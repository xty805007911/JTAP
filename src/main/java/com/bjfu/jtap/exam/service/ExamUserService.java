package com.bjfu.jtap.exam.service;

import com.bjfu.jtap.entity.ExamUser;
import com.bjfu.jtap.entity.TermExample;
import com.bjfu.jtap.entity.UserTerm;
import com.bjfu.jtap.entity.UserTermExample;
import com.bjfu.jtap.mapper.ExamUserMapper;
import com.bjfu.jtap.mapper.UserTermMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
