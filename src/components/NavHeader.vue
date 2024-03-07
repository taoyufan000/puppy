<template>
    <div class="header">
        <div class="nav-header">
            <div class="container">
                <div class="title">
                    PUPPY SWAP
                </div>
                <div class="user">
                    <a href="javascript:;">登陆</a>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
    export default{
        name:'nav-header',
        data(){
            return{
                // username:'jack',
                // username:this.$store.state.username,
            }
        },
        computed:{
            
        },
        mounted(){
            
        },
        methods:{
        
        }
    }
</script>

<style lang = "scss">
@import '../assets/scss/config.scss';
@import '../assets/scss/base.scss';
@import '../assets/scss/mixin.scss';
    .header{
        .nav-header{
            height: 80px;
            line-height: 80px;
            background-color: $colorG;
            color: $colorI;
            .container{
                @include flex();
                border-radius: 16px;
                background-color: $colorA;
                .title{
                    margin-left: 17px;
                }
                /* display: flex;
                justify-content: space-between;
                align-items: center; */
                a{
                    display: inline-block;
                    color:  $colorI;
                    margin-right: 17px;
                }
                
            }
        }
        
    }
</style>