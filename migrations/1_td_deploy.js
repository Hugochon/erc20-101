const ExerciceSolution = artifacts.require("ExerciceSolution");

const EvaluatorAddress = "0x7C5629d850eCD1E640b1572bC0d4ac5210b38FA5";

module.exports = function (deployer, network, accounts) {
	deployer.deploy(ExerciceSolution);
};