//
//
// import 'package:flutter/material.dart';
// import 'package:medicareproapp/Pages/DoctorAppointment/doctor_appointment_navigation.dart';
//
// import '../Constants/colors.dart';
// import 'detailstext1.dart';
//
// class DrawerWidget extends StatefulWidget {
//   const DrawerWidget({super.key});
//
//   @override
//   State<DrawerWidget> createState() => _DrawerWidgetState();
// }
//
// class _DrawerWidgetState extends State<DrawerWidget> {
//   String selectedMenuItem = ''; // Track the selected menu item
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(right: 60),
//       decoration: const BoxDecoration(
//           color:AppColors.tabColor,
//           borderRadius: BorderRadius.only(
//               bottomRight: Radius.circular(30),
//               topRight: Radius.circular(30))),
//       padding: const EdgeInsets.only(left: 20, right: 5, top: 10),
//       child: ListView(
//         physics: const BouncingScrollPhysics(),
//         children: [
//           ListTile(
//               leading: ClipRRect(
//                   borderRadius: BorderRadius.circular(40),
//                   child: Image.network(
//                       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQ1oLaDJlC-DvPibHvUAluSld6D4KG_Q00x6oMDubpL3K5lLeqWeKn8eUgbQ3ZiWjg6HM&usqp=CAU')),
//               title: const Text(
//                 'Hey!',
//                 style: TextStyle(color: Colors.white),
//               ),
//               subtitle: const Text1(text1: 'James Powell',)
//           ),
//           const SizedBox(
//             height: 10.0,
//           ),
//
//           buildMenuItem(
//             title: "Dashboard/Coach",
//             icon: Icons.dashboard,
//             onTap: () {
//               navigateTo(const DoctorAppointmentNavigation());
//             },
//           ),
//           const SizedBox(height: 3),
//           buildMenuItem(
//             title: "Activity",
//             icon: Icons.local_activity,
//             onTap: () {
//               navigateTo(const DoctorAppointmentNavigation());
//             },
//           ),
//           const SizedBox(height: 3),
//           buildMenuItem(
//             title: "Dairy",
//             icon: Icons.food_bank,
//             onTap: () {
//               navigateTo(const DoctorAppointmentNavigation());
//             },
//           ),
//           const SizedBox(height: 3),
//           buildMenuItem(
//             title: 'Hydration Tracking',
//             icon: Icons.water_drop_rounded,
//             onTap: () {
//               navigateTo(const DoctorAppointmentNavigation());
//             },
//           ),
//           const SizedBox(height: 3),
//
//           buildMenuItem(
//             title: 'Meal Planing',
//             icon: Icons.set_meal,
//             onTap: () {
//               navigateTo(const DoctorAppointmentNavigation());
//             },
//           ),
//           const SizedBox(height: 3),
//
//           buildMenuItem(
//             title: 'Mental Wellness',
//             icon: Icons.health_and_safety,
//             onTap: () {
//               navigateTo(const DoctorAppointmentNavigation());
//             },
//           ),
//           const SizedBox(height: 3),
//
//           buildMenuItem(
//             title: 'My Foods',
//             icon: Icons.fastfood_sharp,
//             onTap: () {
//               navigateTo(const DoctorAppointmentNavigation());
//             },
//           ),
//           const SizedBox(height: 3),
//
//           buildMenuItem(
//             title: "Progress Tracking",
//             icon: Icons.report,
//             onTap: () {
//               navigateTo(const DoctorAppointmentNavigation());
//             },
//           ),
//           const SizedBox(height: 3),
//
//           buildMenuItem(
//             title: "Sleep Tracking",
//             icon:Icons.art_track ,
//             onTap: () {
//               navigateTo(const DoctorAppointmentNavigation());
//             },
//           ),
//           const SizedBox(height: 3),
//
//           buildMenuItem(
//             title: "Workout",
//             icon:Icons.work_outline ,
//             onTap: () {
//               navigateTo(const DoctorAppointmentNavigation());
//             },
//           ),
//
//           const SizedBox(height: 3),
//
//           buildMenuItem(
//             title: "Settings And Profile",
//             icon: Icons.settings,
//             onTap: () {
//               navigateTo(const DoctorAppointmentNavigation());
//             },
//           ),
//
//           const SizedBox(height: 3),
//
//           buildMenuItem(
//             title: "About Wellness Tracker App",
//             icon: Icons.question_mark_outlined,
//             onTap: () {
//               navigateTo(const DoctorAppointmentNavigation());
//             },
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           const Divider(
//             thickness: 1,
//           ),
//           ListTile(
//             onTap: () {},
//             leading: const Icon(
//               Icons.logout,
//               color: Color(0xFFE8E8E8),
//               size: 20,
//             ),
//             title: const Text(
//               "Logout",
//
//               style: TextStyle(
//                   fontSize: 10,
//                   color: Color(0xFFE8E8E8), fontWeight: FontWeight.w400),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget buildMenuItem(
//       {required String title,
//         required IconData icon,
//         required VoidCallback onTap}) {
//     bool isSelected = title == selectedMenuItem;
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//       margin: const EdgeInsets.only(right: 30, top: 6),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         border: const Border(),
//         color: isSelected ? Colors.green : null, // Highlight selected item
//       ),
//       child: GestureDetector(
//         onTap: () {
//           setState(() {
//             selectedMenuItem = title;
//           });
//           onTap();
//         },
//         child: Row(
//           children: [
//             Icon(
//               icon,
//               size: 20,
//               color: isSelected ? Colors.white : const Color(0xFFE8E8E8),
//             ),
//             const SizedBox(
//               width: 12,
//             ),
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 12,
//                 color: isSelected ? Colors.white : const Color(0xFFE8E8E8),
//               ),
//             ),
//             const Spacer(),
//             const Icon(
//               Icons.navigate_next,
//               size: 20,
//               color: Colors.white,
//             ),
//             // ListTile(
//             //   onTap: () {
//             //
//             //   },
//             //   leading: Icon(
//             //     icon,
//             //     size: 20,
//             //     color: isSelected ? Colors.white : Color(0xFFE8E8E8),
//             //   ),
//             //   title: Text(
//             //     title,
//             //     style: TextStyle(
//             //       fontSize: 12,
//             //       color: isSelected ? Colors.white : Color(0xFFE8E8E8),
//             //
//             //     ),
//             //   ),
//             //   trailing: Icon(Icons.navigate_next,
//             //     size: 20,
//             //     color: Colors.white,
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void navigateTo(Widget page) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => page),
//     );
//   }
// }
