part of 'Fav_bloc.dart';

@freezed
class FavState with _$FavState {
  const factory FavState({
    required String value,
    required String addvalue,
    authFailureOrSuccessOption,
  }) = _FavState;
  factory FavState.initial() => FavState(
    value:'',
    addvalue: '',
    authFailureOrSuccessOption: none(),
  );
}