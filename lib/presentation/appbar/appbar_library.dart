import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_drive/application/book_view/book_view_cubit.dart';
import 'package:test_drive/presentation/pages/library_page/components/book_view_helpers.dart';

import 'appbar_helpers.dart';

class LibraryAppbar extends StatelessWidget {
  const LibraryAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookViewCubit, BookViewState>(
      builder: (context, bookViewState) {
        final Widget _gridOrListButton = button(
            onPressed: () => context.read<BookViewCubit>().toggleBookView(),
            icon: bookViewState.isGridView
                ? FontAwesomeIcons.list
                : FontAwesomeIcons.borderAll);

        final Widget _searchButton = button(
            onPressed: () => context.read<BookViewCubit>().toggleIsSearch(),
            icon: FontAwesomeIcons.magnifyingGlass);

        final Widget _filterButton = button(
            onPressed: () => openFilterBottomSheet(context),
            icon: FontAwesomeIcons.filter);

        List<Widget> iconButtons = [
          _searchButton,
          _filterButton,
          _gridOrListButton
        ];

        String title = 'Library';

        return AppBar(
          title: bookViewState.isSearch
              ? TextField(
                  style: Theme.of(context).textTheme.headline6,
                  onChanged: (s) => context.read<BookViewCubit>().search(s),
                )
              : Text(title),
          actions: iconButtons,
        );
      },
    );
  }
}
