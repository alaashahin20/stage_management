import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stage_management/cubit/cubit/show_hide_pass_cubit.dart';
import '../cubit/cubit/filterbar_cubit.dart';
//import 'package:stage_management/cubit/cubit/cubit/filterbar_cubit.dart';

class FilterBar extends StatefulWidget {
  FilterBar({super.key});

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  List<String> filterList = [
    "تمت",
    "تحت المراجعة",
    "المكتملة",
    "الملغية",
    "قيد التنفيذ",
    "اطلب مرة اخرى",
    "قيم الطلب",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 249, 249),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            BlocBuilder<FilterbarCubit, FilterbarState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 0; i < filterList.length; i++)
                        InkWell(
                          onTap: () {
                            context.read<FilterbarCubit>().ChangeIndex(i);
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: context
                                            .read<FilterbarCubit>()
                                            .selectedIndx ==
                                        i
                                    ? Colors.blue
                                    : Colors.grey.withOpacity(.5),
                                borderRadius: BorderRadius.circular(18)),
                            child: Text(filterList[i]),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(
              height: 50,
            ),
            Divider(
              color: Colors.black,
              thickness: 1,
            ),
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
      ),
    );
  }
}
