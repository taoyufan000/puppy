<template>
    <div class="index">
        <div class="container">
            <div class="swap-box">
                <div class="upper-card">
                    <input type="upper-card-input">
                    <div class="upper-card-operate">
                        BNB
                    </div>
                </div>
                <div class="middle-card">
                    <div class="mid">
                        <div class="swap-icon"></div>
                        <div class="swap-btn">兑换</div>
                    </div>
                </div>
                <div class="lower-card">
                    <input type="lower-card-input">
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
@import '../assets/scss/base.scss';
@import '../assets/scss/mixin.scss';

.container {
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
        }

        .middle-card {
            background-color: $colorJ;
            border-radius: 16px;
            height: 60px;
            
            .mid {
                display: flex;
                border-radius: 16px;
                background-color: $colorA;
                position:relative;
                margin:  auto;
                justify-content: center;
                height: 50%;
                width: 50%;
                
                
                .swap-icon {
                    @include bgImg(20px, 20px, "../assets/icon-down.png", 20px);
                }
                .swap-btn {
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
        }
    }
}
</style>
