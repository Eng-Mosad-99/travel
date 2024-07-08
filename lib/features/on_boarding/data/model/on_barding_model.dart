class OnBoardingModel {
  final String image;
  final String textImage;

  OnBoardingModel({
    required this.image,
    required this.textImage,
  });
}

List<OnBoardingModel> onBoardingData = [
  OnBoardingModel(
    image: 'Assets/images/onBoarding1.png',
    textImage: 'Assets/images/onBoardingText1.png',
  ),
  OnBoardingModel(
    image: 'Assets/images/onBoarding2.png',
    textImage: 'Assets/images/onBoardingText2.png',
  ),
  OnBoardingModel(
    image: 'Assets/images/onBoarding3.png',
    textImage: 'Assets/images/onBoardingText3.png',
  ),
];
