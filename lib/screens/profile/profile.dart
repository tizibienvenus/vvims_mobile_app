import 'package:flutter/material.dart';
import 'package:vvims/config/app_colors.dart';
import 'package:vvims/screens/profile/edit_profile.dart';
import 'package:vvims/screens/profile/setting.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    ])),
                width: double.infinity,
                child: Text("Profile",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: 20,
                          color: AppColors.white,
                        )),
              ),
              const SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Image.asset(
                    "assets/images/profile.png",
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      bottom: 20,
                      right: 0,
                      child: Container(
                          height: 30,
                          width: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.green,
                            border:
                                Border.all(width: 4, color: AppColors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.edit,
                            size: 15,
                            color: AppColors.white,
                          )))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "FRANCIS FON TEBOH",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: AppColors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  "francfon@gmail.com",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: AppColors.green),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Divider(
                  height: 1,
                  thickness: 1,
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ListView(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditProfile()),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      decoration: BoxDecoration(
                          color: const Color(0xffDFDDDD).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person_outline,
                            size: 30,
                            color: AppColors.blue,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Edit Profile",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 20),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 30,
                            color: AppColors.blue,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Setting()),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      decoration: BoxDecoration(
                          color: const Color(0xffDFDDDD).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.notifications_outlined,
                            size: 30,
                            color: AppColors.blue,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Settings",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 20),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 30,
                            color: AppColors.blue,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      decoration: BoxDecoration(
                          color: const Color(0xffDFDDDD).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout,
                            size: 30,
                            color: AppColors.red,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Logout",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                    color: AppColors.red),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 30,
                            color: AppColors.blue,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ])));
  }
}
