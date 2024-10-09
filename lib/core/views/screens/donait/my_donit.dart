import 'package:flutter/material.dart';
import 'package:pharmcy/core/views/widgets/donit_list.dart';

import '../../../constant/api_url.dart';
import '../../../models/donation.dart';
import '../../../veiwModel/donationvm.dart';

class MyDonit extends StatelessWidget {
   MyDonit({super.key});
  DonationVM dvm = DonationVM();
  int usernum = int.parse(storageHelper.readKey("id"));
  //Future<List<Donation>> pendingCategory=dvm.getData(ApiUrls.pendingCategory );
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 188, 225, 210),
        appBar: AppBar(
          centerTitle: true,
          title: Text('تبرعاتي'),
        ),
        body: 
        
           FutureBuilder(future:dvm.getmydonation(ApiUrls.userDonation ),builder:(ctx,snapshot){
        if(snapshot.connectionState==ConnectionState.done){
          // List<Donation>? userDA =snapshot.data?.where((element) => element.userId==usernum).toList();
          if(snapshot.data != null)
          {
            return ListView.builder(
              itemCount:snapshot.data!.length,
              itemBuilder: (context, index) {
                  return ListTile(
                  title: Text('Name: ${snapshot.data![index].name}'),
                  subtitle: Text('Type: ${snapshot.data![index].type}'),
                  trailing:Text('Quantity: ${snapshot.data![index].quantity}'),
                );
              }
          );
          }
          else
          return Center(child: Container(child: Text("لا توجد تبرعات"),width: 100,height: 100,color: Colors.blue,));

        }
        else
           {
            return CircularProgressIndicator();
           }
      })

       
          //child: DonitList(),
         
        
      ),
    );
  }
}
