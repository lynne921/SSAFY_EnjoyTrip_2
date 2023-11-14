<script setup>
import { listArticle } from '@/api/board'
import { ref, reactive } from 'vue'
import { useRouter } from 'vue-router'
import ArticleListItem from './item/ArticleListItem.vue'
import VSelect from '@/components/common/VSelect.vue'
import PageNavigation from '../common/PageNavigation.vue'

const router = useRouter()

// 목록을 표시할 articles를 반응형으로 선언
const articles = ref([])

// 서버에 보낼 조회 조건을 위한 반응형 변수 선언
const params = reactive({
  pageNo: 1,
  key: 'all',
  word: ''
})

// PageNavigation을 위한 반응형 변수
const currentPage = ref(1)
const totalPage = ref(1)

// VSelect 컴포넌트의 props
const selectOptions = ref([
  { text: '---선택하세요---', value: 'all' },
  { text: '제목', value: 'content' },
  { text: '저자', value: 'userId' }
])

function searchList() {
  console.log('ArticleList params............: ', params)
  listArticle(
    params,
    ({ data }) => {
      console.log('search......result: ', data)
      articles.value = data.boards
      currentPage.value = data.page.pageNo
      totalPage.value = data.page.total
    },
    (error) => {
      console.log(error)
    }
  )
}

console.log('ArticleList.setup......')
searchList()

const changeKey = (val) => {
  console.log('ArticleList.search........changeKey:', val)
  params.key.value = val
}

function moveHandler() {
  router.push({ name: 'regist' })
}

function onPageChange(value) {
  console.log('ArticleList.onPageChange....pageNo', value)
  params.pageNo = value
  searchList()
}
</script>

<template>
  <div class="col-6">
    <button class="btn btn-outline-primary" @click="moveHandler">등록</button>
  </div>
  <div v-if="articles.length > 0">
    <h3>등록된 글 목록</h3>
    <div class="row">
      <div class="col-6">
        <div class="input-group">
          <span class="input-group-text">검색조건</span>
          <v-select :selectOptions="selectOptions" @on-key-select="changeKey" />
          <input
            type="text"
            class="input-control"
            placeholder="검색어를 입력하세요"
            v-model="params.word"
            @keyup.enter="searchList"
          />
          <button class="btn btn-dark" @click="searchList">검색</button>
        </div>
      </div>
    </div>
    <table class="table table-hover">
      <thead>
        <colgroup>
          <col width="10%" />
          <col width="30%" />
          <col width="30%" />
          <col width="30%" />
        </colgroup>
        <tr class="text-center">
          <th>게시글 번호</th>
          <th>제목</th>
          <th>저자</th>
          <th>조회수</th>
        </tr>
      </thead>
      <tbody>
        <ArticleListItem
          v-for="article in articles"
          :key="article.articleNo"
          :article="article"
        ></ArticleListItem>
      </tbody>
    </table>
  </div>
  <div v-else>
    <h3>등록된 게시물 정보가 없습니다</h3>
  </div>
  <PageNavigation :currentPage="currentPage" :totalPage="totalPage" @page-change="onPageChange" />
</template>

<style scoped></style>
