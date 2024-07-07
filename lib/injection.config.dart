// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'favorites/application/Fav_bloc.dart' as _i7;
import 'favorites/domain/Fav_facade.dart' as _i3;
import 'favorites/infrastructure%20/Fav_repository.dart' as _i4;
import 'productPages/application/favPage_watcher_bloc.dart' as _i8;
import 'productPages/domain/favPage_facade.dart' as _i5;
import 'productPages/infrastructure%20/favPage_repository.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.IFavFacade>(() => _i4.FavRepository());
  gh.lazySingleton<_i5.IFavPageFacade>(() => _i6.FavPageRepository());
  gh.factory<_i7.FavBloc>(() => _i7.FavBloc(get<_i3.IFavFacade>()));
  gh.factory<_i8.FavPageWatcherBloc>(
      () => _i8.FavPageWatcherBloc(get<_i5.IFavPageFacade>()));
  return get;
}
