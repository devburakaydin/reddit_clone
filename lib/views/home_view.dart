import '../index.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(
      builder: (context, state) {
        return Scaffold(
          body: buildBody(state),
        );
      },
    );
  }

  Widget buildBody(DataState state) {
    switch (state.status) {
      case DataStatus.initial:
        return buildCircularProgressIndicator();
      case DataStatus.success:
        return buildSliverBody(state);
      case DataStatus.failure:
        return buildError();
    }
  }

  Widget buildSliverBody(DataState state) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<DataBloc>().add(const DataFetched());
      },
      child: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          buildSliverList(state.dates),
        ],
      ),
    );
  }

  SliverAppBar buildSliverAppBar() {
    return const SliverAppBar(
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          AppKeys.appName,
          style: TextStyle(color: Colors.black87),
        ),
      ),
    );
  }

  SliverList buildSliverList(List<ChildModel> dates) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return DataCard(childModel: dates[index]);
        },
        childCount: dates.length,
      ),
    );
  }

  Widget buildError() {
    return const Center(child: Text("Bir Hata Oluştu."));
  }

  Widget buildCircularProgressIndicator() {
    return const Center(child: CircularProgressIndicator());
  }
}
