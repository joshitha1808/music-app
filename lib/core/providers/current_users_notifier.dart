import 'package:client/features/auth/model/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_users_notifier.g.dart';

@Riverpod(keepAlive: true)
class CurrentUsersNotifier extends _$CurrentUsersNotifier {
  @override 
  UserModel? build(){
    return null;

  }
  void addUser(UserModel user){
    state=user;
  }
}
  
  