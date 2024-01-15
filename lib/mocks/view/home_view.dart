import 'package:flutter/material.dart';
import 'package:flutter_api_sample/mocks/model/model.dart';
import 'package:flutter_api_sample/mocks/repository/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget {
  HomeView({super.key});

  final _api = ApiClient();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Superheros Page'),
      ),
      body: Center(
        child: FutureBuilder(
          future: _api.fetchMockData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              final data = snapshot.data as List<Model>;
              return data.isNotEmpty
                  ? ListView(
                      children: data
                          .map(
                            (Model models) => Card(
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Text(models.id.toString()),
                                    title: Text(models.name!),
                                    subtitle: Text(models.hobby!.join(', ')),
                                    trailing: models.isActive!
                                        ? circleAvatar(Colors.green)
                                        : circleAvatar(Colors.red),
                                    onTap: () {
                                      print(models.address.toString());
                                    },
                                  ),
                                  ListTile(
                                    leading: Text("City"),
                                    title:  Text(models.address!.city ?? 'Default City'),
                                  ),
                                   ListTile(
                                    leading: Text("Street"),
                                    title:  Text(models.address!.street ?? 'Default Street'),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    )
                  : const Text('Data is empty.');
            }
          },
        ),
      ),
    );
  }

  Widget circleAvatar(Color color) {
    return CircleAvatar(
      radius: 3,
      backgroundColor: color,
    );
  }
}
