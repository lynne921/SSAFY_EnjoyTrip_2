package com.ssafy.enjoytrip.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AppConfig {

    /**
     * BcryptPasswordEncoder
     * 해싱하는데 시간이 좀 걸림 (해커들의 시도 횟수를 줄이기 위해)
     * 공부해볼 키워드: bcrypt + salt
     *
     * @return
     */
	/*
	 * @Bean public PasswordEncoder passwordEncoder() { return
	 * PasswordEncoderFactories.createDelegatingPasswordEncoder(); }
	 */

}