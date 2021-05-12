package com.bjfu.jtap.exam.vo;

import com.bjfu.jtap.entity.ExamQuestionUser;

import java.util.List;

/**
 * @Description:
 * @Author: Tianyu Xiao
 * @CreateDate: 2021/5/9  9:49
 */
public class ExamQuestionVO {
    private ExamQuestionUser examQuestionUser;
    private Integer id;

    private Integer eid;

    private Integer qid;

    private String description;

    private Integer type;

    private String answer;

    private String detail;

    private Integer diff;

    private Float point;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getEid() {
        return eid;
    }

    public void setEid(Integer eid) {
        this.eid = eid;
    }

    public Integer getQid() {
        return qid;
    }

    public void setQid(Integer qid) {
        this.qid = qid;
    }

    public String getDescription() {
        return description;
    }

    public ExamQuestionUser getExamQuestionUser() {
        return examQuestionUser;
    }

    public void setExamQuestionUser(ExamQuestionUser examQuestionUser) {
        this.examQuestionUser = examQuestionUser;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer == null ? null : answer.trim();
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail == null ? null : detail.trim();
    }

    public Integer getDiff() {
        return diff;
    }

    public void setDiff(Integer diff) {
        this.diff = diff;
    }

    public Float getPoint() {
        return point;
    }

    public void setPoint(Float point) {
        this.point = point;
    }
}
