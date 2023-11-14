var loginUser;
var userIdx;
var currUser;
var userGroup;
var updateFlag=true;

function logout() {
  localStorage.removeItem("userId");
  location.replace("index.html");
}



window.onload = function () {
  loginUser = JSON.parse(localStorage.getItem("userId"));
  userGroup = JSON.parse(localStorage.getItem("users"));
  let flag = false;
  for (let i = 0; i < userGroup.length; i++) {
    if (userGroup[i] == null) continue;
    if (userGroup[i].userId == loginUser) {
      currUser = userGroup[i];
      userIdx = i;
      flag = true;
      break;
    }
  }
  if (!flag) {
    alert("비정상적인 접근이 감지되었습니다. 로그인 페이지로 이동합니다.")
    location.replace('login.html'); 
  }
  showInfo();
  // localStorage.setItem("users", JSON.stringify([]));
}

function showInfo() {
      document.querySelector("#currUser-userId").innerHTML = currUser.userId;
      document.querySelector("#currUser-email").setAttribute("value", currUser.email);
      document.querySelector("#currUser-name").setAttribute("value", currUser.name);
      document.querySelector("#currUser-age").setAttribute("value", currUser.age);
      return;
}

function updateUser() {
  console.log(updateFlag);
  if (updateFlag) {
    updateFlag = false;
    document.querySelector('#update-user-btn').innerHTML = `수정 확정`;
    document.getElementById("currUser-email").disabled = false;
    document.getElementById("currUser-name").disabled = false;
    document.getElementById("currUser-age").disabled = false;
    
  }
  else {
    updateFlag = true;
      const user = {
        userId: loginUser,
        password: currUser.password,
        name: document.querySelector("#currUser-name").value,
        email: document.querySelector("#currUser-email").value,
        age: document.querySelector("#currUser-age").value,
    }
    userGroup[userIdx] = user;
    console.log(user);
    localStorage.setItem("users", JSON.stringify(userGroup));
    document.querySelector('#update-user-btn').innerHTML = `회원 정보 수정`;
    document.getElementById("currUser-email").disabled = true;
    document.getElementById("currUser-name").disabled = true;
    document.getElementById("currUser-age").disabled = true;
}
}

function deleteUser() {
  // var loginUser = JSON.parse(localStorage.getItem("userId"));
  // var userGroup = JSON.parse(localStorage.getItem("users"));
  // let i = 0;
  // for (i = 0; i < userGroup.length; i++) {
  //   if (userGroup[i] == null) continue;
  //   if (userGroup[i].userId == loginUser) {

  //     // userGroup.removeItem(i);
  //     userGroup[i] = null;
  //     break;
  //   }
  // }
  // userGroup = userGroup.splice(i, 1);
  userGroup[userIdx] = null;


  console.log(userGroup)
  localStorage.removeItem("userId");
  localStorage.setItem("users", JSON.stringify(userGroup))
  let modal = `
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
        <p>삭제를 완료했습니다. 로그인창으로 돌아갑니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" onclick="location.replace('login.html')" class="btn btn-secondary" data-bs-dismiss="modal">
          확인
        </button>
      </div>
    </div>
  </div>`;
  document.querySelector("#for-delete").innerHTML = modal;
  return;
}