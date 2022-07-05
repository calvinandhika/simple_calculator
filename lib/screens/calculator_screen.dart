import 'package:flutter/material.dart';
import 'package:simple_calculator/screens/profile_screen.dart';
import 'package:simple_calculator/providers/calculator_provider.dart';
import 'package:provider/provider.dart';
import 'package:simple_calculator/screens/ui_source_screen.dart';
import 'package:simple_calculator/widgets/number_button.dart';
import 'package:simple_calculator/widgets/op_button.dart';

enum AppTheme { dark, light }

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  bool isDarkTheme = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'LIGHT',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Switch(
                  value: isDarkTheme,
                  onChanged: (value) {
                    setState(() {
                      isDarkTheme = !isDarkTheme;
                    });
                    context.read<CalculatorProvider>().toggleAppTheme();
                  },
                  activeTrackColor: Theme.of(context).colorScheme.secondary,
                  activeColor: Theme.of(context).colorScheme.tertiary,
                  inactiveTrackColor: Theme.of(context).colorScheme.secondary,
                  inactiveThumbColor: Theme.of(context).colorScheme.primary,
                ),
                Text(
                  'DARK',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ),
                      );
                    },
                    child: const Text('Made By CA'),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UISourceScreen(),
                        ),
                      );
                    },
                    child: const Text('Ui Source'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Consumer<CalculatorProvider>(
              builder: (context, value, child) {
                return Text(
                  '${value.leftNumber.join()}'
                  '${value.op?.toLowerCase() ?? ''}'
                  '${value.rightNumber.join()}',
                  style: Theme.of(context).textTheme.headline2,
                );
              },
            ),
            FittedBox(
              fit: BoxFit.fitHeight,
              child: Consumer<CalculatorProvider>(
                builder: (context, value, child) {
                  return Text(
                    value.result.toString(),
                    style: Theme.of(context).textTheme.headline1,
                  );
                },
              ),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 1 / 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      //row 1
                      const OpButton(op: 'C', colorIsSecondary: true),
                      OpButton(
                          op: String.fromCharCode(0x2190),
                          colorIsSecondary: true),
                      const OpButton(op: '%', colorIsSecondary: true),
                      OpButton(
                          op: String.fromCharCode(0x00F7),
                          colorIsSecondary: false),
                      //row 2
                      const NumberButton(number: '7'),
                      const NumberButton(number: '8'),
                      const NumberButton(number: '9'),
                      const OpButton(op: 'X', colorIsSecondary: false),
                      //row 3
                      const NumberButton(number: '4'),
                      const NumberButton(number: '5'),
                      const NumberButton(number: '6'),
                      const OpButton(op: '-', colorIsSecondary: false),
                      //row 4
                      const NumberButton(number: '1'),
                      const NumberButton(number: '2'),
                      const NumberButton(number: '3'),
                      const OpButton(op: '+', colorIsSecondary: false),
                      //row 5
                      const NumberButton(number: '.'),
                      const NumberButton(number: '0'),
                      const NumberButton(number: '.'),

                      const OpButton(op: '=', colorIsSecondary: false),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
    );
  }
}
