// ignore_for_file: unnecessary_import, unused_import

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../modules/web_view/web_view_screen.dart';
import '../styles/colors.dart';
import '../styles/styles.dart';
import 'constance.dart';

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String? Function(String?) validate,
  required String label,
  Function? onTab,
  required IconData suffix,
}) => TextFormField(
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: label,
    suffixIcon: Icon(suffix),
  ),
  keyboardType: type,
  controller: controller,
  onTap: onTab as void Function()?,
  validator: validate,
);

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 10.0,
  required Function() function,
  required String text,
}) => Container(
  width: width,
  height: 40.0,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: background,
  ),
  child: MaterialButton(
    onPressed: function,
    child: Text(
      text.toUpperCase(),
      style: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
);

Widget passwordTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onTap,
  required bool isPassword,
  required String? Function(String?) validate,
  required String label,
  required Widget prefix,
  Widget suffix = const Icon(Icons.remove_red_eye),
  required Function() suffixPressed,
  bool isClickable = true,
}) => TextFormField(
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: label,
    prefixIcon: prefix,
    suffixIcon: IconButton(onPressed: suffixPressed, icon: suffix),
  ),
  keyboardType: type,
  controller: controller,
  validator: validate,
  obscureText: isPassword,
);

Widget emailTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onTap,
  required String? Function(String?) validate,
  required String label,
  required Widget prefix,
  bool isClickable = true,
}) => TextFormField(
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: label,
    prefixIcon: prefix,
  ),
  keyboardType: type,
  validator: validate,
  controller: controller,
);

Widget nameTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onTap,
  required String? Function(String?) validate,
  required String label,
  bool isClickable = true,
}) => TextFormField(
  decoration: InputDecoration(border: OutlineInputBorder(), labelText: label),
  keyboardType: type,
  controller: controller,
  validator: validate,
);

Widget searchTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  FontWeight fontWeight = FontWeight.bold,
  double fontSize = 20,
  required Function(String? value) onChanged,
  required Function(String? value) onSubmitted,
  Color iconColor = Colors.black,
  Color labelColor = Colors.black,
  required String? Function(String?) validate,
  bool isClickable = true,
}) => TextFormField(
  decoration: InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(width: 1, style: borderStyle),
    ),
    labelText: 'Search',
    filled: true,
    fillColor: Colors.white,
    prefixIcon: Icon(Icons.search_sharp, color: Colors.deepOrange),
    labelStyle: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
  ),
  keyboardType: type,
  onFieldSubmitted: onSubmitted,
  onChanged: onChanged,
  controller: controller,
  validator: validate,
);

Widget articleItemBuilder(article, context) => InkWell(
  onTap: () {
    navigateTo(context, WebViewScreen(url: '${article['url']}'));
  },
  child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Row(
      children: [
        if (article['urlToImage'] != null)
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage('${article['urlToImage']}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        if (article['urlToImage'] == null)
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[300],
            ),
            child: Icon(Icons.image, size: 50, color: Colors.grey),
          ),
        SizedBox(width: 20),
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${article['title']}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 10),
                Text(
                  'Published At: ${article['publishedAt']}',
                  style: TextStyle(fontSize: 12, color: Colors.deepOrange),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);

void navigateTo(BuildContext context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}
