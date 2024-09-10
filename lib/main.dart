import 'package:flutter/material.dart';
import 'shap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => DiceCubit(),
        child: DiceScreen(),
      ),
    );
  }
}

class DiceScreen extends StatelessWidget {
  const DiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dice Roller'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: Container(
        color: const Color(
            0xFF6BB16E), // Use green color for garden-like background
        child: Center(
          child: BlocBuilder<DiceCubit, DiceState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sum ${state.sum}',
                      style:
                          const TextStyle(fontSize: 24, color: Colors.white)),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/d${state.dice1}.svg',
                        height: 100,
                        width: 100,
                      ),
                      const SizedBox(width: 20),
                      SvgPicture.asset(
                        'assets/d${state.dice2}.svg',
                        height: 100,
                        width: 100,
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<DiceCubit>().rollDice();
                      },
                      child: const Text('Roll'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue, // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 5,
                      ).copyWith(
                        // Modify the button style on hover
                        side: MaterialStateProperty.resolveWith(
                          (states) {
                            if (states.contains(MaterialState.hovered)) {
                              return BorderSide(
                                  color: const Color(0xFF20EB5D), width: 2);
                            }
                            return BorderSide.none;
                          },
                        ),
                        backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                            if (states.contains(MaterialState.hovered)) {
                              return Colors.blueAccent;
                            }
                            return Colors.blue;
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
