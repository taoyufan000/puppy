<template>
    <div class="home">
        <nav-header></nav-header>
        <router-view></router-view>
        <nav-footer></nav-footer>
    </div>
</template>

<script>
import NavHeader from './../components/NavHeader'
import NavFooter from './../components/NavFooter'
export default {
    name: 'nav-home',
    components: {
        NavHeader,
        NavFooter
    }
}
</script>
<style lang="scss">
@import '../assets/scss/config.scss';
@import '../assets/scss/base.scss';

.home {
    position: relative;
    width: 500px;
    margin-right: auto;
    margin-left: auto;
    padding: 10px;
    border-width: 3px;
    border-style: dashed;
    border-color: $colorA;
    border-radius: 16px;
    
}
</style>