import 'package:flutter/material.dart';
import 'package:xo_play/boardData.dart';



typedef BoardCallback =void  Function();

class BoardBtn extends StatelessWidget {
BoardData board;
BoardCallback onClick;
BoardBtn({required this.board,required this.onClick});

  @override
  Widget build(BuildContext context) {
    return
      Expanded(
        child: ElevatedButton(onPressed: (){
          onClick();
        },
              style: ElevatedButton.styleFrom(
                backgroundColor: board.backgroun,
                elevation: 0,
                shape:  RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                ),
                side: BorderSide(
                  color: Colors.black,
                )
    ),
                  child:Text(board.symboll,
                style: TextStyle(color: Colors.black),) ),


    );
  }
}
