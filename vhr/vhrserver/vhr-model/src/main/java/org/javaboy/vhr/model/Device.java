package org.javaboy.vhr.model;

import java.io.Serializable;

public class Device implements Serializable {
    private String id;
    private String name;
    private String workID;
    private String store;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getWorkID() {
        return this.workID;
    }

    public void setWorkID(String workID) {
        this.workID = workID;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return this.name;
    }

    public void setStore(String store) {
        this.store = store;
    }

    public String getStore() {
        return this.store;
    }
}
