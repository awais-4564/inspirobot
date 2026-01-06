// import 'package:flutter/material.dart';
// import 'package:medicareproapp/Pages/LiveConsultations/consultations_details.dart';
// import 'package:medicareproapp/Widgets/custom_outline_button.dart';
//
// import '../../Constants/colors.dart';
// import '../custombtn.dart';
// import '../detailstext1.dart';
// import '../detailstext2.dart';
// import '../text11.dart';
//
//
// class BottomSheetWidget {
//   static void removeFavoritesBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: AppColors.bgColor,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(15.0),
//           topRight: Radius.circular(15.0),
//         ),
//       ),
//       builder: (context) {
//         return Container(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//           height: MediaQuery.of(context).size.height * 0.29,
//           width: double.infinity,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Center(child: Text1(text1: 'Remove from Favorite?',size: 18,)),
//               const SizedBox(height: 12,),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     color: AppColors.tabColor,
//                     borderRadius: BorderRadius.circular(8)),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(8),
//                           child: Image.asset(
//                             'images/drrobert.jpg',
//                             width: 67,
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 10, vertical: 5),
//                                     width: 150,
//                                     decoration: BoxDecoration(
//                                         color: AppColors.bgColor,
//                                         borderRadius: BorderRadius.circular(8)),
//                                     child: const Row(
//                                       children: [
//                                         CircleAvatar(
//                                           radius: 8,
//                                           backgroundColor: AppColors.buttonColor,
//                                           child: Icon(
//                                             Icons.check,
//                                             color: Colors.white,
//                                             size: 10,
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: 5,
//                                         ),
//                                         Text11(
//                                           text2: 'Professor Doctor',
//                                           color: AppColors.buttonColor,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 6,
//                               ),
//                               const Text1(
//                                 text1: 'Dr.Robert Fox',
//                               ),
//                               const SizedBox(
//                                 height: 2,
//                               ),
//                               const Text2(text2: 'Dentist'),
//                               const SizedBox(
//                                 height: 2,
//                               ),
//                               Row(
//                                 children: [
//                                   const Icon(
//                                     Icons.star,
//                                     color: AppColors.buttonColor,
//                                     size: 20,
//                                   ),
//                                   const Icon(
//                                     Icons.star,
//                                     color: AppColors.buttonColor,
//                                     size: 20,
//                                   ),
//                                   const Icon(
//                                     Icons.star,
//                                     color: AppColors.buttonColor,
//                                     size: 20,
//                                   ),
//                                   const Icon(
//                                     Icons.star,
//                                     color: AppColors.buttonColor,
//                                     size: 20,
//                                   ),
//                                   const Icon(
//                                     Icons.star,
//                                     color: AppColors.buttonColor,
//                                     size: 20,
//                                   ),
//                                   const Text1(text1: '4.6'),
//                                   const Spacer(),
//                                   Container(
//                                     color: Colors.white,
//                                     width: 1,
//                                     height: 16,
//                                   ),
//                                   const Spacer(),
//                                   const Text2(text2: '49 Reviews')
//                                 ],
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//
//                   ],
//                 ),
//               ),
//               Row(
//                 children: [
//                   Flexible(child: CustomOutlinedButton(text: 'Make Appointment', onTap: (){})),
//                   const SizedBox(width: 10,),
//                   Flexible(child: CustomButton(text: 'Make Appointment', onTap: (){})),
//
//                 ],
//               )
//
//
//
//
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   static void regularCheckupBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: AppColors.bgColor,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(15.0),
//           topRight: Radius.circular(15.0),
//         ),
//       ),
//       builder: (context) {
//         return Container(
//           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//           height: MediaQuery.of(context).size.height * 0.29,
//           width: double.infinity,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 10,),
//               const Text1(text1: 'Regular Checkup',size: 22,),
//               // SizedBox(height: 2,),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       CircleAvatar(
//                         radius: 5,
//                         backgroundColor: AppColors.buttonColor,
//                       ),
//                       SizedBox(width: 7,),
//                       Text11(text2: 'Awaited',color: AppColors.buttonColor)
//
//                     ],
//                   ),
//
//
//                 ],
//               ),
//               const SizedBox(height: 8,),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text2(text2: 'Host Video:'),
//                   Text1(text1: 'Super Admin')
//
//                 ],
//               ),
//               const SizedBox(height: 8,),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text2(text2: 'Consultation Date:'),
//                   Text1(text1: '2023-06-14, 11:45:00')
//
//                 ],
//               ),
//               const SizedBox(height: 8,),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text2(text2: 'Duration:'),
//                   Text1(text1: '10 minutes')
//
//                 ],
//               ),
//               const SizedBox(height: 8,),
//               CustomButton(text: 'Start Now', onTap: (){
//                 Navigator.of(context).push(
//                     MaterialPageRoute(
//                         builder: (context) =>
//                             const ConsultationDetails()));
//               })
//
//             ],
//
//           ),
//         );
//       },
//     );
//   }
//   //
//   // static void religionBottomSheet(BuildContext context) {
//   //   showModalBottomSheet(
//   //     context: context,
//   //     isScrollControlled: true,
//   //     shape: RoundedRectangleBorder(
//   //       borderRadius: BorderRadius.only(
//   //         topLeft: Radius.circular(15.0),
//   //         topRight: Radius.circular(15.0),
//   //       ),
//   //     ),
//   //     builder: (context) {
//   //       return Container(
//   //         padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//   //         height: MediaQuery.of(context).size.height * 0.85,
//   //         width: double.infinity,
//   //         child: Column(
//   //           crossAxisAlignment: CrossAxisAlignment.start,
//   //           mainAxisSize: MainAxisSize.min,
//   //           children: [
//   //             Row(
//   //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //               children: [
//   //                 Image.asset(
//   //                   'images/backarrow.png',
//   //                   width: 15,
//   //                   height: 15,
//   //                 ),
//   //                 Center(child: Text1(text1: 'What is their religion?')),
//   //                 Text1(text1: '')
//   //               ],
//   //             ),
//   //             Divider(),
//   //             Padding(
//   //               padding: const EdgeInsets.symmetric(vertical: 3),
//   //               child: Row(
//   //                 children: [
//   //                   Container(
//   //                     height: 20,
//   //                     width: 20,
//   //                     decoration: BoxDecoration(
//   //                         borderRadius: BorderRadius.circular(5),
//   //                         border: Border.all(color: Color(0xff8D8D8D))),
//   //                     child: Center(
//   //                       child: Icon(
//   //                         Icons.check,
//   //                         color: Colors.white,
//   //                         size: 14,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   SizedBox(
//   //                     width: 10,
//   //                   ),
//   //                   Text1(
//   //                     text1: 'Agnostic',
//   //                     size: 14,
//   //                   )
//   //                 ],
//   //               ),
//   //             ),
//   //             Divider(),
//   //             Padding(
//   //               padding: const EdgeInsets.symmetric(vertical: 3),
//   //               child: Row(
//   //                 children: [
//   //                   Container(
//   //                     height: 20,
//   //                     width: 20,
//   //                     decoration: BoxDecoration(
//   //                         color: AppColors.buttonColor,
//   //                         borderRadius: BorderRadius.circular(5),
//   //                         border: Border.all(color: Color(0xff8D8D8D))),
//   //                     child: Center(
//   //                       child: Icon(
//   //                         Icons.check,
//   //                         color: Colors.white,
//   //                         size: 14,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   SizedBox(
//   //                     width: 10,
//   //                   ),
//   //                   Text1(
//   //                     text1: 'Atheist',
//   //                     size: 14,
//   //                   )
//   //                 ],
//   //               ),
//   //             ),
//   //             Divider(),
//   //             Padding(
//   //               padding: const EdgeInsets.symmetric(vertical: 3),
//   //               child: Row(
//   //                 children: [
//   //                   Container(
//   //                     height: 20,
//   //                     width: 20,
//   //                     decoration: BoxDecoration(
//   //                         color: AppColors.buttonColor,
//   //                         borderRadius: BorderRadius.circular(5),
//   //                         border: Border.all(color: Color(0xff8D8D8D))),
//   //                     child: Center(
//   //                       child: Icon(
//   //                         Icons.check,
//   //                         color: Colors.white,
//   //                         size: 14,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   SizedBox(
//   //                     width: 10,
//   //                   ),
//   //                   Text1(
//   //                     text1: 'Buddhist',
//   //                     size: 14,
//   //                   )
//   //                 ],
//   //               ),
//   //             ),
//   //             Divider(),
//   //             Padding(
//   //               padding: const EdgeInsets.symmetric(vertical: 3),
//   //               child: Row(
//   //                 children: [
//   //                   Container(
//   //                     height: 20,
//   //                     width: 20,
//   //                     decoration: BoxDecoration(
//   //                         borderRadius: BorderRadius.circular(5),
//   //                         border: Border.all(color: Color(0xff8D8D8D))),
//   //                     child: Center(
//   //                       child: Icon(
//   //                         Icons.check,
//   //                         color: Colors.white,
//   //                         size: 14,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   SizedBox(
//   //                     width: 10,
//   //                   ),
//   //                   Text2(text2: 'Catholic')
//   //                 ],
//   //               ),
//   //             ),
//   //             Divider(),
//   //             Padding(
//   //               padding: const EdgeInsets.symmetric(vertical: 3),
//   //               child: Row(
//   //                 children: [
//   //                   Container(
//   //                     height: 20,
//   //                     width: 20,
//   //                     decoration: BoxDecoration(
//   //                         borderRadius: BorderRadius.circular(5),
//   //                         border: Border.all(color: Color(0xff8D8D8D))),
//   //                     child: Center(
//   //                       child: Icon(
//   //                         Icons.check,
//   //                         color: Colors.white,
//   //                         size: 14,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   SizedBox(
//   //                     width: 10,
//   //                   ),
//   //                   Text2(text2: 'Christian')
//   //                 ],
//   //               ),
//   //             ),
//   //             Divider(),
//   //             Padding(
//   //               padding: const EdgeInsets.symmetric(vertical: 3),
//   //               child: Row(
//   //                 children: [
//   //                   Container(
//   //                     height: 20,
//   //                     width: 20,
//   //                     decoration: BoxDecoration(
//   //                         borderRadius: BorderRadius.circular(5),
//   //                         border: Border.all(color: Color(0xff8D8D8D))),
//   //                     child: Center(
//   //                       child: Icon(
//   //                         Icons.check,
//   //                         color: Colors.white,
//   //                         size: 14,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   SizedBox(
//   //                     width: 10,
//   //                   ),
//   //                   Text2(text2: 'Hindu')
//   //                 ],
//   //               ),
//   //             ),
//   //             Divider(),
//   //             Padding(
//   //               padding: const EdgeInsets.symmetric(vertical: 3),
//   //               child: Row(
//   //                 children: [
//   //                   Container(
//   //                     height: 20,
//   //                     width: 20,
//   //                     decoration: BoxDecoration(
//   //                         borderRadius: BorderRadius.circular(5),
//   //                         border: Border.all(color: Color(0xff8D8D8D))),
//   //                     child: Center(
//   //                       child: Icon(
//   //                         Icons.check,
//   //                         color: Colors.white,
//   //                         size: 14,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   SizedBox(
//   //                     width: 10,
//   //                   ),
//   //                   Text2(text2: 'Jain')
//   //                 ],
//   //               ),
//   //             ),
//   //             Divider(),
//   //             Padding(
//   //               padding: const EdgeInsets.symmetric(vertical: 3),
//   //               child: Row(
//   //                 children: [
//   //                   Container(
//   //                     height: 20,
//   //                     width: 20,
//   //                     decoration: BoxDecoration(
//   //                         borderRadius: BorderRadius.circular(5),
//   //                         border: Border.all(color: Color(0xff8D8D8D))),
//   //                     child: Center(
//   //                       child: Icon(
//   //                         Icons.check,
//   //                         color: Colors.white,
//   //                         size: 14,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   SizedBox(
//   //                     width: 10,
//   //                   ),
//   //                   Text2(text2: 'Jewish')
//   //                 ],
//   //               ),
//   //             ),
//   //             Divider(),
//   //             Padding(
//   //               padding: const EdgeInsets.symmetric(vertical: 3),
//   //               child: Row(
//   //                 children: [
//   //                   Container(
//   //                     height: 20,
//   //                     width: 20,
//   //                     decoration: BoxDecoration(
//   //                         borderRadius: BorderRadius.circular(5),
//   //                         border: Border.all(color: Color(0xff8D8D8D))),
//   //                     child: Center(
//   //                       child: Icon(
//   //                         Icons.check,
//   //                         color: Colors.white,
//   //                         size: 14,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   SizedBox(
//   //                     width: 10,
//   //                   ),
//   //                   Text2(text2: 'Mormon')
//   //                 ],
//   //               ),
//   //             ),
//   //             Divider(),
//   //             Padding(
//   //               padding: const EdgeInsets.symmetric(vertical: 3),
//   //               child: Row(
//   //                 children: [
//   //                   Container(
//   //                     height: 20,
//   //                     width: 20,
//   //                     decoration: BoxDecoration(
//   //                         borderRadius: BorderRadius.circular(5),
//   //                         border: Border.all(color: Color(0xff8D8D8D))),
//   //                     child: Center(
//   //                       child: Icon(
//   //                         Icons.check,
//   //                         color: Colors.white,
//   //                         size: 14,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   SizedBox(
//   //                     width: 10,
//   //                   ),
//   //                   Text2(text2: 'Latter-day Saint')
//   //                 ],
//   //               ),
//   //             ),
//   //             Divider(),
//   //             Padding(
//   //               padding: const EdgeInsets.symmetric(vertical: 3),
//   //               child: Row(
//   //                 children: [
//   //                   Container(
//   //                     height: 20,
//   //                     width: 20,
//   //                     decoration: BoxDecoration(
//   //                         borderRadius: BorderRadius.circular(5),
//   //                         border: Border.all(color: Color(0xff8D8D8D))),
//   //                     child: Center(
//   //                       child: Icon(
//   //                         Icons.check,
//   //                         color: Colors.white,
//   //                         size: 14,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   SizedBox(
//   //                     width: 10,
//   //                   ),
//   //                   Text2(text2: 'Muslim')
//   //                 ],
//   //               ),
//   //             ),
//   //             Divider(),
//   //             Padding(
//   //               padding: const EdgeInsets.symmetric(vertical: 3),
//   //               child: Row(
//   //                 children: [
//   //                   Container(
//   //                     height: 20,
//   //                     width: 20,
//   //                     decoration: BoxDecoration(
//   //                         borderRadius: BorderRadius.circular(5),
//   //                         border: Border.all(color: Color(0xff8D8D8D))),
//   //                     child: Center(
//   //                       child: Icon(
//   //                         Icons.check,
//   //                         color: Colors.white,
//   //                         size: 14,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   SizedBox(
//   //                     width: 10,
//   //                   ),
//   //                   Text2(text2: 'Zoroastrian')
//   //                 ],
//   //               ),
//   //             ),
//   //             Divider(),
//   //             Padding(
//   //               padding: const EdgeInsets.symmetric(vertical: 3),
//   //               child: Row(
//   //                 children: [
//   //                   Container(
//   //                     height: 20,
//   //                     width: 20,
//   //                     decoration: BoxDecoration(
//   //                         borderRadius: BorderRadius.circular(5),
//   //                         border: Border.all(color: Color(0xff8D8D8D))),
//   //                     child: Center(
//   //                       child: Icon(
//   //                         Icons.check,
//   //                         color: Colors.white,
//   //                         size: 14,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   SizedBox(
//   //                     width: 10,
//   //                   ),
//   //                   Text2(text2: 'Sikh')
//   //                 ],
//   //               ),
//   //             ),
//   //             Divider(),
//   //             buildLanguageSwitch('Show other people if i run out'),
//   //             SizedBox(
//   //               height: 14,
//   //             ),
//   //           ],
//   //         ),
//   //       );
//   //     },
//   //   );
//   // }
//   //
//   // static void educationBottomSheet(BuildContext context) {
//   //   showModalBottomSheet(
//   //     context: context,
//   //     isScrollControlled: true,
//   //     shape: RoundedRectangleBorder(
//   //       borderRadius: BorderRadius.only(
//   //         topLeft: Radius.circular(15.0),
//   //         topRight: Radius.circular(15.0),
//   //       ),
//   //     ),
//   //     builder: (context) {
//   //       return Container(
//   //         padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//   //         height: MediaQuery.of(context).size.height * 0.49,
//   //         width: double.infinity,
//   //         child: Column(
//   //           crossAxisAlignment: CrossAxisAlignment.start,
//   //           mainAxisSize: MainAxisSize.min,
//   //           children: [
//   //             Row(
//   //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //               children: [
//   //                 Image.asset(
//   //                   'images/backarrow.png',
//   //                   width: 15,
//   //                   height: 15,
//   //                 ),
//   //                 Center(child: Text1(text1: 'What’s their education?')),
//   //                 Text1(text1: '')
//   //               ],
//   //             ),
//   //             Divider(),
//   //             Padding(
//   //               padding: const EdgeInsets.symmetric(vertical: 3),
//   //               child: Row(
//   //                 children: [
//   //                   Container(
//   //                     height: 20,
//   //                     width: 20,
//   //                     decoration: BoxDecoration(
//   //                         borderRadius: BorderRadius.circular(5),
//   //                         border: Border.all(color: Color(0xff8D8D8D))),
//   //                     child: Center(
//   //                       child: Icon(
//   //                         Icons.check,
//   //                         color: Colors.white,
//   //                         size: 14,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   SizedBox(
//   //                     width: 10,
//   //                   ),
//   //                   Text1(
//   //                     text1: 'High school',
//   //                     size: 14,
//   //                   )
//   //                 ],
//   //               ),
//   //             ),
//   //             Divider(),
//   //             Padding(
//   //               padding: const EdgeInsets.symmetric(vertical: 3),
//   //               child: Row(
//   //                 children: [
//   //                   Container(
//   //                     height: 20,
//   //                     width: 20,
//   //                     decoration: BoxDecoration(
//   //                         color: AppColors.buttonColor,
//   //                         borderRadius: BorderRadius.circular(5),
//   //                         border: Border.all(color: Color(0xff8D8D8D))),
//   //                     child: Center(
//   //                       child: Icon(
//   //                         Icons.check,
//   //                         color: Colors.white,
//   //                         size: 14,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   SizedBox(
//   //                     width: 10,
//   //                   ),
//   //                   Text1(
//   //                     text1: 'Vocational school',
//   //                     size: 14,
//   //                   )
//   //                 ],
//   //               ),
//   //             ),
//   //             Divider(),
//   //             Padding(
//   //               padding: const EdgeInsets.symmetric(vertical: 3),
//   //               child: Row(
//   //                 children: [
//   //                   Container(
//   //                     height: 20,
//   //                     width: 20,
//   //                     decoration: BoxDecoration(
//   //                         color: AppColors.buttonColor,
//   //                         borderRadius: BorderRadius.circular(5),
//   //                         border: Border.all(color: Color(0xff8D8D8D))),
//   //                     child: Center(
//   //                       child: Icon(
//   //                         Icons.check,
//   //                         color: Colors.white,
//   //                         size: 14,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   SizedBox(
//   //                     width: 10,
//   //                   ),
//   //                   Text1(
//   //                     text1: 'In collage',
//   //                     size: 14,
//   //                   )
//   //                 ],
//   //               ),
//   //             ),
//   //             Divider(),
//   //             Padding(
//   //               padding: const EdgeInsets.symmetric(vertical: 3),
//   //               child: Row(
//   //                 children: [
//   //                   Container(
//   //                     height: 20,
//   //                     width: 20,
//   //                     decoration: BoxDecoration(
//   //                         borderRadius: BorderRadius.circular(5),
//   //                         border: Border.all(color: Color(0xff8D8D8D))),
//   //                     child: Center(
//   //                       child: Icon(
//   //                         Icons.check,
//   //                         color: Colors.white,
//   //                         size: 14,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   SizedBox(
//   //                     width: 10,
//   //                   ),
//   //                   Text2(text2: 'Undergraduate degree')
//   //                 ],
//   //               ),
//   //             ),
//   //             Divider(),
//   //             Padding(
//   //               padding: const EdgeInsets.symmetric(vertical: 3),
//   //               child: Row(
//   //                 children: [
//   //                   Container(
//   //                     height: 20,
//   //                     width: 20,
//   //                     decoration: BoxDecoration(
//   //                         borderRadius: BorderRadius.circular(5),
//   //                         border: Border.all(color: Color(0xff8D8D8D))),
//   //                     child: Center(
//   //                       child: Icon(
//   //                         Icons.check,
//   //                         color: Colors.white,
//   //                         size: 14,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   SizedBox(
//   //                     width: 10,
//   //                   ),
//   //                   Text2(text2: 'In grad school')
//   //                 ],
//   //               ),
//   //             ),
//   //             Divider(),
//   //             Padding(
//   //               padding: const EdgeInsets.symmetric(vertical: 3),
//   //               child: Row(
//   //                 children: [
//   //                   Container(
//   //                     height: 20,
//   //                     width: 20,
//   //                     decoration: BoxDecoration(
//   //                         borderRadius: BorderRadius.circular(5),
//   //                         border: Border.all(color: Color(0xff8D8D8D))),
//   //                     child: Center(
//   //                       child: Icon(
//   //                         Icons.check,
//   //                         color: Colors.white,
//   //                         size: 14,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   SizedBox(
//   //                     width: 10,
//   //                   ),
//   //                   Text2(text2: 'Graduate degree')
//   //                 ],
//   //               ),
//   //             ),
//   //             Divider(),
//   //             buildLanguageSwitch('Show other people if i run out'),
//   //             SizedBox(
//   //               height: 14,
//   //             ),
//   //           ],
//   //         ),
//   //       );
//   //     },
//   //   );
//   // }
//   //
//   // static void drinkBottomSheet(BuildContext context) {
//   //   showModalBottomSheet(
//   //     context: context,
//   //     isScrollControlled: true,
//   //     shape: RoundedRectangleBorder(
//   //       borderRadius: BorderRadius.only(
//   //         topLeft: Radius.circular(15.0),
//   //         topRight: Radius.circular(15.0),
//   //       ),
//   //     ),
//   //     builder: (context) {
//   //       return Container(
//   //         padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//   //         height: MediaQuery.of(context).size.height * 0.43,
//   //         width: double.infinity,
//   //         child: Column(
//   //           crossAxisAlignment: CrossAxisAlignment.start,
//   //           mainAxisSize: MainAxisSize.min,
//   //           children: [
//   //             Row(
//   //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //               children: [
//   //                 Image.asset(
//   //                   'images/backarrow.png',
//   //                   width: 15,
//   //                   height: 15,
//   //                 ),
//   //                 Center(child: Text1(text1: 'Do they Drink?')),
//   //                 Text1(text1: '')
//   //               ],
//   //             ),
//   //             Divider(),
//   //             Padding(
//   //               padding: const EdgeInsets.symmetric(vertical: 3),
//   //               child: Row(
//   //                 children: [
//   //                   Container(
//   //                     height: 20,
//   //                     width: 20,
//   //                     decoration: BoxDecoration(
//   //                         borderRadius: BorderRadius.circular(5),
//   //                         border: Border.all(color: Color(0xff8D8D8D))),
//   //                     child: Center(
//   //                       child: Icon(
//   //                         Icons.check,
//   //                         color: Colors.white,
//   //                         size: 14,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   SizedBox(
//   //                     width: 10,
//   //                   ),
//   //                   Text1(
//   //                     text1: 'Frequently',
//   //                     size: 14,
//   //                   )
//   //                 ],
//   //               ),
//   //             ),
//   //             Divider(),
//   //             Padding(
//   //               padding: const EdgeInsets.symmetric(vertical: 3),
//   //               child: Row(
//   //                 children: [
//   //                   Container(
//   //                     height: 20,
//   //                     width: 20,
//   //                     decoration: BoxDecoration(
//   //                         color: AppColors.buttonColor,
//   //                         borderRadius: BorderRadius.circular(5),
//   //                         border: Border.all(color: Color(0xff8D8D8D))),
//   //                     child: Center(
//   //                       child: Icon(
//   //                         Icons.check,
//   //                         color: Colors.white,
//   //                         size: 14,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   SizedBox(
//   //                     width: 10,
//   //                   ),
//   //                   Text1(
//   //                     text1: 'Socially',
//   //                     size: 14,
//   //                   )
//   //                 ],
//   //               ),
//   //             ),
//   //             Divider(),
//   //             Padding(
//   //               padding: const EdgeInsets.symmetric(vertical: 3),
//   //               child: Row(
//   //                 children: [
//   //                   Container(
//   //                     height: 20,
//   //                     width: 20,
//   //                     decoration: BoxDecoration(
//   //                         color: AppColors.buttonColor,
//   //                         borderRadius: BorderRadius.circular(5),
//   //                         border: Border.all(color: Color(0xff8D8D8D))),
//   //                     child: Center(
//   //                       child: Icon(
//   //                         Icons.check,
//   //                         color: Colors.white,
//   //                         size: 14,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   SizedBox(
//   //                     width: 10,
//   //                   ),
//   //                   Text1(
//   //                     text1: 'Rarely',
//   //                     size: 14,
//   //                   )
//   //                 ],
//   //               ),
//   //             ),
//   //             Divider(),
//   //             Padding(
//   //               padding: const EdgeInsets.symmetric(vertical: 3),
//   //               child: Row(
//   //                 children: [
//   //                   Container(
//   //                     height: 20,
//   //                     width: 20,
//   //                     decoration: BoxDecoration(
//   //                         borderRadius: BorderRadius.circular(5),
//   //                         border: Border.all(color: Color(0xff8D8D8D))),
//   //                     child: Center(
//   //                       child: Icon(
//   //                         Icons.check,
//   //                         color: Colors.white,
//   //                         size: 14,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   SizedBox(
//   //                     width: 10,
//   //                   ),
//   //                   Text2(text2: 'Never')
//   //                 ],
//   //               ),
//   //             ),
//   //             Divider(),
//   //             Padding(
//   //               padding: const EdgeInsets.symmetric(vertical: 3),
//   //               child: Row(
//   //                 children: [
//   //                   Container(
//   //                     height: 20,
//   //                     width: 20,
//   //                     decoration: BoxDecoration(
//   //                         borderRadius: BorderRadius.circular(5),
//   //                         border: Border.all(color: Color(0xff8D8D8D))),
//   //                     child: Center(
//   //                       child: Icon(
//   //                         Icons.check,
//   //                         color: Colors.white,
//   //                         size: 14,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   SizedBox(
//   //                     width: 10,
//   //                   ),
//   //                   Text2(text2: 'Sober')
//   //                 ],
//   //               ),
//   //             ),
//   //             Divider(),
//   //             buildLanguageSwitch('Show other people if i run out'),
//   //             SizedBox(
//   //               height: 14,
//   //             ),
//   //           ],
//   //         ),
//   //       );
//   //     },
//   //   );
//   // }
//   //
//   // static void blockPersonBottomSheet(BuildContext context) {
//   //   showModalBottomSheet(
//   //     context: context,
//   //     isScrollControlled: true,
//   //     shape: RoundedRectangleBorder(
//   //       borderRadius: BorderRadius.only(
//   //         topLeft: Radius.circular(15.0),
//   //         topRight: Radius.circular(15.0),
//   //       ),
//   //     ),
//   //     builder: (context) {
//   //       return Container(
//   //         padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//   //         height: MediaQuery.of(context).size.height * 0.35,
//   //         width: double.infinity,
//   //         child: Column(
//   //           crossAxisAlignment: CrossAxisAlignment.start,
//   //           mainAxisSize: MainAxisSize.min,
//   //           children: [
//   //             Row(
//   //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //               children: [
//   //                 Image.asset(
//   //                   'images/backarrow.png',
//   //                   width: 15,
//   //                   height: 15,
//   //                 ),
//   //                 Center(child: Text1(text1: 'Block this Person?')),
//   //                 Text1(text1: '')
//   //               ],
//   //             ),
//   //             Divider(),
//   //             SizedBox(
//   //               height: 10,
//   //             ),
//   //             Center(
//   //                 child: Text2(
//   //                     text2:
//   //                         'When you block someone, you won’t see this person')),
//   //             Center(
//   //                 child: Text2(text2: 'again and they won’t see your profile')),
//   //             Center(
//   //                 child: Text2(
//   //                     text2:
//   //                         '-unless they’ve already seen your profile while swiping.')),
//   //             SizedBox(
//   //               height: 10,
//   //             ),
//   //             CustomOutlinedButton(text: 'Block', onTap: () {
//   //               BottomSheetWidget.ReportBottomSheet(context);
//   //             }),
//   //             CustomOutlinedButton(text: 'Block and Report', onTap: () {
//   //               BottomSheetWidget.ReportBottomSheet(context);
//   //
//   //             }),
//   //           ],
//   //         ),
//   //       );
//   //     },
//   //   );
//   // }
//   //
//   // static void ReportBottomSheet(BuildContext context) {
//   //   showModalBottomSheet(
//   //     context: context,
//   //     isScrollControlled: true,
//   //     shape: RoundedRectangleBorder(
//   //       borderRadius: BorderRadius.only(
//   //         topLeft: Radius.circular(15.0),
//   //         topRight: Radius.circular(15.0),
//   //       ),
//   //     ),
//   //     builder: (context) {
//   //       return Container(
//   //         padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//   //         height: MediaQuery.of(context).size.height * 0.73,
//   //         width: double.infinity,
//   //         child: Column(
//   //           crossAxisAlignment: CrossAxisAlignment.start,
//   //           mainAxisSize: MainAxisSize.min,
//   //           children: [
//   //             Row(
//   //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //               children: [
//   //                 Image.asset(
//   //                   'images/x.png',
//   //                   width: 15,
//   //                   height: 15,
//   //                 ),
//   //                 Text(''),
//   //                 Text('')
//   //               ],
//   //             ),
//   //             Divider(),
//   //             SizedBox(
//   //               height: 10,
//   //             ),
//   //             Text1(text1: 'What is your reason for reporting?'),
//   //             Text1(text1: 'Misleading Profile or Behavior'),
//   //             SizedBox(height: 9,),
//   //             Container(
//   //                 padding: EdgeInsets.symmetric(
//   //                     horizontal: 10,vertical: 7
//   //                 ),
//   //                 width: double.infinity,
//   //                 decoration: BoxDecoration(
//   //                   borderRadius: BorderRadius.circular(10),
//   //                   border: Border.all(color: AppColors.buttonColor),
//   //
//   //
//   //
//   //                 ),
//   //                 child: Text1(text1: 'Fake profile, Scammer, not one person',color: AppColors.buttonColor,)),
//   //
//   //             Container(
//   //               margin: EdgeInsets.symmetric(vertical: 5),
//   //               padding: EdgeInsets.symmetric(
//   //                 horizontal: 10,vertical: 7
//   //               ),
//   //               width: double.infinity,
//   //                 decoration: BoxDecoration(
//   //                   borderRadius: BorderRadius.circular(10),
//   //                   border: Border.all(color: Color(0xffE3E3E3)),
//   //
//   //
//   //
//   //                 ),
//   //                 child: Text2(text2: 'Someone is selling something')),
//   //             Container(
//   //                 margin: EdgeInsets.symmetric(vertical: 5),
//   //                 padding: EdgeInsets.symmetric(
//   //                     horizontal: 10,vertical: 7
//   //                 ),
//   //                 width: double.infinity,
//   //                 decoration: BoxDecoration(
//   //                   borderRadius: BorderRadius.circular(10),
//   //                   border: Border.all(color: Color(0xffE3E3E3)),
//   //
//   //
//   //
//   //                 ),
//   //                 child: Text2(text2: 'Someone under 18 is involved')),
//   //             SizedBox(
//   //               height: 7,
//   //             ),
//   //             Text1(text1: 'Harassing or Bad Behavior'),
//   //             SizedBox(height: 7,),
//   //
//   //
//   //             Container(
//   //                 margin: EdgeInsets.symmetric(vertical: 5),
//   //                 padding: EdgeInsets.symmetric(
//   //                     horizontal: 10,vertical: 7
//   //                 ),
//   //                 width: double.infinity,
//   //                 decoration: BoxDecoration(
//   //                   borderRadius: BorderRadius.circular(10),
//   //                   border: Border.all(color: Color(0xffE3E3E3)),
//   //
//   //
//   //
//   //                 ),
//   //                 child: Text2(text2: 'Nudity or something sexually explicit')),
//   //             Container(
//   //                 margin: EdgeInsets.symmetric(vertical: 5),
//   //                 padding: EdgeInsets.symmetric(
//   //                     horizontal: 10,vertical: 7
//   //                 ),
//   //                 width: double.infinity,
//   //                 decoration: BoxDecoration(
//   //                   borderRadius: BorderRadius.circular(10),
//   //                   border: Border.all(color: Color(0xffE3E3E3)),
//   //
//   //
//   //
//   //                 ),
//   //                 child: Text2(text2: 'Abusive/hateful/threatening behaviour')),
//   //             SizedBox(
//   //               height: 7,
//   //             ),
//   //             Text1(text1: 'Harassing or Bad Behavior'),
//   //             SizedBox(height: 7,),
//   //
//   //
//   //             Container(
//   //                 margin: EdgeInsets.symmetric(vertical: 5),
//   //                 padding: EdgeInsets.symmetric(
//   //                     horizontal: 10,vertical: 7
//   //                 ),
//   //                 width: double.infinity,
//   //                 decoration: BoxDecoration(
//   //                   borderRadius: BorderRadius.circular(10),
//   //                   border: Border.all(color: Color(0xffE3E3E3)),
//   //
//   //
//   //
//   //                 ),
//   //                 child: Text2(text2: 'Possible threat to themselves or other')),
//   //
//   //             SizedBox(
//   //               height: 45,
//   //             ),
//   //             CustomButton(text: 'Report', onTap: (){
//   //               Navigator.push(context, MaterialPageRoute(builder: (_) => MatchScreen()));
//   //
//   //             })
//   //           ],
//   //         ),
//   //       );
//   //     },
//   //   );
//   // }
//   //
//   // static Widget buildLanguageSwitch(String language) {
//   //   bool isSelected = false; // Default switch state
//   //
//   //   return Padding(
//   //     padding: const EdgeInsets.symmetric(vertical: 3),
//   //     child: Row(
//   //       children: [
//   //         Text1(
//   //           text1: language,
//   //           size: 13,
//   //         ),
//   //         Spacer(),
//   //         Transform.scale(
//   //           scale:
//   //               0.5, // Adjust the scale factor as needed to make the switch smaller
//   //           child: Switch(
//   //             activeTrackColor: AppColors.buttonColor,
//   //             inactiveThumbColor: AppColors.buttonColor,
//   //             activeColor: AppColors.buttonColor,
//   //             focusColor: AppColors.buttonColor,
//   //             inactiveTrackColor: AppColors.buttonColor,
//   //             value: isSelected,
//   //             onChanged: (value) {
//   //               // Update the isSelected variable when switch state changes
//   //               isSelected = value;
//   //               // Perform any additional actions here when switch state changes
//   //             },
//   //           ),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }
// }
