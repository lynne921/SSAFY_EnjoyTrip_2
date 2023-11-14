<script setup>
import { ref, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { registArticle, detailArticle, modifyArticle } from '@/api/board'

const router = useRouter()
const route = useRoute()

const props = defineProps({ type: String })

const isUseId = ref(false)

const article = ref({
  articleNo: 0,
  userId: '',
  subject: '',
  content: '',
  hit: 0,
  registerTime: ''
})

if (props.type === 'modify') {
  let { articleNo } = route.params
  console.log(articleNo + '번글 얻어와서 수정할거야')
  detailArticle(
    articleNo,
    ({ data }) => {
      article.value = data
      isUseId.value = true
      console.log(article.value)
    },
    (error) => {
      console.log(error)
    }
  )
  isUseId.value = true
}

const subjectErrMsg = ref('')
const contentErrMsg = ref('')
watch(
  () => article.value.subject,
  (value) => {
    let len = value.length
    if (len == 0 || len > 30) {
      subjectErrMsg.value = '제목을 확인해 주세요!!!'
    } else subjectErrMsg.value = ''
  },
  { immediate: true }
)
watch(
  () => article.value.content,
  (value) => {
    let len = value.length
    if (len == 0 || len > 500) {
      contentErrMsg.value = '내용을 확인해 주세요!!!'
    } else contentErrMsg.value = ''
  },
  { immediate: true }
)

function onSubmit() {
  // event.preventDefault();

  if (subjectErrMsg.value) {
    alert(subjectErrMsg.value)
  } else if (contentErrMsg.value) {
    alert(contentErrMsg.value)
  } else {
    props.type === 'regist' ? writeArticle() : updateArticle()
  }
}

function writeArticle() {
  console.log('글등록하자!!', article.value)
  registArticle(
    article.value,
    (response) => {
      let msg = '글등록 처리시 문제 발생했습니다.'
      if (response.status == 200) msg = '글등록이 완료되었습니다.'
      alert(msg)
      moveList()
    },
    (error) => console.log(error)
  )
}

function updateArticle() {
  console.log(article.value.articleNo + '번글 수정하자!!', article.value)
  modifyArticle(
    article.value,
    (response) => {
      let msg = '글수정 처리시 문제 발생했습니다.'
      if (response.status == 200) msg = '글정보 수정이 완료되었습니다.'
      alert(msg)
      moveList()
    },
    (error) => console.log(error)
  )
}

function moveList() {
  router.push({ name: 'list' })
}
</script>

<template>
  <form @submit.prevent="onSubmit">
    <div class="mb-3">
      <label for="userid" class="form-label">작성자 ID : </label>
      <input
        type="text"
        class="form-control"
        v-model="article.userId"
        :disabled="isUseId"
        placeholder="작성자ID..."
      />
    </div>
    <div class="mb-3">
      <label for="subject" class="form-label">제목 : </label>
      <input type="text" class="form-control" v-model="article.subject" placeholder="제목..." />
    </div>
    <div class="mb-3">
      <label for="content" class="form-label">내용 : </label>
      <textarea class="form-control" v-model="article.content" rows="10"></textarea>
    </div>
    <div class="col-auto text-center">
      <button type="submit" class="btn btn-outline-primary mb-3" v-if="type === 'regist'">
        글작성
      </button>
      <button type="submit" class="btn btn-outline-success mb-3" v-else>글수정</button>
      <button type="button" class="btn btn-outline-danger mb-3 ms-1" @click="moveList">
        목록으로이동...
      </button>
    </div>
  </form>
</template>

<style scoped></style>
