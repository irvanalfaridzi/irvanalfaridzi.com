part of '../pages.dart';

class DetailExperiencePage extends StatefulWidget {
  final Experience experience;
  const DetailExperiencePage({
    Key? key,
    required this.experience,
  }) : super(key: key);

  @override
  State<DetailExperiencePage> createState() => _DetailExperiencePageState();
}

class _DetailExperiencePageState extends State<DetailExperiencePage> {
  bool onHovered = false;
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
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              horizontal: constraints.maxWidth <= 500 ? 20 : 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// header
              widget.experience.hashtag.isEmpty
                  ? const SizedBox()
                  : Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: widget.experience.hashtag
                          .map(
                            (e) => Text(
                              "#$e",
                              style: TextStyle(
                                fontSize: constraints.maxWidth <= 500 ? 14 : 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.blue[400],
                              ),
                            ),
                          )
                          .toList(),
                    ),
              const SizedBox(height: 16),
              Text(
                widget.experience.companyName,
                style: TextStyle(
                  fontSize: constraints.maxWidth <= 500 ? 30 : 40,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 25),
              constraints.maxWidth <= 390
                  ? Column(
                      children: [
                        _buildDateWidget(constraints),
                        const SizedBox(height: 8),
                        _buildWebsiteLink(),
                      ],
                    )
                  : Row(
                      children: [
                        _buildDateWidget(constraints),
                        const SizedBox(width: 20),
                        _buildWebsiteLink(),
                      ],
                    ),

              /// image
              Container(
                width: double.infinity,
                height: 300,
                margin: const EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                  color: widget.experience.bgImageColor,
                  image: widget.experience.image.isEmpty
                      ? null
                      : DecorationImage(
                          image: AssetImage(
                            widget.experience.image[0],
                          ),
                          fit: BoxFit.scaleDown,
                        ),
                ),
                child: isLoading
                    ? Common.loadingWidget
                    : Container(
                        color: Colors.transparent,
                        child: widget.experience.image.isEmpty
                            ? const Center(
                                child: Text(
                                "no image",
                                style: TextStyle(color: Colors.black26),
                              ))
                            : const SizedBox(),
                      ),
              ),

              /// detail or description
              widget.experience.detail.isEmpty
                  ? const SizedBox()
                  : Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black12.withOpacity(0.05),
                      ),
                      child: Text(
                        widget.experience.detail,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                          height: 1.5,
                        ),
                      ),
                    ),

              /// technologies
              widget.experience.technologies.isEmpty
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 40),
                      child: Text(
                        widget.experience.technologies,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                        ),
                      ),
                    ),

              const Divider(thickness: 2),

              /// responsibility
              widget.experience.responsibility.isEmpty
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Column(
                        children: widget.experience.responsibility
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 5,
                                      height: 5,
                                      margin: const EdgeInsets.only(
                                          right: 8, top: 6),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        e,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    )
            ],
          ),
        );
      },
    );
  }

  Widget _buildWebsiteLink() {
    return widget.experience.urlWebsite == ""
        ? const SizedBox()
        : TextButton(
            onPressed: () {
              launchInBrowser(Uri.parse(widget.experience.urlWebsite));
            },
            onHover: (value) {
              setState(() {
                onHovered = value;
              });
            },
            style: ButtonStyle(
              splashFactory: InkSplash.splashFactory,
              overlayColor: MaterialStateProperty.all(
                Colors.blue.withOpacity(0.5),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                border: onHovered
                    ? null
                    : const Border(
                        bottom: BorderSide(
                          color: Colors.black,
                          width: 2.1,
                        ),
                      ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.link_sharp,
                    color: Colors.black,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Website",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  Row _buildDateWidget(BoxConstraints constraints) {
    return Row(
      children: [
        const Icon(
          Icons.calendar_month,
          color: Colors.black54,
        ),
        const SizedBox(width: 5),
        Text(
          widget.experience.joinDate,
          style: TextStyle(
            fontSize: constraints.maxWidth <= 500 ? 14 : 16,
            fontWeight: FontWeight.w400,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
