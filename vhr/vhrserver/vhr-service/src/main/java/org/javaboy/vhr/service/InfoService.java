package org.javaboy.vhr.service;

import org.javaboy.vhr.mapper.InfoMapper;
import org.javaboy.vhr.model.*;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class InfoService {

    //@Autowired
    @Resource
    InfoMapper infoMapper;


    public RespPageBean getInfoByPage(Integer page, Integer size, String keyword) {
        if (page != null && size != null) {
            page = (page - 1) * size;
        } else {
            page = (page == null) ? 1 : page;
            size = (size == null) ? 5 : size;
        }
        List<Info> list = infoMapper.selectByPage(page, size, keyword);
        Long total = infoMapper.getTotal(keyword);
        RespPageBean pageBean = new RespPageBean();
        pageBean.setData(list);
        pageBean.setTotal(total);
        return pageBean;
    }

    public RespBean insertDoc(Info doc, Authentication authentication) {
        if (doc == null) {
            return RespBean.error("添加失败：请选择要上传的文档");
        }
        Hr hr = (Hr) authentication.getPrincipal();
        doc.setHrId(hr.getId());

        try {
            Integer affectRows = infoMapper.insertOne(doc);
            if (affectRows == 1) return RespBean.ok("添加成功！");
            else return RespBean.error("添加失败！");
        } catch (Exception e) {
            return RespBean.error("添加失败：" + e.getMessage() + "！");
        }
    }

    public RespBean deleteDoc(Integer id) {
        if (id == null) {
            return RespBean.error("删除失败！");
        }
        try {
            Integer affectRows = infoMapper.deleteById(id);
            if (affectRows == 1) return RespBean.ok("删除成功！");
            else return RespBean.error("删除失败！");
        } catch (Exception e) {
            return RespBean.error("删除失败：" + e.getMessage() + "！");
        }
    }

    public RespBean updateDoc(Info doc) {
        if (doc == null || doc.getId() == null) return RespBean.error("更新失败！");
        try {
            if (infoMapper.updateOne(doc) == 1) {
                return RespBean.ok("更新成功！");
            } else {
                return RespBean.error("更新失败！");
            }
        } catch (Exception e) {
            return RespBean.ok("更新失败：" + e.getMessage() + "！");
        }
    }


}
