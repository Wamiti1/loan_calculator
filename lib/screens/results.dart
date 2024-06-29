import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';

class Results extends StatelessWidget {
  const Results({super.key,
  required this.monthly,
  required this.total
  });

  final dynamic monthly;
  final dynamic total;


  @override
  Widget build(BuildContext context) {
    
    
    return  Scaffold(
      appBar: AppBar(title: const Center(child: Text('Your loan'),),),
      body: Center(
        child :Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            
            Text('Your monthly payment of the loan : ${monthly.round().toString()}'),
            Text('Your Total Payment : ${total.round().toString()}')
          ],),
      ),
    );
  }
}