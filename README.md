<br>

# AyiConnect Test 📱

This is App for the purpose of the test.
<br>This app also implementing **Flutter Clean Architecture with TDD.**



https://user-images.githubusercontent.com/1531684/189573510-0e1f300c-207d-47ff-8d69-d28e91d09398.mp4?width=350


## Pre-requisites 📐

| Technology | Recommended Version | Installation Guide                                                    |
|------------|---------------------|-----------------------------------------------------------------------|
| Flutter    | v3.3.1              | [Flutter Official Docs](https://flutter.dev/docs/get-started/install) |
| Dart       | v2.18.0             | Installed automatically with Flutter                                  |

## Get Started 🚀

- Clone this project
- Run `flutter run --flavor stg -t lib/main_stg.dart` for **staging** or
- Run `flutter run --flavor prd -t lib/main_prd.dart` for **production**
- Run Test `flutter test`
- To generate launcher icon based on Flavor `flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons*`

## Architecture Proposal by [Resocoder](https://github.com/ResoCoder/flutter-tdd-clean-architecture-course)

<br>

![architecture-proposal](./architecture-proposal.png)

### Project Structure

<details>

````
lib
├── config.dart
├── core
│   ├── core.dart
│   ├── core_mapper.dart
│   ├── error
│   │   ├── error.dart
│   │   ├── exceptions.dart
│   │   └── failure.dart
│   ├── localization
│   │   ├── generated
│   │   │   ├── strings.dart
│   │   │   └── strings_en.dart
│   │   ├── intl_en.arb
│   │   ├── l10n.dart
│   │   └── localization.dart
│   └── usecase
│       └── usecase.dart
├── data
│   ├── data.dart
│   ├── datasources
│   │   ├── datasources.dart
│   │   ├── local
│   │   │   ├── data_helper.dart
│   │   │   ├── local.dart
│   │   │   └── pref_manager.dart
│   │   └── remote
│   │       ├── auth_remote_datasources.dart
│   │       ├── model
│   │       │   ├── auth
│   │       │   │   └── auth.dart
│   │       │   └── model.dart
│   │       ├── remote.dart
│   │       └── services
│   │           └── services.dart
│   └── repositories
│       ├── register_repository_impl.dart
│       └── repositories.dart
├── di
│   └── di.dart
├── domain
│   ├── domain.dart
│   ├── entities
│   │   ├── entities.dart
│   │   └── register
│   │       └── location.dart
│   ├── repositories
│   │   ├── register_repository.dart
│   │   └── repositories.dart
│   └── usecases
│       ├── register
│       │   ├── current_location.dart
│       │   └── register.dart
│       └── usecases.dart
├── main_prd.dart
├── main_stg.dart
├── my_app.dart
├── presentation
│   ├── pages
│   │   ├── app_cubit.dart
│   │   ├── app_route.dart
│   │   ├── pages.dart
│   │   └── register
│   │       ├── cubit
│   │       │   ├── cubit.dart
│   │       │   ├── register_cubit.dart
│   │       │   └── register_state.dart
│   │       ├── register.dart
│   │       ├── register_page.dart
│   │       ├── register_step1.dart
│   │       ├── register_step2.dart
│   │       └── register_step3.dart
│   ├── presentation.dart
│   ├── resources
│   │   ├── dimens.dart
│   │   ├── images.dart
│   │   ├── palette.dart
│   │   ├── resources.dart
│   │   └── styles.dart
│   └── widgets
│       ├── button.dart
│       ├── button_add.dart
│       ├── button_pair.dart
│       ├── disable_focus_node.dart
│       ├── drop_down.dart
│       ├── parent.dart
│       ├── phone_number.dart
│       ├── radio_group.dart
│       ├── spacer_h.dart
│       ├── spacer_v.dart
│       ├── stepper_custom.dart
│       ├── text_f.dart
│       ├── toast.dart
│       └── widgets.dart
└── utils
    ├── ext
    │   ├── context.dart
    │   ├── ext.dart
    │   └── string.dart
    ├── helper
    │   ├── common.dart
    │   ├── constant.dart
    │   └── helper.dart
    ├── services
    │   └── services.dart
    └── utils.dart

````

</details>

### Test Project Structure

<details>

````
 
````

</details>


<br><br>

<h3 align="center">Buy me coffee if you love my works ☕️</h3>
<p align="center">
  <a href="https://www.buymeacoffee.com/Lzyct" target="_blank">
    <img src="https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-2.svg" alt="buymeacoffe" style="vertical-align:top; margin:8px" height="36">
  </a>&nbsp;&nbsp;&nbsp;&nbsp;
   <a href="https://ko-fi.com/Lzyct" target="_blank">
    <img src="https://help.ko-fi.com/system/photos/3604/0095/9793/logo_circle.png" alt="ko-fi" style="vertical-align:top; margin:8px" height="36">
  </a>&nbsp;&nbsp;&nbsp;&nbsp;
  <a href="https://paypal.me/ukieTux" target="_blank">
    <img src="https://blog.zoom.us/wp-content/uploads/2019/08/paypal.png" alt="paypal" style="vertical-align:top; margin:8px" height="36">
  </a>
  <a href="https://saweria.co/Lzyct" target="_blank">
   <img src="https://1.bp.blogspot.com/-7OuHSxaNk6A/X92QPg8L9kI/AAAAAAAAG0E/lUzKf_uuVP8jCqvXpA7juh_l-TfK2jnbwCLcBGAsYHQ/s16000/SAWERIA.webp" style="vertical-align:top; margin:8px" height="36">
  </a>
</p>
<br><br>
