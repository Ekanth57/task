import 'package:freezed_annotation/freezed_annotation.dart';

part 'favPage_failure.freezed.dart';

// these are the failures
@freezed
class FavPageFailure with _$FavPageFailure {
  const factory FavPageFailure.unexpected() = _Unexpected;
  const factory FavPageFailure.insufficientPermission() =_InsufficientPermission;
  const factory FavPageFailure.unableToUpdate() = _UnableToUpdate;
}