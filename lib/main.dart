import 'package:example_api_1/bloc/delete/delete_bloc.dart';
import 'package:example_api_1/bloc/edit/edit_bloc.dart';
import 'package:example_api_1/bloc/product/product_bloc.dart';
import 'package:example_api_1/widgets/my_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<ProductBloc>(
        create: (context) => ProductBloc(),
      ),
      BlocProvider<EditBloc>(
        create: (context) => EditBloc(),
      ),
      BlocProvider<DeleteBloc>(
        create: (context) => DeleteBloc(),
      ),
    ], child: const MaterialApp(home: MyHome()));
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        BlocProvider.of<ProductBloc>(context).add(GetProductsEvent());
      }),
      body: Center(child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const CircularProgressIndicator();
          } else if (state is ProductError) {
            return Text(state.error);
          } else if (state is ProductSuccess) {
            return ListView.separated(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return MyTile(product: state.products[index]);
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
            );
          } else {
            return const SizedBox();
          }
        },
      )),
    );
  }
}
