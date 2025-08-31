import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/categories/business.dart';
import '../../modules/categories/health.dart';
import '../../modules/categories/science.dart';
import '../../modules/categories/sports.dart';
import '../../modules/categories/technology.dart';
import '../../modules/categories/tob_headlines_screen.dart';
import '../network/remote/dio_helper.dart';
import 'app_state.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(AppInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> categories = [
    General(),
    Business(),
    Sports(),
    Technology(),
    Science(),
    Health(),
  ];
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
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
  ];
  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> technology = [];
  List<dynamic> science = [];
  List<dynamic> health = [];
  List<dynamic> general = [];
  List<dynamic> search = [];
  void changeBottomNavBar(int index) {
    currentIndex = index;
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
    emit(NewsBottomNavState());
  }

  ThemeMode appMode = ThemeMode.light;
  void changeAppMode() {
    if (appMode == ThemeMode.light) {
      appMode = ThemeMode.dark;
    } else {
      appMode = ThemeMode.light;
    }
    emit(AppChangeThemeState());
  }

  void getGeneralNews() {
    emit(LoadingGeneralState());
    DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'us',
            'category': 'general',
            'apikey': '11dd6784032d4d5dbb61e64d796b3705',
          },
        )
        .then((value) {
          general = value.data['articles'];
          print(general[0]['title']);
          emit(GeneralSuccessState());
        })
        .catchError((error) {
          print(error.toString());
          emit(GeneralErrorState(error.toString()));
        });
  }

  void getBusinessNews() {
    emit(LoadingBusinessState());
    DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'us',
            'category': 'business',
            'apikey': '11dd6784032d4d5dbb61e64d796b3705',
          },
        )
        .then((value) {
          business = value.data['articles'];
          print(business[0]['title']);
          emit(BusinessSuccessState());
        })
        .catchError((error) {
          print(error.toString());
          emit(BusinessErrorState(error.toString()));
        });
  }

  void getSportsNews() {
    emit(LoadingSportsState());
    DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'us',
            'category': 'sports',
            'apikey': '11dd6784032d4d5dbb61e64d796b3705',
          },
        )
        .then((value) {
          sports = value.data['articles'];
          print(sports[0]['title']);
          emit(SportsSuccessState());
        })
        .catchError((error) {
          print(error.toString());
          emit(SportsErrorState(error.toString()));
        });
  }

  void getTechnologyNews() {
    emit(LoadingTechnologyState());
    DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'us',
            'category': 'technology',
            'apikey': '11dd6784032d4d5dbb61e64d796b3705',
          },
        )
        .then((value) {
          technology = value.data['articles'];
          print(technology[0]['title']);
          emit(TechnologySuccessState());
        })
        .catchError((error) {
          print(error.toString());
          emit(TechnologyErrorState(error.toString()));
        });
  }

  void getScienceNews() {
    emit(LoadingScienceState());
    DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'us',
            'category': 'science',
            'apikey': '11dd6784032d4d5dbb61e64d796b3705',
          },
        )
        .then((value) {
          science = value.data['articles'];
          print(science[0]['title']);
          emit(ScienceSuccessState());
        })
        .catchError((error) {
          print(error.toString());
          emit(ScienceErrorState(error.toString()));
        });
  }

  void getHealthNews() {
    emit(LoadingHealthState());
    DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'us',
            'category': 'health',
            'apikey': '11dd6784032d4d5dbb61e64d796b3705',
          },
        )
        .then((value) {
          health = value.data['articles'];
          print(health[0]['title']);
          emit(HealthSuccessState());
        })
        .catchError((error) {
          print(error.toString());
          emit(HealthErrorState(error.toString()));
        });
  }

  void getSearchResult(String value) {
    emit(LoadingSearchState());
    search = []; // Clear previous search results
    DioHelper.getData(
          url: 'v2/everything',
          query: {'q': value, 'apikey': '11dd6784032d4d5dbb61e64d796b3705'},
        )
        .then((response) {
          if (response.data != null && response.data['articles'] is List) {
            search = List<dynamic>.from(response.data['articles']);
            if (search.isNotEmpty) {
              // Optionally, print information for debugging, but be careful
              // print('First search result title: ${search[0]['title']}');
              print('Search results count: ${search.length}');
            } else {
              print('Search returned no articles.');
            }
          } else {
            print('Search response did not contain a list of articles.');
            // search remains an empty list, which is correct for this case
          }
          emit(SearchSuccessState());
        })
        .catchError((error) {
          print('Error during search: ${error.toString()}');
          emit(SearchErrorState(error.toString()));
        });
  }
}
