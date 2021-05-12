package com.bjfu.jtap.exam.service;

import com.bjfu.jtap.entity.*;
import com.bjfu.jtap.exam.vo.ExamQuestionVO;
import com.bjfu.jtap.mapper.ExamQuestionMapper;
import com.bjfu.jtap.mapper.ExamQuestionUserMapper;
import com.bjfu.jtap.mapper.ExamUserMapper;
import com.bjfu.jtap.mapper.QuestionMapper;
import com.bjfu.jtap.utils.BaseConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.*;

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
    @Autowired
    private ExamQuestionUserMapper examQuestionUserMapper;

    // 根据难度查询
    public List<QuestionWithBLOBs> getQuestionByDiff(Integer diff) {
        QuestionExample example = new QuestionExample();
        example.createCriteria().andDiffEqualTo(diff);
        List<QuestionWithBLOBs> questionWithBLOBs = questionMapper.selectByExampleWithBLOBs(example);
        return questionWithBLOBs;
    }

    // 添加考试题
    public void addExamQuestion(ExamQuestion examQuestion, Integer[] qids, Map<Integer, Float> pointMap) {
        List<Integer> qidList = Arrays.asList(qids);
        Integer eid = examQuestion.getEid();
        QuestionExample example = new QuestionExample();
        example.createCriteria().andIdIn(qidList);
        List<QuestionWithBLOBs> questions = questionMapper.selectByExampleWithBLOBs(example);
        for (QuestionWithBLOBs question : questions) {
            examQuestion = new ExamQuestion();
            examQuestion.setEid(eid);
            examQuestion.setAnswer(question.getAnswer());
            examQuestion.setDescription(question.getDescription());
            examQuestion.setDiff(question.getDiff());
            examQuestion.setQid(question.getId());
            examQuestion.setType(question.getType());
            examQuestion.setDetail(question.getDetail());
            examQuestion.setPoint(pointMap.get(question.getId()));
            examQuestionMapper.insertSelective(examQuestion);
        }
    }

    // 根据考试id获取考试题
    public Map<String, List<ExamQuestion>> getExamQuestionByExamId(Integer eid) {
        ExamQuestionExample example = new ExamQuestionExample();
        example.createCriteria().andEidEqualTo(eid);
        List<ExamQuestion> examQuestionList = examQuestionMapper.selectByExample(example);
        Map<String, List<ExamQuestion>> result = new HashMap<>();

        List<ExamQuestion> l1 = new ArrayList<>();
        List<ExamQuestion> l2 = new ArrayList<>();
        List<ExamQuestion> l3 = new ArrayList<>();
        for (ExamQuestion eq : examQuestionList) {
            if (eq.getDiff() == 1) {
                l1.add(eq);
            }
            if (eq.getDiff() == 2) {
                l2.add(eq);
            }
            if (eq.getDiff() == 3) {
                l3.add(eq);
            }
        }
        result.put("diff1", l1);
        result.put("diff2", l2);
        result.put("diff3", l3);
        return result;
    }

    // 获取用户考试详情
    public Map<String, List<ExamQuestionVO>> getExamQuestionByUserExamId(Integer eid,Integer userId) {
        ExamQuestionExample example = new ExamQuestionExample();
        example.createCriteria().andEidEqualTo(eid);
        List<ExamQuestion> examQuestionList = examQuestionMapper.selectByExample(example);
        BaseConverter<ExamQuestion,ExamQuestionVO> cvt = new BaseConverter<>();
        List<ExamQuestionVO> examQuestionVOList = cvt.convert(examQuestionList, ExamQuestionVO.class);
        Map<String, List<ExamQuestionVO>> result = new HashMap<>();

        List<ExamQuestionVO> l1 = new ArrayList<>();
        List<ExamQuestionVO> l2 = new ArrayList<>();
        List<ExamQuestionVO> l3 = new ArrayList<>();
        for (ExamQuestionVO eq : examQuestionVOList) {

            ExamQuestionUserExample examUserExample = new ExamQuestionUserExample();
            examUserExample.createCriteria().andEidEqualTo(eq.getEid()).andQidEqualTo(eq.getQid());
            List<ExamQuestionUser> examQuestionUserList = examQuestionUserMapper.selectByExample(examUserExample);
            if(!CollectionUtils.isEmpty(examQuestionUserList)) {
                eq.setExamQuestionUser(examQuestionUserList.get(0));
            }


            if (eq.getDiff() == 1) {
                l1.add(eq);
            }
            if (eq.getDiff() == 2) {
                l2.add(eq);
            }
            if (eq.getDiff() == 3) {
                l3.add(eq);
            }
        }
        result.put("diff1", l1);
        result.put("diff2", l2);
        result.put("diff3", l3);
        return result;
    }

}
