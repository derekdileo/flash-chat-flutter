import 'package:flutter/material.dart';
//
// class RoundedButton extends StatelessWidget {
//   late Color colour;
//   String namedRoute = '';
//   String title = '';
//
//   RoundedButton(this.colour, this.namedRoute, this.title);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 16.0),
//       child: Material(
//         elevation: 5.0,
//         color: colour,
//         borderRadius: BorderRadius.circular(30.0),
//         child: MaterialButton(
//           onPressed: () {
//             //Go to login screen.
//             Navigator.pushNamed(context, namedRoute);
//           },
//           minWidth: 200.0,
//           height: 42.0,
//           child: Text(
//             title,
//             style: TextStyle(
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class RoundedButton extends StatelessWidget {
  late Color colour;
  String title = '';
  VoidCallback onPress;

  RoundedButton(
      {required this.colour, required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
