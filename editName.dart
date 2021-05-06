import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class EditName extends StatefulWidget {
  final String nmf;

  EditName(this.nmf);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<EditName> {
  TextEditingController myController = TextEditingController();

  var getads11;
  @override
  void initState() {
    myController.text = widget.nmf;
    super.initState();
  }

  @override
  void dispose() {
    myController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(2, 7, 39, 1),
        floatingActionButton: Container(
            width: double.infinity,
            child: Stack(children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12.0),
                      topLeft: Radius.circular(12.0)),
                  child: new BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: new Container(
                        width: double.infinity,
                        height: 80.0,
                        decoration: new BoxDecoration(
                            color:
                                Color.fromRGBO(5, 30, 70, 1).withOpacity(0.3)),
                      ))),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context, myController.text);
                  },
                  child: Container(
                      height: 56,
                      width: MediaQuery.of(context).size.width - 24,
                      margin: EdgeInsets.only(left: 12, bottom: 12, top: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: //Color(0xff7FB800),
                            Color(0xff7FB800),
                      ),
                      child: Center(
                          child: Text(
                        "Змінити ім'я",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 17),
                      )))),
            ])),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        body: SafeArea(
            child: Stack(children: [
          Container(
              margin: EdgeInsets.only(top: 12, left: 12, right: 12),
              child: GestureDetector(
                onTap: () {
                  // saveAdsdescription = myController.text;
                  Navigator.pop(context, widget.nmf);
                },
                child: Stack(children: [
                  ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(100.0)),
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(5, 30, 70, 1)),
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 20,
                                semanticLabel: 'Назад',
                              ))))
                ]),
              )),
          Center(
              child: Container(
                  margin: EdgeInsets.only(
                      top: 20, left: 12, right: 12, bottom: 100),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    minLines: 1, //Normal textInputField will be displayed
                    maxLines: 1,

                    showCursor: false,
                    autofocus: true, //cursorColor: Color.fromRGBO(2, 7, 39, 1),
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                    controller: myController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Ваше ім'я"),
                  ))),
        ])));
  }
}
