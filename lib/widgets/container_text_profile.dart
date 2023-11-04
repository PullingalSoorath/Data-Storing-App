import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiveproject/widgets/color.dart';

class ContainerNamedProfile extends StatelessWidget {
  const ContainerNamedProfile({
    super.key,
    required TextEditingController namedController,
  }) : _namedController = namedController;

  final TextEditingController _namedController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: defaultColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: TextField(
          //
          //
          enabled: false,
          style: TextStyle(color: textColor),
          controller: _namedController,
          decoration: InputDecoration(
            label: const Text('Name'),
            labelStyle: TextStyle(color: textColor),
            // enabledBorder: OutlineInputBorder(
            //   // borderRadius: BorderRadius.circular(15),
            //   // borderSide: BorderSide(color: borderColor),
            // ),
            // focusedBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(15),
            //   borderSide: BorderSide(color: defaultSecondaryColor),
            // ),
          ),
        ),
      ),
    );
  }
}

class ContainerEmailProfile extends StatelessWidget {
  const ContainerEmailProfile({
    super.key,
    required TextEditingController emailController,
  }) : _emailController = emailController;

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: defaultColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: TextField(
          //
          //
          enabled: false,
          style: TextStyle(color: textColor),
          controller: _emailController,
          decoration: InputDecoration(
            label: const Text('Name'),
            labelStyle: TextStyle(color: textColor),
            // enabledBorder: OutlineInputBorder(
            //   // borderRadius: BorderRadius.circular(15),
            //   // borderSide: BorderSide(color: borderColor),
            // ),
            // focusedBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(15),
            //   borderSide: BorderSide(color: defaultSecondaryColor),
            // ),
          ),
        ),
      ),
    );
  }
}


class ContainerNumberProfile extends StatelessWidget {
  const ContainerNumberProfile({
    super.key,
    required TextEditingController numberController,
  }) : _namedController = numberController;

  final TextEditingController _namedController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: defaultColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: TextField(
          //
          //
          enabled: false,
          style: TextStyle(color: textColor),
          controller: _namedController,
          decoration: InputDecoration(
            label: const Text('Name'),
            labelStyle: TextStyle(color: textColor),
            // enabledBorder: OutlineInputBorder(
            //   // borderRadius: BorderRadius.circular(15),
            //   // borderSide: BorderSide(color: borderColor),
            // ),
            // focusedBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(15),
            //   borderSide: BorderSide(color: defaultSecondaryColor),
            // ),
          ),
        ),
      ),
    );
  }
}


class ContainerProfessionProfile extends StatelessWidget {
  const ContainerProfessionProfile({
    super.key,
    required TextEditingController professionController,
  }) : _professionController = professionController;

  final TextEditingController _professionController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: defaultColor,
      ),
      child: Padding(





        padding: const EdgeInsets.only(left: 25, right: 25),
        child: TextField(
          //
          //
          enabled: false,
          style: TextStyle(color: textColor),
          controller: _professionController,
          decoration: InputDecoration(
            label: const Text('Name'),
            labelStyle: TextStyle(color: textColor),
            // enabledBorder: OutlineInputBorder(
            //   // borderRadius: BorderRadius.circular(15),
            //   // borderSide: BorderSide(color: borderColor),
            // ),
            // focusedBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(15),
            //   borderSide: BorderSide(color: defaultSecondaryColor),
            // ),
          ),
        ),
      ),
    );
  }
}


// class ContainerProfessionProfile extends StatelessWidget {
//   const ContainerProfessionProfile({
//     super.key,
//     required TextEditingController professionController,
//   }) : _professionController = professionController;

//   final TextEditingController _professionController;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: defaultColor,
//       ),
//       child: Padding(





// Class ImageDataTransfer extends StatelessWidget{

//  ContainerProfessionProfile({
//   super.key,
//   required Function
//  })

// }




// class imagestada extends StatefulWidget {
//    imagestada({super.key,required });

//   @override
//   State<imagestada> createState() => _imagestadaState();
// }

// class _imagestadaState extends State<imagestada> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }


// Widget imageProfile() {
//     // Image Profile
//     return Stack(
//       children: <Widget>[
//         CircleAvatar(
//           radius: 125,
//           backgroundColor: circleAvatharBgColor,

//           backgroundImage: _imageFile == null
//               ? const AssetImage('assets/images/img1.png')
//               : FileImage(File(_imageFile!.path)) as ImageProvider<Object>,

//           // backgroundImage: _imageFile == null
//           // ? AssetImage('assets/images/img1.png') as ImageProvider<Object>
//           // : FileImage(File(_imageFile!.path)) as ImageProvider<Object>,
//         ),
//         Positioned(
//           right: 20,
//           bottom: 20,
//           // child: IconButton(
//           //   style: const ButtonStyle(
//           //       backgroundColor: MaterialStatePropertyAll(Colors.blue)),
//           //   onPressed: () {
//           //     showModalBottomSheet(
//           //       barrierColor: const Color.fromARGB(187, 37, 1, 54),
//           //       backgroundColor: defaultUiBackgroundColor,
//           //       context: context,
//           //       builder: ((builder) => bottomSheet()),
//           //     );
//           //   },
//           //   icon: const Icon(
//           //     Icons.edit,
//           //     // color: Colors.red,
//           //   ),
//           // ),
//           child: InkWell(
//             onTap: () {
//               showModalBottomSheet(
//                 barrierColor: const Color.fromARGB(187, 37, 1, 54),
//                 backgroundColor: defaultUiBackgroundColor,
//                 context: context,
//                 builder: ((builder) => bottomSheet()),
//               );
//             },
//             child: Icon(
//               Icons.camera_alt,
//               color: Colors.teal,
//               size: 28,
//             ),
//           ),
//         ),
//       ],
//     );
//   }