package com.bjfu.jtap.mapper;

import com.bjfu.jtap.entity.Exam;
import com.bjfu.jtap.entity.ExamExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ExamMapper {
    int countByExample(ExamExample example);

    int deleteByExample(ExamExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Exam record);

    int insertSelective(Exam record);

    List<Exam> selectByExample(ExamExample example);

    Exam selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Exam record, @Param("example") ExamExample example);

    int updateByExample(@Param("record") Exam record, @Param("example") ExamExample example);

    int updateByPrimaryKeySelective(Exam record);

    int updateByPrimaryKey(Exam record);
}