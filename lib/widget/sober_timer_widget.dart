// import 'package:flutter/material.dart';
// import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:kwik_kik/widget/forum_post_widget.dart';
// import 'package:kwik_kik/widget/recommended_books_widget.dart';
// import 'package:kwik_kik/widget/timer_basic.dart';
// import 'package:kwik_kik/widget/timer_frame.dart';
// import 'package:kwik_kik/widget/tips_card_widget.dart';

// class SoberTimer extends StatefulWidget {
//   const SoberTimer({super.key});

//   @override
//   State<SoberTimer> createState() => _SoberTimerState();
// }

// class _SoberTimerState extends State<SoberTimer> {
//   String initialVal = "Quit Smoking";
//   final List<String> quitOptions = [
//     'Quit Smoking',
//     'Quit Gambling',
//     'Quit Drinking',
//   ];
//   int selectedSection = 0;
//   String selectedTab = "Tips";

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

//     return SafeArea(
//       top: true,
//       bottom: true,
//       left: true,
//       right: true,
//       minimum: const EdgeInsets.all(8.0),
//       maintainBottomViewPadding: true,
//       child: Column(
//         children: [
//           Container(
//             width: screenWidth,
//             height: screenHeight * 0.68,
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(18),
//             ),
//             child: ListView(
//               children: [
//                 TimerFrame(
//                   description: 'Customized Timer Countdown',
//                   timer: TimerBasic(
//                     format: CountDownTimerFormat.daysHoursMinutesSeconds,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: SizedBox(
//                     height: 100.0,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: TabTypes.length,
//                       itemBuilder: (context, index) {
//                         return buildAnimalIcon(index);
//                       },
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     FontAwesomeIcons.comment,
//                     color: Colors.amber,
//                   ),
//                 ),
//                 selectedSection == 0
//                     ? const TipsSection()
//                     : selectedSection == 1
//                         ? const BookSection()
//                         : const ForumSction(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   List<String> TabTypes = [
//     'Tips',
//     'Books',
//     'Forum',
//   ];

//   List<IconData> sectionIcons = [
//     FontAwesomeIcons.lightbulb,
//     FontAwesomeIcons.book,
//     FontAwesomeIcons.comment,
//   ];
//   Widget buildAnimalIcon(int index) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 60.0),
//       child: Column(
//         children: <Widget>[
//           InkWell(
//             onTap: () {
//               setState(() {
//                 selectedSection = index;
//                 selectedTab = TabTypes[selectedSection];
//               });
//             },
//             child: Material(
//               color: selectedSection == index
//                   ? Theme.of(context).primaryColor
//                   : Colors.white,
//               elevation: 8.0,
//               borderRadius: BorderRadius.circular(20.0),
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Icon(
//                   sectionIcons[index],
//                   size: 20.0,
//                   color: selectedSection == index
//                       ? Colors.white
//                       : Theme.of(context).primaryColor,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 12.0,
//           ),
//           Text(
//             TabTypes[index],
//             style: TextStyle(
//               color: Theme.of(context).primaryColor,
//               fontSize: 16.0,
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class TipsSection extends StatelessWidget {
//   const TipsSection({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: const [
//         CustomNewsWidget(
//           image:
//               'https://assets.nhs.uk/campaigns-cms-prod/images/header-smoking-lungs-cut-out-whole_HHWHaNx.width-320.png',
//           headline: 'Flutter News Widget',
//           author: 'John Doe',
//           createdAt: '2023-07-21',
//         ),
//         SizedBox(
//           height: 16,
//         ),
//         CustomNewsWidget(
//           image:
//               'https://assets.nhs.uk/campaigns-cms-prod/images/header-smoking-lungs-cut-out-whole_HHWHaNx.width-320.png',
//           headline: 'Flutter News Widget',
//           author: 'John Doe',
//           createdAt: '2023-07-21',
//         ),
//         SizedBox(
//           height: 16,
//         ),
//         CustomNewsWidget(
//           image:
//               'https://assets.nhs.uk/campaigns-cms-prod/images/header-smoking-lungs-cut-out-whole_HHWHaNx.width-320.png',
//           headline: 'Flutter News Widget',
//           author: 'John Doe',
//           createdAt: '2023-07-21',
//         ),
//       ],
//     );
//   }
// }

// class BookSection extends StatelessWidget {
//   const BookSection({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: const [
//         RecommendedBookWidget(
//           imageUrl:
//               'https://www.booktopia.com.au/covers/150/9781784288655/0000/the-illustrated-easy-way-to-stop-drinking.jpg', // Replace with the actual image URL
//           title: 'Book Title',
//           author: 'Author Name',
//           amazonLink:
//               'https://www.amazon.com/your-book-url', // Replace with the actual Amazon URL
//         ),
//         RecommendedBookWidget(
//           imageUrl:
//               'https://www.booktopia.com.au/covers/150/9781789500042/4504/allen-carr-s-easy-way-to-quit-emotional-eating.jpg', // Replace with the actual image URL
//           title: 'Book Title',
//           author: 'Author Name',
//           amazonLink:
//               'https://www.amazon.com/your-book-url', // Replace with the actual Amazon URL
//         ),
//         RecommendedBookWidget(
//           imageUrl:
//               'https://www.booktopia.com.au/covers/150/9781398800441/7018/allen-carr-s-easy-way-to-quit-smoking-without-willpower-in.jpg', // Replace with the actual image URL
//           title: 'Book Title',
//           author: 'Author Name',
//           amazonLink:
//               'https://www.amazon.com/your-book-url', // Replace with the actual Amazon URL
//         ),
//         RecommendedBookWidget(
//           imageUrl:
//               'https://www.booktopia.com.au/covers/150/9781785991462/0000/stop-smoking-with-allen-carr.jpg', // Replace with the actual image URL
//           title: 'Book Title',
//           author: 'Author Name',
//           amazonLink:
//               'https://www.amazon.com/your-book-url', // Replace with the actual Amazon URL
//         ),
//       ],
//     );
//   }
// }

// class ForumSction extends StatelessWidget {
//   const ForumSction({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ForumPostWidget(
//           userName: 'John Doe',
//           userImageURL:
//               'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
//           datePosted: 'July 22, 2023',
//           postImageURL:
//               'https://www.1mg.com/articles/wp-content/uploads/2016/12/rsz_shutterstock_258753287.jpg',
//           postContent:
//               'This is the content of the post. Lorem ipsum dolor sit amet...',
//         ),
//         ForumPostWidget(
//           userName: 'John Doe',
//           userImageURL:
//               'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
//           datePosted: 'July 22, 2023',
//           postImageURL:
//               'https://www.1mg.com/articles/wp-content/uploads/2016/12/rsz_shutterstock_258753287.jpg',
//           postContent:
//               'This is the content of the post. Lorem ipsum dolor sit amet...',
//         ),
//         ForumPostWidget(
//           userName: 'John Doe',
//           userImageURL:
//               'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
//           datePosted: 'July 22, 2023',
//           postImageURL:
//               'https://www.1mg.com/articles/wp-content/uploads/2016/12/rsz_shutterstock_258753287.jpg',
//           postContent:
//               'This is the content of the post. Lorem ipsum dolor sit amet...',
//         ),
//       ],
//     );
//   }
// }
