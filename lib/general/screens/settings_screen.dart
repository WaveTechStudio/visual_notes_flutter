import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:visual_notes/core/components/appbar_with_icon_component.dart';
import 'package:visual_notes/core/localization/app_localization.dart';
import 'package:visual_notes/core/screens/popup_page.dart';
import 'package:visual_notes/core/services/navigation_service.dart';
import 'package:visual_notes/core/styles/app_colors.dart';
import 'package:visual_notes/core/styles/app_images.dart';
import 'package:visual_notes/core/styles/sizes.dart';
import 'package:visual_notes/core/utils/routes.dart';
import 'package:visual_notes/core/widgets/custom_text.dart';
import 'package:visual_notes/general/components/settings_section_component.dart';
import 'package:visual_notes/general/components/settings_tile_component.dart';
import 'package:visual_notes/general/model/language_model.dart';
import 'package:visual_notes/general/viewmodel/settings_viewmodel.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final settingsVM = ref.watch(settingsViewModel);

    return PopUpPage(
      appBarWithBack: true,
      appbarItems: [
        AppBarWithIconComponent(
          icon: AppImages.settingsScreenIcon,
          title: tr('settings'),
        ),
      ],
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Sizes.screenVPaddingDefault,
            horizontal: Sizes.screenHPaddingDefault,
          ),
          child: Column(
            children: <Widget>[
              SettingsSectionComponent(
                headerIcon: Icons.settings,
                headerTitle: tr('appSettings'),
                tileList: [
                  SettingsTileComponent(
                    customTitle: Row(
                      children: <Widget>[
                        Icon(
                          settingsVM.isLightThemeMode
                              ? Icons.wb_sunny
                              : Icons.nights_stay,
                          size: Sizes.iconsSizes['s6'],
                          color: context.textTheme.headline4!.color,
                        ),
                        SizedBox(
                          width: Sizes.hMarginSmallest,
                        ),
                        CustomText.h5(
                          context,
                          tr('theme'),
                          color: context.textTheme.headline4!.color,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    customTrailing: SizedBox(
                      width: Sizes.switchThemeButtonWidth,
                      child: Switch.adaptive(
                        value: settingsVM.isLightThemeMode,
                        onChanged: (value) {
                          settingsVM.changeTheme(
                            isLight: value,
                          );
                        },
                        activeColor: AppColors.white,
                        activeTrackColor: AppColors.lightOrange,
                      ),
                    ),
                  ),
                  SettingsTileComponent(
                    customTitle: Row(
                      children: <Widget>[
                        Icon(
                          Icons.translate,
                          size: Sizes.iconsSizes['s6'],
                          color: context.textTheme.headline4!.color,
                        ),
                        SizedBox(
                          width: Sizes.hMarginSmallest,
                        ),
                        CustomText.h5(
                          context,
                          tr('language'),
                          color: context.textTheme.headline4!.color,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    trailing: tr(languagesList
                        .firstWhere((element) =>
                            element.code == settingsVM.selectedLanguageCode)
                        .name),
                    onTap: () {
                      NavigationService.navigateTo(
                        navigationMethod: NavigationMethod.push,
                        isNamed: true,
                        page: RoutePaths.settingsLanguage,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
