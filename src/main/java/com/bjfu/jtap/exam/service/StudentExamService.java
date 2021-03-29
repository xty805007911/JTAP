package com.bjfu.jtap.exam.service;

import com.bjfu.jtap.entity.Exam;
import com.bjfu.jtap.entity.ExamUser;
import com.bjfu.jtap.entity.ExamUserExample;
import com.bjfu.jtap.mapper.ExamMapper;
import com.bjfu.jtap.mapper.ExamUserMapper;
import com.bjfu.jtap.utils.Result;
import com.bjfu.jtap.utils.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description:
 * @Author: Tianyu Xiao
 * @CreateDate: 2021/3/29  20:09
 */
@Service
public class StudentExamService {

    @Autowired
    private ExamUserMapper examUserMapper;
    @Autowired
    private ExamMapper examMapper;

    // 学生创建考试
    public void createExam(Integer userId, Integer examId) {
        //先查询，若不存在，在添加
        ExamUserExample example = new ExamUserExample();
        example.createCriteria().andExamIdEqualTo(examId).andUserIdEqualTo(userId);
        List<ExamUser> examUsers = examUserMapper.selectByExample(example);
        if (examUsers == null) {
            return;
        }
        ExamUser examUser = examUsers.get(0);
        examUser.setCreateTime(new Date());
        examUserMapper.updateByPrimaryKeySelective(examUser);
    }

    // 校验当前考试是否可进入
    public Result isExamEntry(Integer userId, Integer examId) {
        Exam exam = examMapper.selectByPrimaryKey(examId);
        Map<Integer, String> result = new HashMap<>();
        if (exam == null) {
            return Result.build(500,"系统错误");
        }
        // 当前时间不在时间段内 false
        boolean isTimeEntry = TimeUtil.belongCalendar(new Date(), exam.getStartTime(), exam.getEndTime());
        if (!isTimeEntry) {
            return Result.build(500,"您不在当前符合的时间段内作答~");
        }
        // 当前作答完毕 false
        ExamUserExample example = new ExamUserExample();
        example.createCriteria().andExamIdEqualTo(examId).andUserIdEqualTo(userId);
        List<ExamUser> examUsers = examUserMapper.selectByExample(example);
        if(examUsers == null) {
            return Result.build(500,"您不在当前考试~");
        }
        if(examUsers.get(0).getEntTime() != null) {
            return Result.build(500,"您已作答~");
        }
        return Result.ok();
    }
}
