import 'package:provider_state_management/resurs/import.dart';

class TwoScreen extends StatefulWidget {
  const TwoScreen({super.key});

  @override
  State<TwoScreen> createState() => _TwoScreenState();
}

class _TwoScreenState extends State<TwoScreen> {
  TextEditingController controller_1 = TextEditingController();
  TextEditingController controller_2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text('Two Screen', style: AppStyles.appBarStyle),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                controller: controller_1,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                controller: controller_2,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<Model>().getAddUser(User(name: controller_1.text, phone: controller_2.text));
          Navigator.pop(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
