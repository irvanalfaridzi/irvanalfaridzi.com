part of '../pages.dart';

class AboutPage extends StatefulWidget {
  final Function(Experience experience) onTap;
  const AboutPage({
    super.key,
    required this.onTap,
  });

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  Future<List<Experience>> getExperienceData() async {
    List<Experience> list = [];
    await Future.delayed(const Duration(milliseconds: 500))
        .whenComplete(() => list = experienceList);
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        final double horizontalExperienceGap = constraints.maxWidth > 1100
            ? 100.0
            : constraints.maxWidth <= 500
                ? 20
                : 50;
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // About Section
            AboutSection(boxConstraints: constraints),

            // Technologies Section
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
                future: getExperienceData(),
                builder: (context, snapshot) {
                  List<Experience>? data = snapshot.data;
                  if (!snapshot.hasData) {
                    return Skeleton.experienceSkeleton(horizontalExperienceGap);
                  } else if (data!.isEmpty) {
                    return const Center(
                      child: Text(
                        "Go get experience!",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          height: 1.5,
                        ),
                      ),
                    );
                  }

                  return _listExperienceWidget(data, horizontalExperienceGap);
                },
              ),
            ),
          ],
        );
      }),
    );
  }

  Column _listExperienceWidget(
      List<Experience> data, double horizontalExperienceGap) {
    int no = data.length;
    return Column(
      children: [
        Column(
            children: data
                .map(
                  (e) => ExperienceItem(
                    no: (no--).toString(),
                    onTap: () {
                      widget.onTap(e);
                    },
                    experience: e,
                    horizontalGap: horizontalExperienceGap,
                  ),
                )
                .toList()),
      ],
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
