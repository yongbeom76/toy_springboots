package com.kybex.toy_springboots.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kybex.toy_springboots.service.MainService;

@Controller
public class MainController {

    @Autowired
    MainService mainService;

    @GetMapping({ "/", "/main", "" })
    public ModelAndView main(ModelAndView modelAndView) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            String username = ((UserDetails) principal).getUsername();
            System.out.println("username:" + username);
            System.out.println("principal:" + principal);
        } else {
            String username = principal.toString();
        }

        modelAndView.setViewName("index");
        return modelAndView;
    }

    @GetMapping("/seeMemberList")
    public ModelAndView seeMemberList(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        Object userList = mainService.getUserList(params);
        modelAndView.addObject("userList", userList);
        modelAndView.setViewName("seeMemberList");
        return modelAndView;
    }

    @GetMapping("/delete/{userId}")
    public ModelAndView deleteAndShowMemberList(@RequestParam Map<String, Object> params, @PathVariable String userId,
            ModelAndView modelAndView) {
        params.put("userId", userId);
        Object userList = mainService.deleteAndList(params);
        modelAndView.addObject("userList", userList);
        modelAndView.setViewName("seeMemberList");
        return modelAndView;
    }

    @PostMapping("/insert")
    public ModelAndView insert(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        if (params.size() != 0) { // ?????????????????? ???????????? ?????? ??????
            // DB??? ?????? ??????
            Object userList = mainService.insertAndGetList(params);
            modelAndView.addObject("userList", userList);
            modelAndView.setViewName("seeMemberList");
        } else {
            modelAndView.setViewName("joinMember");
        }
        return modelAndView;
    }

    @PostMapping("/update")
    public ModelAndView update(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        if (params.size() > 1) {
            // DB??? ?????? ??????
            Object result = mainService.updateOne(params);
            Object userList = mainService.getUserList(params);
            modelAndView.addObject("userList", userList);
            modelAndView.setViewName("seeMemberList");
        } else {
            List userList = (List) mainService.selectOne(params);
            modelAndView.addObject("user", userList.get(0));
            modelAndView.setViewName("updateMember");
        }
        return modelAndView;
    }
}
