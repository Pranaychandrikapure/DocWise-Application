import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:docwise/components/app_text_feild.dart';
import 'package:docwise/components/toolbar.dart';
import 'package:docwise/components/user_avtar.dart';
import 'package:docwise/config/app_strings.dart';
import 'package:docwise/styles/app_colors.dart';
import 'package:docwise/styles/app_text.dart';

enum Gender { none,other, male, female,  }

class EditProfilePage extends StatefulWidget {
  EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  var gender = Gender.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(title: AppString.editProfile, actions: []),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Stack(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: UserAvtar(
                    size: 128,
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                        child: Icon(
                          Icons.edit,
                          size: 20,
                          color: Colors.black,
                        )))
              ]),
              SizedBox(
                height: 60,
              ),
              AppTextFeild(hint: AppString.firstName),
              SizedBox(
                height: 16,
              ),
              AppTextFeild(hint: AppString.lastName),
              SizedBox(
                height: 16,
              ),
              AppTextFeild(hint: AppString.phoneNumber),
              SizedBox(
                height: 16,
              ),
              AppTextFeild(hint: AppString.location),
              SizedBox(
                height: 16,
              ),
              AppTextFeild(hint: AppString.birthday),
              SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.only(left: 14,right: 14,top: 8)
              ),
              Container(
                decoration: BoxDecoration(color: AppColors.feildcolor,borderRadius: BorderRadius.all(Radius.circular(12)) ),
                

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppString.gender,style: AppText.body1.copyWith(
                      fontSize: 12
                    ),),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile(
                            title: Text(AppString.male),
                            value: Gender.male,
                            contentPadding: EdgeInsets.all(0),
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = Gender.male;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile(
                            title: Text(AppString.female),
                            value: Gender.female,
                            contentPadding: EdgeInsets.all(0),
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = Gender.female;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile(
                            title: Text(AppString.other),
                            value: Gender.other,
                            contentPadding: EdgeInsets.all(0),
                            groupValue: gender,
                            onChanged: (value) {
                              gender = Gender.other;
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
