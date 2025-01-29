import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String? label;
  final double? value;
  final double? percentage;

  const ChartBar({
    this.label,
    this.value,
    this.percentage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 5,
            ),
            child: Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text('${value!.toStringAsFixed(2)}'),
              ),
            ),
          ),
          SizedBox(height: constraints.maxHeight * 0.05,),
          Container(
            height: constraints.maxHeight * 0.6,
            width: 10,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    color: const Color.fromARGB(220, 200, 201, 200),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: percentage,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: constraints.maxHeight * 0.05,),
          Container(
            height: constraints.maxHeight * 0.15,
            child: FittedBox(
              child: Text(label!)
              )
            ),
        ],
      );
      },
        
    );
  }
}