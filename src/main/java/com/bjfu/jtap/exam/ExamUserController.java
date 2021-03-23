package com.bjfu.jtap.exam;

import com.bjfu.jtap.exam.service.ExamUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
}
