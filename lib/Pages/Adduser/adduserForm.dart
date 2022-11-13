import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:y2ztest/Models/UserData.dart';
import 'package:y2ztest/UTILITY/CustomDialog.dart';
import 'package:y2ztest/UTILITY/Sizeconfig.dart';

const String dataBoxName = "user data";

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  late TextEditingController firstnameTextXontroller = TextEditingController();
  late TextEditingController lastnameTextXontroller = TextEditingController();
  late TextEditingController emailTextXontroller = TextEditingController();

  Box<UserData>? dataBox;
  bool loading = false;
  adddata(int id, int index) {
    UserData datanew;
    datanew = UserData(
      firstname: firstnameTextXontroller.text,
      lastaname: lastnameTextXontroller.text,
      emailId: emailTextXontroller.text,
    );
    dataBox!.add(datanew);
  }

  bool? addtocart() {
    if (dataBox!.isEmpty) {
      UserData? datanew;
      datanew = UserData(
        firstname: firstnameTextXontroller.text.toString(),
        lastaname: lastnameTextXontroller.text.toString(),
        emailId: emailTextXontroller.text.toString(),
      );

      dataBox!.add(datanew);
      return true;
    } else {
      if (dataBox!.isNotEmpty) {
        UserData? datanew;
        datanew = UserData(
          firstname: firstnameTextXontroller.text.toString(),
          lastaname: lastnameTextXontroller.text.toString(),
          emailId: emailTextXontroller.text.toString(),
        );
        dataBox!.add(datanew);
        return true;
      }
      // updatecart(id, index);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenwidth,
      height: SizeConfig.screenheight,
      child: ModalProgressHUD(
        inAsyncCall: loading,
        progressIndicator: const CircularProgressIndicator(),
        child: Scaffold(
            body: SizedBox(
          width: SizeConfig.screenwidth,
          height: SizeConfig.screenheight,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: 40,
              width: SizeConfig.screenwidth * .75,
              child: TextField(
                controller: firstnameTextXontroller,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent)),
                    labelText: 'First Name',
                    hintText: 'Enter Your FirstName',
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    hintStyle: TextStyle(color: Colors.blueAccent)),
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            SizedBox(
              height: 40,
              width: SizeConfig.screenwidth * .75,
              child: TextField(
                controller: lastnameTextXontroller,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent)),
                    labelText: 'Last Name',
                    hintText: 'Enter Your LastName',
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    hintStyle: TextStyle(color: Colors.blueAccent)),
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            SizedBox(
              height: 40,
              width: SizeConfig.screenwidth * .75,
              child: TextField(
                controller: emailTextXontroller,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    labelText: 'Email',
                    hintText: 'Enter Your Email',
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    hintStyle: TextStyle(color: Colors.blueAccent)),
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            SizedBox(
              width: SizeConfig.screenwidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: SizeConfig.screenwidth * .25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(colors: [
                          Color.fromRGBO(143, 148, 251, 1),
                          Color.fromRGBO(143, 148, 251, .6),
                        ])),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          minimumSize:
                              MaterialStateProperty.all(const Size(100, 50)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          // elevation: MaterialStateProperty.all(3),
                          shadowColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: () {
                          if (firstnameTextXontroller.text.isNotEmpty) {
                            if (lastnameTextXontroller.text.isNotEmpty) {
                              if (lastnameTextXontroller.text.isNotEmpty) {
                                setState(() {
                                  loading = true;
                                });
                                bool? status = addtocart();
                                if (status = true) {
                                  setState(() {
                                    loading = false;
                                  });
                                  CustomWidgets().snackBarWidget(
                                      context,
                                      "Data Saved Succesfully",
                                      Icons.check_circle_rounded,
                                      Colors.white,
                                      2,
                                      Colors.green);
                                  firstnameTextXontroller.clear();
                                  lastnameTextXontroller.clear();
                                  emailTextXontroller.clear();
                                  Navigator.of(context).pushNamed("/userlist");
                                } else {
                                  setState(() {
                                    loading = false;
                                  });
                                }
                              } else {
                                CustomWidgets().snackBarWidget(
                                    context,
                                    "Enter Your Email Id",
                                    Icons.warning,
                                    Colors.white,
                                    2,
                                    Colors.red);
                              }
                            } else {
                              CustomWidgets().snackBarWidget(
                                  context,
                                  "Enter Your LastName",
                                  Icons.warning,
                                  Colors.white,
                                  2,
                                  Colors.red);
                            }
                          } else {
                            CustomWidgets().snackBarWidget(
                                context,
                                "Enter Your first name",
                                Icons.warning,
                                Colors.white,
                                2,
                                Colors.red);
                          }
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Container(
                    height: 50,
                    width: SizeConfig.screenwidth * .25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(colors: [
                          Color.fromRGBO(143, 148, 251, 1),
                          Color.fromRGBO(143, 148, 251, .6),
                        ])),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          minimumSize:
                              MaterialStateProperty.all(const Size(100, 50)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          // elevation: MaterialStateProperty.all(3),
                          shadowColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: () {
                          firstnameTextXontroller.clear();
                          lastnameTextXontroller.clear();
                          emailTextXontroller.clear();
                          //Navigator.of(context).pushNamed("/userlist");
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  )
                ],
              ),
            )
          ]),
        )),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    firstnameTextXontroller.clear();
    lastnameTextXontroller.clear();
    emailTextXontroller.clear();
  }

  @override
  void initState() {
    dataBox = Hive.box<UserData>(dataBoxName);
    super.initState();
  }
}
