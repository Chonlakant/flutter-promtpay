import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:qrcode/service/remote_services.dart';

import 'main.dart';
class ResultPage extends StatefulWidget {
  final String? result_str;
  const ResultPage({Key? key,this.result_str}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState(this.result_str);
}

class _ResultPageState extends State<ResultPage> {
  String? result_str;
  _ResultPageState(this.result_str);
  String _authStatus = 'Unknown';
  String response_txt = "";

  @override
  void initState() {
    _asyncMethod();
    //log(result_str!);



    super.initState();
  }

  Future<void> _asyncMethod() async {
    var response = await RemoteServices.postQrcode(result_str!.toString());

    setState(() {
      response_txt = response.toString();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => {
      Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(MaterialPageRoute(
            builder: (BuildContextcontext) {
            return MyHome();},),
            (_) => false,)},
          ),
          title: Text("Sample Qrcode"),
          centerTitle: true,
        ),
        body: Container(

      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(response_txt.toString()),
            const SizedBox(
              height: 0.1,
            ),
          ],
        ),
      ),
    ));
  }
}
