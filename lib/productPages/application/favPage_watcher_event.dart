part of 'favPage_watcher_bloc.dart';


@freezed
class FavPageWatcherEvent with _$FavPageWatcherEvent {
  const factory FavPageWatcherEvent.watchAllStarted(String userId) =
  _WatchAllStarted;
  const factory FavPageWatcherEvent.propertyWatched(
      Either<FavPageFailure, FavObject> failureOrProperty,
      ) = _PropertyReceived;
}