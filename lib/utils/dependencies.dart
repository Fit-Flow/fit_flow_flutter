import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fit_flow_flutter/view_models/authentication_viewmodel.dart';
import 'package:fit_flow_flutter/view_models/drawer_navigation_viewmodel.dart';
import 'package:fit_flow_flutter/view_models/goal_viewmodel.dart';
import 'package:fit_flow_flutter/view_models/graph_viewmodel.dart';
import 'package:fit_flow_flutter/view_models/lates_trainings_viewmodel.dart';
import 'package:fit_flow_flutter/view_models/training_viewmodel.dart';
import 'package:get/get.dart';

/// Initializes Firebase and sets up authentication and view models.
///
///authors: Jackie
Future<void> init() async {
  // Firebase initialization
  await Firebase.initializeApp();

  // Initialize view models
  Get.lazyPut(() => DrawerNavigationViewModel());
  Get.lazyPut(() => TrainingViewModel());
  Get.lazyPut(() => LatestTrainingViewModel());
  Get.lazyPut(() => AuthenticationViewModel());
  Get.lazyPut(() => GoalViewModel());
  Get.lazyPut(() => GraphViewModel());

  // Configure Firebase authentication
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
      Get.offNamed('/');
      Get.find<GraphViewModel>().removeData();
    } else {
      print('User is signed in!');
      //Get.offNamed('/dashboard');
    }
  });
}
