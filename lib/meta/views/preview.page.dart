import 'package:animate_do/animate_do.dart';
import 'package:expense/app/constants.app.dart';
import 'package:expense/app/extensions/navi.ext.dart';
import 'package:expense/meta/views/charts.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInUp(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: scaffoldColor,
              leading: IconButton(
                  onPressed: () {
                    context.navigateBack();
                  },
                  icon: const Icon(CupertinoIcons.arrow_left)),
              actions: [
                IconButton(
                    onPressed: () {}, icon: const Icon(CupertinoIcons.person))
              ],
            ),
            SliverPersistentHeader(delegate: IcomeHead()),
            SliverPersistentHeader(delegate: ChartHeader()),
            SliverPersistentHeader(delegate: Overview()),
            SliverPersistentHeader(delegate: TitleHeader()),
            SliverList(
                delegate: SliverChildListDelegate([
              ListTile(
                leading: const CircularProgressIndicator(
                  value: .75,
                  backgroundColor: Colors.white10,
                  color: Colors.tealAccent,
                  strokeWidth: 3,
                ),
                title: const Text("75%"),
                subtitle: const Text("Hit rate this year"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      CupertinoIcons.arrow_up,
                      color: Colors.tealAccent,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "4.5%",
                      style: TextStyle(color: Colors.tealAccent),
                    )
                  ],
                ),
              ),
              ListTile(
                leading: const CircularProgressIndicator(
                  value: .5,
                  backgroundColor: Colors.white10,
                  color: Colors.redAccent,
                  strokeWidth: 3,
                ),
                title: const Text("50%"),
                subtitle: const Text("Hit rate this year"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      CupertinoIcons.arrow_down,
                      color: Colors.redAccent,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "4.5%",
                      style: TextStyle(color: Colors.redAccent),
                    )
                  ],
                ),
              )
            ]))
          ],
        ),
      ),
    );
  }
}

class ChartHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return const AspectRatio(aspectRatio: 1.8, child: Chart());
  }

  @override
  double get maxExtent => 250;

  @override
  double get minExtent => 250;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class TitleHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        "Average Total Transcations",
        style: TextStyle(color: Colors.white70, fontSize: 15),
      ),
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class Overview extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Overview",
                style: TextStyle(color: Colors.white70, fontSize: 15),
              ),
              Container(
                height: 35,
                width: 120,
                // padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text("This year"),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Iconsax.arrow_down,
                        size: 15,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  OverviewCard(
                      color: Color(0xFF071A1B),
                      icon: CupertinoIcons.arrow_up,
                      label: "Income",
                      iconColor: Colors.tealAccent),
                  OverviewCard(
                      color: Color(0xFF1D1517),
                      icon: CupertinoIcons.arrow_down,
                      label: "Expense",
                      iconColor: Colors.red),
                  OverviewCard(
                      color: Color(0xFF071A1B),
                      icon: CupertinoIcons.arrow_up,
                      label: "Income",
                      iconColor: Colors.tealAccent),
                  OverviewCard(
                      color: Color(0xFF1D1517),
                      icon: CupertinoIcons.arrow_down,
                      label: "Expense",
                      iconColor: Colors.red),
                ],
              ))
        ],
      ),
    );
  }

  @override
  double get maxExtent => 270;

  @override
  double get minExtent => 270;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class OverviewCard extends StatelessWidget {
  const OverviewCard(
      {Key? key,
      required this.color,
      required this.icon,
      required this.label,
      required this.iconColor})
      : super(key: key);
  final Color color;
  final Color iconColor;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      child: Container(
        height: 180,
        width: 150,
        margin: const EdgeInsets.only(right: 15.0),
        decoration: BoxDecoration(
            color: Colors.white10, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Icon(
                  icon,
                  color: iconColor,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "\$24.1 K",
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Income",
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "24.26%",
              style: TextStyle(color: iconColor, fontSize: 10),
            )
          ]),
        ),
      ),
    );
  }
}

class IcomeHead extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Total Balance",
            style: TextStyle(color: Colors.white70, fontSize: 18),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "\$246,424",
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 100;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
