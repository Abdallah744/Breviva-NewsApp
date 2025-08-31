// ignore_for_file: unnecessary_import, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/search_screen/Search.dart';
import '../../shared/components/components.dart';
import '../../shared/cubit/app_cubit.dart';
import '../../shared/cubit/app_state.dart';

class HomePage extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getGeneralNews(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) => () {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Breviva'),
              actions: [
                IconButton(
                  onPressed: () {
                    navigateTo(context, SearchScreen());
                  },
                  icon: Icon(Icons.search),
                ),
                // IconButton(
                //   onPressed: cubit.changeAppMode,
                //   icon: Icon(Icons.brightness_4_outlined),
                // ),
              ],
            ),
            body: cubit.categories[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              items: cubit.bottomItems,
            ),
          );
        },
      ),
    );
  }
}
