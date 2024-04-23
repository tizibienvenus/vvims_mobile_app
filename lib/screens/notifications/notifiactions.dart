import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class NotificationsScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context){
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
        child: Text("Notifications",
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(
                fontSize: 20,
                color: AppColors.white,
             )),
      ),

              ListView.separated(
                itemCount: 5,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Row(
                      children: [
                        const Icon(Icons.notifications_outlined, size: 50, color: Colors.blue,), // Assuming AppColors.blue is a custom color
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded( // Use Expanded to allow the Column to take up the remaining space
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Tabe Lilian’s information has been registered successfully.",
                                  softWrap: true,
                                  maxLines: 3,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                    fontSize: 16,
                                  )),
                              const SizedBox(height: 5,),
                              Text("10 minutes ago",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                    fontSize: 15,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return  Divider( height: 1, thickness: 1, color: AppColors.grey,);
                },),
      ]
    ))
    );
  }
}