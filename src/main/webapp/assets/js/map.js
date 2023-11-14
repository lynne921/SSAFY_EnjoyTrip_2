var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
		    center: new kakao.maps.LatLng(37.501287442743184,
            127.03961031915247
), // 지도의 중심좌표
		    level: 6 // 지도의 확대 레벨
		};
			// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);
		var markers = [];
		var markerscontent = [];
		//서울, 대구, 부산... 도시 클릭했을 때
		document.getElementById("search-area").addEventListener("click", function () {
		    let areaCode = document.getElementById("search-area").value;
		    console.log("지역 코" + areaCode);
		    if (areaCode !== '0') {
		    	fetch("./map?action=areaarea&area="+areaCode)//db에서 구군 데이터 가져와서
		   		.then(response => response.json())
		   		.then(data => makeAreaArea(data, areaCode));
		    }
		});
	
		function makeAreaArea(data, areaCode) {//구군 데이터 드롭박스로 만들기
		    let sel = document.getElementById("search-area-area");
	
		    sel.innerHTML = ''
	
		    let opt = document.createElement("option");
		    opt.setAttribute("value", 0);
		    opt.appendChild(document.createTextNode("검색 할 세부지역 선택"));
	
		    sel.appendChild(opt);
	
		    let areas = data.gugun;
		    areas.forEach(function (area, i) {
		        opt = document.createElement("option");
		        opt.setAttribute("value", area.code);
		        opt.appendChild(document.createTextNode(area.name));
	
		        sel.appendChild(opt);
		    });
		}
	
		// 지역, 세부지역, 관광지 유형, 입력 후 검색 버튼 클릭.
		document.getElementById("btn-search").addEventListener("click", function () {
		    let areaCode = document.getElementById("search-area").value;
		    let areaareaCode = document.getElementById("search-area-area").value;
		    let contentTypeId = document.getElementById("search-content-id").value;
	
		    for (var i = 0; i < markers.length; i++) {
		        markers[i].setMap(null);
		    }
		    markers = [];//마크 초기화
		    markerscontent = [];//마크 내용 초기화
		    fetch("./map?action=search&area="+areaCode+"&areaarea="+areaareaCode+"&type="+contentTypeId)//db에서 검색 조건에 맞는 데이터 가져와서
		        .then((response) => response.json())
		        .then((data) => {
		        console.log(data);
		        makeTripDot(data)
		        });
		});
	
		function makeTripDot(data) {//마크 정보 세팅하기
		    if (data !== 0) {//데이터가 존재하면
		        let trips = data.marker;
		        var moveLatLon;
		        trips.forEach(function (trip) {
					//지도 좌표
		            moveLatLon = new kakao.maps.LatLng(`${trip.latitude}`, `${trip.longitude}`);
					//태그에 넣을 이미지 크기
		            var markerimgsize = new kakao.maps.Size(32, 36),
		                imageOption = {
		                    offset: new kakao.maps.Point(13, 34)
		                };
					//마크 위치와 이미지 세팅
		            var marker = new kakao.maps.Marker({
		                position: moveLatLon,
		                image: new kakao.maps.MarkerImage(getmarkerimage(trip.contentTypeId), markerimgsize, imageOption)
		            });
		            
		            if (trip.firstimage === "") {//사진이 없을 때 대체할 사진 넣기
		                trip.firstimage = "./assets/img/noimg.png"
		            }
	
		            
		            var infowindow = new kakao.maps.InfoWindow({//태그를 건드렸을 때 생성할 창
		                position: moveLatLon,
		                content: `<div style="width:400px;">
		                        <a style="display: block; padding: 6px;background-color: deepskyblue; font-size: 20px; font-weight: bold; color: white;display: block; text-align: center;">${trip.title}</a>
		                        <div style="display: flex; justify-content: center; align-items: center;">
		                            <img src="${trip.firstImage}" style="width:200px;">
		                            <a style="margin: 20px;">${trip.addr1} ${trip.addr2}</a>
		                        </div>
		                    </div>`
		            })
		            markers.push(marker);//배열에 마크 넣기
		            markerscontent.push(infowindow);
		            setmarker(moveLatLon);//배열에 든 마크 찍기
		        });
		    }
		}
	
		//마크 이미지
		function getmarkerimage(contentTypeId) {
		    if (contentTypeId == '12') {
		        return './assets/img/marker12.png';
		    } else if (contentTypeId === '14') {
		        return './assets/img/marker14.png';
		    } else if (contentTypeId === '15') {
		        return './assets/img/marker15.png';
		    } else if (contentTypeId === '25') {
		        return './assets/img/marker25.png';
		    } else if (contentTypeId === '28') {
		        return './assets/img/marker28.png';
		    } else if (contentTypeId === '32') {
		        return './assets/img/marker32.png';
		    } else if (contentTypeId === '38') {
		        return './assets/img/marker38.png';
		    } else if (contentTypeId == '39') {
		        return './assets/img/marker39.png';
		    }
		}
	
		function setmarker(location) {
		    for (let i = 0; i < markers.length; i++) {
		        markers[i].setMap(map);
		        kakao.maps.event.addListener(markers[i], 'mouseover', makeOverListener(map, markers[i], markerscontent[i]));
		        kakao.maps.event.addListener(markers[i], 'mouseout', makeOutListener(markerscontent[i]));
		    }
		    map.setCenter(location);
		    //map.panTo(location);
		}
	
		function makeOverListener(map, marker, infowindow) {
		    return function () {
		        infowindow.open(map, marker);
		    };
		}
	
		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function () {
		        infowindow.close();
		    };
		}