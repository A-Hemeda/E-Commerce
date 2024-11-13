
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



Widget defualtBottun({
  double width = double.infinity,
  Color background = Colors.blue,
  double height = 50,
  Color textColor = Colors.white,
  required VoidCallback function,
  required String text,
}) => Container(
  width: width,
  color: background,
  height: height,
  child: MaterialButton(
    onPressed: function,
    child: Text(
      '$text',
      style: TextStyle(
        color: textColor,
        fontSize: 20,
      ),
    ) ,
  ),
);

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  void Function(String)? onSubmit,
  void Function(String)? onChange,
  void Function()? onTap ,
  void Function()? suffixPressed,
  bool isPassword = false ,
  required String? Function(String?)? validate ,
  required String label,
  required IconData prefix,
  IconData? suffix,
}) => Padding(
  padding: const EdgeInsets.symmetric(horizontal: 8),
  child:   TextFormField(
    controller: controller,
    keyboardType: type,
    onFieldSubmitted: onSubmit,
    validator: validate,
    onTap: onTap,
    obscureText: isPassword,
    onChanged: onChange,

    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(),
      prefixIcon: Icon(prefix),
      suffixIcon: IconButton(
          onPressed: suffixPressed,
          icon: Icon(suffix)
      ),

    ),
  ),
);





Widget MyDivider () => Container(
  height: 1,
  width: double.infinity,
  color: Colors.grey[300],
);









void navigateTo (context , widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
        builder: (context) => widget  ,
    ),(route){
      return false;
}
);

void navigateToAndReplace (context , widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget  ,
    ),
);
