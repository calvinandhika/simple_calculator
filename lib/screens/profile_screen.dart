import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool contentToggle = true;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          'Profile Creator Screen',
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
                color: Colors.cyan.shade600,
                borderRadius: contentToggle
                    ? const BorderRadius.all(Radius.circular(15))
                    : null,
              ),
              duration: const Duration(milliseconds: 300),
              child: Center(
                child: Text(
                  contentToggle
                      ? 'Click Me!'
                      : 'Hei, It\'s Me\n' 'Calvin Andhika!',
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
