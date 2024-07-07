part of 'favPage_watcher_bloc.dart';

@freezed
class FavPageWatcherState with _$FavPageWatcherState {
  const factory FavPageWatcherState.initial() = _Initial;
  const factory FavPageWatcherState.loadInProgress() = _LoadInProgress;
  const factory FavPageWatcherState.loadSuccess(
      FavObject favPageList) = _LoadSuccess;
  const factory FavPageWatcherState.loadFailure(
      FavPageFailure favPageFailure) = _LoadFailure;
}