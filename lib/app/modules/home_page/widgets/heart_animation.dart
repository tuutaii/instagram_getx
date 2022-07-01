import '../../../core/styles/style.dart';

class HeartAnimation extends StatefulWidget {
  const HeartAnimation({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 100),
  }) : super(key: key);
  final Widget child;
  final Duration duration;

  @override
  State<HeartAnimation> createState() => _HeartAnimationState();
}

class _HeartAnimationState extends State<HeartAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController ctr;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();
    ctr = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: widget.duration.inMilliseconds,
      ),
    );
    scale = Tween<double>(begin: 1, end: 0).animate(ctr);
  }

  @override
  void didUpdateWidget(HeartAnimation oldWidget) {
    if (widget.child != oldWidget.child) {
      showAnimation();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    ctr.dispose();
    super.dispose();
  }

  Future showAnimation() async {
    await ctr.forward();
    await ctr.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: scale, child: widget.child);
  }
}
