part of 'data_bloc.dart';

@immutable
abstract class DataEvent extends Equatable {
  const DataEvent();
}

@immutable
class DataFetched extends DataEvent {
  const DataFetched();

  @override
  List<Object?> get props => [];
}
