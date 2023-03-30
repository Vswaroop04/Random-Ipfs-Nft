const { network } = require('hardhat')
const { developmentChains } = require('../helper.hardhat.config')

module.exports = async ({ getNamedAccounts, deployments }) => {
  const { deploy, log } = deployments
  const { deployer } = await getNamedAccounts()

  log('Deploying BasicNft...')

  const BasicNft = await deploy('BasicNFT', {
    from: deployer,
    args: [],
    log: true,
    waitConfirmations: network.config.blockConfirmations || 1,
  })

  if (
    !developmentChains.includes(network.name) &&
    process.env.ETHERSCAN_API_KEY
  ) {
    await run('verify:verify', {
      address: BasicNft.address,
      args: [],
    })
  }
}
