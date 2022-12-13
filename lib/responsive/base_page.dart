import 'package:alfaridzi_me/models/models.dart';
import 'package:alfaridzi_me/pages/pages.dart';
import 'package:flutter/material.dart';

import '../utils/scroll_behaviour.dart';
import '../widgets/widgets.dart';

enum NamePage { homePage, aboutPage, projectPage, detailExperiencePage }

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  double width = 500;
  NamePage namePage = NamePage.homePage;
  Experience _experience = experienceList[0];
  ScrollController scrollController = ScrollController();

  // for making scroll position to top of screen
  jumpToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  onHomePage() {
    setState(() {
      namePage = NamePage.homePage;
      jumpToTop();
      width = 500;
    });
  }

  onAboutPage() {
    setState(() {
      namePage = NamePage.aboutPage;
      jumpToTop();
      width = 500;
    });
  }

  onProjectsPage() {
    setState(() {
      namePage = NamePage.projectPage;
      jumpToTop();
      width = 500;
    });
  }

  @override
  Widget build(BuildContext context) {
    // appRoutes
    Map<NamePage, Widget> appRoutes = {
      NamePage.homePage: HomePage(onTap: () {
        onAboutPage();
      }),
      NamePage.aboutPage: AboutPage(
        onTap: (e) {
          setState(() {
            namePage = NamePage.detailExperiencePage;
            _experience = e;
            jumpToTop();
          });
        },
      ),
      NamePage.projectPage: const ProjectsPage(),
      NamePage.detailExperiencePage:
          DetailExperiencePage(experience: _experience),
    };
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              ScrollConfiguration(
                behavior: MyCustomScrollBehavior(),
                child: SingleChildScrollView(
                  primary: false,
                  controller: scrollController,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: constraints.maxWidth <= 500 ? 20 : 50,
                        vertical: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // navbar
                        const SizedBox(height: 20),
                        _buildTopNavbar(constraints),

                        // main page
                        SizedBox(height: constraints.maxWidth > 500 ? 100 : 55),
                        appRoutes[namePage] ??
                            HomePage(
                              onTap: () {
                                onAboutPage();
                              },
                            ),

                        // footer
                        const SizedBox(height: 100),
                        _buildMyFooter(),
                      ],
                    ),
                  ),
                ),
              ),
              _buildMobileNavbarMenu(constraints, context),
            ],
          );
        },
      ),
    );
  }

  Visibility _buildMobileNavbarMenu(
      BoxConstraints constraints, BuildContext context) {
    return Visibility(
      visible: constraints.maxWidth <= 500,
      child: AnimatedPositioned(
        left: -width,
        duration: const Duration(
          milliseconds: 400,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: ScrollConfiguration(
            behavior: MyCustomScrollBehavior(),
            child: SingleChildScrollView(
              primary: false,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: constraints.maxWidth <= 500 ? 20 : 50,
                  vertical: 30,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          width = 500;
                        });
                      },
                      iconSize: 40,
                      icon: const Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 50),
                    MySecondaryButton(
                      text: "Home",
                      onTap: () {
                        onHomePage();
                      },
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                    ),
                    const SizedBox(height: 10),
                    MySecondaryButton(
                      text: "About",
                      onTap: () {
                        onAboutPage();
                      },
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                    ),
                    const SizedBox(height: 10),
                    MySecondaryButton(
                      text: "Projects",
                      onTap: () {
                        onProjectsPage();
                      },
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                    ),
                    const SizedBox(height: 150),
                    Center(
                      child: MyFooter(
                        showMenu: false,
                        onHomePage: MenuData(
                          onTap: () {
                            onHomePage();
                          },
                          isSelected: namePage == NamePage.homePage,
                        ),
                        onAboutPage: MenuData(
                          onTap: () {
                            onAboutPage();
                          },
                          isSelected: namePage == NamePage.aboutPage,
                        ),
                        onProjectsPage: MenuData(
                          onTap: () {
                            onProjectsPage();
                          },
                          isSelected: namePage == NamePage.projectPage,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  MyFooter _buildMyFooter() {
    return MyFooter(
      onHomePage: MenuData(
        onTap: () {
          onHomePage();
        },
        isSelected: namePage == NamePage.homePage,
      ),
      onAboutPage: MenuData(
        onTap: () {
          onAboutPage();
        },
        isSelected: namePage == NamePage.aboutPage,
      ),
      onProjectsPage: MenuData(
        onTap: () {
          onProjectsPage();
        },
        isSelected: namePage == NamePage.projectPage,
      ),
    );
  }

  TopNavBar _buildTopNavbar(BoxConstraints constraints) {
    return TopNavBar(
      isMobileLayout: constraints.maxWidth <= 500,
      isTabletLayout: constraints.maxWidth < 1100,
      onTap: () {
        setState(() {
          width = 0;
        });
      },
      onHomePage: MenuData(
        onTap: () {
          onHomePage();
        },
        isSelected: namePage == NamePage.homePage,
      ),
      onAboutPage: MenuData(
        onTap: () {
          onAboutPage();
        },
        isSelected: namePage == NamePage.aboutPage ||
            namePage == NamePage.detailExperiencePage,
      ),
      onProjectsPage: MenuData(
        onTap: () {
          onProjectsPage();
        },
        isSelected: namePage == NamePage.projectPage,
      ),
    );
  }
}
