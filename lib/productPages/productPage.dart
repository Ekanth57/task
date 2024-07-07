import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/cart/cartPage.dart';
import 'package:task/loginAndSIgnup/loginPage.dart';
import 'package:task/productPages/productDetailPage.dart';

import '../favorites/application/Fav_bloc.dart';
import '../favorites/presentation/favoritesPage.dart';
import '../injection.dart';
import '../services/posts.dart';
import '../services/remote_service.dart';
import 'application/favPage_watcher_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  List<Post> posts = [];
  List<Post> favoritePosts = [];
  var isLoaded = false;

  final List<String> categories = [
    "All",
    "Electronics",
    "Jewelery",
    "Men's clothing",
    "Women's clothing"
  ];
  int selectedIndex = 0;
  int _selectedIndex = 0;

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


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FavoritesPage()),
        );
      } else if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CartPage()),
        );
      }
    });
    // setState(() {
    //   _selectedIndex = 0;
    // });
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

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
                    child:Text("load failure..."),
                  ),
                ),
                loadInProgress: (_) => const Center(
                  child: CircularProgressIndicator(),
                ),
                loadSuccess: (state) {
                  print('load success--${state.favPageList.fav}');
                  return Visibility(
                    visible: isLoaded,
                    replacement:Container(
                      color: Colors.white,
                      child: Center(
                        // Lottie animation from local assets folder
                        child: Lottie.asset('assets/images/loading.json',),
                      ),
                    ),
                    child: Scaffold(
                      backgroundColor: Colors.white, // Set background color of the Scaffold
                      appBar: AppBar(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        leading: Icon(Icons.menu, color: Colors.black),
                        actions: [
                          IconButton(
                            icon: Icon(Icons.logout, color: Colors.black),
                            onPressed: () async {
                              final prefs = await SharedPreferences.getInstance();
                              await prefs.setBool('logged', false);
                              await auth.signOut();
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginPage()),
                              );
                            },
                          ),
                        ],
                      ),
                      body: SafeArea(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Text(
                                  'Discover products',
                                  style:
                                  TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 16.h),
                              Container(
                                height: 40.h,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: categories.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = index;
                                        });
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(left: 16.w),
                                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                                        decoration: BoxDecoration(
                                          color: selectedIndex == index
                                              ? Colors.black
                                              : Colors.grey[200],
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Text(
                                          categories[index],
                                          style: TextStyle(
                                            color: selectedIndex == index
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 16.h),
                              Expanded(
                                child: GridView.builder(
                                  scrollDirection: Axis.vertical,
                                  physics: AlwaysScrollableScrollPhysics(),
                                  gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.8, // Adjust this ratio as needed
                                  ),
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
                      bottomNavigationBar: BottomNavigationBar(
                        showUnselectedLabels: true,
                        backgroundColor: Colors.grey[200],
                        unselectedItemColor: Colors.black,
                        selectedItemColor: Colors.black,
                        // currentIndex: _selectedIndex,
                        onTap: _onItemTapped,
                        items: const <BottomNavigationBarItem>[
                          BottomNavigationBarItem(
                            icon: Icon(Icons.home),
                            label: 'Home',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.favorite),
                            label: 'Favorites',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.shopping_cart),
                            label: 'Search',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.person),
                            label: 'Profile',
                          ),
                        ],
                      ),      ),
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 150,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Hero(
                              tag: widget.post.id,
                              child: CachedNetworkImage(
                                imageUrl: widget.post.image,
                                fit: BoxFit.fill,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            widget.post.title,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15.sp),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "${widget.post.price}£",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(

                  child: IconButton(
                    icon: Icon(
                      widget.favs.contains(widget.post.id.toString()) ? Icons.favorite : Icons.favorite_border,
                      color: widget.favs.contains(widget.post.id.toString()) ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      if(widget.favs.contains(widget.post.id.toString())){
                        context.read<FavBloc>().add(FavEvent.val(widget.post.id.toString()));
                        context.read<FavBloc>().add(FavEvent.submitted());
                      }
                      else{
                        context.read<FavBloc>().add(FavEvent.addVal(widget.post.id.toString()));
                        context.read<FavBloc>().add(FavEvent.addValsubmitted());
                      }
                    },
                  ),
                ),
              ],
            ),
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailPage(widget.post, true),
                ),
              );
// _isFavorited = result;
// setState(() {});
            },
          ),
        ),
      ),
    );
  }
}


