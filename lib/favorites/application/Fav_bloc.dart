

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../domain/Fav_facade.dart';
import '../domain/Fav_failure.dart';


part 'Fav_bloc.freezed.dart';
part 'Fav_event.dart';
part 'Fav_state.dart';

@injectable
class FavBloc extends Bloc<FavEvent, FavState> {
  final IFavFacade _iFavFacade;
  FavBloc(this._iFavFacade) : super(FavState.initial());
  @override
  Stream<FavState> mapEventToState(
      FavEvent event,) async* {
    yield* event.map(

      val: (e) async* {
        yield state.copyWith(
          value: e.value,
          authFailureOrSuccessOption: none(),
        );},

      addVal: (e) async* {
        yield state.copyWith(
          addvalue: e.addValue,
          authFailureOrSuccessOption: none(),
        );},

      submitted: (e) async* {
        Either<FavFailure, Unit> failureOrSuccess;
        failureOrSuccess = await _iFavFacade.removeFavSubmit(value: state.value);
        yield state.copyWith(authFailureOrSuccessOption: optionOf(failureOrSuccess),);
      },
      addValsubmitted: (e) async* {
        Either<FavFailure, Unit> failureOrSuccess;
        failureOrSuccess = await _iFavFacade.addFavSubmit(addValue: state.addvalue);
        yield state.copyWith(authFailureOrSuccessOption: optionOf(failureOrSuccess),);
      },
    );
  }
}