import 'package:try_starter/data/datasource/binding_datasources.dart';
import 'package:try_starter/storage/local_storage.dart';

class BindingRemote implements BindingDataSources {
  BindingRemote(this.prefs);

  final SharedPrefs? prefs;
}
