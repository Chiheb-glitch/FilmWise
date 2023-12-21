import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_dashboard/theme/theme_provider.dart';

import 'change_email.dart';

class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);

  @override
  State<settings> createState() => _settings();
}

class _settings extends State<settings> {
  bool _isDark = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: ListView(
            children: [
              _SingleSection(
                title: "General",
                children: [
                  _CustomListTile(
                      title: "Dark Mode",
                      icon: Icons.dark_mode_outlined,
                      trailing: Switch(
                          activeColor: Colors.blue,
                          value: _isDark,
                          onChanged: (value) {
                            Provider.of<ThemeProvider>(context, listen: false)
                                .toggleTheme();
                            setState(() {
                              _isDark = value;
                            });
                          })),
                  _CustomListTile(
                      title: "Notifications",
                      icon: Icons.notifications_none_rounded,
                      trailing: Switch(
                          activeColor: Colors.blue,
                          value: _isDark,
                          onChanged: (value) {
                            setState(() {
                              _isDark = value;
                            });
                          })),
                ],
              ),
              const Divider(),
              const _SingleSection(
                title: "Profile",
                children: [
                  Center(
                      child: _CustomListTile(
                          title: " Change Email", icon: Icons.email)),
                  _CustomListTile(title: " Change Email", icon: Icons.password),
                  _CustomListTile(title: " Bailling", icon: Icons.payment),
                ],
              ),
              const Divider(),
              const _SingleSection(
                children: [
                  _CustomListTile(
                      title: "Help & Feedback",
                      icon: Icons.help_outline_rounded),
                  _CustomListTile(
                      title: "About", icon: Icons.info_outline_rounded),
                  _CustomListTile(
                      title: "Sign out", icon: Icons.exit_to_app_rounded),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? trailing;
  const _CustomListTile(
      {Key? key, required this.title, required this.icon, this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        title: Text(title),
        leading: Icon(icon),
        trailing: trailing,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => change_email()),
          );
        },
      ),
    );
  }
}

class _SingleSection extends StatelessWidget {
  final String? title;
  final List<Widget> children;
  const _SingleSection({
    Key? key,
    this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        Column(
          children: children,
        ),
      ],
    );
  }
}
