package com.bjfu.jtap.exam.vo;

/**
 * @Description:
 * @Author: Tianyu Xiao
 * @CreateDate: 2021/3/30  21:32
 */
public class AnswerSaveVO {
    private Integer id; //qid
    private Integer eid;
    private Integer qid;
    private String answer;
    private Integer diff;
    private Integer type;
    private Float point;

    public Float getPoint() {
        return point;
    }

    public void setPoint(Float point) {
        this.point = point;
    }

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

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public Integer getDiff() {
        return diff;
    }

    public void setDiff(Integer diff) {
        this.diff = diff;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}
