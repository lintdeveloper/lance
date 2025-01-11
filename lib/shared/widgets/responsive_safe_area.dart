import 'package:flutter/material.dart';
import 'package:lance/utils/colors.dart';

typedef ResponsiveBuilder = Widget Function(
    BuildContext context,
    Size size
    );

class ResponsiveSafeArea extends StatelessWidget {
  final ResponsiveBuilder? responsiveBuilder;

  const ResponsiveSafeArea({
    super.key,
    @required ResponsiveBuilder? builder
  }) : responsiveBuilder = builder;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width: size.width, height: size.height,
              color: LanceColors.whiteColor,
              child: responsiveBuilder!(context,
                  constraints.biggest
              ),
            );
          }
      ),
    );
  }

}
