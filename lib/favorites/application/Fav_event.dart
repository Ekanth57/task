part of 'Fav_bloc.dart';

@freezed
class FavEvent with _$FavEvent {
  const factory FavEvent.val(String value) = Value;
  const factory FavEvent.submitted() = Submitted;

  const factory FavEvent.addVal(String addValue) = AddValue;
  const factory FavEvent.addValsubmitted() = AddValSubmitted;

}