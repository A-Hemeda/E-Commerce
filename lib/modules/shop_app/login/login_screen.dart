import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../shared/componants/componant.dart';
import '../register/register_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';


class ShopLogingScreen extends StatelessWidget {

  var formKey = GlobalKey <FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => ShopLoginCubit(),
      child:
      BlocConsumer<ShopLoginCubit , shopLoginStates>(
        listener: (context , state){
          if(state is ShopLoginSuccessState){
            if(state.loginModel.status == true){
              Fluttertoast.showToast(
                  msg: "${state.loginModel.message}",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }else{
              Fluttertoast.showToast(
                  msg: "${state.loginModel.message}",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }
          }
        },
        builder: (context , state){
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'LOGIN',
                            style: Theme.of(context).textTheme.headline3
                        ),
                        Text(
                            'Login now to browse our hot offers',
                            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                color: Colors.grey
                            )
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        defaultTextFormField(
                          controller: emailController,
                          type: TextInputType.text,
                          validate: (value){
                            if(value!.isEmpty) {
                              return 'email must not be empty';
                            }
                          },
                          label: 'Email',
                          prefix: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        defaultTextFormField(
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            isPassword: ShopLoginCubit.get(context).isPassword,
                            validate: (value){
                              if(value!.isEmpty) {
                                return 'password must not be empty';
                              }
                            },
                            label: 'Password',
                            prefix: Icons.lock_outline,
                            onSubmit: (value){
                              if(formKey.currentState!.validate()) {
                                ShopLoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text
                                );
                              }
                            },
                            suffix: ShopLoginCubit.get(context).suffix,
                          suffixPressed: (){
                              ShopLoginCubit.get(context).changeSuffixIcon();
                          }

                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopLoginLoadingState,
                          builder: (context) => defualtBottun(
                              function: (){
                                if(formKey.currentState!.validate()) {
                                  ShopLoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text
                                  );
                                }
                              },
                              text: 'LOGIN',
                              background: Colors.blue
                          ),
                          fallback: (context) => Center(child: CircularProgressIndicator()),

                        ),
                        SizedBox(
                          height: 15,
                        ),
                        defualtBottun(
                            function: (){
                              navigateTo(context, registerScreen());
                            },
                            text: 'Register',
                            background: Colors.blue
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                'I don\'t have an account'
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            TextButton(
                              onPressed: (){},
                              child:Text(
                                'create account',
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      )
    );
  }
}
