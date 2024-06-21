part of 'berita_cubit.dart';

sealed class BeritaState extends Equatable {
  const BeritaState();

  @override
  List<Object> get props => [];
}

final class BeritaInitial extends BeritaState {}

final class BeritaLoading extends BeritaState {}

final class BeritaError extends BeritaState {
  final String message;

  const BeritaError({required this.message});

  @override
  List<Object> get props => [message];
}

final class BeritaLoad extends BeritaState {
  final List<Berita> beritas;

  const BeritaLoad({required this.beritas});

  @override
  List<Object> get props => [beritas];
}