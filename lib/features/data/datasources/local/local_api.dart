import 'package:hive/hive.dart';
import 'package:map/features/data/models/user_model/user.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class LocalApiService {
  static const _userBoxName = 'userBox';

  late Box<User> userBox;

  init() async {
    final applicationPath =
        await path_provider.getApplicationDocumentsDirectory();

    Hive.init(applicationPath.path);

    !Hive.isAdapterRegistered(0) ? Hive.registerAdapter(UserAdapter()) : null;

    userBox = await Hive.openBox<User>(_userBoxName);
  }

  Future<void> saveUser(User user) async {
    await Hive.openBox<User>(_userBoxName);
    await userBox.put('currentUser', user);
  }

  deleteUser() async {
    await Hive.openBox<User>(_userBoxName);
    await userBox.delete('currentUser');
  }

  Future<User> getUser() async {
    await Hive.openBox<User>(_userBoxName);
    return userBox.get('currentUser') ?? User();
  }
}
