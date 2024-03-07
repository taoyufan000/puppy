const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  devServer:{
    host:'localhost',
    port:8080,
    proxy:{
      '/api':{
        target:'http://api-driver.marsview.cc/api/mall/',
        changeOrigin:true,
        pathRewrite:{
          '/api':''
        }
      }
    }
  },
  transpileDependencies: true,
  lintOnSave:false
})
