<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

Body Mass Index ( BMI ) Flutter Package .

## Features

Calculate BMI based on the height and weight that you provided .

## Getting started

This will add a line like this to your package's pubspec.yaml ( run an implicit dart pub get ) :

```dart
dependencies:
  bmi:
    git:
      url: https://github.com/arminmehraeen/Bmi.git
```

```dart
import 'package:bmi/bmi.dart';
```

## Usage

```dart
BmiModel bmi = BMI(weight: 70, height: 180).data ;
bmi.value   ;
bmi.weight  ;
bmi.height  ;
bmi.status  ;
bmi.message ;
```

## Additional information
Support this package by star it :heart_on_fire:

