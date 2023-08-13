import '../index.dart';

class DataCard extends StatelessWidget {
  const DataCard({super.key, required this.childModel});

  final ChildModel childModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      elevation: 5.0,
      child: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            height: 200,
            child: Placeholder(),
          ),
          ListTile(
            title: Text(
              childModel.title ?? "",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(childModel.author ?? ""),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {},
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              childModel.selfText ?? "",
              style: const TextStyle(),
              maxLines: 3,
            ),
          )
        ],
      ),
    );
  }
}
