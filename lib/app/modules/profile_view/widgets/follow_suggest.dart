import '../../../core/styles/style.dart';
import '../../../widgets/commons/app_button.dart';
import '../models/follow_suggest_model.dart';

class FollowSuggest extends StatelessWidget {
  const FollowSuggest({
    Key? key,
    required this.followSuggestModels,
  }) : super(key: key);
  final FollowSuggestModels followSuggestModels;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Stack(
            children: [
              const Positioned(
                  right: 0,
                  child: Icon(
                    Icons.close,
                    size: 20,
                  )),
              ClipRRect(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 35,
                      child: Image.asset(followSuggestModels.imgUrl),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      followSuggestModels.userName,
                      style: context.subtitle2,
                    ),
                    Text(
                      followSuggestModels.description,
                      textAlign: TextAlign.center,
                      style: context.bodyText2.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: AppButton(
                        "Follow",
                        color: context.primary,
                        height: 25,
                        axisSize: MainAxisSize.max,
                        borderRadius: 5,
                        onPressed: () {},
                      ),
                    )
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
