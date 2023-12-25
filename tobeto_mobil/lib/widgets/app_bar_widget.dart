import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
    this.title,
    this.leading,
    this.actions,
  }) : super(key: key);

  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  final Size  preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actionsIconTheme: Theme.of(context).iconTheme,
      iconTheme: Theme.of(context).iconTheme,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      title: title,
      leading: leading,
      actions: [
        if (actions != null)
          ...actions!,

        Builder(builder: (context) {
          return IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(Icons.menu),
          );
        }),
      ],
    );
  }
}
