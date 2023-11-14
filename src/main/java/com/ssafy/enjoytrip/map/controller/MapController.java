package com.ssafy.enjoytrip.map.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.enjoytrip.map.model.dto.GugunDto;
import com.ssafy.enjoytrip.map.model.dto.MarkerDto;
import com.ssafy.enjoytrip.map.model.dto.SidoDto;
import com.ssafy.enjoytrip.map.service.MapService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@Api(value = "핫플찾기 API", description = "/hotPlace API")
@CrossOrigin(origins = {"*"}) // 다른 서버에서 Ajax 요청이 와도 서비스 되도록 설정
@RestController
@RequestMapping("/hotPlace")
public class MapController {
	private Logger logger = LoggerFactory.getLogger(MapController.class);
	private MapService mapService;
	
	private static final String SUCCESS = "success";
	
	public MapController(MapService mapService) {
		this.mapService = mapService;
	}
	
	@ApiOperation(value="시도 정보 조회")
	@GetMapping("/getSido")
	public ResponseEntity<?> getSido() {
		
		List<SidoDto> sidoList = mapService.getSido();
		
		logger.debug("map.getSido...................sidoList:{}", sidoList);
		
		if (sidoList != null && !sidoList.isEmpty()) {
			return new ResponseEntity<List<SidoDto>>(sidoList, HttpStatus.OK);
		} else {
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		}
	}
	
	@ApiOperation(value="구군 정보 조회")
	@GetMapping("/getGugun")
	public ResponseEntity<?> getGugun(@RequestParam int sidoCode) {
		
		List<GugunDto> gugunList = mapService.getGugun(sidoCode);
		
		logger.debug("map.getGugun...................gugunList:{}", gugunList);

		if (gugunList != null && !gugunList.isEmpty()) {
			return new ResponseEntity<List<GugunDto>>(gugunList, HttpStatus.OK);
		} else {
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		}
	}
	
	@ApiOperation(value="마커 정보 조회")
	@GetMapping("/getMarker")
	public ResponseEntity<?> getMarker(@RequestParam int contentTypeId, @RequestParam int sidoCode, @RequestParam int gugunCode) {
		List<MarkerDto> markerList = mapService.getMarker(contentTypeId, sidoCode, gugunCode);
		
		logger.debug("map.getMarker...................markerList:{}", markerList);

		if (markerList != null && !markerList.isEmpty()) {
			return new ResponseEntity<List<MarkerDto>>(markerList, HttpStatus.OK);
		} else {
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		}
	}

	
}
