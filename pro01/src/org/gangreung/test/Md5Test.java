package org.gangreung.test;

import java.security.NoSuchAlgorithmException;

import org.gangreung.util.AES256;

public class Md5Test {
	// 새로 실행해도 값이 일정하다. Sha256에 비해 짧다.
	public static void main(String[] args) throws NoSuchAlgorithmException{
		String pwd = "1234";
		String res = AES256.md5(pwd);
		System.out.println("원래 비밀번호 : "+pwd);
		System.out.println("MD5 암호화된 비밀번호 : "+res);
	}

}
