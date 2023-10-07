require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.19",
  networks: {
    mumbai: {
      url: 'https://rpc.api.moonbase.moonbeam.network',
      chainId: 80001, // (hex: 0x507)
      accounts: ["86b3db259799b6df3c8ef0996f15c56d7a8bd83d2a18bd7754160cd3cac57d3c"]
    }
  },
};
