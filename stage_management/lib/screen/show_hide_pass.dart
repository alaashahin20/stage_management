import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cubit/show_hide_pass_cubit.dart';

class ShowHidePass extends StatelessWidget {
  const ShowHidePass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:
     
      Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
             padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<ShowHidePassCubit, ShowHidePassState>(
                    builder: (context, state) {
                      return TextFormField(
                        obscureText: context.read<ShowHidePassCubit>().isShown ,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock),
                                    suffixIcon: BlocBuilder<ShowHidePassCubit, ShowHidePassState>(
                                      builder: (context, state) {
                                        return IconButton(
                                          
                                          icon: context.read<ShowHidePassCubit>().isShown?
                                          Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                                           onPressed: () { 
                                                icon: context.read<ShowHidePassCubit>().ShowHidePass();
                                            },
                                           );
                                      },
                                    ),
                                    hintText: "Password",
                                    // errorBorder: ,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(255, 36, 4, 240), width: 2),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    // border: ,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    // border:
                                  ),
                                );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}