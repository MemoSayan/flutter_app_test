import 'package:flutter_app_test/data/datasource/data_source.dart';
import 'package:flutter_app_test/presentation/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  final DataSource dataSource;

  UserCubit(this.dataSource) : super(UserInitial());

  Future<void> fetchData() async {
    emit(UserLoading());
    try {
      // Llama al método de DataSource para obtener los datos
      final data = await dataSource.fetchPosts();
      emit(UserLoaded(data));
    } catch (e) {
      emit(UserError('Failed to load data: $e'));
    }
  }
}
