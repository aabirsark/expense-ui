import 'package:animate_do/animate_do.dart';
import 'package:expense/app/constants.app.dart';
import 'package:expense/app/extensions/navi.ext.dart';
import 'package:expense/meta/views/preview.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInUp(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              title: const Text("Current account"),
              pinned: true,
              backgroundColor: scaffoldColor,
              actions: [
                IconButton(
                    onPressed: () {}, icon: const Icon(CupertinoIcons.person))
              ],
            ),
            SliverPersistentHeader(delegate: CardDelegate()),
            SliverPersistentHeader(
              delegate: TransferDelegate(),
            ),
            SliverPersistentHeader(
              delegate: TitleHeader(),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) => FadeInUp(
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xFF081B23),
                      child: Center(
                        child: Icon(
                          Iconsax.arrow_down,
                          color: Colors.tealAccent,
                          size: 15,
                        ),
                      ),
                    ),
                    title: Text("Robert Hook"),
                    subtitle: Text(
                      "incoming payment",
                      style:
                          TextStyle(color: Colors.indigoAccent, fontSize: 12),
                    ),
                    trailing: Text(
                      "\$24687",
                      style: TextStyle(color: Colors.tealAccent),
                    ),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class TitleHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: const [
            Text(
              "Transactions",
              textScaleFactor: 1.3,
            ),
            Spacer(),
            Text(
              "Sort by",
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(
              width: 7,
            ),
            Icon(
              Iconsax.arrow_down,
              size: 20,
              color: Colors.white70,
            )
          ],
        ),
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

class TransferDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            ButtonCards(
              icon: Icon(
                CupertinoIcons.arrow_up,
                color: Colors.indigoAccent,
              ),
              label: "Send",
            ),
            ButtonCards(
              icon: Icon(
                Iconsax.arrow_down,
                color: Colors.tealAccent,
              ),
              label: "Request",
            ),
            ButtonCards(
              icon: Icon(Iconsax.share),
              label: "Share",
            )
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 110;

  @override
  double get minExtent => 110;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class ButtonCards extends StatelessWidget {
  const ButtonCards({Key? key, required this.icon, required this.label})
      : super(key: key);
  final Icon icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: const Color(0xFF081B23),
                borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: icon,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 10, color: Colors.white70),
          )
        ],
      ),
    );
  }
}

class CardDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            context.navigateTo(const PreviewPage());
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFF081B23),
                border: Border.all(color: Colors.white10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "MetaBank",
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(Iconsax.card_add)
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Aabir Sarkar",
                  style: TextStyle(color: Colors.white38, fontSize: 10),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "3460 **** **** 1234",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: const TextSpan(
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            children: [
                          TextSpan(
                              text: "Total amount :  ",
                              style: TextStyle(color: Colors.grey)),
                          TextSpan(
                            text: "\$246,424",
                          ),
                        ])),
                  ],
                )
              ],
            ),
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.all(12.0),
          ),
        ),
        Positioned(
            bottom: 12.0,
            right: 5.0,
            child: Image.network(
              "http://logok.org/wp-content/uploads/2014/03/Mastercard-logo-2016.png",
              height: 50,
              width: 100,
            ))
      ],
    );
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 200;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
