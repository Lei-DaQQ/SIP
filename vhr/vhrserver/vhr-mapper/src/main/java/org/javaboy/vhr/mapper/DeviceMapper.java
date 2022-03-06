package org.javaboy.vhr.mapper;

import org.javaboy.vhr.model.Device;

import java.util.List;

public interface DeviceMapper {
    int deleteById(String id);

    int insert(Device record);

    List<Device> selectByWorkID(String workID);

    int updateById(String id);

    List<Device> getAllDevices();
}
