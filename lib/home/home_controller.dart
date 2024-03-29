import 'package:flutter/material.dart';
import 'package:nlw_quiz/home/home_repository.dart';
import 'package:nlw_quiz/shared/models/quiz_model.dart';
import 'package:nlw_quiz/shared/models/user_model.dart';

import 'home_state.dart';

class HomeController {
  ValueNotifier<HomeState> stateNotifier =
      ValueNotifier<HomeState>(HomeState.loading);

  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel> quizzes = [];

  final repository = HomeRepository();

  void getUser() async {
    state = HomeState.loading;
    user = await repository.getUser();
    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    quizzes = await repository.getQuizzes();
    state = HomeState.success;
  }
}
