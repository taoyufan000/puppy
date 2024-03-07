<template>

  <div class="hello">
    <button @click=connect>connect wallet</button>
  </div>
</template>

<script>
import { ethers } from 'ethers'
export default {

  methods: {
    async connect() {
      let signer = null;
      let provider;
      if (window.ethereum == null) {
        console.log("MetaMask not installed; using read-only defaults")
        provider = ethers.getDefaultProvider()
      } else {
        provider = new ethers.BrowserProvider(window.ethereum)
        signer = await provider.getSigner();
        await signer.getAddress();
        // const addr = await signer.getAddress();
        // console.log(addr)
      }
    }
  }
}
</script>

<style></style>
