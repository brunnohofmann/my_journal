import 'package:flutter/material.dart';
import 'package:my_journal/components/buttons/secondary_button.dart';
import 'package:my_journal/components/mascot.dart';
import 'package:my_journal/components/typography/title.dart';
import 'package:my_journal/contants/theme.dart';
import 'package:my_journal/services/authentication.dart';

class LoginSignupPage extends StatefulWidget {
  LoginSignupPage();

  @override
  State<StatefulWidget> createState() => new _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {
  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  String _errorMessage;

  bool _isLoginForm;
  bool _isLoading;

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    _isLoginForm = true;
    super.initState();
  }

  bool validateForm() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    if (validateForm()) {
      setState(() {
        _errorMessage = "";
        _isLoading = true;
      });

      String userId = "";
      try {
        userId = await Auth.instance.signIn(_email, _password);
        setState(() {
          _isLoading = false;
        });
      } catch (e) {
        setState(() {
          _isLoading = false;
          _errorMessage = e.message;
          _formKey.currentState.reset();
        });
      }
    }
  }

  void resetForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
  }

  void toggleFormMode() {
    resetForm();
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
  }

  Widget showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return Container(
        padding: EdgeInsets.only(top: 16),
        child: Text(
          _errorMessage,
          style: TextStyle(
              fontSize: 13.0,
              color: Colors.red,
              height: 1.0,
              fontWeight: FontWeight.w300),
        ),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  Widget showLogo() {
    return new Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Mascot(),
        ),
      ),
    );
  }

  Widget showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        style: TextStyle(color: primaryDarkBlue),
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color:secondaryColor),
            ),
            hintText: 'Email',
            hintStyle: TextStyle(color: secondaryColor)),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        style: TextStyle(color: secondaryColor),
        decoration: new InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: secondaryColor),
            ),
            hintText: 'Password',
            hintStyle: TextStyle(color: secondaryColor)),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => _password = value.trim(),
      ),
    );
  }

  Widget showPrimaryButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
        child: SizedBox(
            height: 40.0,
            child: SecondaryButton(
              text: 'Login',
              onPressed: validateAndSubmit,
              isLoading: _isLoading,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: tertiaryColor,
        bottomNavigationBar: SafeArea(
            child: Container(
                padding: EdgeInsets.all(20), child: showPrimaryButton())),
        body: Stack(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(16.0),
                child: new Form(
                  key: _formKey,
                  child: new ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      showLogo(),
                      CustomTitle(
                        title: 'Hi! Glad to see you again.',
                        color: primaryDarkBlue,
                        align: TextAlign.center,
                      ),
                      CustomTitle(
                        title: 'But... who are you?',
                        color: secondaryColor,
                        align: TextAlign.center,
                        size: 14,
                      ),
                      showEmailInput(),
                      showPasswordInput(),
                      showErrorMessage(),
                    ],
                  ),
                ))
          ],
        ));
  }
}
