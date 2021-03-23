package com.bjfu.jtap.exam.service;

import com.bjfu.jtap.entity.Exam;
import com.bjfu.jtap.entity.ExamExample;
import com.bjfu.jtap.mapper.ExamMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.Date;
import java.util.List;

/**
 * @Description:
 * @Author: Tianyu Xiao
 * @CreateDate: 2021/3/23  21:44
 */
@Service
public class ExamService {
    @Autowired
    private ExamMapper examMapper;

    public Integer addExam(Exam exam) {
        exam.setCreateTime(new Date());
        examMapper.insertSelective(exam);
        ExamExample example = new ExamExample();
        example.setOrderByClause(" id DESC ");
        List<Exam> examList = examMapper.selectByExample(example);
        if(CollectionUtils.isEmpty(examList)) {
            return 1;
        }else {
            return examList.get(0).getId();
        }
    }
}
