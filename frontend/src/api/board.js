import { localAxios } from '@/utils/http-commons'

const local = localAxios()

function listArticle(params, success, fail) {
  local.get('/board').then(success).catch(fail)
}

function detailArticle(articleNo, success, fail) {
  local.get(`/board/${articleNo}`).then(success).catch(fail)
}

function registArticle(article, success, fail) {
  local.post(`/board/insertReview`, JSON.stringify(article)).then(success).catch(fail)
}

function modifyArticle(article, success, fail) {
  local.put(`/board`, JSON.stringify(article)).then(success).catch(fail)
}

function deleteArticle(articleNo, success, fail) {
  local.delete(`/board/${articleNo}`).then(success).catch(fail)
}

export { listArticle, detailArticle, registArticle, modifyArticle, deleteArticle }
