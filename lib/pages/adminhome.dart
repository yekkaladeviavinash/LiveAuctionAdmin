// import 'package:admin/pages/home_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class Adminhome extends StatelessWidget {
//   const Adminhome({super.key});
// //change MaterialApp to GetMaterialApp
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomeController>(builder:(ctrl){
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Auction Admin'),
//       ),
//       body: ListView.builder(
//           itemCount: ctrl.products.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//                 title: Text(ctrl.products[index].pname ?? ''),
//                 subtitle: Text(ctrl.products[index].pprice ?? ''),
               
//                 trailing:IconButton(
//                     icon: Icon(Icons.delete),
//                     onPressed: () {
//                       ctrl.deleteProduct(ctrl.products[index].pid??'');
//                     },
//                   ),
//             );
//           }),
//     );
//     });
//   }
// }
import 'package:admin/pages/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Adminhome extends StatelessWidget {
  const Adminhome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Auction Admin'),
          ),
          body: ListView.builder(
            itemCount: ctrl.products.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(ctrl.products[index].pname ?? ''),
                subtitle: Text(ctrl.products[index].pprice ?? ''),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        ctrl.deleteProduct(ctrl.products[index].pid ?? '');
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.mark_chat_read),
                      onPressed: () => ctrl.statusupdate(ctrl.products[index].pid ?? '',ctrl.products[index].dateAdded ?? ''),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
