/*let storagePoll = localStorage.getItem("poll");


window.onload = function () {
    if (localStorage.getItem("announce") == null) {
        localStorage.setItem("announce", JSON.stringify([]));
    }
    announce();
}


let pollContent;
if (storagePoll) {
  var poll = JSON.parse(storagePoll);
  var sdate = poll.sdate;
  var edate = poll.edate;
  var question = poll.question;
  var answers = poll.answers;
  pollContent = `
        <div class="survey-title">${question}</div>
        <div class="text-start p-3">
            <ul class="nav flex-column">
        `;
  answers.forEach(function (answer) {
    pollContent += `
              <li class="nav-item">
                  <label><input type="radio" name="poll-answer" value="${answer}" /> ${answer}</label>
              </li>
            `;
  });
  pollContent += `
            </ul>
        </div>
        <div class="text-end">
            <button class="btn btn-outline-primary btn-sm" id="btn-poll-action">투표하기</button>
            
        </div>
        `;
        // <button class="btn btn-outline-danger btn-sm" id="btn-poll-result">결과보기</button>
       
  document.querySelector("#poll-area").innerHTML = pollContent;
  // 설문조사 투표하기!!!
  document.querySelector("#btn-poll-action").addEventListener("click", function () {
      let selItem = document.querySelector("input[name=poll-answer]:checked");
      console.log(selItem);
    if (selItem) alert(selItem.value + "을 선택했습니다.");
    else alert("답변항목 하나 이상을 선택해 주세요.");
  });
} else {
  pollContent = `진행중인 투표가 없습니다.`;
  document.querySelector("#poll-area").innerHTML = pollContent;
}


function addNewChecklist() {
    let answerListDiv = document.querySelector("#poll-answer-list");
    let answerItem = `
    <div class="row mb-1 poll-answer-list-item">
      <div class="col-md-10">
        <input type="text" class="form-control" name="answer">
      </div>
      <div class="col-md-2">
        <button type="button" class="btn btn-outline-danger btn-remove" onclick="javascript:removeAnswer(this);"><i class="bi bi-x-square-fill"></i> 삭제</button>
      </div>
    </div>`;
    answerListDiv.innerHTML = answerListDiv.innerHTML += answerItem;
}

function removeAnswer(el) {
    let parentEl = el.parentNode.parentNode;
    document.querySelector("#poll-answer-list").removeChild(parentEl);
  }

function makeSurvey() {
    let sdate = document.querySelector("#start-date").value;
    let edate = document.querySelector("#end-date").value;
    sdate =  new Date('2001-05-20');
    edate =  new Date('2001-05-20');
    if (!sdate || !edate) {
        alert("설문기간 입력!!!");
        return;
    }
    let question = document.querySelector("#question").value;
    if (!question) {
        alert("설문제목 입력!!");
        return;
    }
    let answerInputs = document.querySelectorAll("input[name=answer]");


    let isValid = true;
    answerInputs.forEach(function (answerInput) {
      if (!answerInput.value) {
        alert("답변항목 입력!!!");
        isValid = false;
        return false; //break;
        // return true; // continue;
      }
    });
    if (!isValid) return;
    let answers = [];
    answerInputs.forEach(function (answerInput) {
      answers.push(answerInput.value);
    });
  
    let poll = {
      sdate,
      edate,
      question,
      answers,
    };
  
    localStorage.setItem("poll", JSON.stringify(poll));
    alert("설문조사 생성!!!");
    location.reload();
    // document.querySelector("#pollModal").modal("hide");
}

function makeAnnouncement() {
    let announceTitle = document.querySelector("#announce-title").value;
    //임시
    if (!announceTitle) {
        alert("제목 입력!!");
        return;
    }
    let annountContent = document.querySelector("#announce-content").value;
    //임시
    if (!annountContent) {
        alert("내용 입력!!");
        return;
    }
  
    let announce = {
    announceTitle,
      annountContent
    };
    lst = JSON.parse(localStorage.getItem("announce"));
    lst.push(announce);
    localStorage.setItem("announce", JSON.stringify(lst));
    alert("공지사항 등록!!");
    location.reload();
    // document.querySelector("#pollModal").modal("hide");
}

function announce() {
    let storageAnnounce = localStorage.getItem("announce");
    let announceArea = document.querySelector("#announcements");
    if (storageAnnounce == '[]') {
        announceArea.innerHTML = `등록된 공지사항이 없습니다.`;
        return;
    }
    //공지사항 글 추가
    storageAnnounce = JSON.parse(storageAnnounce);
    let mainPage = document.querySelector("body");
    for (let i = 0; i < storageAnnounce.length; i++) {
        btn = `
            <div class="announce-btn"><a 
            data-bs-toggle="modal"
            data-bs-target="#each${i}"
            >${(i+1)+'. '+storageAnnounce[i].announceTitle}<br></a></div>`
            ;
        announceArea.innerHTML += btn;
    }
    for (let i = 0; i < storageAnnounce.length; i++) {
        modal = `
        <div
        class="modal fade"
        id="each${i}"
        data-bs-backdrop="static"
        data-bs-keyboard="false"
        tabindex="-1"
        aria-labelledby="staticBackdropLabel"
        aria-hidden="true"
        >
        <div class="modal-dialog modal-lg">
        <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
        <h4 class="modal-title">
        <i class=" text-success"> ${storageAnnounce[i].announceTitle}</i>
        </h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
            <!-- Modal body -->
            <div class="modal-body">
            <div class="mb-3">
            <div>${storageAnnounce[i].annountContent}</div>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-outline-danger btn-sm" data-bs-dismiss="modal">
            Close
            </button>
            </div>
            </div>
            </div>
            </div>`;

        mainPage.innerHTML += modal;
    }
        
}
        */
        