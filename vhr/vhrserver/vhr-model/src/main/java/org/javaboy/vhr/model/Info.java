package org.javaboy.vhr.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.time.LocalDateTime;

public class Info implements Serializable {
    /*主键ID*/
    Integer id;
    /*文件名*/
    String fName;
    /*文件描述*/
    String desp;
    /*服务端文件标识*/
    String link;
    /*上传者ID*/
    Integer hrId;
    /*上传者*/
    String hrName;
    /*是否被删除*/
    Boolean isDeleted;


    public Info(Integer id, String fName, String desp,
                    String link, Integer hrId, String hrName,
                    Boolean isDeleted) {
        this.id = id;
        this.fName = fName;
        this.desp = desp;
        this.link = link;
        this.hrId = hrId;
        this.hrName = hrName;
        this.isDeleted = isDeleted;
    }

    public Info() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public String getDesp() {
        return desp;
    }

    public void setDesp(String desp) {
        this.desp = desp;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public Integer getHrId() {
        return hrId;
    }

    public void setHrId(Integer hrId) {
        this.hrId = hrId;
    }

    public String getHrName() {
        return hrName;
    }

    @Override
    public String toString() {
        return "StudyDoc{" +
                "id=" + id +
                ", fName='" + fName + '\'' +
                ", desp='" + desp + '\'' +
                ", link='" + link + '\'' +
                ", hrId=" + hrId +
                ", hrName='" + hrName + '\'' +
                ", isDeleted=" + isDeleted +
                '}';
    }

    public void setHrName(String hrName) {
        this.hrName = hrName;
    }

    public Boolean getDeleted() {
        return isDeleted;
    }

    public void setDeleted(Boolean deleted) {
        isDeleted = deleted;
    }
}
