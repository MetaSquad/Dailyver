import 'package:dailyver/data/models/client.dart';
import 'package:dailyver/data/repositories/client_repository.dart';

class ClientService {
  final ClientRepository _repository = ClientRepository();

  Future<List<Client>> getAllClient() async {
    return await _repository
        .getAllClient()
        .then((value) => value.docs.map((e) => Client.fromJSON(e.data() as Map<String,dynamic>)).toList());
  }

  Future<Client> getClientFromEmail(String email) async {
    return await _repository.getClientFromEmail(email).then((value) => value
        .docs
        .map((e) => Client.fromJSON(e.data() as Map<String,dynamic>))
        .toList()[0]);
  }

  Future<void> addClient(Client client) async {
    await _repository.addClient(client.toJSON());
  }
}
