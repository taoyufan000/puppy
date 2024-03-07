import {createRouter, createWebHashHistory} from "vue-router"
import Home from './pages/home'
import Index from './pages/index'

const routes = [
    {
        path:'/',
        name:'home',
        component:Home,
        redirect:'index',
        children:[
            {
                path:'index',
                name:'index',
                component:Index,  
            }
        ]
    }
];
// 3. 创建路由实例
const router = createRouter({
    // 4. 采用hash 模式
    history: createWebHashHistory(),
    // 采用 history 模式
    // history: createWebHistory(),
    routes, //使用上方定义的路由配置
  });
export default router

