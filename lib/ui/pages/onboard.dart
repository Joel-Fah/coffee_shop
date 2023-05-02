import 'package:coffee_shop/ui/components/helper.dart';
import 'package:coffee_shop/ui/pages/home.dart';
import 'package:flutter/material.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImagePath.onboarding),
                fit: BoxFit.cover,
                opacity: 0.45,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40.0, 0, 40.0, 70.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Good coffee,\nGood friends,\nlet it blend',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: const Color(0xFFCBCBD4),
                        fontSize: 28.0,
                        fontWeight: FontWeight.w600,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15.0),
                const Text(
                  'The best grain, the finest roast,\nthe most powerful flavor.',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 5.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    const SizedBox(width: 10.0),
                    Container(
                      height: 5.0,
                      width: 5.0,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                    ),
                    const SizedBox(width: 10.0),
                    Container(
                      height: 5.0,
                      width: 5.0,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                    ),
                  ],
                ),
                const SizedBox(height: 50.0),
                SizedBox(
                  width: ContextVariables.width(context),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                    ),
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
