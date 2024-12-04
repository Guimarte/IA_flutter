import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_ia/features/home/bloc_home/home_events.dart';
import 'package:poc_ia/features/home/bloc_home/home_state.dart';
import 'package:poc_ia/features/home/use_case/request_ia_use_case.dart';

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  HomeBloc() : super(HomeStateInitial()) {
    on<SendRequestEvent>(_generateResponse);
  }
  void _generateResponse(
      SendRequestEvent event, Emitter<HomeState> emitter) async {
    emitter(HomeStateLoading());

    String test = await RequestAnsewerIAImplementation().call(event.question);
    emitter(HomeStateLoaded(ansewer: test));
  }
}
