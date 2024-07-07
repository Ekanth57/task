// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Fav_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) val,
    required TResult Function() submitted,
    required TResult Function(String addValue) addVal,
    required TResult Function() addValsubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? val,
    TResult? Function()? submitted,
    TResult? Function(String addValue)? addVal,
    TResult? Function()? addValsubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? val,
    TResult Function()? submitted,
    TResult Function(String addValue)? addVal,
    TResult Function()? addValsubmitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Value value) val,
    required TResult Function(Submitted value) submitted,
    required TResult Function(AddValue value) addVal,
    required TResult Function(AddValSubmitted value) addValsubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Value value)? val,
    TResult? Function(Submitted value)? submitted,
    TResult? Function(AddValue value)? addVal,
    TResult? Function(AddValSubmitted value)? addValsubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Value value)? val,
    TResult Function(Submitted value)? submitted,
    TResult Function(AddValue value)? addVal,
    TResult Function(AddValSubmitted value)? addValsubmitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavEventCopyWith<$Res> {
  factory $FavEventCopyWith(FavEvent value, $Res Function(FavEvent) then) =
      _$FavEventCopyWithImpl<$Res, FavEvent>;
}

/// @nodoc
class _$FavEventCopyWithImpl<$Res, $Val extends FavEvent>
    implements $FavEventCopyWith<$Res> {
  _$FavEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ValueCopyWith<$Res> {
  factory _$$ValueCopyWith(_$Value value, $Res Function(_$Value) then) =
      __$$ValueCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$ValueCopyWithImpl<$Res> extends _$FavEventCopyWithImpl<$Res, _$Value>
    implements _$$ValueCopyWith<$Res> {
  __$$ValueCopyWithImpl(_$Value _value, $Res Function(_$Value) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$Value(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Value implements Value {
  const _$Value(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'FavEvent.val(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Value &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ValueCopyWith<_$Value> get copyWith =>
      __$$ValueCopyWithImpl<_$Value>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) val,
    required TResult Function() submitted,
    required TResult Function(String addValue) addVal,
    required TResult Function() addValsubmitted,
  }) {
    return val(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? val,
    TResult? Function()? submitted,
    TResult? Function(String addValue)? addVal,
    TResult? Function()? addValsubmitted,
  }) {
    return val?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? val,
    TResult Function()? submitted,
    TResult Function(String addValue)? addVal,
    TResult Function()? addValsubmitted,
    required TResult orElse(),
  }) {
    if (val != null) {
      return val(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Value value) val,
    required TResult Function(Submitted value) submitted,
    required TResult Function(AddValue value) addVal,
    required TResult Function(AddValSubmitted value) addValsubmitted,
  }) {
    return val(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Value value)? val,
    TResult? Function(Submitted value)? submitted,
    TResult? Function(AddValue value)? addVal,
    TResult? Function(AddValSubmitted value)? addValsubmitted,
  }) {
    return val?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Value value)? val,
    TResult Function(Submitted value)? submitted,
    TResult Function(AddValue value)? addVal,
    TResult Function(AddValSubmitted value)? addValsubmitted,
    required TResult orElse(),
  }) {
    if (val != null) {
      return val(this);
    }
    return orElse();
  }
}

abstract class Value implements FavEvent {
  const factory Value(final String value) = _$Value;

  String get value;
  @JsonKey(ignore: true)
  _$$ValueCopyWith<_$Value> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmittedCopyWith<$Res> {
  factory _$$SubmittedCopyWith(
          _$Submitted value, $Res Function(_$Submitted) then) =
      __$$SubmittedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SubmittedCopyWithImpl<$Res>
    extends _$FavEventCopyWithImpl<$Res, _$Submitted>
    implements _$$SubmittedCopyWith<$Res> {
  __$$SubmittedCopyWithImpl(
      _$Submitted _value, $Res Function(_$Submitted) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Submitted implements Submitted {
  const _$Submitted();

  @override
  String toString() {
    return 'FavEvent.submitted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Submitted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) val,
    required TResult Function() submitted,
    required TResult Function(String addValue) addVal,
    required TResult Function() addValsubmitted,
  }) {
    return submitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? val,
    TResult? Function()? submitted,
    TResult? Function(String addValue)? addVal,
    TResult? Function()? addValsubmitted,
  }) {
    return submitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? val,
    TResult Function()? submitted,
    TResult Function(String addValue)? addVal,
    TResult Function()? addValsubmitted,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Value value) val,
    required TResult Function(Submitted value) submitted,
    required TResult Function(AddValue value) addVal,
    required TResult Function(AddValSubmitted value) addValsubmitted,
  }) {
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Value value)? val,
    TResult? Function(Submitted value)? submitted,
    TResult? Function(AddValue value)? addVal,
    TResult? Function(AddValSubmitted value)? addValsubmitted,
  }) {
    return submitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Value value)? val,
    TResult Function(Submitted value)? submitted,
    TResult Function(AddValue value)? addVal,
    TResult Function(AddValSubmitted value)? addValsubmitted,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(this);
    }
    return orElse();
  }
}

abstract class Submitted implements FavEvent {
  const factory Submitted() = _$Submitted;
}

/// @nodoc
abstract class _$$AddValueCopyWith<$Res> {
  factory _$$AddValueCopyWith(
          _$AddValue value, $Res Function(_$AddValue) then) =
      __$$AddValueCopyWithImpl<$Res>;
  @useResult
  $Res call({String addValue});
}

/// @nodoc
class __$$AddValueCopyWithImpl<$Res>
    extends _$FavEventCopyWithImpl<$Res, _$AddValue>
    implements _$$AddValueCopyWith<$Res> {
  __$$AddValueCopyWithImpl(_$AddValue _value, $Res Function(_$AddValue) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addValue = null,
  }) {
    return _then(_$AddValue(
      null == addValue
          ? _value.addValue
          : addValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddValue implements AddValue {
  const _$AddValue(this.addValue);

  @override
  final String addValue;

  @override
  String toString() {
    return 'FavEvent.addVal(addValue: $addValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddValue &&
            (identical(other.addValue, addValue) ||
                other.addValue == addValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, addValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddValueCopyWith<_$AddValue> get copyWith =>
      __$$AddValueCopyWithImpl<_$AddValue>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) val,
    required TResult Function() submitted,
    required TResult Function(String addValue) addVal,
    required TResult Function() addValsubmitted,
  }) {
    return addVal(addValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? val,
    TResult? Function()? submitted,
    TResult? Function(String addValue)? addVal,
    TResult? Function()? addValsubmitted,
  }) {
    return addVal?.call(addValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? val,
    TResult Function()? submitted,
    TResult Function(String addValue)? addVal,
    TResult Function()? addValsubmitted,
    required TResult orElse(),
  }) {
    if (addVal != null) {
      return addVal(addValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Value value) val,
    required TResult Function(Submitted value) submitted,
    required TResult Function(AddValue value) addVal,
    required TResult Function(AddValSubmitted value) addValsubmitted,
  }) {
    return addVal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Value value)? val,
    TResult? Function(Submitted value)? submitted,
    TResult? Function(AddValue value)? addVal,
    TResult? Function(AddValSubmitted value)? addValsubmitted,
  }) {
    return addVal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Value value)? val,
    TResult Function(Submitted value)? submitted,
    TResult Function(AddValue value)? addVal,
    TResult Function(AddValSubmitted value)? addValsubmitted,
    required TResult orElse(),
  }) {
    if (addVal != null) {
      return addVal(this);
    }
    return orElse();
  }
}

abstract class AddValue implements FavEvent {
  const factory AddValue(final String addValue) = _$AddValue;

  String get addValue;
  @JsonKey(ignore: true)
  _$$AddValueCopyWith<_$AddValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddValSubmittedCopyWith<$Res> {
  factory _$$AddValSubmittedCopyWith(
          _$AddValSubmitted value, $Res Function(_$AddValSubmitted) then) =
      __$$AddValSubmittedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddValSubmittedCopyWithImpl<$Res>
    extends _$FavEventCopyWithImpl<$Res, _$AddValSubmitted>
    implements _$$AddValSubmittedCopyWith<$Res> {
  __$$AddValSubmittedCopyWithImpl(
      _$AddValSubmitted _value, $Res Function(_$AddValSubmitted) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddValSubmitted implements AddValSubmitted {
  const _$AddValSubmitted();

  @override
  String toString() {
    return 'FavEvent.addValsubmitted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AddValSubmitted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) val,
    required TResult Function() submitted,
    required TResult Function(String addValue) addVal,
    required TResult Function() addValsubmitted,
  }) {
    return addValsubmitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? val,
    TResult? Function()? submitted,
    TResult? Function(String addValue)? addVal,
    TResult? Function()? addValsubmitted,
  }) {
    return addValsubmitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? val,
    TResult Function()? submitted,
    TResult Function(String addValue)? addVal,
    TResult Function()? addValsubmitted,
    required TResult orElse(),
  }) {
    if (addValsubmitted != null) {
      return addValsubmitted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Value value) val,
    required TResult Function(Submitted value) submitted,
    required TResult Function(AddValue value) addVal,
    required TResult Function(AddValSubmitted value) addValsubmitted,
  }) {
    return addValsubmitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Value value)? val,
    TResult? Function(Submitted value)? submitted,
    TResult? Function(AddValue value)? addVal,
    TResult? Function(AddValSubmitted value)? addValsubmitted,
  }) {
    return addValsubmitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Value value)? val,
    TResult Function(Submitted value)? submitted,
    TResult Function(AddValue value)? addVal,
    TResult Function(AddValSubmitted value)? addValsubmitted,
    required TResult orElse(),
  }) {
    if (addValsubmitted != null) {
      return addValsubmitted(this);
    }
    return orElse();
  }
}

abstract class AddValSubmitted implements FavEvent {
  const factory AddValSubmitted() = _$AddValSubmitted;
}

/// @nodoc
mixin _$FavState {
  String get value => throw _privateConstructorUsedError;
  String get addvalue => throw _privateConstructorUsedError;
  dynamic get authFailureOrSuccessOption => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavStateCopyWith<FavState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavStateCopyWith<$Res> {
  factory $FavStateCopyWith(FavState value, $Res Function(FavState) then) =
      _$FavStateCopyWithImpl<$Res, FavState>;
  @useResult
  $Res call(
      {String value, String addvalue, dynamic authFailureOrSuccessOption});
}

/// @nodoc
class _$FavStateCopyWithImpl<$Res, $Val extends FavState>
    implements $FavStateCopyWith<$Res> {
  _$FavStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? addvalue = null,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      addvalue: null == addvalue
          ? _value.addvalue
          : addvalue // ignore: cast_nullable_to_non_nullable
              as String,
      authFailureOrSuccessOption: freezed == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FavStateCopyWith<$Res> implements $FavStateCopyWith<$Res> {
  factory _$$_FavStateCopyWith(
          _$_FavState value, $Res Function(_$_FavState) then) =
      __$$_FavStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String value, String addvalue, dynamic authFailureOrSuccessOption});
}

/// @nodoc
class __$$_FavStateCopyWithImpl<$Res>
    extends _$FavStateCopyWithImpl<$Res, _$_FavState>
    implements _$$_FavStateCopyWith<$Res> {
  __$$_FavStateCopyWithImpl(
      _$_FavState _value, $Res Function(_$_FavState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? addvalue = null,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_$_FavState(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      addvalue: null == addvalue
          ? _value.addvalue
          : addvalue // ignore: cast_nullable_to_non_nullable
              as String,
      authFailureOrSuccessOption: freezed == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption!
          : authFailureOrSuccessOption,
    ));
  }
}

/// @nodoc

class _$_FavState implements _FavState {
  const _$_FavState(
      {required this.value,
      required this.addvalue,
      this.authFailureOrSuccessOption});

  @override
  final String value;
  @override
  final String addvalue;
  @override
  final dynamic authFailureOrSuccessOption;

  @override
  String toString() {
    return 'FavState(value: $value, addvalue: $addvalue, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavState &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.addvalue, addvalue) ||
                other.addvalue == addvalue) &&
            const DeepCollectionEquality().equals(
                other.authFailureOrSuccessOption, authFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, addvalue,
      const DeepCollectionEquality().hash(authFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavStateCopyWith<_$_FavState> get copyWith =>
      __$$_FavStateCopyWithImpl<_$_FavState>(this, _$identity);
}

abstract class _FavState implements FavState {
  const factory _FavState(
      {required final String value,
      required final String addvalue,
      final dynamic authFailureOrSuccessOption}) = _$_FavState;

  @override
  String get value;
  @override
  String get addvalue;
  @override
  dynamic get authFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_FavStateCopyWith<_$_FavState> get copyWith =>
      throw _privateConstructorUsedError;
}
