import 'package:bloc/bloc.dart';
import 'package:code_union_test/main/data/providers/feed/feed_provider.dart';
import 'package:code_union_test/main/domain/models/feed/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  void getPosts() => add(GetPostsEvent());
  void refresh() => add(RefreshPostsEvent());

  final _provider = FeedProvider();
  int page = 1;

  FeedBloc() : super(FeedInitial()) {
    on<GetPostsEvent>(_getPosts);
    on<RefreshPostsEvent>(_refreshPosts);
  }

  void _getPosts(GetPostsEvent event, Emitter<FeedState> emit) async {
    emit(PostsLoadingState());
    // try {
    final response = await _provider.getFeed(page: page);
    if (response.isSuccess) {
      page++;
      emit(PostsLoadedState(response.posts ?? []));
      return;
    }
    emit(PostsErrorState(response.error ?? 'Что-то пошло не так'));
    return;
    // } catch (e) {
    //   debugPrint('FeedBloc getPosts error: $e');
    //   emit(PostsErrorState('Что-то пошло не так'));
    //   return;
    // }
  }

  void _refreshPosts(RefreshPostsEvent event, Emitter<FeedState> emit) async {
    emit(PostsLoadingState());
    page = 1;
    final response = await _provider.getFeed(page: page);
    if (response.isSuccess) {
      emit(PostsLoadedState(response.posts ?? []));
      return;
    }
    emit(PostsErrorState(response.error ?? 'Что-то пошло не так'));
    return;
  }
}
