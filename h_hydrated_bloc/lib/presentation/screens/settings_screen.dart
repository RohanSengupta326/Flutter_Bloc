import 'package:d_bloc_route_access_counterapp_anonymus_routing/logic/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocConsumer<SettingsCubit, SettingsCubitState>(
        builder: (builderContext, state) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.all(16),
                child: SwitchListTile(
                  title: Text(
                    'App Notification : ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  value: state.appNotifications,
                  onChanged: (newValue) {
                    builderContext
                        .read<SettingsCubit>()
                        .toggleAppNotification(newValue);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(16),
                child: SwitchListTile(
                  title: Text(
                    'Email Notification : ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  value: state.emailNotifications,
                  onChanged: (newValue) {
                    builderContext
                        .read<SettingsCubit>()
                        .toggleEmailNotification(newValue);
                  },
                ),
              ),
            ],
          );
        },
        listener: (listenerContext, state) {
          ScaffoldMessenger.of(listenerContext).removeCurrentSnackBar();
          ScaffoldMessenger.of(listenerContext).showSnackBar(
            SnackBar(
              content: Text(
                'AppNotification : ${state.appNotifications}, \n EmailNotification : ${state.emailNotifications} ',
              ),
            ),
          );
        },
      ),
    );
  }
}
