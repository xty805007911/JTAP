package com.bjfu.jtap.entity;

public class Question {
    private Integer id;

    private Integer type;

    private String answer;

    private Integer diff;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Integer getDiff() {
        return diff;
    }

    public void setDiff(Integer diff) {
        this.diff = diff;
    }
}