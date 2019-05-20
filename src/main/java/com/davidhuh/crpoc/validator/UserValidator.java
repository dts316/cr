package com.davidhuh.crpoc.validator;

import com.davidhuh.crpoc.model.User;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import org.apache.commons.validator.routines.EmailValidator;

@Component
public class UserValidator implements Validator {
    
    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user = (User) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "NotEmpty");
        if (user.getFirstName().length() < 3 ) {
            System.out.println(user.getFirstName().length());
            errors.rejectValue("firstName", "Size.userForm");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "NotEmpty");
        if (user.getLastName().length() < 3 ) {
            errors.rejectValue("lastName", "Size.userForm");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "emailId", "NotEmpty");
        if (!isValidEmailAddress(user.getEmailId())) errors.rejectValue("emailId", "email.invalid");


    }

    public boolean isValidEmailAddress(String emailAddress){
    	String[] email = emailAddress.split("@");
    	boolean retVal = false;
    	if(email[email.length-1].contains(".") && EmailValidator.getInstance().isValid(emailAddress)) {
    		retVal = true;
    	}
    	
       return retVal;
    }


}