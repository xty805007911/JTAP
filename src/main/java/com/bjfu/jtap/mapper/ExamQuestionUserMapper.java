package com.bjfu.jtap.mapper;

import com.bjfu.jtap.entity.ExamQuestionUser;
import com.bjfu.jtap.entity.ExamQuestionUserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ExamQuestionUserMapper {
    int countByExample(ExamQuestionUserExample example);

    int deleteByExample(ExamQuestionUserExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ExamQuestionUser record);

    int insertSelective(ExamQuestionUser record);

    List<ExamQuestionUser> selectByExample(ExamQuestionUserExample example);

    ExamQuestionUser selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ExamQuestionUser record, @Param("example") ExamQuestionUserExample example);

    int updateByExample(@Param("record") ExamQuestionUser record, @Param("example") ExamQuestionUserExample example);

    int updateByPrimaryKeySelective(ExamQuestionUser record);

    int updateByPrimaryKey(ExamQuestionUser record);
}