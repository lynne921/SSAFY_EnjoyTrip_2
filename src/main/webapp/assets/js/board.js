let boardBox = "";
displayData();

function displayData() {

  var datas = JSON.parse(localStorage.getItem("datas"));
  if (datas) {
      
    for (let i = datas.length - 1; i >= 0; i--) {
      const data = datas[i];
      boardBox  += `<div class="sm-box">
                <div class="num">글번호 : ${i+1}</div>
                <div class="writer">글쓴이 : ${data.userId}</div>
                <div class="titleData">제목 : ${data.title}</div><hr>
                <div class="contentData">${data.content}</div>
                </div>
              `;
    }
  }
  document.querySelector("#board-container").innerHTML = boardBox;
}



let datas = [];

function check_login() {
  if (!localStorage.getItem('userId')) {
    alert("로그인 후 이용해주세요");
  } else {
    const myModal = new bootstrap.Modal(document.getElementById('myModal'));
    myModal.show();
  }
}

// 등록 버튼 클릭 시 실행되는 함수
function writeData() {

  const title = document.getElementById('b-title').value;
  const content = document.getElementById('b-content').value;
  const userId = localStorage.getItem('userId');

  if (title && content) {

    const data = {
      userId: userId,
      title: title,
      content: content,
    };

    var datas = JSON.parse(localStorage.getItem("datas"));

    if (!datas) {
      datas = []; 
    }

    datas.push(data);
    localStorage.setItem('datas', JSON.stringify(datas));

    document.getElementById('b-title').value = '';
    document.getElementById('b-content').value = '';

    alert('게시글이 등록되었습니다 !');
    location.reload();
  } else {
    alert('제목과 내용을 모두 입력하세요.');
  }

}