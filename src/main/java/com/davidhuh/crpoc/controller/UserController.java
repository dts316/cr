package com.davidhuh.crpoc.controller;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.*;
import com.davidhuh.crpoc.service.UserService;
import com.davidhuh.crpoc.validator.UserValidator;
import com.davidhuh.crpoc.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    private UserValidator userValidator;



    @GetMapping({"/", "/welcome"})
    public String welcome(Model model) {
        model.addAttribute("users", userService.getAllUsers());
        return "welcome";
    }

    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }
    @PostMapping("/registration")
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, final RedirectAttributes redirectAttributes) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.saveOrUpdate(userForm);

        redirectAttributes.addFlashAttribute("userFormRedirected",userForm);
        return "redirect:/welcome";
    }
    @GetMapping("/allUsers")
    public String allUsers(Model model) {
    	model.addAttribute("users", userService.getAllUsers());
    	return "allUsers";
    }
}
