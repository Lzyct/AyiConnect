import 'package:ayiconnect_test/core/core.dart';
import 'package:ayiconnect_test/data/datasources/datasources.dart';
import 'package:ayiconnect_test/di/di.dart';
import 'package:ayiconnect_test/presentation/presentation.dart';
import 'package:ayiconnect_test/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final int _maxTopSafeArea = 40;
  bool _isLastPageComplete = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentStep == 0) {
          return true;
        } else {
          _onStepCancel();
        }

        return false;
      },
      child: Parent(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(
            backgroundColor: Palette.primary,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Colors.transparent,
            ),
          ),
        ),
        child: _buildStepper(context),
      ),
    );
  }

  StepperCustom _buildStepper(BuildContext context) {
    return StepperCustom(
      type: StepperCustomType.horizontal,
      currentStep: _currentStep,
      margin: EdgeInsets.zero,
      onStepContinue: _onStepContinue,
      onStepCancel: _onStepCancel,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).viewPadding.top > _maxTopSafeArea
            ? 0
            : Dimens.space8,
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
      if (_currentStep < _getSteps().length - 1) {
        _currentStep++;
      } else {
        _isLastPageComplete = true;
      }
    });
  }

  void _onStepCancel() {
    setState(() {
      if (_currentStep > 0) {
        _currentStep--;
        _isLastPageComplete = false;
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
        content: BlocProvider(
          create: (_) => sl<RegisterCubit>()..currentLocation(),
          child: RegisterStep2(onNext: _onStepContinue),
        ),
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
        state: (_currentStep > 2 || _isLastPageComplete)
            ? StepStateCustom.complete
            : StepStateCustom.indexed,
      ),
    ];
  }
}
