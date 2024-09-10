import 'dart:math';
import 'package:bloc/bloc.dart';

class DiceState {
  final int dice1;
  final int dice2;
  final int sum;

  DiceState({required this.dice1, required this.dice2, required this.sum});
}

class DiceCubit extends Cubit<DiceState> {
  DiceCubit() : super(DiceState(dice1: 2, dice2: 2, sum: 4));

  void rollDice() {
    final random = Random();
    int newDice1 = random.nextInt(6) + 1;
    int newDice2 = random.nextInt(6) + 1;
    int newSum = newDice1 + newDice2;

    emit(DiceState(dice1: newDice1, dice2: newDice2, sum: newSum));
  }
}
