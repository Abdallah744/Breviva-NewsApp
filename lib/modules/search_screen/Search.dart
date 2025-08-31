import 'package:breviva_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/cubit/app_cubit.dart';
import '../../shared/cubit/app_state.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsStates>(
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        List list = cubit.search;
        return Scaffold(
          appBar: AppBar(title: Text('Search')),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    searchTextFormField(
                      controller: searchController,
                      type: TextInputType.text,
                      onChanged: (value) {
                        if (value != null && value.isNotEmpty) {
                          cubit.getSearchResult(value);
                        } else {
                          // Optionally clear search or handle empty input
                          // cubit.clearSearch();
                        }
                      },
                      onSubmitted: (value) {
                        if (value != null && value.isNotEmpty) {
                          cubit.getSearchResult(value);
                        }
                      },
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Search must not be empty';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (state is LoadingSearchState) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is SearchSuccessState) {
                      if (list.isNotEmpty) {
                        return ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) =>
                              articleItemBuilder(list[index], context),
                          separatorBuilder: (context, index) =>
                              Container(height: 1, color: Colors.grey),
                          itemCount: list.length,
                        );
                      } else {
                        return Center(
                          child: Text(
                            'No articles found. Try a different search.',
                          ),
                        );
                      }
                    } else if (state is SearchErrorState) {
                      return Center(child: Text('Error: ${state.error}'));
                    }
                    // Initial state or before first search
                    return Center(
                      child: Text('Enter a search term to see results.'),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
