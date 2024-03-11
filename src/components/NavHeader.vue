<template>
    <div class="header">
        <div class="nav-header">
            <div class="container">
                <div class="title">
                    PUPPY SWAP
                </div>
                <div class="user">
                    <!-- <a href="javascript:;"  @click=connect>连接钱包</a> -->
                    <a href="javascript:;" v-if="!addr" @click=connect>连接钱包</a>
                    <span class="addr" v-if="addr">{{ addr }}</span>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import { ethers } from 'ethers'
export default {
    name: 'nav-header',
    data() {
        return {
            // username:'jack',
            // username:this.$store.state.username,
            addr:""
        }
    },
    computed: {

    },
    mounted() {
        this.connect() 
    },
    methods: {
        async connect() {
            let signer = null;
            let provider;
            try {
                if (window.ethereum == null) {
                    console.log("MetaMask not installed; using read-only defaults")
                    provider = ethers.getDefaultProvider()
                } else {
                    provider = new ethers.BrowserProvider(window.ethereum)
                    signer = await provider.getSigner();
                    await signer.getAddress();
                    this.addr = await signer.getAddress();
                    console.log(this.addr);
                }
            }catch(err){
                console.log("未连接钱包！")
                // alert("未连接钱包！")
            }
            
        }
    }
}
</script>

<style lang="scss">
@import '../assets/scss/config.scss';
@import '../assets/scss/base.scss';
@import '../assets/scss/mixin.scss';

.header {
    .nav-header {
        height: 80px;
        line-height: 80px;
        background-color: $colorG;
        color: $colorI;

        .container {
            @include flex();
            border-radius: 16px;
            background-color: $colorA;

            .title {
                margin-left: 17px;
            }

            /* display: flex;
                justify-content: space-between;
                align-items: center; */
            a {
                display: inline-block;
                color: $colorI;
                margin-right: 17px;
            }
        }
    }
}
</style>