package com.kybex.toy_springboots.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kybex.toy_springboots.service.MainService;

@Controller
public class MainController {

    @Autowired
    MainService mainService;

    @GetMapping({ "/", "/main", "" })
    public ModelAndView main(ModelAndView modelAndView) {
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
}
