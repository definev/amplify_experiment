// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_feed_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostFeedState {
  Set<Post> get posts => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostFeedStateCopyWith<PostFeedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostFeedStateCopyWith<$Res> {
  factory $PostFeedStateCopyWith(
          PostFeedState value, $Res Function(PostFeedState) then) =
      _$PostFeedStateCopyWithImpl<$Res>;
  $Res call({Set<Post> posts, int page, bool isLoading});
}

/// @nodoc
class _$PostFeedStateCopyWithImpl<$Res>
    implements $PostFeedStateCopyWith<$Res> {
  _$PostFeedStateCopyWithImpl(this._value, this._then);

  final PostFeedState _value;
  // ignore: unused_field
  final $Res Function(PostFeedState) _then;

  @override
  $Res call({
    Object? posts = freezed,
    Object? page = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as Set<Post>,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_PostFeedStateCopyWith<$Res>
    implements $PostFeedStateCopyWith<$Res> {
  factory _$$_PostFeedStateCopyWith(
          _$_PostFeedState value, $Res Function(_$_PostFeedState) then) =
      __$$_PostFeedStateCopyWithImpl<$Res>;
  @override
  $Res call({Set<Post> posts, int page, bool isLoading});
}

/// @nodoc
class __$$_PostFeedStateCopyWithImpl<$Res>
    extends _$PostFeedStateCopyWithImpl<$Res>
    implements _$$_PostFeedStateCopyWith<$Res> {
  __$$_PostFeedStateCopyWithImpl(
      _$_PostFeedState _value, $Res Function(_$_PostFeedState) _then)
      : super(_value, (v) => _then(v as _$_PostFeedState));

  @override
  _$_PostFeedState get _value => super._value as _$_PostFeedState;

  @override
  $Res call({
    Object? posts = freezed,
    Object? page = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_$_PostFeedState(
      posts: posts == freezed
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as Set<Post>,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PostFeedState implements _PostFeedState {
  const _$_PostFeedState(
      {required final Set<Post> posts,
      required this.page,
      required this.isLoading})
      : _posts = posts;

  final Set<Post> _posts;
  @override
  Set<Post> get posts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_posts);
  }

  @override
  final int page;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'PostFeedState(posts: $posts, page: $page, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostFeedState &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_posts),
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$$_PostFeedStateCopyWith<_$_PostFeedState> get copyWith =>
      __$$_PostFeedStateCopyWithImpl<_$_PostFeedState>(this, _$identity);
}

abstract class _PostFeedState implements PostFeedState {
  const factory _PostFeedState(
      {required final Set<Post> posts,
      required final int page,
      required final bool isLoading}) = _$_PostFeedState;

  @override
  Set<Post> get posts;
  @override
  int get page;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_PostFeedStateCopyWith<_$_PostFeedState> get copyWith =>
      throw _privateConstructorUsedError;
}
