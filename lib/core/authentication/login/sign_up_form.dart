import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:university_chat_app/constants/constants.dart';
import 'package:university_chat_app/constants/enums.dart';
import 'package:university_chat_app/provider/providers.dart';
import 'package:university_chat_app/widgets/responsive.dart';
import 'package:university_chat_app/widgets/signin_widgets.dart';

class UserData {
  String firstName = '';
  String middleName = '';
  String lastName = '';
  String email = '';
  String password = '';
  Gender gender = Gender.unknown;
  Occupation occupation = Occupation.student;

  @override
  String toString() {
    return 'UserData(firstName: $firstName, middleName: $middleName, lastName: $lastName, email: $email, password: $password, gender: $gender, occupation: $occupation)';
  }
}

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _userData = UserData();

  bool _isLoading = false;
  bool _isPasswordVisible = false;
  int _stepperIndex = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool _isDesktop = Responsive.isDesktop(context);
    Size querySize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: _isDesktop ? querySize.width * 0.2 : querySize.width * 0.05,
      ),
      child: Column(
        children: [
          const SizedBox(height: 25),
          const Text(
            'Sign Up',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          // const SizedBox(height: 10),
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                StepperBuilder(
                  formKey: _formKey,
                  steps: [
                    step1(),
                    step2(),
                  ],
                  stepperIndex: _stepperIndex,
                  updateStepperIndex: (newIndex) {
                    setState(() {
                      _stepperIndex = newIndex;
                    });
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      gradient: const LinearGradient(
                        colors: [Colors.lightBlueAccent, Colors.blueAccent],
                      ),
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color?>(
                          Colors.transparent,
                        ),
                      ),
                      onPressed: _isLoading
                          ? null
                          : () {
                              if (_userData.gender == Gender.unknown) {
                                CustomFlushbar.show(
                                  context: context,
                                  message: 'Please specify your gender',
                                );
                                return;
                              }
                              if (_formKey.currentState?.validate() == true) {
                                setState(() => _isLoading = true);
                                print(_userData);
                                ref
                                    .watch(authUserNotifierProvider.notifier)
                                    .createUserWithEmailAndPassword(
                                      context: context,
                                      email: _userData.email,
                                      displayName: _userData.firstName,
                                      password: _userData.password,
                                    )
                                    .then((_) {
                                  setState(() => _isLoading = false);
                                });
                              }
                            },
                      child: Text(_isLoading ? 'Signing Up...' : 'Sign Up'),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Step step1() {
    return Step(
      title: const Text('Step 1'),
      isActive: _stepperIndex >= 0,
      // state: _index >= 1
      //     ? StepState.complete
      //     : StepState.disabled,
      content: Column(
        children: [
          const SizedBox(height: 5),
          TextForm(
            labelText: 'First name',
            onChanged: (value) => _userData.firstName = value,
            keyboardType: TextInputType.name,
            autofillHints: const [AutofillHints.givenName],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your first name';
              }
            },
          ),
          const SizedBox(height: 10),
          TextForm(
            labelText: 'Middle name',
            onChanged: (value) => _userData.middleName = value,
            keyboardType: TextInputType.name,
            autofillHints: const [AutofillHints.middleName],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your middle name';
              }
            },
          ),
          const SizedBox(height: 10),
          TextForm(
            labelText: 'Last name',
            onChanged: (value) => _userData.lastName = value,
            keyboardType: TextInputType.name,
            autofillHints: const [AutofillHints.familyName],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your last name';
              }
            },
          ),
          const SizedBox(height: 10),
          TextForm(
            labelText: 'Email',
            onChanged: (value) => _userData.email = value,
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your email address';
              }
              if (!EmailValidator.validate(value)) {
                return 'Invalid email address';
              }
            },
          ),
          const SizedBox(height: 10),
          TextForm(
            labelText: 'Password',
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() => _isPasswordVisible = !_isPasswordVisible);
              },
            ),
            onChanged: (value) => _userData.password = value,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters long';
              }
            },
            keyboardType: TextInputType.visiblePassword,
            obscureText: !_isPasswordVisible,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Step step2() {
    return Step(
      title: const Text('Step 2'),
      isActive: _stepperIndex == 1,
      content: Column(
        children: <Widget>[
          const HeaderText(labelText: 'Gender'),
          RadioButton<Gender>(
            title: Gender.male.displayTitle,
            value: Gender.male,
            groupValue: _userData.gender,
            onTap: (value) => setState(() => _userData.gender = value),
            onChanged: (value) =>
                setState(() => _userData.gender = value ?? Gender.unknown),
          ),
          RadioButton<Gender>(
            title: Gender.female.displayTitle,
            value: Gender.female,
            groupValue: _userData.gender,
            onTap: (value) => setState(() => _userData.gender = value),
            onChanged: (value) =>
                setState(() => _userData.gender = value ?? Gender.unknown),
          ),
          const Divider(),
          const HeaderText(labelText: 'Occupation'),
          const SizedBox(width: 10),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 25),
            child: DropdownButton(
              value: _userData.occupation,
              // style: const TextStyle(fontSize: 18),
              onChanged: (Occupation? newValue) {
                setState(
                  () => _userData.occupation = newValue!,
                );
              },
              items: Occupation.values
                  .map(
                    (value) => DropdownMenuItem(
                      value: value,
                      child: Text(
                        value.displayTitle,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}

class StepperBuilder extends StatelessWidget {
  const StepperBuilder({
    Key? key,
    required this.steps,
    required this.stepperIndex,
    required this.updateStepperIndex,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final List<Step> steps;
  final int stepperIndex;
  final ValueChanged<int> updateStepperIndex;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      physics: const ClampingScrollPhysics(),
      type: StepperType.vertical,
      currentStep: stepperIndex,
      onStepCancel: () {
        if (stepperIndex > 0) {
          updateStepperIndex(stepperIndex - 1);
        }
      },
      onStepContinue: () {
        if (stepperIndex <= 0) {
          updateStepperIndex(stepperIndex + 1);
        }
      },
      onStepTapped: (int index) {
        updateStepperIndex(index);
      },
      steps: <Step>[...steps],
      controlsBuilder: (
        BuildContext context, {
        // ControlsDetails details,
        void Function()? onStepCancel,
        void Function()? onStepContinue,
      }) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton(
              onPressed: stepperIndex <= 0 ? null : onStepCancel,
              child: const Text('BACK'),
            ),
            OutlinedButton(
              onPressed: stepperIndex >= 1
                  ? null
                  : () {
                      if (formKey.currentState!.validate()) {
                        onStepContinue?.call();
                      }
                    },
              child: const Text('NEXT'),
            ),
          ],
        );
      },
    );
  }
}
