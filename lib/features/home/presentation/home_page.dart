import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_ia/features/home/bloc_home/home_bloc.dart';
import 'package:poc_ia/features/home/bloc_home/home_events.dart';
import 'package:poc_ia/features/home/bloc_home/home_state.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teste IA"),
        centerTitle: true,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        if (state is HomeStateInitial) {
          return SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: TextFormField(
                    controller: textController,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      context
                          .read<HomeBloc>()
                          .add(SendRequestEvent(question: textController.text));
                    },
                    child: const Text("Perguntar"))
              ],
            ),
          );
        }
        if (state is HomeStateLoading) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircularProgressIndicator(
                  color: Colors.pink,
                ),
              ),
            ],
          );
        }
        if (state is HomeStateLoaded) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(textController.text),
              ),
              SingleChildScrollView(
                child: Center(
                  child: Text(state.ansewer),
                ),
              ),
            ],
          );
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
