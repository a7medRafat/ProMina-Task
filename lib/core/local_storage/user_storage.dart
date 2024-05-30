import 'package:hive/hive.dart';
import '../../features/Auth/data/models/LoginModel.dart';
import 'hive_keys.dart';
import 'local_storage.dart';

class CurrentUser implements LocalStorage<LoginModel> {
  static Box<LoginModel>? _box;

  @override
  Future<void> init() async {
    _box = await Hive.openBox(HiveKeys.user);
  }

  @override
  LoginModel? getData({required String id}) => _box!.get(id);

  @override
  Future<void> saveData({required String id, required LoginModel data}) async {
    await _box!.put(id, data);
    await _box!.flush();
  }

  @override
  Future<void> deleteData({required String id}) async {
    await _box!.delete(id);
  }
}
