<template>
    <div class="index">
        <div class="container">
            <div class="swap-box">
                <div class="upper-card">
                    <input class="upper-card-input">
                    <div class="upper-card-operate" >
                        {{symbol}}
                    </div>
                </div>
                <div class="middle-card">
                    <div class="mid-btn" @click=getSymbol>
                        <div class="swap-icon"></div>
                        <div class="swap-word">兑换</div>
                    </div>
                </div>
                <div class="lower-card">
                    <input class="lower-card-input">
                    <div class="lower-card-operate">
                        ETH
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { ethers, Contract} from 'ethers'
export default {
    name: 'index',
    data() {
        return {
            symbol: ""
        }
    },
    mounted(){
        // this.getSymbol()
    },
    components: {
    },
    methods: {
        transfer() {

        },
        async getSymbol() {
            // The contract ABI (fragments we care about)
            let abi = [
                "function decimals() view returns (uint8)",
                "function symbol() view returns (string)",
                "function balanceOf(address a) view returns (uint)"
            ]
            let provider = new ethers.BrowserProvider(window.ethereum)
            // Create a contract; connected to a Provider, so it may
            // only access read-only methods (like view and pure)
            let contract = new Contract("0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512", abi, provider)
            // The symbol name for the token
            this.symbol = await contract.symbol()
        }
    }
}
</script>

<style lang="scss">
@import '../assets/scss/config.scss';
// @import '../assets/scss/base.scss';
@import '../assets/scss/mixin.scss';

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
