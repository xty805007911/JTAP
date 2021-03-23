package com.bjfu.jtap.entity;

import java.util.Date;

public class ExamUser {
    private Integer id;

    private Integer userId;

    private Integer examId;

    private Date createTime;

    private Date entTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getExamId() {
        return examId;
    }

    public void setExamId(Integer examId) {
        this.examId = examId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getEntTime() {
        return entTime;
    }

    public void setEntTime(Date entTime) {
        this.entTime = entTime;
    }
}