// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.j1987.aakura.domain;

import com.j1987.aakura.domain.JUser;
import com.j1987.aakura.domain.JUserDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect JUserDataOnDemand_Roo_DataOnDemand {
    
    declare @type: JUserDataOnDemand: @Component;
    
    private Random JUserDataOnDemand.rnd = new SecureRandom();
    
    private List<JUser> JUserDataOnDemand.data;
    
    public JUser JUserDataOnDemand.getNewTransientJUser(int index) {
        JUser obj = new JUser();
        setEmail(obj, index);
        setFirstName(obj, index);
        setLastName(obj, index);
        setPassword(obj, index);
        setPhoneNumber(obj, index);
        setRoleName(obj, index);
        setUserName(obj, index);
        return obj;
    }
    
    public void JUserDataOnDemand.setEmail(JUser obj, int index) {
        String email = "foo" + index + "@bar.com";
        obj.setEmail(email);
    }
    
    public void JUserDataOnDemand.setFirstName(JUser obj, int index) {
        String firstName = "firstName_" + index;
        obj.setFirstName(firstName);
    }
    
    public void JUserDataOnDemand.setLastName(JUser obj, int index) {
        String lastName = "lastName_" + index;
        obj.setLastName(lastName);
    }
    
    public void JUserDataOnDemand.setPassword(JUser obj, int index) {
        String password = "password_" + index;
        obj.setPassword(password);
    }
    
    public void JUserDataOnDemand.setPhoneNumber(JUser obj, int index) {
        String phoneNumber = "phoneNumber_" + index;
        obj.setPhoneNumber(phoneNumber);
    }
    
    public void JUserDataOnDemand.setRoleName(JUser obj, int index) {
        String roleName = "roleName_" + index;
        obj.setRoleName(roleName);
    }
    
    public void JUserDataOnDemand.setUserName(JUser obj, int index) {
        String userName = "userName_" + index;
        obj.setUserName(userName);
    }
    
    public JUser JUserDataOnDemand.getSpecificJUser(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        JUser obj = data.get(index);
        Long id = obj.getId();
        return JUser.findJUser(id);
    }
    
    public JUser JUserDataOnDemand.getRandomJUser() {
        init();
        JUser obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return JUser.findJUser(id);
    }
    
    public boolean JUserDataOnDemand.modifyJUser(JUser obj) {
        return false;
    }
    
    public void JUserDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = JUser.findJUserEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'JUser' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<JUser>();
        for (int i = 0; i < 10; i++) {
            JUser obj = getNewTransientJUser(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
