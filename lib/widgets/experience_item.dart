part of 'widgets.dart';

class ExperienceItem extends StatelessWidget {
  final String no;
  final Experience experience;
  final Function onTap;
  final double horizontalGap;
  const ExperienceItem({
    super.key,
    required this.no,
    required this.experience,
    required this.onTap,
    this.horizontalGap = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          horizontalTitleGap: horizontalGap,
          contentPadding: const EdgeInsets.symmetric(vertical: 20),
          onTap: () {
            onTap();
          },
          leading: Padding(
            padding: EdgeInsets.only(left: horizontalGap),
            child: Text(
              no,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  experience.companyName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                  softWrap: true,
                ),
              ),
              const SizedBox(width: 20),
              Text(
                experience.joinDate,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ),
                maxLines: 2,
              ),
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              experience.description,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
            ),
          ),
          trailing: Padding(
            padding: EdgeInsets.only(right: horizontalGap),
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.black54,
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
