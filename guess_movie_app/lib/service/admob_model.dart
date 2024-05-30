import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:guess_movie/service/admob_service.dart';
import 'package:guess_movie/src/models/puzzle_model.dart';
import 'package:provider/provider.dart';

class AdMobModel extends ChangeNotifier {
  RewardedAd? _rewardedAd;
  RewardedAd? get rewardedAd => _rewardedAd;
  bool _isAdLoaded = false;
  bool get isAdLoaded => _isAdLoaded;
  final int _rewardedPuzzles = 10;

  void createRewardedAd() {
    RewardedAd.load(
      adUnitId: AdmobService.rewardedAdUnitId!,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          _rewardedAd = ad;
          _isAdLoaded = true;
          notifyListeners();
          debugPrint('Loaded RewardedAd');
        },
        onAdFailedToLoad: (LoadAdError error) {
          _rewardedAd = null;
          _isAdLoaded = false;
          notifyListeners();
          debugPrint('RewardedAd failed to load: $error');
        },
      ),
    );
  }

  void showRewardedAd(BuildContext context) {
    if (_rewardedAd != null) {
      _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (ad) =>
            debugPrint('Ad showed fullscreen content'),
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          createRewardedAd();
          debugPrint('Ad dismissed fullscreen content');
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          createRewardedAd();
          debugPrint('Ad failed to show fullscreen content: $error');
        },
      );
      _rewardedAd!.show(
        onUserEarnedReward: (ad, reward) {
          debugPrint('User earned reward: $reward');
          final puzzleModel = context.read<PuzzleModel>();
          puzzleModel.incrementPuzzleCount(_rewardedPuzzles);
        },
      );
      _rewardedAd = null;
      _isAdLoaded = true;
    }
  }
}
