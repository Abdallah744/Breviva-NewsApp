// ignore_for_file: unnecessary_import, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components/components.dart';
import '../../shared/cubit/app_cubit.dart';
import '../../shared/cubit/app_state.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/styles.dart';

class Settings extends StatelessWidget{

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text('Settings'),
      ),
    );
  }

}