part of 'widgets.dart';

class Skeleton {
  static Widget experienceSkeleton(double horizontalGap,
          {int skeletonLength = 3}) =>
      Column(
        children: List.generate(
          skeletonLength,
          (index) => Shimmer.fromColors(
            baseColor: Colors.grey[300] ?? Colors.grey,
            highlightColor: Colors.grey[100] ?? Colors.white54,
            child: Column(
              children: [
                ListTile(
                  horizontalTitleGap: horizontalGap,
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  onTap: () {},
                  leading: Padding(
                    padding: EdgeInsets.only(left: horizontalGap),
                    child:
                        Container(width: 20, height: 20, color: Colors.white),
                  ),
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Container(height: 15, color: Colors.white)),
                      const SizedBox(width: 20),
                      Container(
                        width: 100,
                        height: 15,
                        color: Colors.white,
                      )
                    ],
                  ),
                  subtitle: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Container(height: 15, color: Colors.white)),
                  trailing: Padding(
                    padding: EdgeInsets.only(right: horizontalGap),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      );
}
