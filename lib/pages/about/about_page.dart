part of '../pages.dart';

class AboutPage extends StatefulWidget {
  final Function(Experience experience) onTap;
  const AboutPage({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  bool onHovered = false;
  final Repository client = Repository();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
              padding: Common.paddingBase(constraints),
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
              padding: Common.paddingBase(constraints),
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
                          decoration:
                              onHovered ? null : TextDecoration.underline,
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
            // technologies
            const SizedBox(height: 120),
            const Center(
              child: Text(
                "Technologies & Tools I frequently use",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),

            ResponsiveLayout(
              mobileBody: Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  runSpacing: 20,
                  spacing: 20,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  children:
                      listTechTools.map((e) => _techToolButton(e)).toList(),
                ),
              ),
              tabletBody: _techToolsWidget(20),
              desktopBody: _techToolsWidget(30),
            ),
            const SizedBox(height: 100),
            const Center(
              child: Text(
                "Work Experience",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: constraints.maxWidth > 1100 ? 100.0 : 0),
              child: FutureBuilder<List<Experience>>(
                future: client.getListExperience(),
                builder: (context, snapshot) {
                  List<Experience>? data = snapshot.data;
                  if (!snapshot.hasData) {
                    return Center(
                      child: Common.loadingWidget,
                    );
                  } else if (data?.length == null) {
                    return const Center(
                      child: Text("Empty"),
                    );
                  }

                  return Column(
                      children: data!
                          .map(
                            (e) => Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: constraints.maxWidth > 1100
                                          ? 0.0
                                          : 0),
                                  child: ExperienceItem(
                                    no: e.no.toString(),
                                    onTap: () {
                                      widget.onTap(e);
                                    },
                                    experience: e,
                                    horizontalGap: constraints.maxWidth > 1100
                                        ? 100.0
                                        : constraints.maxWidth <= 500
                                            ? 20
                                            : 50,
                                  ),
                                ),
                                const Divider(),
                              ],
                            ),
                          )
                          .toList());
                },
              ),
            ),
          ],
        );
      }),
    );
  }

  Column _techToolsWidget(double gap) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
              6,
              (index) => Padding(
                    padding: EdgeInsets.only(right: index != 5 ? gap : 0),
                    child: _techToolButton(listTechTools[index]),
                  )),
        ),
        SizedBox(height: gap),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            12,
            (index) => index > 5
                ? Padding(
                    padding: EdgeInsets.only(right: index != 11 ? gap : 0),
                    child: _techToolButton(listTechTools[index]),
                  )
                : const SizedBox(),
          ),
        )
      ],
    );
  }
}

Widget _techToolButton(TechnologyTool technologyTool) {
  return MyMainButton(
    width: 60,
    height: 60,
    buttonMode: ButtonMode.whiteTheme,
    onTap: () {
      launchInBrowser(Uri.parse(technologyTool.urlTech));
    },
    child: Padding(
      padding: technologyTool.padding,
      child: Image.asset(
        technologyTool.imageAsset,
      ),
    ),
  );
}
