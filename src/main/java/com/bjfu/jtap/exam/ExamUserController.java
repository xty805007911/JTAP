package com.bjfu.jtap.exam;

import com.bjfu.jtap.exam.service.ExamUserService;
import com.bjfu.jtap.exam.vo.ExamUserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Description:
 * @Author: Tianyu Xiao
 * @CreateDate: 2021/3/23  23:22
 */
@RestController
@RequestMapping("/api")
public class ExamUserController {

    @Autowired
    private ExamUserService examUserService;
    @PostMapping("/exam-user/add")
    public void addExamUser(Integer termId,Integer examId) {
        examUserService.addExamUser(termId,examId);
    }

    // 获取考试用户列表
    @GetMapping("/exam-user/exam-list/{examId}")
    public List<ExamUserVO> getExamList(@PathVariable Integer examId) {
        return examUserService.getExamUserList(examId);
    }
}
