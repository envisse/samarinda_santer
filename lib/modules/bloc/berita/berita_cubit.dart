import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:samarinda_santer/models/berita.dart';
import 'package:samarinda_santer/modules/repositories/berita.dart';

part 'berita_state.dart';

class BeritaCubit extends Cubit<BeritaState> {
  BeritaCubit() : super(BeritaInitial());

  void getList() async {
    emit(BeritaLoading());

    try {
      var data = await BeritaRepositories.list();

      if (data.value == null) return emit(BeritaError(message: data.message!));
      if (data.value!.isEmpty) return emit(const BeritaError(message: 'Berita Kosong'));

      return emit(BeritaLoad(beritas: data.value!));
    } on Exception catch (e) {
      emit(BeritaError(message: e.toString()));
    }
  }
}
