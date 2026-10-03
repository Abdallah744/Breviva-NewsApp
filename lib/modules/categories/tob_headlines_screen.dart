import 'package:breviva_app/shared/components/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../../shared/components/constance.dart';

class General extends StatelessWidget {
  final List<dynamic> list;

  General(this.list);

  @override
  Widget build(BuildContext context) {
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
  }
}
