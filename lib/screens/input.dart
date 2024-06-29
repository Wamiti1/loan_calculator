import 'package:flutter/material.dart';
import 'package:loan_calculator/screens/results.dart';

class Input extends StatefulWidget {
  const Input({super.key});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  double currentLoan = 40000;
  double currentRate = 0.0;
  double currentTerm = 0.0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        title: const Center(child: Text('Loan Calculator'),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Borrowing amount : ${currentLoan.round().toString()}'),
            ),

            Slider(
            value: currentLoan, 
            min: 40000,
            max: 3000000,
            label: (currentLoan.round()).toString(),
            thumbColor: Colors.purple,
            activeColor: Colors.redAccent,
            inactiveColor: Colors.blueAccent,
            onChanged: (value){
                setState((){
                  currentLoan = value;
                }
                );
            }),


            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Interest rate : ${currentRate.toString()}'),
            ),

            Slider(value: currentRate, 
            min: 0.0,
            max: 10.0,
            divisions: 5,
            label: currentRate.toString(),
            thumbColor: Colors.purple,
            activeColor: Colors.redAccent,
            inactiveColor: Colors.blueAccent,
            onChanged: (value){
                setState((){
                  currentRate = value;
                }
                );
            }),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Loan Term in years : ${currentTerm.round().toString()}'),
            ),

            Slider(value: currentTerm, 
            divisions: 100,
            min: 0.0,
            max: 100,
            label: currentTerm.round().toString(),
            thumbColor: Colors.purple,
            activeColor: Colors.redAccent,
            inactiveColor: Colors.blueAccent,
            onChanged: (value){
                setState((){
                  currentTerm = value;
                }
                );
            }),

            MaterialButton(
              onPressed: (){
                var monthly = (currentLoan/currentTerm)*12;
                var total = (currentLoan*currentRate*currentTerm) + currentLoan;

                Navigator.push(context, MaterialPageRoute(builder: (_)=>Results(monthly: monthly, total: total,)));

              },
              child: const Text('Calculate your payment'),
              textColor: Colors.orangeAccent,
              color: Colors.brown,
              elevation: 10.0,
              )




        ],),


    );
  }
}