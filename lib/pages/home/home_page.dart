part of '../pages.dart';

class HomePage extends StatefulWidget {
  final Function onTap;
  const HomePage({
    super.key,
    required this.onTap,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool onHovered = false;
  bool onHoveredFlutter = false;
  bool onHoveredVue = false;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody: _body(false),
      tabletBody: _body(false),
      desktopBody: _body(true),
    );
  }

  Column _body(bool isDesktopLayout) {
    return Column(
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: const BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("assets/images/alfaridzi.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Irvan Alfaridzi",
          style: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        const Text(
          "Flutter Developer",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 90),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isDesktopLayout ? 300 : 0),
          child: Text.rich(
            TextSpan(
              text: "I'm a Mobile Developer using ",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
                height: 1.5,
              ),
              children: [
                TextSpan(
                  text: "Flutter",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    height: 1.5,
                    decoration:
                        onHoveredFlutter ? null : TextDecoration.underline,
                  ),
                  onEnter: ((event) {
                    setState(() {
                      onHoveredFlutter = true;
                    });
                  }),
                  onExit: (event) {
                    setState(() {
                      onHoveredFlutter = false;
                    });
                  },
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      launchInBrowser(Constant.urlFlutter);
                    },
                ),
                const TextSpan(
                  text:
                      " with almost 3 years of experience since 2020 and start learning web development with ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),
                TextSpan(
                  text: "VueJS",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    height: 1.5,
                    decoration: onHoveredVue ? null : TextDecoration.underline,
                  ),
                  onEnter: ((event) {
                    setState(() {
                      onHoveredVue = true;
                    });
                  }),
                  onExit: (event) {
                    setState(() {
                      onHoveredVue = false;
                    });
                  },
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      launchInBrowser(Constant.urlVue);
                    },
                ),
                const TextSpan(
                  text: ". Currently I'm a Software Development Engineer at ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),
                TextSpan(
                  text: "The Software Practice Singapore",
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
                    ..onTap = () async {
                      launchInBrowser(Constant.urlTSP);
                    },
                ),
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
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 60),
        MyMainButton(
          onTap: () {
            widget.onTap();
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "More about me",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              SizedBox(width: 16),
            ],
          ),
        ),
        const SizedBox(height: 120),

        // get in touch
        const Text(
          "Get in touch",
          style: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isDesktopLayout ? 300 : 0),
          child: const Text(
            "Open for any project freelance or opportunity, especially on Mobile App projects with Flutter. Feel free to contact me.",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 40),
        Wrap(
          runSpacing: 25,
          spacing: 40,
          children: [
            MyMainButton(
              buttonMode: ButtonMode.blackTheme,
              onTap: () {
                // launchInBrowser(Constant.urlGmail);
                // Find the ScaffoldMessenger in the widget tree
                // and use it to show a SnackBar.
                ScaffoldMessenger.of(context)
                    .showSnackBar(Common.snackBar(context));
              },
              child: const Text(
                "Ping me",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            MyMainButton(
              buttonMode: ButtonMode.whiteTheme,
              onTap: () {
                // Find the ScaffoldMessenger in the widget tree
                // and use it to show a SnackBar.
                ScaffoldMessenger.of(context)
                    .showSnackBar(Common.snackBar(context));
              },
              child: Stack(
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Schedule a meeting",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 230,
                    height: 60,
                    child: Align(
                      alignment: Alignment.center,
                      child: Transform.rotate(
                        angle: -math.pi / 20,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 20),
                          // margin: const EdgeInsets.only(left: 30, bottom: 30),
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            "Coming Soon",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
