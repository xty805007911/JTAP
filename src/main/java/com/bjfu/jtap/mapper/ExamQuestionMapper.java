package com.bjfu.jtap.mapper;

import com.bjfu.jtap.entity.ExamQuestion;
import com.bjfu.jtap.entity.ExamQuestionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ExamQuestionMapper {
    int countByExample(ExamQuestionExample example);

    int deleteByExample(ExamQuestionExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ExamQuestion record);

    int insertSelective(ExamQuestion record);

    List<ExamQuestion> selectByExample(ExamQuestionExample example);

    ExamQuestion selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ExamQuestion record, @Param("example") ExamQuestionExample example);

    int updateByExample(@Param("record") ExamQuestion record, @Param("example") ExamQuestionExample example);

    int updateByPrimaryKeySelective(ExamQuestion record);

    int updateByPrimaryKey(ExamQuestion record);
}