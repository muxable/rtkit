import 'package:flutter/material.dart';
import 'package:rtkit/adapter/channels_adapter.dart';
import 'package:rtkit/control_api.dart';
import 'package:rtkit/home.dart';
import 'package:rtkit/settings.dart';

const darkColor = Color.fromARGB(255, 38, 38, 38);
const yellow = Color.fromARGB(255, 223, 251, 38);
const red = Color.fromARGB(255, 255, 107, 107);
const purple = Color.fromARGB(255, 145, 133, 247);

class ControlScreen extends StatelessWidget {
  final String channelId;
  const ControlScreen({super.key, required this.channelId});

  Future<void> _dialogBuilder(BuildContext context, String title,
      List<String> options, Function(String, String) onTileTap) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: options.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    options[index],
                  ),
                  onTap: () {
                    onTileTap(channelId, options[index]);
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<ChannelStatus>(
            stream: ChannelsAdapter.instance.retrieveChannelStatus(channelId),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                case ConnectionState.none:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.active:
                case ConnectionState.done:
                  final channelStatus = snapshot.data;
                  if (channelStatus == null) {
                    return const Center(
                      child: Text('OBS has not reported its status'),
                    );
                  }

                  return LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        child: GridView.count(
                          crossAxisCount: constraints.maxWidth < 600 ? 2 : 4,
                          shrinkWrap: true,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            _ControlBox(
                              title: channelStatus.obsRecording == 'stopped'
                                  ? 'Start Recording'
                                  : 'Stop Recording',
                              boxColor: channelStatus.obsRecording == 'stopped'
                                  ? yellow
                                  : red,
                              icon: Icons.camera,
                              onTap: () =>
                                  channelStatus.obsRecording == 'stopped'
                                      ? startRecording(channelId)
                                      : stopRecording(channelId),
                            ),
                            _ControlBox(
                              title: channelStatus.obsStreaming == 'stopped'
                                  ? 'Start Streaming'
                                  : 'Stop Streaming',
                              boxColor: channelStatus.obsStreaming == 'stopped'
                                  ? yellow
                                  : red,
                              icon: Icons.live_tv,
                              onTap: () =>
                                  channelStatus.obsStreaming == 'stopped'
                                      ? startStreaming(channelId)
                                      : stopStreaming(channelId),
                            ),
                            _ControlBox(
                              title: channelStatus.obsReplayBuffer == 'stopped'
                                  ? 'Start Replay Buffer'
                                  : 'Stop Replay Buffer',
                              boxColor:
                                  channelStatus.obsReplayBuffer == 'stopped'
                                      ? yellow
                                      : red,
                              icon: Icons.replay,
                              onTap: () =>
                                  channelStatus.obsReplayBuffer == 'stopped'
                                      ? startReplayBuffer(channelId)
                                      : stopReplayBuffer(channelId),
                            ),
                            _ControlBox(
                              title: 'Save Replay',
                              boxColor: yellow.withOpacity(
                                  channelStatus.obsReplayBuffer == 'started'
                                      ? 1
                                      : 0.4),
                              icon: Icons.save_alt,
                              onTap: channelStatus.obsReplayBuffer == 'started'
                                  ? () => saveReplayBuffer(channelId)
                                  : null,
                            ),
                            _ControlBox(
                              title: 'Scene',
                              subtitle: channelStatus.obsScene.name,
                              boxColor: purple,
                              icon: Icons.switch_video,
                              onTap: () => _dialogBuilder(
                                context,
                                'Select a Scene',
                                channelStatus.obsScenes,
                                setCurrentScene,
                              ),
                            ),
                            _ControlBox(
                              title: 'Transition',
                              subtitle: channelStatus.obsTransition,
                              boxColor: purple,
                              icon: Icons.switch_access_shortcut,
                              onTap: () => _dialogBuilder(
                                context,
                                'Select a Transition',
                                channelStatus.obsTransitions,
                                setCurrentTransition,
                              ),
                            ),
                            _ControlBox(
                              title: 'Main Screen',
                              boxColor: Colors.transparent,
                              withBorder: true,
                              accentColor: Colors.white,
                              icon: Icons.home_outlined,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MainPage(),
                                  ),
                                );
                              },
                            ),
                            _ControlBox(
                              title: 'Settings',
                              boxColor: Colors.transparent,
                              withBorder: true,
                              accentColor: Colors.white,
                              icon: Icons.settings,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Settings(),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      );
                    },
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}

class _ControlBox extends StatelessWidget {
  const _ControlBox({
    Key? key,
    required this.title,
    this.subtitle,
    required this.onTap,
    this.icon,
    required this.boxColor,
    this.withBorder = false,
    this.accentColor = darkColor,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final IconData? icon;
  final Color boxColor;
  final bool? withBorder;
  final Color? accentColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.circular(16),
            border: withBorder != null && withBorder == true
                ? Border.all(color: accentColor!, width: 1)
                : null),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    icon,
                    color: accentColor,
                  )
                ],
              ),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: accentColor),
                ),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: accentColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
