import 'package:reddit_clone/index.dart';

void main() {
  Bloc.observer = const DataBlocObserver();
  runApp(const MyApp());
}

class DataBlocObserver extends BlocObserver {
  const DataBlocObserver();

  @override
  void onTransition(Bloc bloc, Transition transition) {
    'Bloc : $bloc'.log();
    super.onTransition(bloc, transition);
  }

  @override
  void onCreate(BlocBase bloc) {
    'Data Bloc Created'.log();
    super.onCreate(bloc);
  }
}
