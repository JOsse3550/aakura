// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.j1987.aakura.domain;

import com.j1987.aakura.domain.JRole;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Version;

privileged aspect JRole_Roo_Jpa_Entity {
    
    declare @type: JRole: @Entity;
    
    declare @type: JRole: @Table(name = "J_ROLE");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long JRole.id;
    
    @Version
    @Column(name = "version")
    private Integer JRole.version;
    
    public Long JRole.getId() {
        return this.id;
    }
    
    public void JRole.setId(Long id) {
        this.id = id;
    }
    
    public Integer JRole.getVersion() {
        return this.version;
    }
    
    public void JRole.setVersion(Integer version) {
        this.version = version;
    }
    
}
