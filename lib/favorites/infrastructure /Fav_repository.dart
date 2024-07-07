import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';


import '../domain/Fav_facade.dart';
import '../domain/Fav_failure.dart';


@LazySingleton(as: IFavFacade)
class FavRepository implements IFavFacade {
  @override
  Future<Either<FavFailure, Unit>> removeFavSubmit({required String value,}) async{
    final FirebaseAuth auth = FirebaseAuth.instance;

    final User user = auth.currentUser!;
    final uid = user.uid;
    try {
      FirebaseFirestore.instance
          .collection("users")
          .doc(uid).update({
        'FavObject.fav': FieldValue.arrayRemove([value]),
      });
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const FavFailure.serverError());
      } else {
        return left(const FavFailure.serverError());
      }
    }
  }

  Future<Either<FavFailure, Unit>> addFavSubmit({required String addValue,}) async{
    final FirebaseAuth auth = FirebaseAuth.instance;

    final User user = auth.currentUser!;
    final uid = user.uid;

    try {

      FirebaseFirestore.instance
          .collection("users")
          .doc(uid).update({
        'FavObject.fav': FieldValue.arrayUnion([addValue]),
      });


      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const FavFailure.serverError());
      } else {
        return left(const FavFailure.serverError());
      }
    }
  }


}