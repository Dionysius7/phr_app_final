import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phr_app_final/controllers/register_controller.dart';
import 'package:intl/intl.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final registerController = Get.put(RegisterController());
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25, left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Create Account",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 5.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Field Required';
                              }
                              return null;
                            },
                            cursorColor: Colors.indigo,
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.black),
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(
                                    'assets/register_person.png',
                                    width: 15,
                                    height: 15,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                hintText: "Full Name",
                                focusColor: Colors.black,
                                fillColor: Colors.black,
                                hintStyle: TextStyle(color: Colors.black),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.indigo)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.indigo))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 5.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Field Required';
                              }
                              return null;
                            },
                            cursorColor: Colors.indigo,
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.black),
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(
                                    'assets/register_phone.png',
                                    width: 15,
                                    height: 15,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                hintText: "Phone",
                                focusColor: Colors.black,
                                fillColor: Colors.black,
                                hintStyle: TextStyle(color: Colors.black),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.indigo)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.indigo))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 5.0),
                          child: Row(
                            children: [
                              // GENDER SECTION
                              Expanded(
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.indigo))),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Spacer(),
                                              Image.asset(
                                                'assets/register_gender.png',
                                                width: 25,
                                                height: 25,
                                                fit: BoxFit.contain,
                                              ),
                                              Spacer(),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                            child: Obx(() => DropdownButton(
                                                  underline: Container(),
                                                  isExpanded: true,
                                                  value: registerController
                                                      .selectedGender.value,
                                                  // isExpanded: true,
                                                  items: registerController
                                                      .genderList
                                                      .map((val) {
                                                    return DropdownMenuItem(
                                                        value: val,
                                                        child: Text(
                                                            val.toString()));
                                                  }).toList(),
                                                  onChanged: (newValue) {
                                                    registerController
                                                        .setSelectedGender(
                                                            newValue
                                                                .toString());
                                                  },
                                                ))),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              // BIRTHDAY SECTION
                              Expanded(
                                child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.indigo))),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                          child: Image.asset(
                                            'assets/register_birthday.png',
                                            width: 25,
                                            height: 25,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Container(
                                          child: Obx(() => InkWell(
                                                onTap: () {
                                                  showDatePicker(
                                                          context: context,
                                                          initialDate:
                                                              DateTime.now(),
                                                          firstDate:
                                                              DateTime(0000),
                                                          lastDate:
                                                              DateTime(9999))
                                                      .then((date) {
                                                    if (date == null) {
                                                      registerController
                                                          .setBirthDate(
                                                              registerController
                                                                  .selectedDate
                                                                  .value);
                                                    } else {
                                                      registerController
                                                          .setBirthDate(
                                                              date.toString());
                                                    }
                                                  });
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 16.0,
                                                      horizontal: 16.0),
                                                  child: Text(registerController
                                                              .selectedDate
                                                              .value ==
                                                          ""
                                                      ? 'Pick a date'
                                                      : DateFormat("yyyy-MM-dd")
                                                          .format(DateFormat(
                                                                  "yyyy-MM-dd")
                                                              .parse(registerController
                                                                  .selectedDate
                                                                  .value
                                                                  .toString()))
                                                          .toString()),
                                                ),
                                              )),
                                        ),
                                      ],
                                    )),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 5.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Field Required';
                              }
                              return null;
                            },
                            cursorColor: Colors.indigo,
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.black),
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(
                                    'assets/register_number.png',
                                    width: 15,
                                    height: 15,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                hintText: "NIK",
                                focusColor: Colors.black,
                                fillColor: Colors.black,
                                hintStyle: TextStyle(color: Colors.black),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.indigo)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.indigo))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 5.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Field Required';
                              }
                              return null;
                            },
                            cursorColor: Colors.indigo,
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.black),
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(
                                    'assets/register_number.png',
                                    width: 15,
                                    height: 15,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                hintText: "BPJS",
                                focusColor: Colors.black,
                                fillColor: Colors.black,
                                hintStyle: TextStyle(color: Colors.black),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.indigo)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.indigo))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 5.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Field Required';
                              }
                              return null;
                            },
                            cursorColor: Colors.indigo,
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.black),
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(
                                    'assets/register_address.png',
                                    width: 15,
                                    height: 15,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                hintText: "Address",
                                focusColor: Colors.black,
                                fillColor: Colors.black,
                                hintStyle: TextStyle(color: Colors.black),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.indigo)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.indigo))),
                          ),
                        ),
                        Container(
                          child: Obx(() => CheckboxListTile(
                                title: Text.rich(TextSpan(
                                    style: TextStyle(fontSize: 13),
                                    children: [
                                      TextSpan(text: "I accept the"),
                                      TextSpan(
                                          text: " Terms of Service ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                          recognizer: TapGestureRecognizer()),
                                      TextSpan(text: "and"),
                                      TextSpan(
                                          text: " Privacy Policy ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                          recognizer: TapGestureRecognizer()),
                                    ])),
                                value: registerController.checkedBox.value,
                                activeColor: Colors.indigo[400],
                                checkColor: Colors.white,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                onChanged: (newValue) {
                                  registerController.setCheckBox(newValue!);
                                },
                                controlAffinity: ListTileControlAffinity
                                    .leading, //  <-- leading Checkbox
                              )),
                        ),
                        Container(
                          padding: const EdgeInsets.all(15.0),
                          width: width / 1.5,
                          child: MaterialButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {}
                              },
                              child: Text("Register",
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                              color: Colors.indigo,
                              textColor: Colors.white,
                              padding: EdgeInsets.all(13),
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(35))),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: height / 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Image.asset("assets/top_right_decoration.png")],
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?"),
                        InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 2.0),
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        )));
  }
}
