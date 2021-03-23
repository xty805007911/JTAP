package com.bjfu.jtap.exam;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
