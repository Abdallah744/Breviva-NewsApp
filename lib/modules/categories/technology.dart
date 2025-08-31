import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constance.dart';
import '../../shared/cubit/app_cubit.dart';
import '../../shared/cubit/app_state.dart';

class Technology extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) => () {
        if (state is LoadingBusinessState) {
          Center(child: CircularProgressIndicator());
        }
      },
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        var list = cubit.technology;
        return ConditionalBuilder(
          condition: list.isNotEmpty,
          builder: (context) => ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                articleItemBuilder(list[index], context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: list.length,
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
