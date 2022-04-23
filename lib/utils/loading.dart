import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height-20,
      // color: Colors.black.withOpacity(0.2),
        child: const Center(
          child: SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation(Colors.red),
              strokeWidth: 4,
            ),
          ),
        ));
  }
}