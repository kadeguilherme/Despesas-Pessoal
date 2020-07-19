import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;

  ChartBar({
    this.label,
    this.value,
    this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Container(
                height: constraints.maxHeight * 0.1,
                child: FittedBox(
                  child: Text(
                    '${value.toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: constraints.maxHeight * 0.04),
              Container(
                height: constraints.maxHeight * 0.50,
                width: 12,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    FractionallySizedBox(
                      heightFactor: percentage,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: constraints.maxHeight * 0.05),
              Container(
                height: constraints.maxHeight * 0.14,
                child: FittedBox(
                  child: Text(
                    label,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
