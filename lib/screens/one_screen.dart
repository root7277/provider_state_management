import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/model.dart';
import 'package:provider_state_management/resurs/app_color.dart';
import 'package:provider_state_management/resurs/app_style.dart';

class OneScreen extends StatefulWidget {
  const OneScreen({super.key});

  @override
  State<OneScreen> createState() => _OneScreenState();
}

class _OneScreenState extends State<OneScreen> {
  TextEditingController controllerEditingName = TextEditingController();
  TextEditingController controllerEditingPhone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text('One Screen', style: AppStyles.appBarStyle),
      ),
      body: Consumer<Model>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.fullName.length,
            itemBuilder: (context, index) {
              return ListTile(
                onLongPress: () {
                  controllerEditingName.text = value.fullName[index].name;
                  controllerEditingPhone.text = value.fullName[index].phone;
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        actions: [
                          TextButton(
                            onPressed: () {
                              // Set state funcion yordamida ishlatib ko'rilsa:
                              // setState(() {
                              //   value.fullName[index].name = controllerEditingName.text;
                              //   value.fullName[index].phone = controllerEditingPhone.text;
                              // });

                              // Provider yordamida ishlatildi:
                              context.read<Model>().getChangeUser(index, controllerEditingName.text, controllerEditingPhone.text);
                              Navigator.pop(context);
                            },
                            child: const Text('Save'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cencel'),
                          ),
                        ],
                        title: const Text('Editing'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: controllerEditingName,
                              decoration: const InputDecoration(border: OutlineInputBorder()),
                            ),
                            const SizedBox(height: 30),
                            TextField(
                              controller: controllerEditingPhone,
                              decoration: const InputDecoration(border: OutlineInputBorder()),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                title: Text(value.fullName[index].name),
                subtitle: Text(value.fullName[index].phone),
                leading: CircleAvatar(
                  child: Text(
                    '${index + 1}',
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          actions: [
                            TextButton(
                              onPressed: () {
                                context.read<Model>().getRemoveUser(index);
                                Navigator.pop(context);
                              },
                              child: const Text('Yes'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('No'),
                            ),
                          ],
                          title: const Text('Delete'),
                          content: Text('${value.fullName[index].phone} ushbu raqam o\'chirilsinmi?'),
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.delete),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/two');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
