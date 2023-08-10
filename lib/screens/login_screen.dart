import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_docs_clone/colors.dart';
import 'package:google_docs_clone/screens/home_screen.dart';
import 'package:google_docs_clone/repository/auth_repository.dart';
import 'package:routemaster/routemaster.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  void signinwithgoogle(WidgetRef ref,BuildContext context)async {
    final sMessenger = ScaffoldMessenger.of(context);
    final navigator = Routemaster.of(context);
   final errorModel = await ref.read(authRepositoryProvider).signInWithGoogle();

    if(errorModel.error == null){
      ref.read(userProvider.notifier).update((state) => errorModel.data);
      navigator.push('/');


    }else{
      sMessenger.showSnackBar(SnackBar(content:  Text(errorModel.error!)));

    }


  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
            child: ElevatedButton.icon(
          onPressed: () => signinwithgoogle(ref,context),
          icon: Image.asset(
            'assets/images/g-logo-2.png',
            width: 20,
            height: 20,
          ),
          label: const Text(
            'Sign in with Google',
            style: TextStyle(color: kBlackColor),
          ),
          style: ElevatedButton.styleFrom(backgroundColor: kWhiteColor, minimumSize: const Size(150, 50)),
        )),
    );
  }
}
