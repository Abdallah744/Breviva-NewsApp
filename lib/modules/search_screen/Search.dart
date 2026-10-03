import 'package:breviva_app/shared/components/components.dart';
import 'package:flutter/material.dart';

import '../../shared/network/remote/dio_helper.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchController = TextEditingController();
  List<dynamic> search = [];
  bool isLoading = false;
  String? errorMessage;

  void getSearchResult(String value) {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    DioHelper.getData(
          url: 'v2/everything',
          query: {'q': value, 'apikey': '11dd6784032d4d5dbb61e64d796b3705'},
        )
        .then((value) {
          setState(() {
            search = value.data['articles'] ?? [];
            isLoading = false;
          });
        })
        .catchError((error) {
          setState(() {
            errorMessage = error.toString();
            isLoading = false;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: searchTextFormField(
              controller: searchController,
              type: TextInputType.text,
              onChanged: (value) {
                if (value != null && value.isNotEmpty) {
                  getSearchResult(value);
                } else {
                  setState(() {
                    search = [];
                  });
                }
              },
              onSubmitted: (value) {
                if (value != null && value.isNotEmpty) {
                  getSearchResult(value);
                }
              },
              validate: (value) {
                if (value == null || value.isEmpty) {
                  return 'Search must not be empty';
                }
                return null;
              },
            ),
          ),
          Expanded(child: _buildSearchResults()),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (errorMessage != null) {
      return Center(child: Text('Error: $errorMessage'));
    }

    if (searchController.text.isEmpty) {
      return const Center(child: Text('Enter a search term to see results.'));
    }

    if (search.isEmpty) {
      return const Center(
        child: Text('No articles found. Try a different search.'),
      );
    }

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) =>
          articleItemBuilder(search[index], context),
      separatorBuilder: (context, index) =>
          Container(height: 1, color: Colors.grey),
      itemCount: search.length,
    );
  }
}
