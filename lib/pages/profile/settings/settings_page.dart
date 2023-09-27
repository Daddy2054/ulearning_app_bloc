import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/routes/names.dart';
import '../../../common/values/constant.dart';
import '../../../common/widgets/base_text_widget.dart';

import '../../../global.dart';
import '../../application/bloc/app_bloc.dart';
import '../../home/bloc/home_page_bloc.dart';
import '../../home/bloc/home_page_event.dart';
import 'bloc/settings_bloc.dart';
import 'widgets/settings_widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeUserData() {
    context.read<AppBloc>().add(const TriggerAppEvent(0));
    context.read<HomePageBloc>().add(const HomePageDots(0));
    Global.storageService.remove(
      AppConstants.STORAGE_USER_TOKEN_KEY,
    );
    Global.storageService.remove(
      AppConstants.STORAGE_USER_PROFILE_KEY,
    );
    Navigator.of(context).pushNamedAndRemoveUntil(
      AppRoutes.SING_IN,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Settings'),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return Column(
              children: [
                settingsButton(context, removeUserData),
              ],
            );
          },
        ),
      ),
    );
  }
}
