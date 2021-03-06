import 'package:easy_peasy/constants.dart';

class OnboardingModel {
  String image;
  String title;
  String text;

  OnboardingModel(
      {required this.image, required this.title, required this.text});
  static List<OnboardingModel> list = [
    OnboardingModel(
        image: k1stImageOnboardingPath,
        title: "Выбирай",
        text: "нужные слова\nиз готовых подборок"),
    OnboardingModel(
        image: k2ndImageOnboardingPath,
        title: "Запоминай",
        text: "слова с помощью\nлегкой игровой механики"),
    OnboardingModel(
        image: k3rdImageOnboardingPath,
        title: "Применяй",
        text: "полученные навыки\nв повседневной жизни")
  ];
}
