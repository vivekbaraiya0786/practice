import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techinal_practice/controller/blob/internet_bloc.dart';
import 'package:techinal_practice/controller/blob/internet_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:
    SafeArea(

      child: Center(

        child: BlocConsumer<InternetBloc,InternetState>(
          listener: (context, state) {
            if(state is InternetGainedState){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Internet Connected....")),
              );
            }else if(state is InternetLostState){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Internet Lost....")),
              );
            }
          },
           builder: (context, state) {
            //if(state == )
            //== to chcek value
            //is check to datatype
            if(state is InternetGainedState){
              return const Text("Connected");
            }else if(state is InternetLostState){
              return const Text("Not Connected");
            }else{
              return const Text("Loading");
            }

          },

        ),
        // child: BlocBuilder<InternetBloc,InternetState>(
        //   builder: (context, state) {
        //     //if(state == )
        //     //== to chcek value
        //     //is check to datatype
        //     if(state is InternetGainedState){
        //       return const Text("Connected");
        //     }else if(state is InternetLostState){
        //       return const Text("Not Connected");
        //     }else{
        //       return const Text("Loading");
        //     }
        //
        //   },
        // ),
      ),
    ),
    );
  }
}
