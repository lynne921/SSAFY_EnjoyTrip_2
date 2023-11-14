import { createRouter, createWebHistory } from 'vue-router'
import TheHomeView from '@/views/TheHomeView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/', // 처음 실행 시 보여줄 main
      name: 'main',
      component: TheHomeView
    },
    {
      path: '/board',
      name: 'board',
      component: () => import('@/views/TheBoardView.vue'),
      redirect: { name: 'list' },
      children: [
        {
          path: 'list', // children에서는 '/'가 자동으로 붙기 때문에
          name: 'list',
          component: () => import('@/components/board/ArticleList.vue')
        },
        {
          path: 'view/:articleNo?', // children에서는 '/'가 자동으로 붙기 때문에
          name: 'view',
          component: () => import('@/components/board/ArticleDetail.vue')
        },
        {
          path: 'modify/:articleNo?', // children에서는 '/'가 자동으로 붙기 때문에
          name: 'modify',
          component: () => import('@/components/board/ArticleModify.vue')
        },
        {
          path: 'regist', // children에서는 '/'가 자동으로 붙기 때문에
          name: 'regist',
          component: () => import('@/components/board/ArticleRegist.vue')
        }
      ]
    }
  ]
})

export default router
