// // import 'package:admin/pages/home_controller.dart';
// // import 'package:admin/pages/seller.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';

// // class Adminhome extends StatelessWidget {
// //   const Adminhome({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     Size screenSize = MediaQuery.of(context).size;
// //     double screenWidth = screenSize.width;
// //     double screenHeight = screenSize.height;
// //     return GetBuilder<HomeController>(
// //       builder: (ctrl) {
// //         return Scaffold(
// //           appBar: AppBar(
// //             title: Text(
// //               'Welcome Admin!',
// //               style: TextStyle(
// //                 fontSize: 20.0,
// //                 color: Colors.white,
// //               ),
// //             ),
// //             backgroundColor: Colors.black,
// //           ),
// //           body: RefreshIndicator(
// //             onRefresh: () async {
// //               await ctrl.refreshPage();
// //             },
// //             child: Container(
// //               color: Colors.grey[200],
// //               padding: EdgeInsets.all(16.0),
// //               child: ListView.builder(
// //                 itemCount: ctrl.products.length,
// //                 itemBuilder: (context, index) {
// //                   var item = ctrl.products[index];
// //                   return AdminCard(
// //                     title: ctrl.products[index].pname ?? '',
// //                     bidPrice: ctrl.products[index].pprice ?? '',
// //                     auctionDate: ctrl.products[index].dateAdded ?? '',
// //                     category: ctrl.products[index].pcategory ?? '',
// //                     imageUrl: ctrl.products[index].pimage ?? '',
// //                     bool: ctrl.products[index].status.toString() ?? '',
// //                     screenWidth: screenWidth,
// //                     screenHeight: screenHeight,
// //                     onPressedDelete: () {
// //                       ctrl.deleteProduct(ctrl.products[index].pid ?? '');
// //                     },
// //                     onuser: () {
// //                       ctrl.getuserdetails(ctrl.products[index].sid ?? '');
// //                       Navigator.push(
// //                                 context,
// //                                 MaterialPageRoute(
// //                                   builder: (context) => SellerDetailsPage(),
// //                                 ),
// //                               );
// //                     },
// //                     onPressedAccept: () {
// //                       ctrl.statusupdate(
// //                         ctrl.products[index].pid ?? '',
// //                         ctrl.products[index].dateAdded ?? '',
// //                       );
// //                     },
// //                   );
// //                 },
// //               ),
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

// // class AdminCard extends StatelessWidget {
// //   final String title;
// //   final String bidPrice;
// //   final String auctionDate;
// //   final String category;
// //   final String imageUrl;
// //   final String bool;
// //   final VoidCallback onPressedDelete;
// //   final VoidCallback onPressedAccept;
// //   final VoidCallback onuser;
// //   final double screenWidth;
// //   final double screenHeight;

// //   const AdminCard({
// //     required this.title,
// //     required this.bidPrice,
// //     required this.auctionDate,
// //     required this.category,
// //     required this.imageUrl,
// //     required this.bool,
// //     required this.onPressedDelete,
// //     required this.onPressedAccept,
// //     required this.screenWidth,
// //     required this.screenHeight,
// //     required this.onuser,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Card(
// //       color: Colors.white,
// //       elevation: 3,
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(12),
// //       ),
// //       surfaceTintColor: Colors.transparent,
// //       child: Padding(
// //         padding: EdgeInsets.all(16.0),
// //         child: Row(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             ClipRRect(
// //               borderRadius: BorderRadius.circular(8.0),
// //               child: Image.network(
// //                 imageUrl,
// //                 width: 100.0,
// //                 height: 100.0,
// //                 fit: BoxFit.cover,
// //               ),
// //             ),
// //             SizedBox(width: 16.0),
// //             Expanded(
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Text(
// //                     title,
// //                     style: TextStyle(
// //                       fontSize: screenWidth * 0.04,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.black,
// //                     ),
// //                   ),
// //                   SizedBox(height: 8.0),
// //                   InkWell(
// //                     onTap:onuser ,
// //                      child: Text(
// //                       'User Details',
// //                       style: TextStyle(
// //                         fontSize: screenWidth * 0.03,
// //                         fontWeight: FontWeight.bold,
// //                         color: Colors.blue,
// //                       ),
// //                                        ),
// //                    ),
// //                   Text(
// //                     'Bid Price: $bidPrice',
// //                     style: TextStyle(
// //                       fontSize: screenWidth * 0.03,
// //                       color: Colors.black,
// //                     ),
// //                   ),
// //                   Text(
// //                     'Auction Date: $auctionDate',
// //                     style: TextStyle(
// //                       fontSize: screenWidth * 0.03,
// //                       color: Colors.black,
// //                     ),
// //                   ),
// //                   Text(
// //                     'Category: $category',
// //                     style: TextStyle(
// //                       fontSize: screenWidth * 0.03,
// //                       color: Colors.black,
// //                     ),
// //                   ),
// //                   Text(
// //                     'Status: ${bool == 'true' ? 'Accepted' : 'Not Accepted yet'}',
// //                     style: TextStyle(
// //                       fontSize: screenWidth * 0.03,
// //                       color: bool == 'true' ? Colors.green : Colors.red,
// //                     ),
// //                   ),
                   
// //                   SizedBox(height: 16.0),
// //                   Row(
// //                     children: [
// //                       // Expanded(
// //                       //   child: ElevatedButton(
// //                       //     onPressed:onuser,
// //                       //     child: const Text('User',
// //                       //         style: TextStyle(color: Colors.white)),
// //                       //     style: ElevatedButton.styleFrom(
// //                       //       padding: EdgeInsets.symmetric(vertical: 12.0),
// //                       //       backgroundColor: Colors.blue[400],
// //                       //       shape: RoundedRectangleBorder(
// //                       //         borderRadius: BorderRadius.circular(8),
// //                       //       ),
// //                       //     ),
// //                       //   ),
// //                       // ),
// //                       if (bool !=
// //                           'true') // Show "Accept" button only when bool is not true
// //                         Expanded(
// //                           child: ElevatedButton(
// //                             onPressed: onPressedAccept,
// //                             child: const Text('Accept',
// //                                 style: TextStyle(color: Colors.white)),
// //                             style: ElevatedButton.styleFrom(
// //                               padding: EdgeInsets.symmetric(vertical: 12.0),
// //                               backgroundColor: Colors.green[400],
// //                               shape: RoundedRectangleBorder(
// //                                 borderRadius: BorderRadius.circular(8),
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       if (bool ==
// //                           'true') // Show "Delete" button only when bool is true
// //                         Expanded(
// //                           child: ElevatedButton(
                            
// //                                   onPressed: () => {
// //                       showDialog(
// //                           context: context,
// //                           builder: (ctx) => AlertDialog(
// //                                 title: const Text("Delete File"),
// //                                 content: const Text(
// //                                     "Are you sure you want to delete this file?"),
// //                                 actions: [
// //                                   TextButton(
// //                                     child: const Text("Cancel"),
// //                                     onPressed: () {
// //                                       Navigator.of(context).pop();
// //                                     },
// //                                   ),
// //                                   TextButton(
// //                                     child: const Text("Delete"),
// //                                     onPressed: onPressedDelete,
                                    
// //                                   ),
// //                                 ],
// //                               ))
// //                     },

// //                             child: const Text('Delete',
// //                                 style: TextStyle(color: Colors.white)),
// //                             style: ElevatedButton.styleFrom(
// //                               padding: EdgeInsets.symmetric(vertical: 12.0),
// //                               backgroundColor: Colors.red[400],
// //                               shape: RoundedRectangleBorder(
// //                                 borderRadius: BorderRadius.circular(8),
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       if (bool !=
// //                           'true') // Show "Delete" button only when bool is not true
// //                         SizedBox(width: 8.0),
// //                       if (bool !=
// //                           'true') // Show "Delete" button only when bool is not true
// //                         Expanded(
// //                           child: ElevatedButton(
// //                             onPressed: onPressedDelete,
// //                             child: const Text('Delete',
// //                                 style: TextStyle(color: Colors.white)),
// //                             style: ElevatedButton.styleFrom(
// //                               padding: EdgeInsets.symmetric(vertical: 12.0),
// //                               backgroundColor: Colors.red[400],
// //                               shape: RoundedRectangleBorder(
// //                                 borderRadius: BorderRadius.circular(8),
// //                               ),
// //                             ),
// //                           ),
// //                         ),
                      
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:admin/pages/home_controller.dart';
// import 'package:admin/pages/seller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class Adminhome extends StatelessWidget {
//   const Adminhome({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Size screenSize = MediaQuery.of(context).size;
//     double screenWidth = screenSize.width;
//     double screenHeight = screenSize.height;
//     return GetBuilder<HomeController>(
//       builder: (ctrl) {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text(
//               'Welcome Admin!',
//               style: TextStyle(
//                 fontSize: 20.0,
//                 color: Colors.white,
//               ),
//             ),
//             backgroundColor: Colors.black,
//           ),
//           body: RefreshIndicator(
//             onRefresh: () async {
//               await ctrl.refreshPage();
//             },
//             child: Container(
//               color: Colors.grey[200],
//               padding: EdgeInsets.all(16.0),
//               child: ListView.builder(
//                 itemCount: ctrl.products.length,
//                 itemBuilder: (context, index) {
//                   var item = ctrl.products[index];
//                   return AdminCard(
//                     title: ctrl.products[index].pname ?? '',
//                     bidPrice: ctrl.products[index].pprice ?? '',
//                     auctionDate: ctrl.products[index].dateAdded ?? '',
//                     category: ctrl.products[index].pcategory ?? '',
//                     imageUrl: ctrl.products[index].pimage ?? '',
//                     bool: ctrl.products[index].status.toString() ?? '',
//                     screenWidth: screenWidth,
//                     screenHeight: screenHeight,
//                     onPressedDelete: () {
//                       ctrl.deleteProduct(ctrl.products[index].pid ?? '');
//                     },
//                     onuser: () {
//                       ctrl.getuserdetails(ctrl.products[index].sid ?? '');
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => SellerDetailsPage(),
//                         ),
//                       );
//                     },
//                     onPressedAccept: () {
//                       ctrl.statusupdate(
//                         ctrl.products[index].pid ?? '',
//                         ctrl.products[index].dateAdded ?? '',
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class AdminCard extends StatelessWidget {
//   final String title;
//   final String bidPrice;
//   final String auctionDate;
//   final String category;
//   final String imageUrl;
//   final String bool;
//   final VoidCallback onPressedDelete;
//   final VoidCallback onPressedAccept;
//   final VoidCallback onuser;
//   final double screenWidth;
//   final double screenHeight;

//   const AdminCard({
//     required this.title,
//     required this.bidPrice,
//     required this.auctionDate,
//     required this.category,
//     required this.imageUrl,
//     required this.bool,
//     required this.onPressedDelete,
//     required this.onPressedAccept,
//     required this.screenWidth,
//     required this.screenHeight,
//     required this.onuser,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Colors.white,
//       elevation: 3,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       surfaceTintColor: Colors.transparent,
//       child: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8.0),
//               child: Image.network(
//                 imageUrl,
//                 width: 100.0,
//                 height: 100.0,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             SizedBox(width: 16.0),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: TextStyle(
//                       fontSize: screenWidth * 0.04,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(height: 8.0),
//                   InkWell(
//                     onTap:onuser ,
//                     child: Text(
//                       'User Details',
//                       style: TextStyle(
//                         fontSize: screenWidth * 0.03,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue,
//                       ),
//                     ),
//                   ),
//                   Text(
//                     'Bid Price: $bidPrice',
//                     style: TextStyle(
//                       fontSize: screenWidth * 0.03,
//                       color: Colors.black,
//                     ),
//                   ),
//                   Text(
//                     'Auction Date: $auctionDate',
//                     style: TextStyle(
//                       fontSize: screenWidth * 0.03,
//                       color: Colors.black,
//                     ),
//                   ),
//                   Text(
//                     'Category: $category',
//                     style: TextStyle(
//                       fontSize: screenWidth * 0.03,
//                       color: Colors.black,
//                     ),
//                   ),
//                   Text(
//                     'Status: ${bool == 'true' ? 'Accepted' : 'Not Accepted yet'}',
//                     style: TextStyle(
//                       fontSize: screenWidth * 0.03,
//                       color: bool == 'true' ? Colors.green : Colors.red,
//                     ),
//                   ),
//                   SizedBox(height: 16.0),
//                   Row(
//                     children: [
//                       if (bool != 'true') // Show "Accept" button only when bool is not true
//                         Expanded(
//                           child: ElevatedButton(
//                             onPressed: onPressedAccept,
//                             child: const Text('Accept',
//                                 style: TextStyle(color: Colors.white)),
//                             style: ElevatedButton.styleFrom(
//                               padding: EdgeInsets.symmetric(vertical: 12.0),
//                               backgroundColor: Colors.green[400],
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                             ),
//                           ),
//                         ),
//                       Expanded(
//                         child: ElevatedButton(
//                           onPressed: () {
//                             showDialog(
//                               context: context,
//                               builder: (ctx) => AlertDialog(
//                                 title: const Text("Delete File"),
//                                 content: const Text(
//                                     "Are you sure you want to delete this file?"),
//                                 actions: [
//                                   TextButton(
//                                     child: const Text("Cancel"),
//                                     onPressed: () {
//                                       Navigator.of(context).pop();
//                                     },
//                                   ),
//                                   TextButton(
//                                     child: const Text("Delete"),
//                                     onPressed: () {
//                                       onPressedDelete(); // Call the delete function
//                                       Navigator.of(context).pop(); // Close the dialog
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                           child: const Text('Delete',
//                               style: TextStyle(color: Colors.white)),
//                           style: ElevatedButton.styleFrom(
//                             padding: EdgeInsets.symmetric(vertical: 12.0),
//                             backgroundColor: Colors.red[400],
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:convert';

import 'package:admin/pages/home_controller.dart';
import 'package:admin/pages/seller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Adminhome extends StatelessWidget {
  const Adminhome({Key? key}) : super(key: key);
postData(String sellermail) async {
  try {
    final response = await http.post(
      Uri.parse('http://10.81.66.192:3000/sellerconfirm'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'selleremail': sellermail,
      }),
    );

    if (response.statusCode == 200) {
      print('Data posted successfully');
    } else {
      print('Failed to post data: ${response.statusCode}');
    }
  } catch (e) {
    print('Exception while posting data: $e');
  }
}
postdeleteData(String sellermail) async {
  try {
    final response = await http.post(
      Uri.parse('http://10.81.66.192:3000/sellerdelete'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'selleremail': sellermail,
      }),
    );

    if (response.statusCode == 200) {
      print('Data posted successfully');
    } else {
      print('Failed to post data: ${response.statusCode}');
    }
  } catch (e) {
    print('Exception while posting data: $e');
  }
}
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return GetBuilder<HomeController>(
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Welcome Admin!',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.black,
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              await ctrl.refreshPage();
            },
            child: Container(
              color: Colors.grey[200],
              padding: EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: ctrl.products.length,
                itemBuilder: (context, index) {
                  var item = ctrl.products[index];
                  return AdminCard(
                    title: ctrl.products[index].pname ?? '',
                    bidPrice: ctrl.products[index].pprice ?? '',
                    auctionDate: ctrl.products[index].dateAdded ?? '',
                    category: ctrl.products[index].pcategory ?? '',
                    imageUrl: ctrl.products[index].pimage ?? '',
                    bool: ctrl.products[index].status.toString() ?? '',
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    onPressedDelete: () async{
                      ctrl.deleteProduct(ctrl.products[index].pid ?? '');
                      String? smail=await ctrl.getusermail(ctrl.products[index].sid);
                      postdeleteData(smail.toString());
                    },
                    onuser: () {
                      ctrl.getuserdetails(ctrl.products[index].sid ?? '');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SellerDetailsPage(productlocation:ctrl.products[index].location),
                        ),
                      );
                    },
                    onPressedAccept: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text("Accept Product"),
                          content: const Text(
                              "Are you sure you want to accept this product?"),
                          actions: [
                            TextButton(
                              child: const Text("Cancel"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text("Accept"),
                              onPressed: () async{
                                ctrl.statusupdate(
                                  ctrl.products[index].pid ?? '',
                                  ctrl.products[index].dateAdded ?? '',
                                );
                                 String? smail=await ctrl.getusermail(ctrl.products[index].sid);
                                postData(smail.toString());
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class AdminCard extends StatelessWidget {
  final String title;
  final String bidPrice;
  final String auctionDate;
  final String category;
  final String imageUrl;
  final String bool;
  final VoidCallback onPressedDelete;
  final VoidCallback onPressedAccept;
  final VoidCallback onuser;
  final double screenWidth;
  final double screenHeight;

  const AdminCard({
    required this.title,
    required this.bidPrice,
    required this.auctionDate,
    required this.category,
    required this.imageUrl,
    required this.bool,
    required this.onPressedDelete,
    required this.onPressedAccept,
    required this.screenWidth,
    required this.screenHeight,
    required this.onuser,
  });





  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      surfaceTintColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                imageUrl,
                width: 100.0,
                height: 100.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  InkWell(
                    onTap:onuser ,
                    child: Text(
                      'User Details',
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Text(
                    'Bid Price: $bidPrice',
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Auction Date: $auctionDate',
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Category: $category',
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Status: ${bool == 'true' ? 'Accepted' : 'Not Accepted yet'}',
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: bool == 'true' ? Colors.green : Colors.red,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      if (bool != 'true') // Show "Accept" button only when bool is not true
                        Expanded(
                          child: ElevatedButton(
                            onPressed:onPressedAccept,

                            child: const Text('Accept',
                                style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 12.0),
                              backgroundColor: Colors.green[400],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text("Delete File"),
                                content: const Text(
                                    "Are you sure you want to delete this file?"),
                                actions: [
                                  TextButton(
                                    child: const Text("Cancel"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: const Text("Delete"),
                                    onPressed: () {
                                      onPressedDelete(); // Call the delete function
                                      Navigator.of(context).pop(); // Close the dialog
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                          child: const Text('Delete',
                              style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            backgroundColor: Colors.red[400],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
