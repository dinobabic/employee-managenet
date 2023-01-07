package com.main.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.main.service.UserService;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
	@Autowired
	private UserService userService;
	
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public DaoAuthenticationProvider authenticationProvider() {
		DaoAuthenticationProvider auth = new DaoAuthenticationProvider();
		
		auth.setUserDetailsService(userService);
		auth.setPasswordEncoder(passwordEncoder());
		
		return auth;
	}
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		return http
			.authorizeRequests(configurer ->
					configurer
						.antMatchers("/").permitAll()
						.antMatchers("/showLoginPage").permitAll()
						.antMatchers("/showRegistrationPage").permitAll()
						.antMatchers("/successLogin").hasRole("EMPLOYEE")
						.antMatchers("/admin-dashboard").hasRole("ADMIN"))
			.formLogin(configurer -> 
					configurer
						.loginPage("/showLoginPage")
						.loginProcessingUrl("/authenticateUser")
						.defaultSuccessUrl("/successLogin")
						.permitAll())
			.logout(configurer ->
					configurer
						.permitAll())
			.exceptionHandling(configurer ->
					configurer
						.accessDeniedPage("/access-denied"))
			.build();
	}
}