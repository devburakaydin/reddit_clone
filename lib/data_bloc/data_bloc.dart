import '../index.dart';

part 'data_event.dart';

part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final ApiRepository apiRepo;

  DataBloc({required this.apiRepo}) : super(const DataState()) {
    on<DataEvent>((event, emit) async {
      await mapEventToState(event, emit);
    });
  }

  Future<void> mapEventToState(DataEvent event, Emitter<DataState> emit) async {
    if (event is DataFetched) {
      try {
        emit(state.copyWith( status: DataStatus.initial));
        var dates = await apiRepo.getDates();
        emit(state.copyWith(dates: dates, status: DataStatus.success));
      } catch (e) {
        emit(state.copyWith(status: DataStatus.failure));
      }
    }
  }
}
