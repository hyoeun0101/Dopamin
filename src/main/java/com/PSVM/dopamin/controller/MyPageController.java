package com.PSVM.dopamin.controller;

import com.PSVM.dopamin.domain.MyPageCntsDto;
import com.PSVM.dopamin.domain.MyPagePostDto;
import com.PSVM.dopamin.domain.RevwDto;
import com.PSVM.dopamin.service.MyPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
    @Autowired
    MyPageService MyPageService;

    //한줄평 리스트 가져오기
    @GetMapping("/revw/{userId}")
    public String readRevwList(@PathVariable String userId, Model m) throws Exception {
        List<RevwDto> revwDtoList = MyPageService.revwList(userId);
        m.addAttribute("revwDtoList", revwDtoList);
        System.out.println("revwDtoList = " + revwDtoList);
        return "home";
    }

    // 평가된 한줄평 가져오기
    @GetMapping("/revweval/{user_id}")
    public String readRevwEvalList(@PathVariable String user_id, Model m) throws Exception {
        List<RevwDto> revwDtoList = MyPageService.revwEvalList(user_id);
        m.addAttribute("revwDtoList", revwDtoList);
        System.out.println("revwDtoList = " + revwDtoList);
        return "home";
    }

    //컨텐츠 찜 목록 가져오기
    @GetMapping("/cntswish/{user_id}")
    public String readCntsWishList(@PathVariable String user_id, Model m) throws Exception {
        List<MyPageCntsDto> cntsDtoList = MyPageService.cntsWishList(user_id);
        m.addAttribute("cntsDtoList", cntsDtoList);
        System.out.println("cntsDtoList = " + cntsDtoList);
        return "home";
    }

    //컨텐츠 조회 기록 목록 가져오기
    @GetMapping("/cntsview/{user_id}")
    public String readCntsViewList(@PathVariable String user_id, Model m) throws Exception {
        List<MyPageCntsDto> cntsDtoList = MyPageService.cntsViewList(user_id);
        m.addAttribute("cntsDtoList", cntsDtoList);
        System.out.println("cntsDtoList = " + cntsDtoList);
        return "home";
    }

    //게시글 목록 가져오기
    @GetMapping("/post/{user_id}")
    public String readPostList(@PathVariable String user_id, Model m) throws Exception {
        List<MyPagePostDto> postDtoList = MyPageService.postList(user_id);
        m.addAttribute("postDtoList", postDtoList);
        return "home";
    }
}
