import 'package:flutter/material.dart';
import 'package:pharmcy/core/models/donation.dart';
import 'package:pharmcy/core/views/widgets/button.dart';

class Cart extends StatefulWidget {
 late List<Donation> donation;
   Cart({super.key,required this.donation});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  //TextEditingController g = TextEditingController();
 late List<TextEditingController> controllers;
  @override
  void initState() {
    super.initState();
    controllers = List.generate(widget.donation.length, (index) => TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 2 / 3,
            child: ListView.separated(
                        separatorBuilder: (ctx, index) {
                          return Divider();
                        },
                        itemCount:widget.donation.length,
                        itemBuilder: (ctx, index) {
                          return ListTile(
                            //leading: ,
                            title:Column(
                              children: [
                                Text('${ widget.donation[index].name}'),
                                Text(' الكمية المتوفرة ${ widget.donation[index].quantity}'),
                                TextField(controller:controllers[index] ,
                                decoration:InputDecoration(
                                  label: Text("الكمية المطلوبة")
                                )
                                ) 
                              ],
                            ),
                              );
                        }),
          ),
          ButtonRounded(text:"ارسال", onTap:(){
            
          })
        ],
      ),
           
        );
      
     
    
  }
}