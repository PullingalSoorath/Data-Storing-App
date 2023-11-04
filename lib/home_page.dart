import 'dart:io';

import 'dart:async';

import 'package:number_text_input_formatter/number_text_input_formatter.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:hiveproject/widgets/color.dart';
import 'package:hiveproject/widgets/defaultIconButton.dart';
import 'package:image_picker/image_picker.dart';
import 'widgets/container_text_profile.dart';
import 'widgets/default_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // PickedFile? _imageFile;
  // final ImagePicker _picker = ImagePicker();

  // void _setImageFileListFromFile(XFile? value) {
  //   _imageFile = value == null ? null : <XFile>[value];
  // }

  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;

  // List<XFile>? _imageFiles;

  final formKey = GlobalKey<FormState>();

  final TextEditingController _namedController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();

  final RegExp _textPattern = RegExp(r'[A-Z , a-z ,_,]');
  final RegExp _professionPattern = RegExp(r'[A-Z , a-z ,_,]');
  // ignore: unused_field
  List<Map<String, dynamic>> _items = [];

  final _profileDatas = Hive.box('boxname');

  @override
  void initState() {
    super.initState();
    _refreshItem();
  }

  void _refreshItem() {
    ///Refresh Item
    final data = _profileDatas.keys.map((key) {
      final item = _profileDatas.get(key);
      return {
        "key": key,
        "name": item["name"],
        "email": item["email"],
        "number": item["number"],
        "profession": item["profession"]
      };
    }).toList();

    setState(() {
      _items = data.reversed.toList();

      // print(_items.length);
    });
  }

  Future<void> _createItem(Map<String, dynamic> newItem) async {
    //Create Item
    ///Create Item
    await _profileDatas.add(newItem);

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        // shape: RoundedRectangleBorder(),
        backgroundColor: defaultColor,
        shape: const RoundedRectangleBorder(),
        content: const Text('Profile Details Added'),
      ),
    );

    _refreshItem();
  }

  Future<void> _updateItem(int itemKey, Map<String, dynamic> item) async {
    //Update Item
    await _profileDatas.put(itemKey, item);
    _refreshItem();

// ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        // shape: RoundedRectangleBorder(),
        backgroundColor: defaultColor,
        shape: const RoundedRectangleBorder(),
        content: const Text('Profile Details Updated.!!!'),
      ),
    );
  }

  Future<void> _deleteItem(int itemkey) async {
    await _profileDatas.delete(itemkey);
    _refreshItem();

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: snackBarColor,
        shape: const RoundedRectangleBorder(),
        content: const Text('Profile Details Deleted.!!!'),
      ),
    );
  }

  void showAlertDialog(BuildContext context, currentItem) {
    //Warning!!! , Are You Sure....

    showDialog(
      // barrierColor: Colors.black,

      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: defaultUiBackgroundColor,
          title: Text(
            'Warning.!',
            style: TextStyle(color: textColor),
          ),
          content: Text(
            'Are you sure want to delete this data.!!!',
            style: TextStyle(color: textColor),
          ),
          actions: <Widget>[
            DefaultButton(
                pressFn: () {
                  Navigator.pop(context);
                },
                buttonName: 'Cancel',
                heightBtn: 20.0,
                widthBtn: 60.0),
            const SizedBox(
              width: 2,
            ),
            DefaultButton(
                pressFn: () {
                  _deleteItem(currentItem['key']);
                  // Navigator.of(context).pop();
                  Navigator.pop(context);
                },
                buttonName: 'Delete',
                heightBtn: 20.0,
                widthBtn: 50.0),
            const SizedBox(
              width: 2,
            )
          ],
        );
      },
    );
  }

  void _showProfile(BuildContext ctx, int? itemkey) async {
    if (itemkey != null) {
      final existingItem =
          _items.firstWhere((element) => element['key'] == itemkey);

      _namedController.text = existingItem['name'];
      _emailController.text = existingItem['email'];
      _numberController.text = existingItem['number'];
      _professionController.text = existingItem['profession'];
    }

    showModalBottomSheet(
      backgroundColor: defaultBackgroundColor,
      context: ctx,
      isScrollControlled: true,
      enableDrag: false,
      builder: (_) => Container(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
            right: 15,
            top: 10,
            left: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),

//button for without swipe

            Row(
              children: [
//backbutton top

                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _namedController.text = '';
                    _emailController.text = '';
                    _numberController.text = '';
                    _professionController.text = '';
                  },
                  icon: const Icon(
                    CupertinoIcons.back,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Expanded(

//circleAwathar

                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Stack(
                      children: [
                        imageProfile(),
                      ],
                    ),
                  ),
                )),
            ContainerNamedProfile(namedController: _namedController),
            sizeboxheight(),
            ContainerEmailProfile(emailController: _emailController),
            sizeboxheight(),
            ContainerNumberProfile(numberController: _numberController),
            sizeboxheight(),
            ContainerProfessionProfile(
                professionController: _professionController),

            const SizedBox(
              height: 40,
            ),

            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  ///IMAGE GALLERY , CAMERA

  Widget bottomSheet() {
    ///IMAGE GALLERY , CAMERA
    return Container(
      // color: defaultBackgroundColor,

      height: 160.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Chose Profile Photo',
            style: TextStyle(fontSize: 20.0, color: textColor),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GalleryBtn(
                btnName: "Gallery",
                fnOnPress: () {
                  takePhoto(ImageSource.gallery);
                  // setState(() {

                  // });
                },
                btnTextSize: 15.0,
                btnHeight: 50.0,
                btnWidth: 160.0,
              ),
              const SizedBox(
                width: 10,
              ),
              CameraBtn(
                btnName: 'Camera',
                fnOnPress: () {
                  setState(() {
                    takePhoto(ImageSource.camera);
                  });
                },
                btnTextSize: 15.0,
                btnHeight: 50.0,
                btnWidth: 160.0,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget imageProfile() {
    // Image Profile
    return Stack(
      children: [
        CircleAvatar(
          radius: 125,
          backgroundColor: circleAvatharBgColor,
          backgroundImage: _imageFile == null
              ? const AssetImage('assets/images/img1.png')
              : FileImage(File(_imageFile!.path)) as ImageProvider<Object>,
        ),
        Positioned(
          right: 20,
          bottom: 20,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                barrierColor: const Color.fromARGB(187, 37, 1, 54),
                backgroundColor: defaultUiBackgroundColor,
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: const Icon(
              Icons.camera_alt,
              color: Colors.teal,
              size: 28,
            ),
          ),
        ),
      ],
    );
  }

  void takePhoto(ImageSource source) async {
    //uploading Image

    // final XFile image = await _picker.pickImage();

    final XFile? image = await _picker.pickImage(
      source: source,
    );

    // List<XFile> images = await _picker.pickMultiImage();

    setState(() {
      _imageFile = image;

      // _imageFiles = images;
    });
  }

  void _showUpdateForm(BuildContext ctx, int? itemkey) async {
    ///Main Form Page
    if (itemkey != null) {
      final existingItem =
          _items.firstWhere((element) => element['key'] == itemkey);

      _namedController.text = existingItem['name'];
      _emailController.text = existingItem['email'];
      _numberController.text = existingItem['number'];
      _professionController.text = existingItem['profession'];
    }

    showModalBottomSheet(
      backgroundColor: defaultBackgroundColor,
      context: ctx,
      enableDrag: false,
      isScrollControlled: true,
      builder: (_) => Container(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
            right: 15,
            top: 15,
            left: 15),
        child: Form(
          onChanged: () {
            formKey.currentState!.validate();
          },
          key: formKey,
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  IconButton(
                    //  enableDrag: itemkey != null ? true : false,

                    onPressed: () {
                      Navigator.pop(context);
                      _namedController.text = '';
                      _emailController.text = '';
                      _numberController.text = '';
                      _professionController.text = '';
                    },
                    icon: Icon(
                      CupertinoIcons.back,
                      color: navIconColor,
                    ),
                  )
                ],
              ),
              itemkey == null
                  ? Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            imageProfile(),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(
                      height: 50,
                    ),
              SizedBox(
                child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(_textPattern),
                  ],
                  keyboardType: TextInputType.name,
                  style: TextStyle(color: textColor),
                  controller: _namedController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: textColor,
                    ),
                    label: const Text('Name'),
                    hintText: 'Enter Name',
                    hintStyle: TextStyle(color: textColor),
                    labelStyle: TextStyle(color: textColor),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: borderColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: defaultSecondaryColor),
                    ),
                  ),
                  validator: (value) {
                    RegExp name = RegExp(
                        r"^([A-Z][A-Za-z.'\-]+) (?:([A-Z][A-Za-z.'\-]+) )?([A-Z][A-Za-z.'\-]+)$");

                    if (!name.hasMatch(value!)) {
                      return "Enter Valid Name";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                //
                // inputFormatters: [
                //   FilteringTextInputFormatter.allow(_emailPattern),
                // ],

                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: textColor),
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Icon(
                    Icons.mail,
                    color: textColor,
                  ),
                  label: const Text('Email'),
                  hintText: 'Email-Id',
                  hintStyle: TextStyle(color: textColor),
                  labelStyle: TextStyle(color: textColor),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: defaultSecondaryColor),
                  ),
                ),
                validator: (value) {
                  RegExp email = RegExp(
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

                  if (!email.hasMatch(value!)) {
                    return "Enter Valid Email";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                //
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  NumberTextInputFormatter(
                    integerDigits: 11,
                    decimalDigits: 0,
                    maxValue: '10000000000',
                    groupDigits: 4,
                    groupSeparator: ' ',
                    insertDecimalPoint: false,
                    insertDecimalDigits: true,
                  ),
                ],
                keyboardType: TextInputType.number,
                style: TextStyle(color: textColor),
                controller: _numberController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Icon(
                    Icons.phone,
                    color: textColor,
                  ),
                  label: const Text('Number'),
                  hintText: 'Number',
                  hintStyle: TextStyle(color: textColor),
                  labelStyle: TextStyle(color: textColor),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: defaultSecondaryColor),
                  ),
                ),
                validator: (value) {
                  RegExp number =
                      RegExp(r"^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$");

                  if (!number.hasMatch(value!) || (value.length < 12)) {
                    return "Enter Valid Number";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                //
                //
                inputFormatters: [
                  FilteringTextInputFormatter.allow(_professionPattern),
                ],

                keyboardType: TextInputType.text,
                style: TextStyle(color: textColor),
                controller: _professionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Icon(
                    Icons.work,
                    color: textColor,
                  ),
                  label: const Text('Profession'),
                  hintText: 'Profession',
                  hintStyle: TextStyle(color: textColor),
                  labelStyle: TextStyle(color: textColor),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: defaultSecondaryColor),
                  ),
                ),
                validator: (value) {
                  RegExp profession = RegExp(
                      r"^([A-Z][A-Za-z.'\-]+) (?:([A-Z][A-Za-z.'\-]+) )?([A-Z][A-Za-z.'\-]+)$");

                  if (!profession.hasMatch(value!)) {
                    return "Enter Valid Profession";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: itemkey == null ? 10 : 30,
              ),
              DefaultButton(
                pressFn: () async {
                  final valid = formKey.currentState?.validate();

                  if (valid!) {
                    if (_namedController.text == '' ||
                        _emailController.text == '' ||
                        _numberController.text == '' ||
                        _professionController.text == '') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: snackBarColor,
                          shape: const RoundedRectangleBorder(),
                          content: const Text('Please Fill The Field'),
                        ),
                      );
                    } else if (itemkey == null) {
                      _createItem({
                        "name": _namedController.text,
                        "email": _emailController.text,
                        "number": _numberController.text,
                        "profession": _professionController.text
                      });
                    }

                    if (itemkey != null) {
                      _updateItem(itemkey, {
                        "name": _namedController.text.trim(),
                        "email": _emailController.text.trim(),
                        "number": _numberController.text.trim(),
                        "profession": _professionController.text.trim()
                      });
                    }

                    _namedController.text = '';
                    _emailController.text = '';
                    _numberController.text = '';
                    _professionController.text = '';

                    Navigator.pop(context);
                  }
                },
                buttonName: itemkey == null ? 'Create New' : 'Update',
                heightBtn: 35.0,
                widthBtn: 120.0,
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox sizeboxheight() {
    return const SizedBox(
      height: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Data Pro',
          // style: TextStyle(color: Colors.white),
        ),
        titleTextStyle: TextStyle(color: headingColor, fontSize: 20),
        centerTitle: true,
        backgroundColor: defaultBackgroundColor,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: defaultFlobtnColor,
        onPressed: () => _showUpdateForm(context, null),
        child: const Icon(Icons.add),
      ),
      body: _items.isEmpty
          ? const Center(
              child: Text(
                'The List is Empty',
                style: TextStyle(color: Colors.white),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(
                top: 10,
                right: 10,
                left: 10,
              ),
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 2,
                    );
                  },
                  itemCount: _items.length,
                  itemBuilder: (ctx, index) {
                    final currentItem = _items[index];
                    return Slidable(
                      startActionPane: ActionPane(
                        motion: const StretchMotion(),
                        children: [
                          SlidableAction(
//delete Data swipe

                            onPressed: ((context) {
                              showAlertDialog(context, currentItem);
                              // _deleteItem(currentItem['key']);
                            }),

                            borderRadius: BorderRadius.circular(15),
                            backgroundColor: Colors.red.shade600,
                            icon: Icons.delete,
                          ),
                        ],
                      ),
                      endActionPane:
                          ActionPane(motion: const StretchMotion(), children: [
                        SlidableAction(
//edit data swipe

                          onPressed: ((context) =>
                              _showUpdateForm(ctx, currentItem['key'])),
                          borderRadius: BorderRadius.circular(15),
                          backgroundColor: Colors.blue,
                          icon: Icons.edit,
                        ),
                      ]),
                      child: ListTile(
                        onTap: () {
                          _showProfile(ctx, currentItem['key']);
                        },

                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.elliptical(20, 20),
                          ),
                        ),
                        tileColor: defaultColor,
                        leading: CircleAvatar(
                          backgroundColor: circleAvatharBgColor,
                          backgroundImage:
                              const AssetImage('assets/images/img1.png'),
                        ),
                        title: Text(
                          currentItem["name"],
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Text(
                          currentItem["email"].toString(),
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // trailing: Row(
                        //   mainAxisSize: MainAxisSize.min,
                        //   children: [
                        //     IconButton(
                        //       onPressed: () => _showForm(ctx, currentItem['key']),
                        //       icon: const Icon(Icons.edit),
                        //     ),
                        //     IconButton(
                        //       onPressed: () => _deleteItem(currentItem['key']),
                        //       icon: const Icon(Icons.delete),
                        //     ),
                        //   ],
                        // ),
                      ),
                    );
                  }),
            ),
    );
  }
}
