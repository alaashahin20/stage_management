import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cubit/filterbar_cubit.dart';
//import 'package:stage_management/cubit/cubit/cubit/filterbar_cubit.dart';

class FilterBar extends StatelessWidget {
  FilterBar({super.key});
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
      backgroundColor: Color.fromARGB(255, 214, 235, 252),
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          BlocBuilder<FilterbarCubit, FilterbarState >(
            builder: (context, state) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < filterList.length; i++)
                      InkWell(onTap: (){
                        context .read<FilterbarCubit>()
                                  .ChangeIndex(i);
                      },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            
                              color:context
                                              .read<FilterbarCubit>()
                                              .selectedIndx ==
                                          i ?
                                       Colors.blue
                                      : Colors.grey.withOpacity(.5),
                              borderRadius: BorderRadius.circular(18)),
                          child: Text(filterList[i]),
                        ),
                      ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    ));
  }
}
