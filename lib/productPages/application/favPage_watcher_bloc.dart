import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:task/productPages/domain/favModel.dart';
import 'package:task/productPages/domain/favPage_failure.dart';

import '../domain/favPage_facade.dart';

part 'favPage_watcher_bloc.freezed.dart';
part 'favPage_watcher_event.dart';
part 'favPage_watcher_state.dart';

@injectable
class FavPageWatcherBloc extends Bloc<FavPageWatcherEvent, FavPageWatcherState> {
  final IFavPageFacade favPageFacade;

  FavPageWatcherBloc(this.favPageFacade)
      : super(const FavPageWatcherState.initial());

  late StreamSubscription<Either<FavPageFailure, FavObject>>
  favPageStreamSubscription;
  @override
  Stream<FavPageWatcherState> mapEventToState(
      FavPageWatcherEvent event,
      ) async* {
    yield* event.map(
      watchAllStarted: (e) async* {
        yield const FavPageWatcherState.loadInProgress();
        favPageStreamSubscription =
            favPageFacade.favWatch(e.userId).listen(
                  (failureOrBookings) =>
                  add(FavPageWatcherEvent.propertyWatched(failureOrBookings)),
            );
      },
      propertyWatched: (e) async* {
        yield e.failureOrProperty.fold(
              (f) => FavPageWatcherState.loadFailure(f),
              (assets) => FavPageWatcherState.loadSuccess(assets),
        );
      },
    );
  }

  @override
  Future<void> close() async {
    return super.close();
  }
}
