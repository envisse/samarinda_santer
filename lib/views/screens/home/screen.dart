import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samarinda_santer/modules/bloc/berita/berita_cubit.dart';
import 'package:samarinda_santer/views/widgets/button/button_contained.dart';
import 'package:samarinda_santer/views/widgets/text/text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BeritaCubit(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            ButtonContainedWidget(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                label: 'Login')
          ],
        ),
        body: BlocBuilder<BeritaCubit, BeritaState>(
          builder: (context, state) {
            if (state is BeritaLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is BeritaLoad) {
              var item = state.beritas;
              return ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                itemBuilder: (context, index) =>
                    ListTile(title: TextWidget(text: item[index].judul, textStyling: TextStyling.bodySmall)),
                separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10),
                itemCount: item.length,
              );
            }
            String message = state is BeritaError ? state.message : 'Unknown Error';
            return Center(child: TextWidget(text: message, textStyling: TextStyling.bodySmall));
          },
        ),
      ),
    );
  }
}
