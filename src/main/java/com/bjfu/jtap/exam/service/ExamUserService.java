package com.bjfu.jtap.exam.service;

import com.bjfu.jtap.entity.*;
import com.bjfu.jtap.exam.vo.ExamUserVO;
import com.bjfu.jtap.mapper.ExamQuestionUserMapper;
import com.bjfu.jtap.mapper.ExamUserMapper;
import com.bjfu.jtap.mapper.UserMapper;
import com.bjfu.jtap.mapper.UserTermMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * @Description:
 * @Author: Tianyu Xiao
 * @CreateDate: 2021/3/23  23:18
 */
@Service
public class ExamUserService {

    @Autowired
    private UserTermMapper userTermMapper;
    @Autowired
    private ExamUserMapper examUserMapper;
    @Autowired
    private ExamQuestionUserMapper examQuestionUserMapper;
    @Autowired
    private UserMapper userMapper;

    public void addExamUser(Integer termId,Integer examId) {
        UserTermExample example = new UserTermExample();
        example.createCriteria().andTermidEqualTo(termId);
        List<UserTerm> userTermList = userTermMapper.selectByExample(example);
        for(UserTerm userTerm : userTermList) {
            ExamUser examUser = new ExamUser();
            examUser.setExamId(examId);
            examUser.setUserId(userTerm.getStudentid());
            examUserMapper.insert(examUser);
        }
    }

    public List<ExamUserVO> getExamUserList(Integer examId) {
        ExamUserExample examUserExample = new ExamUserExample();
        examUserExample.createCriteria().andExamIdEqualTo(examId);
        List<ExamUser> examUserList = examUserMapper.selectByExample(examUserExample);
        if(CollectionUtils.isEmpty(examUserList)) {
            return null;
        }
        List<ExamUserVO> resultList = new ArrayList<>();
        for(ExamUser eu : examUserList) {
            Integer userId = eu.getUserId();
            ExamQuestionUserExample examQuestionUserExample = new ExamQuestionUserExample();
            examQuestionUserExample.createCriteria().andEidEqualTo(examId).andUserIdEqualTo(userId);
            List<ExamQuestionUser> examQuestionUserList = examQuestionUserMapper.selectByExample(examQuestionUserExample);

            ExamUserVO vo = new ExamUserVO();
            Float point = 0F;
            if(!CollectionUtils.isEmpty(examQuestionUserList)) {
                for(ExamQuestionUser equ : examQuestionUserList) {
                    point += equ.getPoint();
                }
                vo.setStatus("已完成");
            }else {
                vo.setStatus("未完成");
            }

            vo.setExamId(examId);
            vo.setUserId(userId);
            vo.setPoint(point);
            User user = userMapper.selectByPrimaryKey(userId);
            if(user != null) {
                vo.setUserName(user.getName());
            }
            resultList.add(vo);
        }
        return resultList;
    }
}
