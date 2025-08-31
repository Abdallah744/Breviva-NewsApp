abstract class NewsStates {}

class AppInitialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class GeneralSuccessState extends NewsStates {}

class LoadingGeneralState extends NewsStates {}

class GeneralErrorState extends NewsStates {
  final String error;
  GeneralErrorState(this.error);
}

class BusinessSuccessState extends NewsStates {}

class LoadingBusinessState extends NewsStates {}

class BusinessErrorState extends NewsStates {
  final String error;
  BusinessErrorState(this.error);
}

class SportsSuccessState extends NewsStates {}

class LoadingSportsState extends NewsStates {}

class SportsErrorState extends NewsStates {
  final String error;
  SportsErrorState(this.error);
}

class TechnologySuccessState extends NewsStates {}

class LoadingTechnologyState extends NewsStates {}

class TechnologyErrorState extends NewsStates {
  final String error;
  TechnologyErrorState(this.error);
}

class ScienceSuccessState extends NewsStates {}

class LoadingScienceState extends NewsStates {}

class ScienceErrorState extends NewsStates {
  final String error;
  ScienceErrorState(this.error);
}

class HealthSuccessState extends NewsStates {}

class LoadingHealthState extends NewsStates {}

class HealthErrorState extends NewsStates {
  final String error;
  HealthErrorState(this.error);
}

class SearchSuccessState extends NewsStates {}

class LoadingSearchState extends NewsStates {}

class SearchErrorState extends NewsStates {
  final String error;
  SearchErrorState(this.error);
}

class AppChangeThemeState extends NewsStates {}

class AppSearchState extends NewsStates {}
