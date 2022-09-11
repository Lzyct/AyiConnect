import 'package:ayiconnect_test/core/core.dart';
import 'package:ayiconnect_test/data/datasources/datasources.dart';
import 'package:ayiconnect_test/presentation/presentation.dart';
import 'package:ayiconnect_test/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'register_step1.dart';
part 'register_step2.dart';
part 'register_step3.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _onStepCancel();
        return _currentStep == 0;
      },
      child: Parent(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(backgroundColor: Palette.primary, elevation: 0),
        ),
        child: _buildStepper(context),
      ),
    );
  }

  StepperCustom _buildStepper(BuildContext context) {
    log.d("Test ${MediaQuery.of(context).viewPadding.top}");
    return StepperCustom(
      type: StepperCustomType.horizontal,
      currentStep: _currentStep,
      margin: EdgeInsets.zero,
      onStepContinue: _onStepContinue,
      onStepCancel: _onStepCancel,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).viewPadding.top > 20 ? 0 : Dimens.space8,
        bottom: Dimens.space16,
      ),
      controlsBuilder: (context, details) {
        return const SizedBox();
      },
      steps: _getSteps(),
    );
  }

  void _onStepContinue() {
    setState(() {
      if (_currentStep <= _getSteps().length - 1) {
        _currentStep++;
      }
    });
  }

  void _onStepCancel() {
    setState(() {
      if (_currentStep > 0) {
        _currentStep--;
      }
    });
  }

  List<StepCustom> _getSteps() {
    return [
      StepCustom(
        title: Text(
          Strings.of(context)!.step1Title,
          style: Theme.of(context).textTheme.caption?.copyWith(
                color: Palette.white.withOpacity(_currentStep >= 0 ? 1 : 0.7),
                fontWeight:
                    _currentStep >= 0 ? FontWeight.w600 : FontWeight.normal,
              ),
          textAlign: TextAlign.center,
        ),
        content: RegisterStep1(onNext: _onStepContinue),
        isActive: _currentStep >= 0,
        state: _currentStep > 0
            ? StepStateCustom.complete
            : StepStateCustom.indexed,
      ),
      StepCustom(
        title: Text(
          Strings.of(context)!.step2Title,
          style: Theme.of(context).textTheme.caption?.copyWith(
                color: Palette.white.withOpacity(_currentStep >= 1 ? 1 : 0.7),
                fontWeight:
                    _currentStep >= 1 ? FontWeight.w600 : FontWeight.normal,
              ),
          textAlign: TextAlign.center,
        ),
        content: RegisterStep2(onNext: _onStepContinue),
        isActive: _currentStep >= 1,
        state: _currentStep > 1
            ? StepStateCustom.complete
            : StepStateCustom.indexed,
      ),
      StepCustom(
        title: Text(
          Strings.of(context)!.step3Title,
          style: Theme.of(context).textTheme.caption?.copyWith(
                color: Palette.white.withOpacity(_currentStep >= 2 ? 1 : 0.7),
                fontWeight:
                    _currentStep >= 2 ? FontWeight.w600 : FontWeight.normal,
              ),
          textAlign: TextAlign.center,
        ),
        content: RegisterStep3(onNext: _onStepContinue),
        isActive: _currentStep >= 2,
        state: _currentStep > 2
            ? StepStateCustom.complete
            : StepStateCustom.indexed,
      ),
    ];
  }
}
