package com.ssafy.enjoytrip.map.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.enjoytrip.map.model.dao.MapDao;
import com.ssafy.enjoytrip.map.model.dto.GugunDto;
import com.ssafy.enjoytrip.map.model.dto.MapException;
import com.ssafy.enjoytrip.map.model.dto.MarkerDto;
import com.ssafy.enjoytrip.map.model.dto.SidoDto;

@Service
public class MapServiceImpl implements MapService {

	@Autowired
	private MapDao mapDao;

	public MapServiceImpl(MapDao mapDao) {
		this.mapDao = mapDao;
	}

	@Override
	public List<SidoDto> getSido() {
		try {
			List<SidoDto> sidoList = mapDao.getSido();
			if (sidoList == null) {
				throw new MapException("sidoList가 없습니다.");
			}
			return sidoList;
		} catch (SQLException e) {
			throw new MapException("전체 시도 조회 중 오류 발생");
		}
	}

	@Override
	public List<GugunDto> getGugun(int sidoCode) {
		try {
			List<GugunDto> gugunList = mapDao.getGugun(sidoCode);
			if (gugunList == null) {
				throw new MapException("gugunList가 없습니다.");
			}
			return gugunList;
		} catch (SQLException e) {
			throw new MapException("구군 조회 중 오류 발생");
		}
	}

	@Override
	public List<MarkerDto> getMarker(int contentTypeId, int sidoCode, int gugunCode) {
		try {
			List<MarkerDto> markerList = mapDao.getMarker(contentTypeId, sidoCode, gugunCode);
			if (markerList == null) {
				throw new MapException("markerList가 없습니다.");
			}
			return markerList;
		} catch (SQLException e) {
			throw new MapException("관광지 조회 중 오류 발생");
		}
	}

}
