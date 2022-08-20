import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/controller/auth_controller.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.green,
          ),
          Container(
            alignment: Alignment.center,
            height: (deviceSize.height - MediaQuery.of(context).padding.top),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  AuthCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  const AuthCard({Key? key}) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

enum AuthMode { LogIn, SignUp }

class _AuthCardState extends State<AuthCard>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  var _authMode = AuthMode.LogIn;

  Map<String, String> authData = {
    'email': '',
    'password': '',
    'userName': '',
  };
  final TextEditingController _passwordController = TextEditingController();
  late Animation<double> _opacityAnimation;

  String error = '';

  _submit() {
    setState(() {
      isLoading = true;
    });
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) {
      setState(() {
        isLoading = false;
      });
      return;
    }
    _formKey.currentState!.save();
    bool isLogIn = (_authMode == AuthMode.LogIn) ? true : false;
    Provider.of<AuthProvider>(context, listen: false).singIn(
        authData['email']!, authData['password']!, context, isLogIn, context,
        userName: authData['userName']);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    _opacityAnimation =
        Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
            parent: AnimationController(
              vsync: this,
              duration: const Duration(milliseconds: 300),
            ),
            curve: Curves.linear));
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Card(
      color: Colors.white70,
      elevation: 15,
      shadowColor: Colors.black.withOpacity(.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: deviceSize.width * .8,
        height: (deviceSize.height < 300)
            ? 300
            : (_authMode == AuthMode.SignUp)
                ? 430
                : 300,
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                (_authMode == AuthMode.SignUp)
                    ? TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          hintText: 'Muhammad Rehab',
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.yellow,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        validator: FullNameValidation.validate,
                        onSaved: (value) {
                          authData['userName'] = value!;
                        },
                      )
                    : Container(),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    hintText: 'ahmed30@gmail.com',
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 2,
                        color: Colors.yellow,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: EmailValidation.validate,
                  onSaved: (value) {
                    authData['email'] = value!;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(width: 2, color: Colors.yellow),
                    ),
                  ),
                  obscureText: true,
                  validator: PasswordValidation.validate,
                ),
                const SizedBox(
                  height: 20,
                ),
                (_authMode == AuthMode.SignUp)
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        constraints: BoxConstraints(
                          minHeight: (_authMode == AuthMode.SignUp) ? 60 : 0,
                          maxHeight: (_authMode == AuthMode.SignUp) ? 120 : 0,
                        ),
                        child: FadeTransition(
                          opacity: _opacityAnimation,
                          child: TextFormField(
                            enabled:
                                (_authMode == AuthMode.SignUp) ? true : false,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              border: (_authMode == AuthMode.SignUp)
                                  ? OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )
                                  : null,
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value != _passwordController.text) {
                                return 'Password is not match';
                              }
                            },
                          ),
                        ),
                      )
                    : Container(),
                const SizedBox(
                  height: 15,
                ),
                if (isLoading) const CircularProgressIndicator(),
                if (!isLoading)
                  MaterialButton(
                    onPressed: _submit,
                    color: Colors.yellow.shade900,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: Text(
                      _authMode == AuthMode.LogIn ? 'LOG IN' : 'SIGN UP',
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                if (!isLoading)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _authMode == AuthMode.SignUp
                            ? _authMode = AuthMode.LogIn
                            : _authMode = AuthMode.SignUp;
                      });
                    },
                    child: Text(
                      '${_authMode == AuthMode.SignUp ? 'Login In' : 'Sign Up'} Instead',
                      style: TextStyle(
                        color: Colors.red.shade900,
                        fontSize: 18,
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FullNameValidation {
  static String? validate(String? value) => (value == null || value.length < 6)
      ? 'please enter your full name '
      : null;
}

class EmailValidation {
  static String? validate(String? value) {
    if (value == null) {
      return 'please enter the email';
    } else if (!value.contains('@gmail.com')) {
      return 'Email should contain @gmail.com';
    } else {
      return null;
    }
  }
}

class PasswordValidation {
  static String? validate(String? value) {
    if (value == null) {
      return 'you must enter password';
    } else if (value.length <= 5) {
      return 'Password is too short';
    } else {
      return null;
    }
  }
}
