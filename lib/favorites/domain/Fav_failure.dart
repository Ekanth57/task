import 'package:freezed_annotation/freezed_annotation.dart';

part 'Fav_failure.freezed.dart';

@freezed
class FavFailure with _$FavFailure {
  const factory FavFailure.unexpected() = _Unexpected;
  const factory FavFailure.insufficientPermission() =
  _InsufficientPermission;
  const factory FavFailure.unableToUpdate() = _UnableToUpdate;
  const factory FavFailure.serverError() = ServerError;
}