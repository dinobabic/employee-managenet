package com.main.validation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.BeanWrapperImpl;

public class FieldMatchValidator implements ConstraintValidator<FieldMatch, Object> {
	
	private String firstFieldName;
	private String secondFieldName;
	private String message;
	

	@Override
	public void initialize(FieldMatch constraintAnnotation) {
		firstFieldName = constraintAnnotation.first();
		secondFieldName = constraintAnnotation.second();
		message = constraintAnnotation.message();
	}

	@Override
	public boolean isValid(Object value, ConstraintValidatorContext context) {
		boolean valid = true;
		
		try {
			final Object firstObject = new BeanWrapperImpl(value).getPropertyValue(firstFieldName);
			final Object secondObject = new BeanWrapperImpl(value).getPropertyValue(secondFieldName);
			
			if (firstObject == null && secondObject != null) valid = false;
			if (firstObject != null &&  secondObject == null) valid = false;
			if (!firstObject.equals(secondObject)) valid = false;
		}
		catch (Exception e) {
			// we do nothing
		}
		
		if (!valid){
	           context.buildConstraintViolationWithTemplate(message)
	                   .addPropertyNode(firstFieldName)
	                   .addConstraintViolation()
	                   .disableDefaultConstraintViolation();
        }
		
		return valid;
	}

}
