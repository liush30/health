// 导入 Hardhat 环境
const hre = require("hardhat");

// scripts/deploy.js
async function main() {
  // 1. Get the contract to deploy
  const MedicalRecords = await ethers.getContractFactory('MedicalRecords');
  console.log('Deploying MedicalRecords...');

  // 2. Instantiating a new Box smart contract
  const box = await MedicalRecords.deploy();

  // 3. Waiting for the deployment to resolve
  await box.waitForDeployment();

  // 4. Use the contract instance to get the contract address
  console.log('Box deployed to:', box.target);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
     console.error(error);
     process.exit(1);
  });
