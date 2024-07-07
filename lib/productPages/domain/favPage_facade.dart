import 'package:dartz/dartz.dart';
import 'package:task/productPages/domain/favModel.dart';
import 'package:task/productPages/domain/favPage_failure.dart';


abstract class IFavPageFacade {
  Stream<Either<FavPageFailure, FavObject>> favWatch(String userId);

}