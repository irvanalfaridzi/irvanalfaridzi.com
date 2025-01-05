part of 'widgets.dart';

class TopNavBar extends StatelessWidget {
  final bool isMobileLayout;
  final bool isTabletLayout;
  final Function onTap;
  final MenuData onHomePage;
  final MenuData onAboutPage;
  final MenuData onProjectsPage;
  const TopNavBar({
    super.key,
    this.isMobileLayout = false,
    this.isTabletLayout = false,
    required this.onTap,
    required this.onHomePage,
    required this.onAboutPage,
    required this.onProjectsPage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: isMobileLayout,
          child: Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                onTap();
              },
              iconSize: 40,
              icon: const Icon(
                Icons.menu_rounded,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Visibility(
          visible: !isMobileLayout,
          child: Align(
            alignment: AlignmentDirectional.center,
            child: Row(
              children: [
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    children: [
                      MyMenuButton(
                        text: "Home",
                        onTap: () {
                          onHomePage.onTap();
                        },
                        isSelected: onHomePage.isSelected,
                      ),
                      const SizedBox(width: 16),
                      MyMenuButton(
                        text: "About",
                        onTap: () {
                          onAboutPage.onTap();
                        },
                        isSelected: onAboutPage.isSelected,
                      ),
                      const SizedBox(width: 16),
                      MyMenuButton(
                        text: "Projects",
                        onTap: () {
                          onProjectsPage.onTap();
                        },
                        isSelected: onProjectsPage.isSelected,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
        Visibility(
          visible: !isTabletLayout,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: MySecondaryButton(
                text: 'Irvan Alfaridzi',
                onTap: () {
                  onHomePage.onTap();
                },
              ),
            ),
          ),
        ),
        Visibility(
          visible: !isTabletLayout,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: MySecondaryButton(
                text: 'Contact',
                onTap: () {
                  // Find the ScaffoldMessenger in the widget tree
                  // and use it to show a SnackBar.
                  ScaffoldMessenger.of(context)
                      .showSnackBar(Common.snackBar(context));
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
