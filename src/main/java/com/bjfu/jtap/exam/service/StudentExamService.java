package com.bjfu.jtap.exam.service;

import com.bjfu.jtap.entity.*;
import com.bjfu.jtap.exam.vo.AnswerSaveVO;
import com.bjfu.jtap.exam.vo.ExamVO;
import com.bjfu.jtap.mapper.ExamMapper;
import com.bjfu.jtap.mapper.ExamQuestionUserMapper;
import com.bjfu.jtap.mapper.ExamUserMapper;
import com.bjfu.jtap.utils.Result;
import com.bjfu.jtap.utils.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.*;

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
    @Autowired
    private ExamQuestionUserMapper examQuestionUserMapper;

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

    //修改学生结束答题时间
    public void updateUserExamEndTime(Integer userId, Integer examId) {
        ExamUserExample example = new ExamUserExample();
        example.createCriteria().andExamIdEqualTo(examId).andUserIdEqualTo(userId);
        List<ExamUser> examUsers = examUserMapper.selectByExample(example);
        ExamUser examUser = examUsers.get(0);
        examUser.setEntTime(new Date());
        examUserMapper.updateByPrimaryKeySelective(examUser);
    }

    // 校验当前考试是否可进入
    public Result isExamEntry(Integer userId, Integer examId) {
        Exam exam = examMapper.selectByPrimaryKey(examId);
        Map<Integer, String> result = new HashMap<>();
        if (exam == null) {
            return Result.build(500, "系统错误");
        }
        // 当前时间不在时间段内 false
        boolean isTimeEntry = TimeUtil.belongCalendar(new Date(), exam.getStartTime(), exam.getEndTime());
        if (!isTimeEntry) {
            return Result.build(500, "您不在当前符合的时间段内作答~");
        }
        // 当前作答完毕 false
        ExamUserExample example = new ExamUserExample();
        example.createCriteria().andExamIdEqualTo(examId).andUserIdEqualTo(userId);
        List<ExamUser> examUsers = examUserMapper.selectByExample(example);
        if (examUsers == null) {
            return Result.build(500, "您不在当前考试~");
        }
        if (examUsers.get(0).getEntTime() != null) {
            return Result.build(500, "您已作答~");
        }
        return Result.ok();
    }

    // 保存答案
    public void saveAnswer(List<AnswerSaveVO> answerSaveVOList, String[] userAnswerList, Integer userId) {
        List<ExamQuestionUser> insertEntityList = new ArrayList<>();
        int index = 0;
        for (AnswerSaveVO vo : answerSaveVOList) {
            ExamQuestionUser entity = new ExamQuestionUser();
            entity.setEid(vo.getEid());
            entity.setQid(vo.getQid());
            entity.setqType(vo.getType());
            entity.setUserId(userId);
            entity.setDiff(vo.getDiff());

            //判断是否正确
            String answer = vo.getAnswer();
            String userAnswer = userAnswerList[index++];
            entity.setUserAnswer(userAnswer);
            if (answer.trim().toLowerCase().equals(userAnswer.trim().toLowerCase())) {
                entity.setAnswerFlag(1);
                entity.setPoint(vo.getPoint());
            } else {
                entity.setAnswerFlag(0);
                entity.setPoint(0F);
            }
            examQuestionUserMapper.insertSelective(entity);
        }
    }

    // 获取未完成的考试
    public Exam getDoingExam(Integer userId) {
        ExamUserExample examExample = new ExamUserExample();
        examExample.setOrderByClause(" create_time DESC");
        examExample.createCriteria().andCreateTimeIsNotNull().andEntTimeIsNull().andUserIdEqualTo(userId);
        List<ExamUser> examUsers = examUserMapper.selectByExample(examExample);
        if (!CollectionUtils.isEmpty(examUsers)) {
            ExamUser examUser = examUsers.get(0);
            return examMapper.selectByPrimaryKey(examUser.getExamId());
        }
        return null;
    }

    // 获取未完成的考试页面
    public Integer getDoingExamPage(Integer userId, Integer eid) {
        ExamQuestionUserExample example = new ExamQuestionUserExample();
        example.setOrderByClause(" diff DESC");
        example.createCriteria().andUserIdEqualTo(userId).andEidEqualTo(eid);
        List<ExamQuestionUser> examQuestionUsers = examQuestionUserMapper.selectByExample(example);
        if (!CollectionUtils.isEmpty(examQuestionUsers)) {
            return examQuestionUsers.get(0).getDiff() + 1;
        } else {
            return 0;
        }
    }

    // 获取已经完成的考试
    public List<ExamVO> getDoneExam(Integer userId) {

        //获取enttime不为空的
        ExamUserExample examUserExample = new ExamUserExample();
        examUserExample.createCriteria().andUserIdEqualTo(userId).andCreateTimeIsNotNull().andEntTimeIsNotNull();
        List<ExamUser> examUserList = examUserMapper.selectByExample(examUserExample);
        if (CollectionUtils.isEmpty(examUserList)) {
            return null;
        }
        List<ExamVO> resultList = new ArrayList<>();
        for (ExamUser eu : examUserList) {
            Integer eid = eu.getExamId();
            Exam exam = examMapper.selectByPrimaryKey(eid);
            ExamQuestionUserExample examQuestionUserExample = new ExamQuestionUserExample();
            examQuestionUserExample.createCriteria().andUserIdEqualTo(userId).andEidEqualTo(eid);
            List<ExamQuestionUser> examQuestionUserList = examQuestionUserMapper.selectByExample(examQuestionUserExample);
            Float point = 0F;
            if(!CollectionUtils.isEmpty(examQuestionUserList)) {
                for(ExamQuestionUser equ : examQuestionUserList) {
                    point+=equ.getPoint();
                }
            }
            ExamVO vo = new ExamVO();
            vo.setExamId(eid);
            vo.setExamName(exam.getExamName());
            vo.setPoint(point);
            resultList.add(vo);
        }
        return resultList;
    }
}
