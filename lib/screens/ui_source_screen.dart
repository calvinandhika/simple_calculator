import 'package:flutter/material.dart';

class UISourceScreen extends StatefulWidget {
  const UISourceScreen({Key? key}) : super(key: key);

  @override
  State<UISourceScreen> createState() => _UISourceScreenState();
}

class _UISourceScreenState extends State<UISourceScreen> {
  bool contentToggle = true;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          'UI Source Screen',
          textAlign: TextAlign.center,
        ),
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              setState(() {
                contentToggle = !contentToggle;
              });
            },
            child: AnimatedContainer(
              width: contentToggle ? screenSize.width / 2 : screenSize.width,
              height: contentToggle ? 200 : screenSize.height,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                borderRadius: contentToggle
                    ? const BorderRadius.all(Radius.circular(15))
                    : null,
              ),
              duration: const Duration(milliseconds: 300),
              child: Center(
                child: SelectableText(
                  contentToggle
                      ? 'Click Me!'
                      : 'Check Out:\n'
                          'https://www.figma.com/community/file/1041082497681424521',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
