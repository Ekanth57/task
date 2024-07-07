
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task/productPages/domain/favModel.dart';
import 'package:task/productPages/domain/favPage_facade.dart';
import 'package:task/productPages/domain/favPage_failure.dart';


@LazySingleton(as: IFavPageFacade)
class FavPageRepository implements IFavPageFacade {
  @override
  Stream<Either<FavPageFailure, FavObject>> favWatch(String userId) async* {
    final FirebaseAuth auth = FirebaseAuth.instance;

    final User user = auth.currentUser!;
    final uid = user.uid;
    yield* FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .snapshots()
        .map((snapshot) => right<FavPageFailure, FavObject>(
        FavObject.fromJson(snapshot.get('FavObject'))))
        .onErrorReturnWith((e, stackTrace) {
      if (e is FirebaseException && e.message!.contains('PERMISSION_DENIED')) {
        return left(const FavPageFailure.insufficientPermission());
      } else {
        return left(const FavPageFailure.unexpected());
      }
    });
  }
}
