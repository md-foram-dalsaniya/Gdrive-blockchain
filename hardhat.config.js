require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.9",
  networks: {
    hardhat: {
      chainId: 1337,
      // chainId: 31337,
      
    },
  },
  paths: {
    artifacts: "./my-react-app/src/artifacts",
    // scripts: "./scripts",
  },
};