import { ethers } from "hardhat";

async function main() {
    const contract = await ethers.getContractFactory('NftrsContract');
    const contractDeploy = await contract.deploy();
    await contractDeploy.deployed();
    console.log("Contract deployed to:", contractDeploy.address);

    var txn = await contractDeploy.mintHouseProperty();
    txn.wait;

    var txn = await contractDeploy.mintHouseProperty();
    txn.wait;
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
