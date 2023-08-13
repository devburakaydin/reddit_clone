import 'index.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppKeys.appName,
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: BlocProvider<DataBloc>(
        create: (context) => DataBloc(apiRepo: ApiRepository())
          ..add(
            const DataFetched(),
          ),
        child: const HomeView(),
      ),
    );
  }
}
