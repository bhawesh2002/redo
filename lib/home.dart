import 'package:flutter/material.dart';
import 'package:redo/widgets/widgets.dart';
import 'todo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: redoLogo(context, 0.2),
            title: const Text("Redo"),
          ),
          body: FutureBuilder<List<Todo>>(
            future: getTasks(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Text('No tasks available.');
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Todo todo = snapshot.data![index];
                    return ListTile(
                      title: Text(todo.title),
                      subtitle: Text(todo.description),
                      onTap: () {
                        debugPrint(
                            "Start Date: ${todo.startDate}\tStart Time: ${todo.startTime}\n"
                            "End Date: ${todo.endDate}\t\tEnd Time: ${todo.endTime}");
                      },
                    );
                  },
                );
              }
            },
          )),
    );
  }
}
