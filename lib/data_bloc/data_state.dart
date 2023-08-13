part of 'data_bloc.dart';

enum DataStatus { initial, success, failure }

class DataState extends Equatable {
  final List<ChildModel> dates;
  final DataStatus status;

  const DataState({
    this.dates = const <ChildModel>[],
    this.status = DataStatus.initial,
  });

  DataState copyWith({
    List<ChildModel>? dates,
    DataStatus? status,
  }) {
    return DataState(
      dates: dates ?? this.dates,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [dates, status];
}
