package com.bjfu.jtap.exam.service;

import com.bjfu.jtap.entity.Exam;
import com.bjfu.jtap.entity.ExamExample;
import com.bjfu.jtap.entity.ExamUser;
import com.bjfu.jtap.entity.ExamUserExample;
import com.bjfu.jtap.mapper.ExamMapper;
import com.bjfu.jtap.mapper.ExamUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
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
    @Autowired
    private ExamUserMapper examUserMapper;

    //添加考试
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

    // 根据创建者获取考试
    public List<Exam> getExamListByCreateUser(Integer createUserId) {
        ExamExample example = new ExamExample();
        example.createCriteria().andCreateUserIdEqualTo(createUserId);
        return examMapper.selectByExample(example);
    }
    // 根据学生获取考试
    public List<Exam> getExamListByStudent(Integer userId) {
        //查询学生用户的考试id list
        ExamUserExample example1 = new ExamUserExample();
        example1.createCriteria().andUserIdEqualTo(userId);
        List<ExamUser> examUsers = examUserMapper.selectByExample(example1);
        List<Integer> examIds = new ArrayList<>();
        for(ExamUser eu : examUsers) {
            examIds.add(eu.getExamId());
        }
        ExamExample example = new ExamExample();
        example.createCriteria().andIdIn(examIds);
        return examMapper.selectByExample(example);
    }

    public Exam getById(Integer id) {
        return examMapper.selectByPrimaryKey(id);
    }
}
