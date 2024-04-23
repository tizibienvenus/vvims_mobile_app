import 'package:flutter/material.dart';

import '../../components/custom_input.dart';
import '../../utils/colors.dart';

class VisitInfosScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xffDFDDDD).withOpacity(0.2),
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
      body:SingleChildScrollView(
        child: Column(
            children: [
        Container(
        padding: const EdgeInsets.all(20),
        height: 150,
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
            Icon(Icons.arrow_back, color: AppColors.white, size: 25,),

            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("All Visitors/Vehicles",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                          fontSize: 20,
                          color: AppColors.white,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(width: 10,),
                  CircleAvatar(
                    radius: 15,
                    foregroundColor: AppColors.white,
                    backgroundColor: AppColors.green,
                    child: Text("30", style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.white
                    ),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Transform.translate(
            offset: const Offset(0, -30),
            child: CustomFormInputField(
              onChange: (String query) {},
              placeholder: "Search",
              suffixIcon: "assets/icons/search.png",
              isFilled: true,
              hasBorder: true,
              borderColor: AppColors.grey.withOpacity(0.4),
              borderWidth: 2,
              isEnabled: false,
              hasSuffix: true,
            )),
      ),

              ListView.separated(
                itemCount: 5,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors
                          .white, // Assuming AppColors.white is a custom color
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(
                              0.1), // Assuming AppColors.grey is a custom color
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/profile.png",
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text("Tabe Lilian",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                  fontSize: 19,)),
                            Text("27/03/2024",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                  fontSize: 15,
                                )),
                          ],
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.more_vert,
                          size: 30,
                          color: Colors.black,
                        ) // Assuming AppColors.black is a custom color
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 10);
                },),
      ]
    )
    ));
  }
}