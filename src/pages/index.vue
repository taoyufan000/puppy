<template>
    <div class="index">
        <div class="container">
            <div class="swap-box">
                <div class="upper-card">
                    <input class="upper-card-input">
                    <div class="upper-card-operate">
                        BNB
                    </div>
                </div>
                <div class="middle-card">
                    <div class="mid-btn">
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
export default {
    name: 'index',
    components: {
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
            .upper-card-input{
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
                position:relative;
                justify-content: center;
                height: 30px;
                width: 250px;
                cursor: pointer;
                .swap-icon {
                    padding-top: 5px;
                    @include bgImg(20px, 20px, "../assets/icon-down.png", 20px);
                }
                .swap-word {
                    padding-top: 3px;
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
            .lower-card-input{
                width: 400px;   
                height: 40px;
            }
        }
    }
// }
</style>
