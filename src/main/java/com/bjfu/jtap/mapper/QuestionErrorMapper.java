package com.bjfu.jtap.mapper;

import com.bjfu.jtap.entity.QuestionError;
import com.bjfu.jtap.entity.QuestionErrorExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface QuestionErrorMapper {
    int countByExample(QuestionErrorExample example);

    int deleteByExample(QuestionErrorExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(QuestionError record);

    int insertSelective(QuestionError record);

    List<QuestionError> selectByExample(QuestionErrorExample example);

    QuestionError selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") QuestionError record, @Param("example") QuestionErrorExample example);

    int updateByExample(@Param("record") QuestionError record, @Param("example") QuestionErrorExample example);

    int updateByPrimaryKeySelective(QuestionError record);

    int updateByPrimaryKey(QuestionError record);
}