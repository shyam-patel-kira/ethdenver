// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PredictionMarket {
    struct Prediction {
        address predictor;
        string symbolPair;
        uint256 timestamp;
        bool predictedGreen;
        bool verified;
    }

    mapping(uint256 => Prediction) public predictions;
    uint256 public predictionCount;

    event PredictionMade(uint256 predictionId, address predictor, string symbolPair, bool predictedGreen);

    function makePrediction(string memory symbolPair, bool predictedGreen) public {
        predictions[predictionCount] = Prediction(msg.sender, symbolPair, block.timestamp, predictedGreen, false);
        emit PredictionMade(predictionCount, msg.sender, symbolPair, predictedGreen);
        predictionCount++;
    }

    // function verifyPrediction(uint256 predictionId, bytes memory proof) public {
    // bool isValid = verifyProof(proof);
    // // bool isValid = true;

    // require(predictionId < predictionCount, "Invalid prediction ID");
    // require(isValid, "Invalid proof");

    // predictions[predictionId].verified = true;
    // }
}
