import 'package:flutter/material.dart';
import 'package:footbal_app/core/app_export.dart';

class CustomSegmentedProgressBar extends StatefulWidget {
  final int index;
  final int count;
  final Color? activeColor;
  final Color? unactiveColor;
  final EdgeInsets? padding;

  CustomSegmentedProgressBar(
      {Key? key,
      required this.count,
      required this.index,
      this.activeColor,
      this.unactiveColor,
      this.padding})
      : super(key: key);

  @override
  State<CustomSegmentedProgressBar> createState() =>
      _CustomSegmentedProgressBarState();
}

class _CustomSegmentedProgressBarState
    extends State<CustomSegmentedProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: AppDecoration.fillOnPrimaryContainer,
      //width: 10,
      child: Padding(
        padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 20.h),
        child: Container(
          //decoration: AppDecoration.fillOnPrimaryContainer,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 15,
                width: 45,
                decoration: AppDecoration.surface?.copyWith(borderRadius: BorderRadius.circular(30)),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.count,
                  (currentIndex) => Container(
                      //decoration: AppDecoration.fillOnPrimaryContainer,
                      width: currentIndex == widget.index ? 15.h : 9.h,
                      child: _buildSegment(currentIndex)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSegment(int currentIndex) {
    Color color = (currentIndex == widget.index)
        ? widget.activeColor ?? theme.colorScheme.primary
        : widget.unactiveColor ?? appTheme.gray700;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Container(
        // Ширина сегмента
        height: 5.0, // Высота сегмента
        // margin: EdgeInsets.symmetric(horizontal: 0.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
