package com.bjfu.jtap.student.service;

import com.bjfu.jtap.entity.QuestionError;

import java.util.List;

public interface StudentQuestionErrorService {

    public List<QuestionError> getErrorNum(Integer qid);

    public void addErrorQuestionNum(Integer qid);
}
