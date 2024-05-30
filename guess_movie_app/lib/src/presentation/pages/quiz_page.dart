import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:guess_movie/service/admob_service.dart';
import 'package:guess_movie/src/features/quiz/builders/quiz_builder.dart';
import 'package:guess_movie/src/models/answer_model.dart';
import 'package:guess_movie/src/presentation/my_app_bar/widgets/my_app_bar.dart';
import 'package:provider/provider.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();

    Provider.of<AnswerModel>(context, listen: false).initializeLetters();
    _createBannerAd();
  }

  void _createBannerAd() {
    _bannerAd = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: AdmobService.bannerAdUnitId!,
      listener: AdmobService.bannerAdListener,
      request: const AdRequest(),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: myAppBar(context, quitQuiz: true),
        body: SafeArea(
          child: Consumer<AnswerModel>(
            builder: (context, answerData, child) {
              return QuizBuilder(
                questionData:
                    answerData.questionData[answerData.numberOfQuestion],
              );
            },
          ),
        ),
        bottomNavigationBar: _bannerAd == null
            ? const SizedBox()
            : SizedBox(
                height: 52,
                child: AdWidget(ad: _bannerAd!),
              ));
  }
}
