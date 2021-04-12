package com.bjfu.jtap.exam;

import com.bjfu.jtap.entity.ExamQuestion;
import com.bjfu.jtap.entity.QuestionWithBLOBs;
import com.bjfu.jtap.exam.service.ExamQuestionService;
import com.bjfu.jtap.exam.vo.QidPointVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

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
    public void addExamQuestions(Integer[] qids, Integer eid, @RequestBody List<QidPointVO> qidPointList) {
        //TODO qidPointList不准确，以qids为准，重新筛选
        ExamQuestion examQuestion = new ExamQuestion();
        examQuestion.setEid(eid);
        examQuestionService.addExamQuestion(examQuestion,qids);
    }

    // 获取分类的考试题
    @GetMapping("/questions/map/{examId}")
    public Map<String, List<ExamQuestion>> getExamQuestionMap(@PathVariable Integer examId) {
        return examQuestionService.getExamQuestionByExamId(examId);
    }
}
