import 'package:try_starter/data/datasource/binding_datasources.dart';
import 'package:try_starter/storage/local_storage.dart';

class BindingLocal implements BindingDataSources {
  BindingLocal(this.prefs);

  final SharedPrefs? prefs;
}
