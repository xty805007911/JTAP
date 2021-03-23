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
        //时间转换
        /*
        if(!StringUtils.isEmpty(examTime)) {
            String[] times = examTime.split(",");
            String startTime = times[0];
            String endTime = times[1];
            SimpleDateFormat sdf = new SimpleDateFormat();
            sdf.
        }
        */

        User sessionUser = (User) session.getAttribute("user");
        exam.setCreateUserId(sessionUser.getId());
        return examService.addExam(exam);
    }
}
