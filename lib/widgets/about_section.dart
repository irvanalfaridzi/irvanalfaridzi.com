part of 'widgets.dart';

class AboutSection extends StatefulWidget {
  final BoxConstraints boxConstraints;
  const AboutSection({super.key, required this.boxConstraints});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  bool onHovered = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            "Flutter Enthusiast",
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 50),
        Padding(
          padding: Common.paddingBase(widget.boxConstraints),
          child: const Text(
            "I'm a Mobile Developer using Flutter with great passion.",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
              height: 1.5,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: Common.paddingBase(widget.boxConstraints),
          child: Text.rich(
            TextSpan(
              text:
                  "I'm living in Surabaya, Indonesia. During my free time, I like playing basketball, watching movies/anime, and doing some research ",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
                height: 1.5,
              ),
              children: [
                TextSpan(
                    text: "projects",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      height: 1.5,
                      decoration: onHovered ? null : TextDecoration.underline,
                    ),
                    onEnter: ((event) {
                      setState(() {
                        onHovered = true;
                      });
                    }),
                    onExit: (event) {
                      setState(() {
                        onHovered = false;
                      });
                    },
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launchInBrowser(Constant.urlGithub());
                      }),
                const TextSpan(
                  text: ".",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
