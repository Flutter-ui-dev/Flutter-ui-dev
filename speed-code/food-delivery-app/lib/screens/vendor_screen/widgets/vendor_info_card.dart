import 'package:flutter/material.dart';

import '../../../core/utils/ui_helper.dart';
import '../../../core/widgets/icon/custom_icons.dart';

class VendorInfoCard extends StatelessWidget {
  const VendorInfoCard(
      {Key? key,
      required this.title,
      required this.rating,
      required this.sideImagePath})
      : super(key: key);

  final String title;
  final double rating;
  final String sideImagePath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: space5x,
        right: space2x,
        top: space2x * 1.2,
        bottom: space2x * 1.2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontSize: rf(20),
                    ),
              ),
              SizedBox(
                height: rh(space1x * 1.2),
              ),
              Row(
                children: [
                  CIcons.fromMaterial(
                    icon: Icons.star,
                    semanticLabel: "rating",
                    size: rf(16),
                    color: const Color(0xFFFFB740),
                  ),
                  SizedBox(
                    width: rw(6),
                  ),
                  Text(
                    "$rating",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: rf(12)),
                  ),
                  Text(
                    " • fast food • \$\$ • 15-20 min",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.grey.shade400,
                          fontSize: rf(12),
                        ),
                  ),
                ],
              ),
              SizedBox(
                height: rh(space2x),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: space2x,
                      vertical: space1x,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE3DA),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Free delivery",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontSize: rf(12)),
                    ),
                  ),
                  SizedBox(
                    width: rw(space2x),
                  ),
                  Text(
                    "21 reviews",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Colors.grey.shade400,
                          fontSize: rf(12),
                        ),
                  )
                ],
              )
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(rf(15)),
            child: Image.asset(
              sideImagePath,
              width: rw(70),
            ),
          ),
        ],
      ),
    );
  }
}
