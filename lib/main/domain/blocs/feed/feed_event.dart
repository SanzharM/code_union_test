part of 'feed_bloc.dart';

@immutable
abstract class FeedEvent {}

class GetPostsEvent extends FeedEvent {}
