package org.javaboy.vhr.service;

import java.util.List;

import org.javaboy.vhr.mapper.DeviceMapper;
import org.javaboy.vhr.model.Device;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class DeviceService {
    @Autowired
    DeviceMapper deviceMapper;

    public List<Device> getAllDevices() {
        return deviceMapper.getAllDevices();
    }

    public Integer addDevice(Device device) {
        return deviceMapper.insert(device);
    }

    public Integer deleteById(String iid) {
        return deviceMapper.deleteById(iid);
    }

    public List<Device> selectByWorkID(String WorkID) {
        return deviceMapper.selectByWorkID(WorkID);
    }
}
