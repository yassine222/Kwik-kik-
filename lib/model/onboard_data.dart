class OnBoarding {
  final String title;
  final String image;

  OnBoarding({
    required this.title,
    required this.image,
  });
}

List<OnBoarding> onboardingContents = [
  OnBoarding(
    title: 'Welcome to\n Kwik kik',
    image: 'assets/images/welcome.png',
  ),
  OnBoarding(
    title: 'Create new habits easily',
    image: 'assets/images/time_manegment.png',
  ),
  OnBoarding(
    title: 'Keep track of your progress',
    image: 'assets/images/progress.png',
  ),
  OnBoarding(
    title: 'Join a supportive community',
    image: 'assets/images/friends.png',
  ),
];
