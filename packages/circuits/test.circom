pragma circom 2.1.6;

template Main() {
    signal input openPrice;
    signal input closePrice;
    signal input predictedGreen; // 1 for green, 0 for red
    signal output predictionCorrect;

    component checkPrediction = IsGreenOrRed();
    checkPrediction.openPrice <== openPrice;
    checkPrediction.closePrice <== closePrice;
    checkPrediction.predictedGreen <== predictedGreen;

    predictionCorrect <== checkPrediction.predictionCorrect;
}

template IsGreenOrRed() {
    signal input openPrice;
    signal input closePrice;
    signal input predictedGreen;
    signal output predictionCorrect;

    predictionCorrect <-- (closePrice > openPrice && predictedGreen == 1) || (closePrice < openPrice && predictedGreen == 0);
}

component main  = Main();
