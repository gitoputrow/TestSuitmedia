import 'package:untitled/resource.dart';
import 'package:rxdart/rxdart.dart';
import 'model.dart';

class ContactBloc {
  final _repository = Repository();
  final _contactFetcher = PublishSubject<ItemModel>();

  Stream<ItemModel> get allContact => _contactFetcher.stream;

  fetchAllContact() async {
    ItemModel itemModel = await _repository.fetchAllContact();
    _contactFetcher.sink.add(itemModel);
  }

  dispose() {
    _contactFetcher.close();
  }
}

final bloc = ContactBloc();