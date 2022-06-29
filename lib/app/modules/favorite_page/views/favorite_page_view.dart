import 'package:flutter/gestures.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:instagram/app/core/utilities/image.dart';
import 'package:instagram/app/widgets/commons/app_button.dart';

import '../../../core/styles/style.dart';
import '../controllers/favorite_page_controller.dart';

class FavoritePageView extends GetView<FavoritePageController> {
  const FavoritePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        toolbarHeight: 0,
        backgroundColor: context.surface,
        bottom: TabBar(
          controller: controller.tabController,
          unselectedLabelColor: Colors.grey,
          labelColor: context.bodyText1.color,
          indicatorColor: context.onSurface,
          labelPadding: const EdgeInsets.symmetric(vertical: 10),
          tabs: const [
            Text(
              "Following",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "You",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Follow Requests",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              const Divider(
                height: 1,
              ),
              _FormNotification(
                title: "New",
                details: Column(
                  children: [
                    _DetailNotification(
                      imgUrl: AppImage.avt2,
                      isSubtitle: true,
                      isTrailingPicture: true,
                    ),
                  ],
                ),
              ),
              _FormNotification(
                title: "Today",
                details: Column(
                  children: [
                    _DetailNotification(
                      imgUrl: AppImage.avt3,
                    ),
                  ],
                ),
              ),
              _FormNotification(
                title: "This Week",
                details: Column(
                  children: [
                    _DetailNotification(
                      imgUrl: AppImage.avt,
                    ),
                    _DetailNotification(
                      imgUrl: AppImage.avt1,
                      isSubtitle: true,
                      isTrailingPicture: true,
                    ),
                    _DetailNotification(
                      imgUrl: AppImage.avt,
                    ),
                    _DetailNotification(
                      imgUrl: AppImage.avt2,
                      isSubtitle: true,
                      isTrailingPicture: true,
                    ),
                    _DetailNotification(
                      imgUrl: AppImage.avt1,
                    ),
                    _DetailNotification(
                      imgUrl: AppImage.avt2,
                      isSubtitle: true,
                      isTrailingPicture: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FormNotification extends StatelessWidget {
  const _FormNotification({
    Key? key,
    this.title,
    this.details,
  }) : super(key: key);
  final String? title;
  final Widget? details;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title ?? "Empty",
            style: context.subtitle2
                .copyWith(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          details ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class _DetailNotification extends StatelessWidget {
  const _DetailNotification({
    Key? key,
    this.imgUrl,
    this.isSubtitle = false,
    this.isTrailingPicture = false,
  }) : super(key: key);
  final String? imgUrl;
  final bool isSubtitle, isTrailingPicture;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: ListTile(
        horizontalTitleGap: 10,
        isThreeLine: false,
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 22,
          child: Image.asset(imgUrl ?? AppImage.avt),
        ),
        minLeadingWidth: 0,
        contentPadding: EdgeInsets.zero,
        title: isTrailingPicture
            ? RichText(
                textAlign: TextAlign.start,
                maxLines: 2,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: 'tuu_taii',
                        style: TextStyle(
                          color: context.onSurface,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {}),
                    TextSpan(
                      text: ' and ',
                      style: TextStyle(
                        color: context.onSurface,
                        fontSize: 13,
                      ),
                    ),
                    TextSpan(
                      text: '44,666 others',
                      style: TextStyle(
                        color: context.onSurface,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                    TextSpan(
                      text: ' liked your post.',
                      style: TextStyle(
                        color: context.onSurface,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              )
            : RichText(
                textAlign: TextAlign.start,
                maxLines: 2,
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'tuu_taii',
                        style: TextStyle(
                          color: context.onSurface,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {}),
                    TextSpan(
                      text: ' started following you.',
                      style: TextStyle(
                        color: context.onSurface,
                        fontSize: 13,
                      ),
                    ),
                    TextSpan(
                      text: '3d ',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
        subtitle: isSubtitle
            ? Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 10,
                      child: InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                          AppImage.iconHeart,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Reply",
                        style: context.bodyText1.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
              )
            : const SizedBox.shrink(),
        trailing: isTrailingPicture
            ? SizedBox(
                height: 44,
                width: 44,
                child: Image.asset(AppImage.imagePost),
              )
            : AppButton(
                "Follow",
                color: context.primary,
                borderRadius: 4,
                height: 28,
                onPressed: () {},
              ),
      ),
    );
  }
}
