import 'package:code_union_test/core/constants/app_constraints.dart';
import 'package:code_union_test/core/constants/constants.dart';
import 'package:code_union_test/main/domain/models/feed/post.dart';
import 'package:code_union_test/main/presentation/widgets/buttons/app_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        height: MediaQuery.of(context).size.width * 0.7,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: AppConstraints.borderRadius,
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: AppConstraints.borderRadius,
                child: Image.network(
                  '',
                  // post.images?.first ?? '',
                  fit: BoxFit.cover,
                  height: double.maxFinite,
                  width: double.maxFinite,
                  errorBuilder: (_, obj, trace) => const Icon(CupertinoIcons.exclamationmark_circle_fill),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.title ?? '',
                        maxLines: 2,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        post.description ?? '',
                        maxLines: 3,
                        style: Theme.of(context).textTheme.titleSmall?.apply(color: AppColors.greyBackground),
                      ),
                    ],
                  ),
                ),
                AppIconButton(
                  icon: Icon(post.isFavourite ? CupertinoIcons.heart_fill : CupertinoIcons.heart),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
