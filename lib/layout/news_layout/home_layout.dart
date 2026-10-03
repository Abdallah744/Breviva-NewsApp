// ignore_for_file: unnecessary_import, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../modules/categories/business.dart';
import '../../modules/categories/health.dart';
import '../../modules/categories/science.dart';
import '../../modules/categories/sports.dart';
import '../../modules/categories/technology.dart';
import '../../modules/categories/tob_headlines_screen.dart';
import '../../modules/search_screen/Search.dart';
import '../../shared/components/components.dart';
import '../../shared/network/remote/dio_helper.dart';

class HomePage extends StatefulWidget {
  final Function changeTheme;

  HomePage({required this.changeTheme});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> technology = [];
  List<dynamic> science = [];
  List<dynamic> health = [];
  List<dynamic> general = [];

  bool isLoading = false;

  void getGeneralNews() {
    setState(() {
      isLoading = true;
    });
    DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'us',
            'category': 'general',
            'apikey': '11dd6784032d4d5dbb61e64d796b3705',
          },
        )
        .then((value) {
          setState(() {
            general = value.data['articles'];
            isLoading = false;
          });
        })
        .catchError((error) {
          setState(() {
            isLoading = false;
          });
        });
  }

  void getBusinessNews() {
    if (business.isEmpty) {
      setState(() {
        isLoading = true;
      });
      DioHelper.getData(
            url: 'v2/top-headlines',
            query: {
              'country': 'us',
              'category': 'business',
              'apikey': '11dd6784032d4d5dbb61e64d796b3705',
            },
          )
          .then((value) {
            setState(() {
              business = value.data['articles'];
              isLoading = false;
            });
          })
          .catchError((error) {
            setState(() {
              isLoading = false;
            });
          });
    }
  }

  void getSportsNews() {
    if (sports.isEmpty) {
      setState(() {
        isLoading = true;
      });
      DioHelper.getData(
            url: 'v2/top-headlines',
            query: {
              'country': 'us',
              'category': 'sports',
              'apikey': '11dd6784032d4d5dbb61e64d796b3705',
            },
          )
          .then((value) {
            setState(() {
              sports = value.data['articles'];
              isLoading = false;
            });
          })
          .catchError((error) {
            setState(() {
              isLoading = false;
            });
          });
    }
  }

  void getTechnologyNews() {
    if (technology.isEmpty) {
      setState(() {
        isLoading = true;
      });
      DioHelper.getData(
            url: 'v2/top-headlines',
            query: {
              'country': 'us',
              'category': 'technology',
              'apikey': '11dd6784032d4d5dbb61e64d796b3705',
            },
          )
          .then((value) {
            setState(() {
              technology = value.data['articles'];
              isLoading = false;
            });
          })
          .catchError((error) {
            setState(() {
              isLoading = false;
            });
          });
    }
  }

  void getScienceNews() {
    if (science.isEmpty) {
      setState(() {
        isLoading = true;
      });
      DioHelper.getData(
            url: 'v2/top-headlines',
            query: {
              'country': 'us',
              'category': 'science',
              'apikey': '11dd6784032d4d5dbb61e64d796b3705',
            },
          )
          .then((value) {
            setState(() {
              science = value.data['articles'];
              isLoading = false;
            });
          })
          .catchError((error) {
            setState(() {
              isLoading = false;
            });
          });
    }
  }

  void getHealthNews() {
    if (health.isEmpty) {
      setState(() {
        isLoading = true;
      });
      DioHelper.getData(
            url: 'v2/top-headlines',
            query: {
              'country': 'us',
              'category': 'health',
              'apikey': '11dd6784032d4d5dbb61e64d796b3705',
            },
          )
          .then((value) {
            setState(() {
              health = value.data['articles'];
              isLoading = false;
            });
          })
          .catchError((error) {
            setState(() {
              isLoading = false;
            });
          });
    }
  }

  @override
  void initState() {
    super.initState();
    getGeneralNews();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> categories = [
      General(general),
      Business(business),
      Sports(sports),
      Technology(technology),
      Science(science),
      Health(health),
    ];

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
          IconButton(
            onPressed: () {
              widget.changeTheme();
            },
            icon: Icon(Icons.brightness_4_outlined),
          ),
        ],
      ),
      body: categories[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          if (index == 1) {
            getBusinessNews();
          } else if (index == 2) {
            getSportsNews();
          } else if (index == 3) {
            getTechnologyNews();
          } else if (index == 4) {
            getScienceNews();
          } else if (index == 5) {
            getHealthNews();
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
          BottomNavigationBarItem(
            icon: Icon(Icons.computer_outlined),
            label: 'Technology',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.science_outlined),
            label: 'Science',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety_outlined),
            label: 'Health',
          ),
        ],
      ),
    );
  }
}
