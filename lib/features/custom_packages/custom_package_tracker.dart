import 'package:flutter/material.dart';
import 'package:sih_v2/features/constants/journey.dart';

class OrderTracker extends StatefulWidget {
  ///This variable is used to set status of order, this get only enum which is already in a package below example present.
  /// Status.order
  final int current;

  /// This variable is used to get list of order sub title and date to show present status of product.
  final List<TextDto>? orderTitleAndDateList;

  /// This variable is used to get list of shipped sub title and date to show present status of product.
  final List<TextDto>? shippedTitleAndDateList;

  /// This variable is used to get list of outOfDelivery sub title and date to show present status of product.
  final List<TextDto>? outOfDeliveryTitleAndDateList;

  /// This variable is used to get list of delivered sub title and date to show present status of product.
  final List<TextDto>? deliveredTitleAndDateList;

  /// This variable is used to change color of active animation border.
  final Color? activeColor;

  /// This variable is used to change color of inactive animation border.
  final Color? inActiveColor;

  /// This variable is used to change style of heading title text.
  final TextStyle? headingTitleStyle;

  /// This variable is used to change style of heading date text.
  final TextStyle? headingDateTextStyle;

  /// This variable is used to change style of sub title text.
  final TextStyle? subTitleTextStyle;

  /// This variable is used to change style of sub date text.
  final TextStyle? subDateTextStyle;

  const OrderTracker(
      {Key? key,
      required this.current,
      this.orderTitleAndDateList,
      this.shippedTitleAndDateList,
      this.outOfDeliveryTitleAndDateList,
      this.deliveredTitleAndDateList,
      this.activeColor,
      this.inActiveColor,
      this.headingTitleStyle,
      this.headingDateTextStyle,
      this.subTitleTextStyle,
      this.subDateTextStyle})
      : super(key: key);

  @override
  State<OrderTracker> createState() => _OrderTrackerState();
}

class _OrderTrackerState extends State<OrderTracker>
    with TickerProviderStateMixin {
  int route = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i <= journeyModels.length; i++)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                        border: widget.current == i
                            ? Border.all(color: Colors.yellow)
                            : null,
                        color: widget.current == i
                            ? Colors.yellow
                            : widget.current >= i
                                ? Colors.green
                                : Colors.grey[300],
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: journeyModels[route][i].sourceLocationName,
                            style: widget.headingTitleStyle ??
                                const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: SizedBox(
                      width: 2,
                      height: widget.shippedTitleAndDateList != null &&
                              widget.shippedTitleAndDateList!.isNotEmpty
                          ? widget.shippedTitleAndDateList!.length * 56
                          : 60,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: LinearProgressIndicator(
                            value: i == widget.current
                                ? 0
                                : i < widget.current
                                    ? 1
                                    : 0,
                            backgroundColor: Colors.grey[300],
                            color: Colors.green),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'RoundTrip Duration ${journeyModels[route][i].timeOfRoundTrip}',
                        style: widget.subTitleTextStyle ??
                            const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        DateTime.now().toString(),
                        style: widget.subDateTextStyle ??
                            TextStyle(fontSize: 14, color: Colors.grey[600]),
                      )
                    ],
                  ))
                ],
              ),
            ],
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      color: widget.current >= journeyModels[route].length
                          ? widget.activeColor ?? Colors.green
                          : widget.inActiveColor ?? Colors.grey[300],
                      borderRadius: BorderRadius.circular(50)),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: journeyModels[route]
                                  [journeyModels[route].length - 1]
                              .destinationLocationName,
                          style: widget.headingTitleStyle ??
                              const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: SizedBox(
                    width: 2,
                    height: widget.shippedTitleAndDateList != null &&
                            widget.shippedTitleAndDateList!.isNotEmpty
                        ? widget.shippedTitleAndDateList!.length * 56
                        : 60,
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: LinearProgressIndicator(
                          value: widget.current == journeyModels[route].length
                              ? 0
                              : widget.current > journeyModels[route].length - 1
                                  ? 1
                                  : 0,
                          backgroundColor: Colors.grey[300],
                          color: Colors.green),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.shippedTitleAndDateList?[index].title ??
                                  "",
                              style: widget.subTitleTextStyle ??
                                  const TextStyle(fontSize: 14),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              widget.shippedTitleAndDateList?[index].date ?? "",
                              style: widget.subDateTextStyle ??
                                  TextStyle(
                                      fontSize: 14, color: Colors.grey[600]),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 4,
                        );
                      },
                      itemCount: widget.shippedTitleAndDateList != null &&
                              widget.shippedTitleAndDateList!.isNotEmpty
                          ? widget.shippedTitleAndDateList!.length
                          : 0),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class TextDto {
  String? title;
  String? date;

  TextDto(this.title, this.date);
}

enum Status { order, shipped, outOfDelivery, delivered }
