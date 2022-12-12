part of 'widgets.dart';

class MyFooter extends StatelessWidget {
  final bool showMenu;
  final MenuData onHomePage;
  final MenuData onAboutPage;
  final MenuData onProjectsPage;
  const MyFooter({
    Key? key,
    this.showMenu = true,
    required this.onHomePage,
    required this.onAboutPage,
    required this.onProjectsPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Visibility(
          visible: showMenu,
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children: [
              MySecondaryButton(
                text: "Home",
                onTap: () {
                  onHomePage.onTap();
                },
                fontWeight: FontWeight.w900,
                fontSize: 16,
              ),
              // const SizedBox(width: 20),
              MySecondaryButton(
                text: "About",
                onTap: () {
                  onAboutPage.onTap();
                },
                fontWeight: FontWeight.w900,
                fontSize: 16,
              ),
              // const SizedBox(width: 20),
              MySecondaryButton(
                text: "Projects",
                onTap: () {
                  onProjectsPage.onTap();
                },
                fontWeight: FontWeight.w900,
                fontSize: 16,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 16,
          runSpacing: 16,
          children: [
            IconButton(
              onPressed: () {
                launchInBrowser(Constant.urlGithub());
              },
              icon: FaIcon(
                FontAwesomeIcons.github,
                color: Colors.grey[800],
              ),
            ),
            // const SizedBox(width: 16),
            IconButton(
              onPressed: () {
                launchInBrowser(Constant.urlTwitter);
              },
              icon: FaIcon(
                FontAwesomeIcons.twitter,
                color: Colors.grey[800],
              ),
            ),
            // const SizedBox(width: 16),
            IconButton(
              onPressed: () {
                // canLaunchUrl(Constant.urlGmail).then((value) => print(value));
                // launchInBrowser(Constant.urlGmail);
                // ignore: deprecated_member_use
                launch("mailto:zaphod@willamette.edu");
              },
              icon: FaIcon(
                FontAwesomeIcons.solidEnvelope,
                color: Colors.grey[800],
              ),
            ),
            // const SizedBox(width: 16),
            IconButton(
              onPressed: () {
                launchInBrowser(Constant.urlTelegram);
              },
              icon: FaIcon(
                FontAwesomeIcons.telegram,
                color: Colors.grey[800],
              ),
            ),
            // const SizedBox(width: 16),
            IconButton(
              onPressed: () {
                launchInBrowser(Constant.urlLinkedin);
              },
              icon: FaIcon(
                FontAwesomeIcons.linkedin,
                color: Colors.grey[800],
              ),
            ),
            // const SizedBox(width: 16),
            IconButton(
              onPressed: () {
                launchInBrowser(Constant.urlInstagram);
              },
              icon: FaIcon(
                FontAwesomeIcons.squareInstagram,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          "© 2022, made with Flutter by Irvan Alfaridzi",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: Colors.black54,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
