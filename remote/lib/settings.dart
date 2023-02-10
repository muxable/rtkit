import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:rtkit/urls.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: Consumer(
          builder: (context, layoutModel, child) {
            return ListView(
              children: [
                ListTile(
                  title: const Text('RealtimeKit is open source!'),
                  subtitle: const Text("Find us on GitHub!"),
                  trailing: const Icon(Icons.terminal),
                  onTap: () =>
                      openUrl(Uri.parse("https://github.com/muxable/rtkit")),
                ),
                ListTile(
                  title: const Text('Muxable Discord'),
                  subtitle: const Text("Join the Muxable Discord!"),
                  trailing: const Icon(Icons.launch),
                  onTap: () =>
                      openUrl(Uri.parse("https://discord.gg/UKHJMQs74u")),
                ),
                ListTile(
                  title: const Text("Website"),
                  subtitle: const Text("Get a browser source for OBS"),
                  trailing: const Icon(Icons.launch),
                  onTap: () => openUrl(Uri.parse("https://kit.rtirl.com")),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                      "Thanks to all the early testers who sent bug reports!",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Column(
                    children: {"muxfd", "SputNikPlop"}.map((key) {
                  final url = "https://twitch.tv/$key";
                  return ListTile(
                    leading: const Image(
                        width: 24,
                        image: AssetImage('assets/providers/twitch.png')),
                    title: Text("/$key"),
                    trailing: const Icon(Icons.launch),
                    onTap: () => openUrl(Uri.parse(url)),
                  );
                }).toList()),
                FutureBuilder(
                    future: PackageInfo.fromPlatform(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Container();
                      }
                      final packageInfo = snapshot.data as PackageInfo;
                      final appName = packageInfo.appName;
                      final version = packageInfo.version;
                      final buildNumber = packageInfo.buildNumber;
                      return AboutListTile(
                        icon: const Icon(Icons.info),
                        applicationName: appName,
                        applicationVersion: 'Version $version ($buildNumber)',
                        applicationLegalese: '\u{a9} 2023 Muxable',
                        dense: true,
                      );
                    })
              ],
            );
          },
        ));
  }
}
