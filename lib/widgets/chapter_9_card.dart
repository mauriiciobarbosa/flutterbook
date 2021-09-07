import 'package:ch4_starter_exercise/pages/card_widget.dart';
import 'package:flutter/material.dart';

class CardSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Sample'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardWidget(),
                CardWidget(shape: StadiumBorder(), shapeName: 'Stadium Border'),
                CardWidget(
                  shape: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  shapeName: 'Underline Input Border',
                ),
                CardWidget(
                  shape: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  shapeName: 'Outline Input Border',
                ),
                SizedBox(height: 32)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
