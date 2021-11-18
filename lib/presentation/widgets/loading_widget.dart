import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        SizedBox(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
          width: 60,
          height: 60,
        ),
        Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text(
            "Récupération des données...",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
