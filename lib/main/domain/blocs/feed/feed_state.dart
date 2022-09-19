part of 'feed_bloc.dart';

@immutable
abstract class FeedState {}

class FeedInitial extends FeedState {}

class PostsErrorState extends FeedState {
  final String error;
  PostsErrorState(this.error);
}

class PostsLoadingState extends FeedState {}

class PostsLoadedState extends FeedState {
  final List<Post> posts;
  PostsLoadedState(this.posts);
}

class PostsRefreshedState extends FeedState {
  final List<Post> posts;
  PostsRefreshedState(this.posts);
}
