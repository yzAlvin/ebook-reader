import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_drive/application/book_view/book_view_cubit.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_grid/book_grid.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_list/book_list.dart';
import 'package:test_drive/utils.dart';

import '../../../../application/book_loader/book_loader_cubit.dart';

class BookView extends StatelessWidget {
  const BookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookLoaderCubit, BookLoaderState>(
      builder: ((context, loaderState) {
        return loaderState.map(
          initial: (_) => const CircularProgressIndicator.adaptive(),
          loading: (_) => const CircularProgressIndicator.adaptive(),
          loadSuccess: (e) => BlocBuilder<BookViewCubit, BookViewState>(
            builder: (context, viewState) {
              var books = e.books;
              if (viewState.isSearch) {
                books = e.books.filterBookBySearch(viewState.searchBy);
              }
              if (viewState.isGridView) {
                return BookGrid(books: books);
              } else {
                return BookList(books: books);
              }
            },
          ),
          loadFailure: (e) => Center(
            child: Text('Could not load books because: ${e.errorMsg}'),
          ),
        );
      }),
    );
  }
}
