part of '../pages.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  bool onHovered = false;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Projects",
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: Common.paddingBase(constraints, gap: 300),
            child: Text.rich(
              TextSpan(
                text: "Not many projects that I set public in my repo.\n",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                  height: 1.5,
                ),
                children: [
                  const TextSpan(
                    text: "But feel free to take a look at my ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                      height: 1.5,
                    ),
                  ),
                  TextSpan(
                    text: "Github",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
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
                        launchInBrowser(Constant.urlGithub());
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
                  )
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 50),
          // Filter
          ProjectFilterBox(constraints: constraints),
          const SizedBox(height: 50),
          constraints.maxWidth > 1100
              ? Wrap(
                  direction: Axis.horizontal,
                  runSpacing: 20,
                  spacing: 20,
                  children: context
                      .watch<ProjectProvider>()
                      .listOfSearchProject
                      .map(
                        (e) => SizedBox(
                          width: (MediaQuery.of(context).size.width - 152) / 2,
                          child: MyProjectCard(
                            project: e,
                          ),
                        ),
                      )
                      .toList(),
                )
              : Column(
                  children: context
                      .watch<ProjectProvider>()
                      .listOfSearchProject
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: MyProjectCard(
                            project: e,
                          ),
                        ),
                      )
                      .toList(),
                )
        ],
      ),
    );
  }
}
