package com.bjfu.jtap.exam.vo;

/**
 * @Description:
 * @Author: Tianyu Xiao
 * @CreateDate: 2021/5/6  20:21
 */
public class ExamVO {
    private Integer examId;
    private String examName;
    private Float point;

    public Integer getExamId() {
        return examId;
    }

    public void setExamId(Integer examId) {
        this.examId = examId;
    }

    public String getExamName() {
        return examName;
    }

    public void setExamName(String examName) {
        this.examName = examName;
    }

    public Float getPoint() {
        return point;
    }

    public void setPoint(Float point) {
        this.point = point;
    }
}
