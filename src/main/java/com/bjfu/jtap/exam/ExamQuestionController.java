package com.bjfu.jtap.exam;

import com.bjfu.jtap.entity.ExamQuestion;
import com.bjfu.jtap.entity.QuestionWithBLOBs;
import com.bjfu.jtap.exam.service.ExamQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Description:
 * @Author: Tianyu Xiao
 * @CreateDate: 2021/3/23  20:59
 */
@RestController
@RequestMapping("/api")
public class ExamQuestionController {

    @Autowired
    private ExamQuestionService examQuestionService;

    @GetMapping("/questions")
    public List<QuestionWithBLOBs> getQuestionByDiff(Integer diff) {
        return examQuestionService.getQuestionByDiff(diff);
    }

    // 添加考试题
    @PostMapping("/questions/add")
    public void addExamQuestions(@RequestBody ExamQuestion examQuestion,Integer[] qids) {
        examQuestionService.addExamQuestion(examQuestion,qids);
    }
}
