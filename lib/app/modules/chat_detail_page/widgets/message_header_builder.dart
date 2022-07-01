import '../../../core/styles/style.dart';
import '../../../widgets/commons/app_button.dart';
import '../../../widgets/commons/circle_avatar.dart';

class MessageHeader extends StatelessWidget {
  const MessageHeader({
    Key? key,
    required this.userName,
    required this.avt,
  }) : super(key: key);
  final String userName, avt;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CustomCircleAvatar(
            avt,
            radius: 40,
          ),
          Text(
            userName,
            style: context.subtitle2,
          ),
          Text(
            "$userName . Instagram",
            style: context.subtitle1.copyWith(
              fontSize: 14,
              color: context.onSurface.withOpacity(.6),
            ),
          ),
          Text(
            "50 Follower . 3 Post",
            style: context.subtitle1.copyWith(
              fontSize: 14,
              color: context.onSurface.withOpacity(.6),
            ),
          ),
          Text(
            "You guys are following each other on Instagram",
            style: context.subtitle1.copyWith(
              fontSize: 14,
              color: context.onSurface.withOpacity(.6),
            ),
          ),
          Text(
            "You two follow aa and 25 others",
            style: context.subtitle1.copyWith(
              fontSize: 14,
              color: context.onSurface.withOpacity(.6),
            ),
          ),
          AppButton("View Profile",
              height: 25,
              axisSize: MainAxisSize.min,
              textColor: context.onSurface,
              borderRadius: 5,
              type: ButtonType.outline,
              borderColor: context.onSurface,
              onPressed: () {}),
        ],
      ),
    );
  }
}
