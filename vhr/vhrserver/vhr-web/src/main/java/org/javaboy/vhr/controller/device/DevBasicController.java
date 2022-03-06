package org.javaboy.vhr.controller.device;


import org.javaboy.vhr.model.Device;
import org.javaboy.vhr.model.RespBean;
import org.javaboy.vhr.service.DeviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/device/data")
public class DevBasicController {
    @Autowired
    DeviceService deviceService;

    @GetMapping("/")
    public List<Device> getAllDevices() {
        return deviceService.getAllDevices();
    }

    @PostMapping("/")
    public RespBean addDevice(@RequestBody Device device) {
        if (deviceService.addDevice(device) == 1) {
            return RespBean.ok("添加成功！");
        }
        return RespBean.error("添加失败！");
    }

    @GetMapping("/{workID}/")
    public RespBean selectByWorkID(@PathVariable String workID) {
        List<Device> device;
//        System.out.println(workID);
        device = deviceService.selectByWorkID(workID);
        return RespBean.ok("ok", device);
//        return RespBean.error("添加失败！");
    }

    @DeleteMapping("/{iid}")
    public RespBean deleteDevice(@PathVariable String iid) {
        if (deviceService.deleteById(iid) == 1) {
            return RespBean.ok("删除成功！");
        }
        return RespBean.error("删除失败！");
    }
}
