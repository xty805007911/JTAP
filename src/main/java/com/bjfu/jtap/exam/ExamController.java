package com.bjfu.jtap.exam;

import com.bjfu.jtap.entity.Exam;
import com.bjfu.jtap.entity.User;
import com.bjfu.jtap.exam.service.ExamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @Description:
 * @Author: Tianyu Xiao
 * @CreateDate: 2021/3/23  22:16
 */
@RestController
@RequestMapping("/api")
public class ExamController {

    @Autowired
    private ExamService examService;

    //添加考试
    @PostMapping("/exam/add")
    public Integer addExam(@RequestBody Exam exam, HttpSession session) {
        User sessionUser = (User) session.getAttribute("user");
        exam.setCreateUserId(sessionUser.getId());
        return examService.addExam(exam);
    }

    //获取考试list
    @GetMapping("/exam/list")
    public List<Exam> getExamList(HttpSession session) {
        User sessionUser = (User) session.getAttribute("user");
        if(sessionUser.getRole() == 1) {
            return examService.getExamListByCreateUser(sessionUser.getId());
        }else {
            return examService.getExamListByStudent(sessionUser.getId());
        }
    }

    //获取考试详情
    @GetMapping("/exam/detail/{id}")
    public Exam getExamDetail(@PathVariable Integer id) {
        return examService.getById(id);
    }
}
