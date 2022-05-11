import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_drive/application/menu/menu_cubit.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const items = [
      BottomNavigationBarItem(
          label: "Library", icon: Icon(FontAwesomeIcons.bookOpen)),
      BottomNavigationBarItem(
          label: "Quotes", icon: Icon(FontAwesomeIcons.noteSticky)),
      BottomNavigationBarItem(
          label: "Settings", icon: Icon(FontAwesomeIcons.gear))
    ];
    return BlocBuilder<MenuCubit, MenuState>(
      builder: (context, state) {
        MenuCubit cubit = context.read<MenuCubit>();

        return BottomNavigationBar(
          currentIndex: cubit.stateToInt(),
          items: items,
          key: const Key('bottomNavigationBar'),
          onTap: (int index) {
            cubit.intToState(index);
          },
        );
      },
    );
  }
}
