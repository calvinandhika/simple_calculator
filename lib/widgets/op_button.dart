import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calculator/providers/calculator_provider.dart';

class OpButton extends StatelessWidget {
  const OpButton({
    Key? key,
    required this.op,
    required this.colorIsSecondary,
  }) : super(key: key);

  final String op;
  final bool colorIsSecondary;

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
            color: colorIsSecondary
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.tertiary,
          ),
          child: Center(
              child: Text(op, style: Theme.of(context).textTheme.bodyText1)),
        ),
        onTap: () {
          context.read<CalculatorProvider>().addDigitToOp(op);
        },
      ),
    );
  }
}
