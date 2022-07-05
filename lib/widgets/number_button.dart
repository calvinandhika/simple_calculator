import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calculator/providers/calculator_provider.dart';

class NumberButton extends StatelessWidget {
  const NumberButton({
    Key? key,
    required this.number,
  }) : super(key: key);

  final String number;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size.width;

    return Center(
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        child: Ink(
          width: screenSize / 4,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(24),
            ),
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Center(
              child:
                  Text(number, style: Theme.of(context).textTheme.bodyText1)),
        ),
        onTap: () {
          context.read<CalculatorProvider>().addDigitToNumber(number);
        },
      ),
    );
  }
}
