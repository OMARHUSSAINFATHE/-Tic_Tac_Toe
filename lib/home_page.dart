import 'package:flutter/material.dart';
import 'package:xo_play/board_screen.dart';
class HomePage extends StatefulWidget {
  static const String routeName="HomePage";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController player1Controller =TextEditingController();
  TextEditingController player2Controller =TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
        'HomePage' ,
          style: TextStyle(color: Colors.blue,
          fontSize: 25
          ),

        ),
      ),
      body: Container(
        margin: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
              shape: BoxShape.circle
              ),
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller:player1Controller ,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "PlayerName1",
                  border: OutlineInputBorder(),

                ),
                validator: (value){
                  if(value==null||value.isEmpty){
                    return "Pleas Enter Your Name ";
                  }
                  return null;
                },

              ),
            ),
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle
              ),
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: player2Controller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "PlayerName1",
                  border: OutlineInputBorder(),


                ),
                validator: (value){
                  if(value==null||value.isEmpty){
                    return "Pleas Enter Your Name ";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 10,)  ,
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, BoardScreen.routeName,
                arguments: BoardArgs(player1Controller.text, player2Controller.text));


              },
                child: Text("Play",style: TextStyle(color: Colors.blue),),


            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
