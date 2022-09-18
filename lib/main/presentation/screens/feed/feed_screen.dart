import 'package:code_union_test/core/constants/constants.dart';
import 'package:code_union_test/main/domain/blocs/feed/feed_bloc.dart';
import 'package:code_union_test/main/domain/models/feed/post.dart';
import 'package:code_union_test/main/presentation/screens/feed/post_card.dart';
import 'package:code_union_test/main/presentation/widgets/custom_appbar.dart';
import 'package:code_union_test/main/presentation/widgets/custom_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  late FeedBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<FeedBloc>()..getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Лента',
        needLeading: false,
      ),
      body: BlocConsumer<FeedBloc, FeedState>(
        bloc: bloc,
        listener: (context, state) {},
        builder: (context, state) {
          final isLoading = state is PostsLoadingState;
          return CustomShimmer(
            isLoading: isLoading,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(AppConstraints.padding),
              itemCount: state is PostsLoadedState ? state.posts.length : 3,
              separatorBuilder: (_, sep) => const SizedBox(height: AppConstraints.padding),
              itemBuilder: (_, i) => PostCard(
                post: state is PostsLoadedState ? state.posts[i] : const Post(),
              ),
            ),
          );
        },
      ),
    );
  }
}
