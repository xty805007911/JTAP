package com.bjfu.jtap.exam.service;

import com.bjfu.jtap.entity.ExamQuestion;
import com.bjfu.jtap.entity.QuestionExample;
import com.bjfu.jtap.entity.QuestionWithBLOBs;
import com.bjfu.jtap.mapper.ExamQuestionMapper;
import com.bjfu.jtap.mapper.QuestionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

/**
 * @Description:
 * @Author: Tianyu Xiao
 * @CreateDate: 2021/3/23  21:00
 */
@Service
public class ExamQuestionService {
    @Autowired
    private QuestionMapper questionMapper;
    @Autowired
    private ExamQuestionMapper examQuestionMapper;

    // 根据难度查询
    public List<QuestionWithBLOBs> getQuestionByDiff(Integer diff) {
        QuestionExample example = new QuestionExample();
        example.createCriteria().andDiffEqualTo(diff);
        List<QuestionWithBLOBs> questionWithBLOBs = questionMapper.selectByExampleWithBLOBs(example);
        return questionWithBLOBs;
    }

    // 添加考试题
    public void addExamQuestion(ExamQuestion examQuestion,Integer[] qids) {
        List<Integer> qidList = Arrays.asList(qids);
        Integer eid = examQuestion.getEid();
        QuestionExample example = new QuestionExample();
        example.createCriteria().andIdIn(qidList);
        List<QuestionWithBLOBs> questions = questionMapper.selectByExampleWithBLOBs(example);
        for(QuestionWithBLOBs question : questions) {
            examQuestion = new ExamQuestion();
            examQuestion.setEid(eid);
            examQuestion.setAnswer(question.getAnswer());
            examQuestion.setDescription(question.getDescription());
            examQuestion.setDiff(question.getDiff());
            examQuestion.setQid(question.getId());
            examQuestion.setType(question.getType());
            examQuestion.setDetail(question.getDetail());
            examQuestionMapper.insertSelective(examQuestion);
        }
    }

}