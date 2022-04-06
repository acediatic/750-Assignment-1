# Stronger

Stronger is a simple Flutter app demonstrating the core functionality of the framework, especially with regard to its differences to [React](https://reactjs.org/).

## Running the App

To compile and run the app locally, you need to have installed Flutter and Dart on your local machine, following the steps provided in the [Flutter official docs](https://docs.flutter.dev/get-started/install).

Once you've successfully installed Flutter, you have the choice of running and debugging the app using any of Flutter's supported platforms. This guide will assume you're using [Microsoft's Visual Studio Code](https://code.visualstudio.com/) as your IDE, and have an Android phone.

To run the application:

1. Open the repository in VS Code, then navigate to the [`lib/main.dart`](./lib/main.dart).
2. Plug your Android device into your computer, and configure it for [developer mode](https://docs.flutter.dev/get-started/install/windows#set-up-your-android-device)
3. Open the command palette using `ctrl-shift-p` or `view>command palette`, then type `Flutter: select device` and choose the corresponding option. This will show a drop-down of the available devices.
4. Select your Android device from the dropdown list
5. Use `ctrl-F5` or `Run>Run without debugging` to run the application. After compiling and loading, you should see the Stronger app launched on your Android device.

Note that if you don't have an Android device, other devices may be selected in step 3. above, such as the Chrome web browser. However, be aware that the example application was built with mobile in mind, and hence is not optimised and may not look or perform as expected on other platforms.

The [Flutter docs](https://docs.flutter.dev/get-started/test-drive?tab=vscode) are again helpful if you get stuck.

## Introduction to Flutter

As per the [Flutter website](https://flutter.dev):

> Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.

Flutter allows you to simultaneously develop for:

1. iOS
2. Android
3. Windows
4. MacOS
5. Linux
6. Web

all using one shared code base. Unlike React, Flutter applications are written in the [Dart](https://dart.dev/) programming language, instead of [JavaScript](https://www.javascript.com/). Dart's syntax looks similar to JavaScipt and Java. Unlike vanilla Javascript however, Dart is **type-safe**.

Aaron Oertel [recreated their Java application in Dart](https://proandroiddev.com/why-flutter-will-change-mobile-development-for-the-best-c249f71fa63c?gi=1e32232228cf), reducing _179 files and 12,176 lines of code_ to only _31 files and 1,735 lines of code_.

## Flutter Basic Architecture

A Flutter application is built by nesting a series of _widgets_ together in the _widget tree_.

A _Widget_ is simply a unit of composition. That is, a widget is the basic building block of any Flutter application, similar to a React component.

### State Management

State in Flutter is primarily managed using one of three methods:

1. Stateless Widgets
2. Statefull Widgets
3. Providers

**Stateless Widgets**

Stateless widgets act in a similar manner to React components. They are used to display an element of the UI, be it a visible element, or a non-visible layout (such as the common Row, Column, or Grid widgets). They hold no state and are reset with each rerender.

**Stateful Widgets**

Stateful widgets hold their state between widgets, with the state matching the lifecycle of the particular widget. For example, the basic flutter app contains a counter widget, with buttons to increment and decrement the counter. The value of the counter is stored in state.

**Providers**

When wanting to share state between multiple widgets, we can pass information between widgets (similar to [prop drilling](https://blogs.perficient.com/2021/12/03/understanding-react-context-and-property-prop-drilling/) in React) using their constructors. However, this quickly becomes complex and cumbersome for anything more than trivial applications.

To solve this, the Provider package allows the passing of information using the producer-consumer model. Here, widgets can subscribe to a certain type of object (usually a datamodel object, like a shopping cart), which they can access from their parent. They typically watch for changes of this object, and rerender whenever they're notified that the object has changed.

**React Equivalences Summary**

The equivalences between Flutter and React state management methods are summarised below:
| Flutter State Management Method | React State Management Method |
|---------------------------------|--------------------------------------|
| Stateless Widgets | React Components |
| Stateful Widgets | React Components with useState hooks |
| Providers | ContextProvider |

Select a cross-platform development framework of your choice, and prepare a demo which explains the toolchain involved - including how to test your app on real mobile devices. Also include in your demo some examples and explanation of the differences between web development using React, and mobile development using your chosen framework.

**UI Components**
Flutter doesn’t use native UI components. When the Flutter code is compiled on iOS for example, it is not compiled into the underlying iOS button type. Instead, this is all handled by Flutter's graphic engine, in a similar manner to Java's JVM.

# The _Stronger_ App

The "Stronger" app is configured as a (very) basic workout logger. At the higher level, the app consists of workouts, which in turn consists of exercises. The app allows you to create and view workouts, as well as count your repetitions of a particular exercise. This information is persisted in voltaile memory (involatile memory was out of scope).

## Structure

The Dart code can be found under the [`lib` directory](./lib/), equivalent to `src` in other frameworks. In this directory, there are three subdirectories: [`components`](./lib/components/), [`model`](./lib/model/), and [`pages`](./lib/pages), along with the [`main.dart`](./lib/main.dart) file.

`main.dart` is the entry point for our Flutter application (and indeed any Dart code). The `main` function runs our code, creating a `StrongerApp()` instance, which is our top level widget (the widget at the top of the widget tree).

**Navigation**: In a similiar manner to React, there are named routes that allow us to transition between different pages in our application. The slugs and correspondings pages are listed in the `main.dart` file, inside the `StrongerApp` widget, under the `routes` properties. Here we see the initial route, set at `/`, displays the `home` widget.

## Data Model

The model directory contains three models (and files):

1. **[Exercise](./lib/model/exercise.dart):** An exercise represents an exercise within a workout, such as push ups or pull ups. Along with basic information about the exercise such as its name and description, it has a _target_ number of repetitions (the number of repetitions the user _aims_ to complete), and a _completed_ number of reptetions (the number of repetitions the user has _actually completed_).

2. **[Workout](./lib/model/workout.dart):** A workout represents a user's workout. It is a collection of exercises in a specific order. Along with the basic information such as title and description, a workout has an ordered list of repetitions and a target number of rounds to complete (how many times all exercises will be attempted).

3. **[Workout List](./lib/model/workouts_list.dart):** A workout list represents the collection of the user's workouts. It stores all the workouts the user has, and would likely be replaced with a remote database such as Firebase in a full application.

## Pages

[Pages](./lib/pages/) are simply widgets like any other, but they are structured so as to be the top level widget of a partciular page view. They begin with a standard skeleton which adds the basic, standard layout for the application, including the app bar. They then contain a custom widget composition to produce the desired page.

### [HomePage](./lib/pages/home.dart)

The home page allows the user to view their top saved workouts, navigate to a list of all their workouts, access a freedom mode allowing them to perform exercise by exercise, or to add an entirely new workout.

### [List Workouts Page](./lib/pages/list_workouts.dart)

The list workouts page lists all the user's saved workouts. They can click any workout to be taken to it's page.

### [Workout Page](./lib/pages/workout_page.dart)

The workout page represents a particular exercise. It shows details about that workout, as well as the list of exercises for that workout. Clicking any one of these exercises starts an exercise session.

### [Exercise Page](./lib/pages/exercise_page.dart)

The exercise page displays an exercise. It has an adjustable counter, allowing the user to keep track of the number of repetitions they've completed. Navigating back to the workout screen, then back again to the exercise demonstrates that the count is still preservered - this is persisted in (volatile) memory.

### [Create Workout Page](./lib/pages/create_workout_page.dart)

The Create Workout page allow the user to add a new workout. In the current implementation, they are able to edit its title and desired number of round repetitions. Continuing, the user is taken to the Add Exercise page where they can add exercises to this workout.

### [Add Exercise Page](./lib/pages/add_exercise_page.dart)

The Add Exercise page allows the user to add exercises to their newly created workout. They can do this by pushing the floating action button in the bottom right corner. This produces a dialogue into which they can describe the exercise's name and target number of repetitions. Adding the exercise adds it to the list.

### [Freedom Mode](./lib/pages/freedom_mode_page.dart)

Freedom mode allows the user to pick their exercises as they go, creating a workout on the fly. It has not yet been implemented.

## Unique UI Features

### Hero Transitions

Hero transitions are used to create a sense of continuity between screens. It takes an icon/image/hero element, and animates it transitioning between two screens. It is most notably used in the transition from the home screen to the `MyWorkouts` screen, and again from the `MyWorkouts` screen through to the `Workout` page.

### Preserved User Input

### Reorderable Exercises

### Slide to Delete Exercises

### Preserved Exercise Reps

### Saving a Workout

## Toolchain

### Examples

## Additional Flutter Resources

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
