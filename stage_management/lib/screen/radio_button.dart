import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stage_management/cubit/cubit/radio_button_cubit.dart';

class RadioButton extends StatelessWidget {
  const RadioButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SizedBox(
              height: MediaQuery.of(context).size.height,
              child: BlocBuilder<RadioButtonCubit, RadioButtonState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return RadioListTile(
                        value: index,
                        groupValue:
                            context.read<RadioButtonCubit>().currentValue,
                        onChanged: (value) {
                          context.read<RadioButtonCubit>().currentValue =
                              value!;
                          context.read<RadioButtonCubit>().radioButton();
                        },
                        title: Text("Radio_Button"),
                        subtitle: Text("Click hir"),
                      );
                    },
                  );
                },
              ),
            )
    );
  }
}