package com.bjfu.jtap.exam.vo;

/**
 * @Description:
 * @Author: Tianyu Xiao
 * @CreateDate: 2021/5/11  20:17
 */
public class ExamUserVO {
    private Integer userId;
    private String userName;
    private Integer examId;
    private Float point;
    private String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Integer getExamId() {
        return examId;
    }

    public void setExamId(Integer examId) {
        this.examId = examId;
    }

    public Float getPoint() {
        return point;
    }

    public void setPoint(Float point) {
        this.point = point;
    }
}
