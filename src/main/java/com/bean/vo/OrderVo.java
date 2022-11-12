package com.bean.vo;

import com.bean.entity.Provider;

import java.util.Date;

public class OrderVo {

    private Long id;
    private String code;
    private String productName;
    private String providerId;
    private Double number;
    private Double amount;
    private Integer status;
    private Date createTime;
    private String unit;

    private String paid;
    private Provider provider;

    @Override
    public String toString() {
        return "OrderVo{" +
                "id=" + id +
                ", code='" + code + '\'' +
                ", productName='" + productName + '\'' +
                ", providerId='" + providerId + '\'' +
                ", number=" + number +
                ", amount=" + amount +
                ", status=" + status +
                ", createTime=" + createTime +
                ", unit='" + unit + '\'' +
                ", paid='" + paid + '\'' +
                ", provider=" + provider +
                '}';
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }


    public Double getNumber() {
        return number;
    }

    public void setNumber(Double number) {
        this.number = number;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
        setPaid();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getPaid() {
        return paid;
    }

    public void setPaid() {
        switch (status) {
            case 1:
                paid = "已付款";
                break;
            case 2:
                paid = "未付款";
                break;
        }
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public Provider getProvider() {
        return provider;
    }

    public void setProvider(Provider provider) {
        this.provider = provider;
    }

    public String getProviderId() {
        return providerId;
    }

    public void setProviderId(String providerId) {
        this.providerId = providerId;
    }

    public void setPaid(String paid) {
        this.paid = paid;
    }
}
