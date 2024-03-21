<template>
  <div class="index">
    <div class="container">
      <div class="swap-box">
        <div class="upper-card">
          <input class="upper-card-input" />
          <div class="upper-card-operate">
            {{ symbol }}
          </div>
        </div>
        <div class="middle-card">
          <div class="mid-btn" @click="transfer">
            <div class="swap-icon"></div>
            <div class="swap-word">兑换</div>
          </div>
        </div>
        <div class="lower-card">
          <input class="lower-card-input" />
          <div class="lower-card-operate">ETH</div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { ethers, Contract, parseUnits } from 'ethers'
export default {
  name: 'index',
  data() {
    return {
      symbol: ""
    }
  },
  mounted() {
    this.getSymbol()
  },
  components: {
  },
  methods: {
    async transfer() {
      let abi = [
        "function transfer(address to, uint amount)"
      ]
      let provider = new ethers.BrowserProvider(window.ethereum)
      let signer = await provider.getSigner();
      // Connected to a Signer; can make state changing transactions,
      // which will cost the account ether
      let contract = new Contract("0x5FbDB2315678afecb367f032d93F642f64180aa3", abi, signer)
      // Send 1 DAI
      let amount = parseUnits("1.0", 2);
      // Send the transaction
      let tx = await contract.transfer("0x70997970C51812dc3A010C7d01b50e0d17dc79C8", amount)
      // Currently the transaction has been sent to the mempool,
      // but has not yet been included. So, we...

      // ...wait for the transaction to be included.
      await tx.wait()
    },
    async getSymbol() {
      try {
        // The contract ABI (fragments we care about)
        let abi = [
          "function decimals() view returns (uint8)",
          "function symbol() view returns (string)",
          "function balanceOf(address a) view returns (uint)"
        ]
        let provider = new ethers.BrowserProvider(window.ethereum)
        // Create a contract; connected to a Provider, so it may
        // only access read-only methods (like view and pure)
        let contract = new Contract("0x5FbDB2315678afecb367f032d93F642f64180aa3", abi, provider)
        // The symbol name for the token
        this.symbol = await contract.symbol()
      } catch (err) {
        console.log("未获取Symbol！")
      }

    }
  }
}
</script>

<style lang="scss">
@import "../assets/scss/config.scss";
// @import '../assets/scss/base.scss';
@import "../assets/scss/mixin.scss";

// .container {
.swap-box {
  .upper-card {
    @include flex();
    background-color: $colorJ;
    border-radius: 16px;
    height: 120px;
    line-height: 20px;
    padding: 16px;
    margin-top: 16px;
    margin-bottom: 16px;

    .upper-card-input {
      width: 400px;
      height: 40px;
    }
  }

  .middle-card {
    // background-color: $colorJ;
    border-radius: 16px;
    height: 50px;
    padding-top: 15px;
    padding-left: 125px;

    .mid-btn {
      display: flex;
      border-radius: 16px;
      background-color: $colorA;
      position: relative;
      justify-content: center;
      height: 30px;
      width: 250px;
      cursor: pointer;

      .swap-icon {
        padding-top: 7px;
        @include bgImg(20px, 20px, "../assets/icon-down.png", 20px);
      }

      .swap-word {
        padding-top: 5px;
        position: center;
      }
    }
  }

  .lower-card {
    @include flex();
    background-color: $colorJ;
    border-radius: 16px;
    height: 120px;
    line-height: 20px;
    padding: 16px;
    margin-top: 16px;

    .lower-card-input {
      width: 400px;
      height: 40px;
    }
  }
}

// }</style>
