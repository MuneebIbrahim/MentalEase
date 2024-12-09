import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dob_input_field/dob_input_field.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:passwordfield/passwordfield.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: SplachScreen(),
    );
  }
}


class SplachScreen extends StatefulWidget{
  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), (){
      Navigator.pushReplacement(
          context, 
      MaterialPageRoute(builder: (context) => HomePage())    
      );
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Image.asset('lib/icons/bi_peace-fill.png'),
                 Text('MentalEase',
                 style: TextStyle(
                   fontSize: 36,
                 ),
                 ),
               ],
              ),
              Text('Your Companion of Mental Wellness',
              style: TextStyle(
                fontSize: 14,
              ),
              ),
            ],
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient:
            LinearGradient(colors:
            [
              Color(0xFFE0F7FA),
              Color(0xFF80DEEA)
            ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
    );
  }
}

class HomePage extends StatefulWidget{
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup Page',
          style: TextStyle(
            fontSize: 40,
            color: Colors.black,
          ),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
              child:  TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your Name',
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                child: IntlPhoneField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  initialCountryCode: 'PK',
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                )
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
              child: DOBInputField(
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
              child: PasswordField(),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirstScreen()),
                );
              },
              child: Text('Goto Login Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstScreen extends StatefulWidget{
  FirstScreenPage createState() => FirstScreenPage();
}

class FirstScreenPage extends State<FirstScreen>{
  int counter=0;
  void Increment(){
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text('Goto Home Page'),
            ),
            SizedBox(height: 20),
            Text('This is the First Screen'),
            Text('$counter',
            style: TextStyle(
              fontSize: 40,
            ),
            ),
            ElevatedButton(
              onPressed: (){
                Increment();
              },
              child: Text('Counter'),
            ),
          ],
        ),
      ),
    );
  }
}