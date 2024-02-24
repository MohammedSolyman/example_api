import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:example_api_1/consts/consts.dart';
import 'package:http/http.dart' as http;

part 'delete_event.dart';
part 'delete_state.dart';

class DeleteBloc extends Bloc<DeleteEvent, DeleteState> {
  DeleteBloc() : super(DeleteInitial()) {
    on<DeleteEvent>(deletingProduct);
  }

  void deletingProduct(event, emit) async {
    emit(DeleteLoading(id: event.id));
    try {
      Uri uri = Uri.parse("${Urls.allProdcuts}/8");
      http.Response response =
          await http.delete(uri, headers: {'content-type': 'application/json'});
      if (response.statusCode == 200) {
        emit(DeleteNotLoading());
      } else {}
    } catch (e) {
      emit(DeleteError(error: e.toString()));
    }
  }
}
