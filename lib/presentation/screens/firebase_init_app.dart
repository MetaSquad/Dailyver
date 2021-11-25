import 'package:dailyver/data/models/client.dart';
import 'package:dailyver/data/services/client_service.dart';
import 'package:dailyver/presentation/widgets/error_widget.dart';
import 'package:dailyver/presentation/widgets/loading_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirebaseInit extends StatelessWidget {
  FirebaseInit({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorView(error: snapshot.error.toString());
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      final ClientService _clientService = ClientService();
                      _clientService.addClient(Client("Alexandre CANTON CONDES",
                          "alexCantonCondes@gmail.com", "Castelnau"));
                    },
                    child: const Text("Ajouter un Client"),
                  ),
                  FutureBuilder<List<Client>>(
                    future: ClientService().getAllClient(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Client>> snapshot) {
                      if (snapshot.hasError) {
                        print("error ->" + snapshot.error.toString());
                        return ErrorView(error: snapshot.error.toString());
                      }
                      if (snapshot.hasData) {
                        for (var element in snapshot.data!) {
                          print(element.name);
                        }
                        return Text(snapshot.data![0].name);
                      }
                      return Loading();
                    },
                  ),
                ],
              ),
            );
          }
          return const Loading();
        },
      ),
    );
  }
}
