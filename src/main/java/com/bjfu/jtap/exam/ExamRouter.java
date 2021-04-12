package com.bjfu.jtap.exam;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * @Description:
 * @Author: Tianyu Xiao
 * @CreateDate: 2021/3/23  20:48
 */
@Controller
public class ExamRouter {
    //管理员去添加考试
    @RequestMapping("/teacher/exam/toAdd")
    public String adminToAdd() {
        return "teacher/exam/add";
    }

    //管理员去考试列表
    @RequestMapping("/teacher/exam/list")
    public String adminToList() {
        return "teacher/exam/list";
    }

    //管理员去考试页面
    @RequestMapping("/teacher/exam/{id}")
    public String adminToExamDetail(@PathVariable Integer id, HttpServletRequest request) {
        request.setAttribute("examId", id);
        return "teacher/exam/detail";
    }

    //学生去考试列表
    @RequestMapping("/student/exam/list")
    public String studentToExamList() {
        return "student/exam/list";
    }

    // 去考试首页
    @RequestMapping("/student/do-exam/0/{examId}")
    public String studentDoExam0(@PathVariable Integer examId, HttpServletRequest request) {
        request.setAttribute("eid", examId);
        return "student/exam/doExam";
    }

    // 去考试简单题
    @RequestMapping("/student/do-exam/1/{examId}")
    public String studentDoExam1(@PathVariable Integer examId, HttpServletRequest request) {
        request.setAttribute("eid", examId);
        return "student/exam/doExam-1";
    }

    // 去考试中等
    @RequestMapping("/student/do-exam/2/{examId}")
    public String studentDoExam2(@PathVariable Integer examId, HttpServletRequest request) {
        request.setAttribute("eid", examId);
        return "student/exam/doExam-2";
    }

    // 去考试难题
    @RequestMapping("/student/do-exam/3/{examId}")
    public String studentDoExam3(@PathVariable Integer examId, HttpServletRequest request) {
        request.setAttribute("eid", examId);
        return "student/exam/doExam-3";
    }

    // 去已完成的考试页面
    @RequestMapping("/student/exam/done")
    public String studentDoneExamList() {
        return "student/exam/doneList";
    }

}
