// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.j1987.aakura.domain;

import com.j1987.aakura.domain.JActivityDataOnDemand;
import com.j1987.aakura.domain.JPayment;
import com.j1987.aakura.domain.JPaymentDataOnDemand;
import java.math.BigDecimal;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect JPaymentDataOnDemand_Roo_DataOnDemand {
    
    declare @type: JPaymentDataOnDemand: @Component;
    
    private Random JPaymentDataOnDemand.rnd = new SecureRandom();
    
    private List<JPayment> JPaymentDataOnDemand.data;
    
    @Autowired
    JActivityDataOnDemand JPaymentDataOnDemand.jActivityDataOnDemand;
    
    public JPayment JPaymentDataOnDemand.getNewTransientJPayment(int index) {
        JPayment obj = new JPayment();
        setAmount(obj, index);
        setCreatedBy(obj, index);
        setCreationDate(obj, index);
        setDescription(obj, index);
        setModificatedBy(obj, index);
        setModificationDate(obj, index);
        setPaymentDate(obj, index);
        setPaymentType(obj, index);
        setReference(obj, index);
        return obj;
    }
    
    public void JPaymentDataOnDemand.setAmount(JPayment obj, int index) {
        BigDecimal amount = BigDecimal.valueOf(index);
        obj.setAmount(amount);
    }
    
    public void JPaymentDataOnDemand.setCreatedBy(JPayment obj, int index) {
        String createdBy = "createdBy_" + index;
        obj.setCreatedBy(createdBy);
    }
    
    public void JPaymentDataOnDemand.setCreationDate(JPayment obj, int index) {
        Date creationDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setCreationDate(creationDate);
    }
    
    public void JPaymentDataOnDemand.setDescription(JPayment obj, int index) {
        String description = "description_" + index;
        obj.setDescription(description);
    }
    
    public void JPaymentDataOnDemand.setModificatedBy(JPayment obj, int index) {
        String modificatedBy = "modificatedBy_" + index;
        obj.setModificatedBy(modificatedBy);
    }
    
    public void JPaymentDataOnDemand.setModificationDate(JPayment obj, int index) {
        Date modificationDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setModificationDate(modificationDate);
    }
    
    public void JPaymentDataOnDemand.setPaymentDate(JPayment obj, int index) {
        Date paymentDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setPaymentDate(paymentDate);
    }
    
    public void JPaymentDataOnDemand.setPaymentType(JPayment obj, int index) {
        String paymentType = "paymentType_" + index;
        obj.setPaymentType(paymentType);
    }
    
    public void JPaymentDataOnDemand.setReference(JPayment obj, int index) {
        String reference = "reference_" + index;
        obj.setReference(reference);
    }
    
    public JPayment JPaymentDataOnDemand.getSpecificJPayment(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        JPayment obj = data.get(index);
        Long id = obj.getId();
        return JPayment.findJPayment(id);
    }
    
    public JPayment JPaymentDataOnDemand.getRandomJPayment() {
        init();
        JPayment obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return JPayment.findJPayment(id);
    }
    
    public boolean JPaymentDataOnDemand.modifyJPayment(JPayment obj) {
        return false;
    }
    
    public void JPaymentDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = JPayment.findJPaymentEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'JPayment' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<JPayment>();
        for (int i = 0; i < 10; i++) {
            JPayment obj = getNewTransientJPayment(i);
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
