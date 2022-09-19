import 'package:cached_network_image/cached_network_image.dart';
import 'package:code_union_test/core/constants/app_colors.dart';
import 'package:code_union_test/core/constants/app_constraints.dart';
import 'package:code_union_test/main/domain/models/feed/post.dart';
import 'package:code_union_test/main/presentation/app_router.dart';
import 'package:code_union_test/main/presentation/widgets/app_cell.dart';
import 'package:code_union_test/main/presentation/widgets/buttons/app_icon_button.dart';
import 'package:code_union_test/main/presentation/widgets/custom_expansion_tile.dart';
import 'package:code_union_test/main/presentation/widgets/separator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoScrollbar(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.width * 0.5,
              stretch: true,
              snap: false,
              pinned: true,
              elevation: 0,
              backgroundColor: AppColors.black.withOpacity(0.8),
              leading: AppIconButton(
                icon: const Icon(Icons.arrow_back_ios_rounded, color: AppColors.white),
                onPressed: () => AppRouter.back(context),
              ),
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const [StretchMode.zoomBackground],
                centerTitle: true,
                title: Text(
                  widget.post.title ?? '',
                  style: Theme.of(context).textTheme.titleMedium?.apply(color: AppColors.white),
                ),
                background: CachedNetworkImage(
                  imageUrl: (widget.post.images?.isEmpty ?? true) ? '' : widget.post.images!.first,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                  errorWidget: (_, obj, trace) => const Icon(
                    CupertinoIcons.exclamationmark_circle_fill,
                    color: AppColors.white,
                  ),
                ),
              ),
              actions: [
                AppIconButton(
                  icon: Icon(
                    widget.post.isFavourite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                    color: widget.post.isFavourite ? AppColors.red : AppColors.white,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SliverFillRemaining(
              fillOverscroll: true,
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(AppConstraints.padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomExpansionTile(
                      title: Text(
                        'Описание',
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodyMedium?.apply(color: AppColors.greyDark),
                      ),
                      iconColor: AppColors.greyLight,
                      children: [
                        Text(
                          widget.post.description ?? '',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: AppConstraints.padding),
                    const HorizontalSepartor(),
                    AppCell(
                      padding: const EdgeInsets.symmetric(vertical: AppConstraints.padding),
                      icon: const Icon(CupertinoIcons.clock, color: AppColors.black),
                      text: 'Работаем с ${widget.post.schedule?.opening ?? '--:--'} до ${widget.post.schedule?.closing}',
                    ),
                    AppCell(
                      padding: const EdgeInsets.symmetric(vertical: AppConstraints.padding),
                      icon: const Icon(CupertinoIcons.location_solid, color: AppColors.black),
                      text: widget.post.coordinates?.addressName ?? '',
                    ),
                    const HorizontalSepartor(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
