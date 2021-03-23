package com.bjfu.jtap.student.service.impl;

import com.bjfu.jtap.entity.QuestionError;
import com.bjfu.jtap.entity.QuestionErrorExample;
import com.bjfu.jtap.mapper.QuestionErrorMapper;
import com.bjfu.jtap.student.service.StudentQuestionErrorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;

@Service
public class StudentQuestionErrorServiceImpl implements StudentQuestionErrorService{
    @Autowired
    private QuestionErrorMapper questionErrorMapper;
    @Override
    public List<QuestionError> getErrorNum(Integer qid) {
        QuestionErrorExample example = new QuestionErrorExample();
        example.setOrderByClause(" err_num DESC ");
        example.createCriteria().andQidEqualTo(qid);
        return questionErrorMapper.selectByExample(example);
    }

    @Override
    public void addErrorQuestionNum(Integer qid) {
        QuestionErrorExample example = new QuestionErrorExample();
        example.createCriteria().andQidEqualTo(qid);
        List<QuestionError> list = questionErrorMapper.selectByExample(example);

        QuestionError questionError = new QuestionError();
        if(!CollectionUtils.isEmpty(list)) {

            questionError = list.get(0);
            Integer errNum = questionError.getErrNum() + 1;
            questionError.setErrNum(errNum);
            questionErrorMapper.updateByPrimaryKey(questionError);
        }else {
            questionError.setErrNum(1);
            questionError.setQid(qid);
            questionErrorMapper.insertSelective(questionError);
        }

    }
}
