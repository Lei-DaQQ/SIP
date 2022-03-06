package org.javaboy.vhr.mapper;

import org.javaboy.vhr.model.Info;

import java.util.List;

public interface InfoMapper {
    Integer insertOne(Info doc);

    List<Info> selectByPage(Integer page, Integer size, String keyword);

    Long getTotal(String keyword);

    Integer deleteById(Integer id);

    Integer updateOne(Info doc);
}
