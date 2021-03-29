package com.bjfu.jtap.exam;

import com.bjfu.jtap.entity.User;
import com.bjfu.jtap.exam.service.StudentExamService;
import com.bjfu.jtap.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * @Description:
 * @Author: Tianyu Xiao
 * @CreateDate: 2021/3/29  20:07
 */
@RestController
@RequestMapping("/api")
public class StudentExamController {

    @Autowired
    private StudentExamService studentExamService;

    //创建考试
    @GetMapping("/create/exam/{examId}")
    public void createPaper(HttpSession session, @PathVariable Integer examId) {
        User user = (User) session.getAttribute("user");
        studentExamService.createExam(user.getId(), examId);
    }

    // 校验当前考试是否可进
    @GetMapping("/validate/exam/entry/{examId}")
    public Result isExamEntry(HttpSession session, @PathVariable Integer examId) {
        //当前用户为空，false
        if (session.getAttribute("user") == null) {
            Result.build(500,"未登录");
        }
        User user = (User) session.getAttribute("user");
        return studentExamService.isExamEntry(user.getId(),examId);
    }
}
