package com.bjfu.jtap.exam;

import com.bjfu.jtap.entity.Exam;
import com.bjfu.jtap.entity.User;
import com.bjfu.jtap.exam.service.StudentExamService;
import com.bjfu.jtap.exam.vo.AnswerSaveVO;
import com.bjfu.jtap.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
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
            Result.build(500, "未登录");
        }
        User user = (User) session.getAttribute("user");
        return studentExamService.isExamEntry(user.getId(), examId);
    }

    // 保存答案
    @PostMapping("/exam/save-answer")
    public Result saveAnswer(@RequestBody List<AnswerSaveVO> answerSaveVOList, String[] userAnswerList, Integer isEnd, Integer examId, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return Result.build(500, "未登录");
        }
        if (isEnd != null) {//交卷了
            studentExamService.updateUserExamEndTime(user.getId(), examId);
        }
        studentExamService.saveAnswer(answerSaveVOList, userAnswerList, user.getId());
        return Result.ok();
    }

    // 获取未完成的考试
    @GetMapping("/exam/getDoingExam")
    public Exam getDoingExam(HttpSession session) {
        User user = (User) session.getAttribute("user");
        return studentExamService.getDoingExam(user.getId());
    }

    // 获取未完成考试的考试页数
    @GetMapping("/exam/getDoingExam/examPage/{examId}")
    public Integer getDoingExamPage(HttpSession session,@PathVariable Integer examId) {
        User user = (User) session.getAttribute("user");
        return studentExamService.getDoingExamPage(user.getId(),examId);
    }

    // 获取已完成的考试
    /*
    @GetMapping("/exam/done")
    public List<>
    */
}
