abstract class HomeState {}

class HomeStateInitial extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateLoaded extends HomeState {
  String ansewer;
  HomeStateLoaded({required this.ansewer});
}
