import 'dart:developer';

import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class ScannedVisitorDetails extends StatelessWidget {
  const ScannedVisitorDetails({super.key, this.frontIdData, this.backIdData});

  final frontIdData;
  final backIdData;

  @override
  Widget build(BuildContext context) {
    log(frontIdData, name: 'FRONT ID CARD DATA');
    log(backIdData, name: 'BACK ID CARD DATA');

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 5,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            padding: EdgeInsets.zero,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xff7B9CF6),
              Color(0xff184AD2),
            ])),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                height: 100,
                decoration: BoxDecoration(
                    color: AppColors.blue,
                    gradient: const LinearGradient(colors: [
                      Color(0xff7B9CF6),
                      Color(0xff184AD2),
                    ])
                    // #7B9CF6
                    ),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 25,
                          color: AppColors.white,
                        )),
                    Expanded(
                      child: Center(
                        child: Text("Scanned Visitor Detail",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  fontSize: 20,
                                  color: AppColors.white,
                                )),
                      ),
                    ),
                  ],
                ),
              ),
            ])));
  }
}
