import 'package:flutter/material.dart';
import 'package:xo_play/boardData.dart';
import 'package:xo_play/board_botton.dart';
import 'package:xo_play/winner_screen.dart';
class BoardScreen extends StatefulWidget {
  static const String routeName = "Board";

  const BoardScreen({super.key});

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}
class _BoardScreenState extends State<BoardScreen> {
List<BoardData>boardState=[
  BoardData(symboll: "", backgroun: Colors.transparent),  BoardData(symboll: "", backgroun: Colors.transparent), BoardData(symboll: "", backgroun: Colors.transparent),
  BoardData(symboll: "", backgroun: Colors.transparent),  BoardData(symboll: "", backgroun: Colors.transparent), BoardData(symboll: "", backgroun: Colors.transparent),
  BoardData(symboll: "", backgroun: Colors.transparent),  BoardData(symboll: "", backgroun: Colors.transparent), BoardData(symboll: "", backgroun: Colors.transparent),
];

  @override
  Widget build(BuildContext context) {
    BoardArgs args =ModalRoute.of(context)!.settings.arguments as BoardArgs;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Screen Players",
        style: TextStyle(color: Colors.black),
        ),
      ),

      body: Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.blue,
              margin: EdgeInsets.all(30),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                              right: 20,
                            ),
                            child: Text("${args.player1} (X)")),
                        Text("Score ${args.player1}:$ScorePlayer1")
                      ],
                    ),
                    const VerticalDivider(
                      color: Colors.black,
                      thickness: 3,
                      width: 50,
                
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${args.player2} (O)"),
                        Text("Score, ${args.player2}:$ScorePlayer2 ")
                      ],
                    )
                
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Divider(
              height: 22,
              color: Colors.black,
              thickness:5,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BoardBtn(board:boardState[0],onClick:()=>
                    PlayRound(0),) ,
                  BoardBtn(board:boardState[1],onClick:()=>
                      PlayRound(1),) ,
                  BoardBtn(board:boardState[2],onClick:()=>
                      PlayRound(2),) ,
              
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BoardBtn(board:boardState[3],onClick:()=>
                      PlayRound(3),) ,
                  BoardBtn(board:boardState[4],onClick:()=>
                      PlayRound(4),) ,
                  BoardBtn(board:boardState[5],onClick:()=>
                      PlayRound(5),) ,

                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BoardBtn(board:boardState[6],onClick:()=>
                      PlayRound(6),) ,
                  BoardBtn(board:boardState[7],onClick:()=>
                      PlayRound(7),) ,
                  BoardBtn(board:boardState[8],onClick:()=>
                      PlayRound(8),) ,

                ],
              ),
            ),




          ],
        ),
      )
    );
  }



int counter=1;
int ScorePlayer1=0;
int ScorePlayer2=0;
//الفانكشن دى
void PlayRound(int index){
  //دى معناها ان لو الزرار فيه X or O سيبو ومتغيرش القيه الى فيها

  if (boardState[index].symboll.isNotEmpty) return;

  setState(() {

      if(counter.isOdd){
      boardState[index].symboll = "X";
      boardState[index].backgroun = Colors.red;
      }else{
        boardState[index].symboll = "O";
        boardState[index].backgroun = Colors.blue;
      }

      if(CheckWinner("X")){
        ScorePlayer1 += 10;
        winner();
        resetGame();

      }else if(CheckWinner("O")){
        ScorePlayer2 += 10;
        winner();

        resetGame();

      }
      //هنا بقى لو حصل تعادل اول ابدأ من اول و جديد
      else if(counter==9){
        resetGame();
      }else{
        counter++;

      }
    });
  }
  // دى فانكشن بتخلينى اعيد الدور او ابدأ دور جديد وهكذا
resetGame(){
  boardState=[
    BoardData(symboll: "", backgroun: Colors.transparent),  BoardData(symboll: "", backgroun: Colors.transparent), BoardData(symboll: "", backgroun: Colors.transparent),
    BoardData(symboll: "", backgroun: Colors.transparent),  BoardData(symboll: "", backgroun: Colors.transparent), BoardData(symboll: "", backgroun: Colors.transparent),
    BoardData(symboll: "", backgroun: Colors.transparent),  BoardData(symboll: "", backgroun: Colors.transparent), BoardData(symboll: "", backgroun: Colors.transparent),
  ];
  counter=1;
}

 bool CheckWinner(String symboll){
     for(int i=0;i<9;i+=3){
      if(boardState[i].symboll==symboll
         && boardState[i+1].symboll==symboll
          && boardState[i+2].symboll==symboll){
        return true;
      }}

     for(int i=0;i<3;i++){
       if(boardState[i].symboll==symboll
         && boardState[i+3].symboll==symboll
         && boardState[i+6].symboll==symboll){
       return true;
     }
}
     if(boardState[0].symboll==symboll
           && boardState[4].symboll==symboll
           && boardState[8].symboll==symboll){
         return true;
       }
     if(boardState[2].symboll==symboll
         && boardState[4].symboll==symboll
         && boardState[6].symboll==symboll){
       return true;
     }
 return false;


}


winner(){
  if(ScorePlayer1==10 || ScorePlayer2==50){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const WinnerScreen()),);
  }
}


}

class BoardArgs{
  String player1;
  String player2;
  BoardArgs(this.player1,this.player2);

}