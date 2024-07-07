import 'package:dartz/dartz.dart';

import 'Fav_failure.dart';


abstract class IFavFacade {

  Future<Either<FavFailure, Unit>> removeFavSubmit({required String value});
  Future<Either<FavFailure, Unit>> addFavSubmit({required String addValue});

}