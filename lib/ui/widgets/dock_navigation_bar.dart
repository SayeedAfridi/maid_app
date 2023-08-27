import 'package:flutter/material.dart';

class DockNavigationBar extends StatelessWidget {
  const DockNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      margin: const EdgeInsets.symmetric(horizontal: 100),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(2, 2),
            blurRadius: 12,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BarItem(
            icon: Icons.cyclone,
            isActive: currentIndex == 0,
            onTap: () {
              onTap(0);
            },
          ),
          BarItem(
            icon: Icons.list,
            isActive: currentIndex == 1,
            onTap: () {
              onTap(1);
            },
          ),
        ],
      ),
    );
  }
}

class BarItem extends StatelessWidget {
  const BarItem({
    super.key,
    required this.icon,
    this.isActive = false,
    this.onTap,
  });

  final IconData icon;
  final bool isActive;
  final void Function()? onTap;

  final Color activeColor = Colors.blueAccent;

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).splashColor;
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        focusColor: color,
        highlightColor: color,
        splashColor: color,
        hoverColor: color,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Icon(
            icon,
            color: isActive ? activeColor : null,
          ),
        ),
      ),
    );
  }
}
