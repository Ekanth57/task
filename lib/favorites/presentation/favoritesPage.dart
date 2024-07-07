import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/cart/cartPage.dart';
import 'package:task/loginAndSIgnup/loginPage.dart';
import 'package:task/productPages/productDetailPage.dart';


import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection.dart';
import '../../productPages/application/favPage_watcher_bloc.dart';
import '../../services/posts.dart';
import '../../services/remote_service.dart';
import '../application/Fav_bloc.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  List<Post> posts = [];
  List<Post> favoritePosts = [];
  var isLoaded = false;
  

  @override
  void initState() {
    super.initState();
    getState();
  }

  getState() async {
    posts = (await RemoteService().getPosts())!;
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FavPageWatcherBloc>(
          create: (context) => getIt<FavPageWatcherBloc>()
            ..add(FavPageWatcherEvent.watchAllStarted('')),
        ),

        BlocProvider<FavBloc>(
          create: (context) => getIt<FavBloc>(),
        ),
      ],
      child: BlocBuilder<FavPageWatcherBloc, FavPageWatcherState>(
          builder: (context, state) {
            return state.map(
                initial: (_) => Container(),
                loadFailure: (_) => Center(
                  child: Container(
                    child:Text("load failure"),
                  ),
                ),
                loadInProgress: (_) => const Center(
                  child: CircularProgressIndicator(),
                ),
                loadSuccess: (state) {
                  print('load success--${state.favPageList.fav}');
                  return Scaffold(
                    backgroundColor: Colors.white, // Set background color of the Scaffold
                    appBar: AppBar(
                      iconTheme: IconThemeData(
                        color: Colors.black, //change your color here
                      ),
                      backgroundColor: Colors.white,
                      title: Text("Favorites",
                      style: TextStyle(
                        color: Colors.black
                      ),
                      ),
                      centerTitle: true,
                    ),
                    body: Visibility(
                      visible: isLoaded,
                      replacement:Container(
                        color: Colors.white,
                        child: Center(
                          // Lottie animation from local assets folder
                          child: Lottie.asset('assets/images/loading.json',frameRate: FrameRate(10)),
                        ),
                      ),
                      child: SafeArea(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  physics: AlwaysScrollableScrollPhysics(),
                                  itemCount: posts.length,
                                  itemBuilder: (context, index) {
                                    final post = posts[index];
                                    final isFavorited = favoritePosts.contains(post);
                                    return ProductCard(
                                      post,
                                      isFavorited: isFavorited,
                                      favs:state.favPageList.fav!,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );

                });
          }),
    );;
  }
}

class ProductCard extends StatefulWidget {
  final Post post;
  final bool isFavorited;
  final List<String> favs;

  const ProductCard(this.post,
      {required this.isFavorited, required this.favs});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  // late bool _isFavorited;

  @override
  void initState() {
    super.initState();
    print('inside card----');
    print(widget.favs.contains(widget.post.id.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FavBloc>(),
      child: BlocListener<FavBloc, FavState>(
        listener: (contxt, state) {
          state.authFailureOrSuccessOption.fold(
                () {},
                (either) => either.fold(
                  (failure) {
                failure.map(
                  insufficientPermission: (val) {},
                  serverError: (value) {},
                  unableToUpdate: (value) {},
                  unexpected: (value) {},
                );
              },
                  (id) {},
            ),
          );
        },
        child: Visibility(
          visible: widget.favs.contains(widget.post.id.toString()),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(
                          0, 4), // changes position of shadow
                    ),
                  ]),
              child: ListTile(
                leading: CachedNetworkImage(
                  imageUrl: widget.post.image,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                title: Text(widget.post.title),
                subtitle: Text("${widget.post.price}£"),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    context.read<FavBloc>().add(FavEvent.val(widget.post.id.toString()));
                    context.read<FavBloc>().add(FavEvent.submitted());
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}













// class FavoritesPage extends StatefulWidget {
//   final List<Post> favoritePosts;
//
//   const FavoritesPage({Key? key, required this.favoritePosts}) : super(key: key);
//
//   @override
//   _FavoritesPageState createState() => _FavoritesPageState();
// }
//
// class _FavoritesPageState extends State<FavoritesPage> {
//   late List<Post> _favoritePosts;
//
//   @override
//   void initState() {
//     super.initState();
//     _favoritePosts = List<Post>.from(widget.favoritePosts);
//   }
//
//   void _removeFavorite(Post post) {
//     setState(() {
//       _favoritePosts.remove(post);
//     });
//   }
//
//   Future<bool> _onWillPop() async {
//     Navigator.pop(context, _favoritePosts);
//     return true;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: _onWillPop,
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text('Favorites',
//           style: TextStyle(
//             color: Colors.black
//           ),
//           ),
//
//           backgroundColor: Colors.white,
//           iconTheme: IconThemeData(color: Colors.black),
//
//         ),
//         body: _favoritePosts.isEmpty
//             ? Center(
//           child: Text('No favorites yet.'),
//         )
//             : ListView.builder(
//           itemCount: _favoritePosts.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               leading: CachedNetworkImage(
//                 imageUrl: _favoritePosts[index].image,
//                 placeholder: (context, url) => CircularProgressIndicator(),
//                 errorWidget: (context, url, error) => Icon(Icons.error),
//               ),
//               title: Text(_favoritePosts[index].title),
//               subtitle: Text("${_favoritePosts[index].price}£"),
//               trailing: IconButton(
//                 icon: Icon(Icons.delete, color: Colors.red),
//                 onPressed: () {
//                   _removeFavorite(_favoritePosts[index]);
//                 },
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }