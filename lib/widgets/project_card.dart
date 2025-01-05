part of 'widgets.dart';

class MyProjectCard extends StatefulWidget {
  final Project project;
  const MyProjectCard({
    super.key,
    required this.project,
  });

  @override
  State<MyProjectCard> createState() => _MyProjectCardState();
}

class _MyProjectCardState extends State<MyProjectCard> {
  bool isLoading = true;

  @override
  void initState() {
    loadingImage();
    super.initState();
  }

  loadingImage() async {
    await Future.delayed(const Duration(milliseconds: 500)).whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: AssetImage(
                  widget.project.images[0],
                ),
                fit: widget.project.boxFit,
                alignment: Alignment.center,
              ),
            ),
            child: isLoading
                ? Common.loadingWidget
                : Container(
                    color: Colors.transparent,
                  ),
          ),
          const SizedBox(height: 30),
          ResponsiveLayout(
            mobileBody: _titleSection(isMobile: true),
            tabletBody: _titleSection(),
            desktopBody: _titleSection(),
          ),
          const SizedBox(height: 20),
          Text(
            widget.project.description,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            alignment: WrapAlignment.start,
            runSpacing: 16,
            spacing: 16,
            children: widget.project.technologies
                .map(
                  (e) => Text(
                    e,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black38,
                      height: 1.5,
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }

  Widget _titleSection({bool isMobile = false}) {
    return isMobile
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.project.projectName,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              _viewProjectButton(),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.project.projectName,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
              _viewProjectButton(),
            ],
          );
  }

  MyMainButton _viewProjectButton() {
    return MyMainButton(
      width: 200,
      height: 50,
      onTap: () {
        if (widget.project.urlProject != "") {
          launchInBrowser(Uri.parse(widget.project.urlProject));
        } else {
          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(Common.snackBar(context));
        }
      },
      buttonMode: ButtonMode.whiteTheme,
      child: const Text(
        'View Project',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w800,
          color: Colors.black,
        ),
      ),
    );
  }
}
