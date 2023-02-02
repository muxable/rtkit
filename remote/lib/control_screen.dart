import 'package:flutter/material.dart';
import 'package:remote/adapter/channels_adapter.dart';

const darkColor = Color.fromARGB(255, 38, 38, 38);
const yellow = Color.fromARGB(255, 223, 251, 38);
const red = Color.fromARGB(255, 255, 107, 107);
const purple = Color.fromARGB(255, 145, 133, 247);

class ControlScreen extends StatelessWidget {
  final String channelId;
  const ControlScreen({super.key, required this.channelId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: SafeArea(
          child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder<ChannelStatus>(
                stream:
                    ChannelsAdapter.instance.retrieveChannelStatus(channelId),
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
                            child: Text('OBS has not reported its status'));
                      }

                      return GridView.count(
                        crossAxisCount: 2,
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
                            icon: Icons.fiber_manual_record_outlined,
                            onTap: () {},
                          ),
                          _ControlBox(
                            title: channelStatus.obsStreaming == 'stopped'
                                ? 'Start Streaming'
                                : 'Stop Streaming',
                            boxColor: channelStatus.obsStreaming == 'stopped'
                                ? yellow
                                : red,
                            icon: Icons.emergency_recording_rounded,
                            onTap: () {},
                          ),
                          _ControlBox(
                            title: channelStatus.obsReplayBuffer == 'stopped'
                                ? 'Start Replay Buffer'
                                : 'Stop Replay Buffer',
                            boxColor: channelStatus.obsReplayBuffer == 'stopped'
                                ? yellow
                                : red,
                            icon: Icons.fast_rewind,
                            onTap: () {},
                          ),
                          _ControlBox(
                            title: 'Save Replay',
                            boxColor: yellow.withOpacity(
                                channelStatus.obsReplayBuffer == 'started'
                                    ? 1
                                    : 0.4),
                            icon: Icons.save_alt,
                            onTap: () {
                              // TODO One can only save a replay buffed when its started
                              if (channelStatus.obsReplayBuffer == 'started') {}
                            },
                          ),
                          _ControlBox(
                            title: 'Scene',
                            subtitle: channelStatus.obsScene.name,
                            boxColor: purple,
                            icon: Icons.screenshot_monitor,
                            onTap: () {},
                          ),
                          _ControlBox(
                            title: 'Transition',
                            subtitle: channelStatus.obsTransition,
                            boxColor: purple,
                            icon: Icons.copy_all_outlined,
                            onTap: () {},
                          ),
                          _ControlBox(
                            title: 'Main Screen',
                            boxColor: Colors.transparent,
                            withBorder: true,
                            accentColor: Colors.white,
                            icon: Icons.home_outlined,
                            onTap: () {},
                          ),
                          _ControlBox(
                            title: 'Settings',
                            boxColor: Colors.transparent,
                            withBorder: true,
                            accentColor: Colors.white,
                            icon: Icons.settings,
                            onTap: () {},
                          )
                        ],
                      );
                  }
                }),
          ),
        ],
      )),
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
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            decoration: BoxDecoration(
                color: boxColor,
                borderRadius: BorderRadius.circular(16),
                border: withBorder != null && withBorder == true
                    ? Border.all(color: accentColor!, width: 1)
                    : null),
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
                      Text(subtitle!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: accentColor)),
                    Text(title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: accentColor)),
                    // Expanded(child: child),
                  ],
                ))));
  }
}
