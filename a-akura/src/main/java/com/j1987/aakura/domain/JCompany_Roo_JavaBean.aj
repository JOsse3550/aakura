// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.j1987.aakura.domain;

import com.j1987.aakura.domain.JActivity;
import com.j1987.aakura.domain.JCompany;
import com.j1987.aakura.domain.JUser;
import java.util.List;
import java.util.Set;

privileged aspect JCompany_Roo_JavaBean {
    
    public String JCompany.getName() {
        return this.name;
    }
    
    public void JCompany.setName(String name) {
        this.name = name;
    }
    
    public String JCompany.getDescription() {
        return this.description;
    }
    
    public void JCompany.setDescription(String description) {
        this.description = description;
    }
    
    public Set<JActivity> JCompany.getActivities() {
        return this.activities;
    }
    
    public void JCompany.setActivities(Set<JActivity> activities) {
        this.activities = activities;
    }
    
    public List<JUser> JCompany.getUsers() {
        return this.users;
    }
    
    public void JCompany.setUsers(List<JUser> users) {
        this.users = users;
    }
    
}
