package org.gangreung.test;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.InvalidParameterSpecException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import org.gangreung.util.AES256;

public class Aes256Test {
	// 암호화, 복호화 둘 다 가능. 새로 실행할 때 마다 값이 달라진다. 설정해 놓은 key값이 다르면 암호화, 복호화 불가능하다.
	public static void main(String[] args) throws NoSuchAlgorithmException, InvalidKeyException, InvalidKeySpecException, NoSuchPaddingException, InvalidParameterSpecException, UnsupportedEncodingException, BadPaddingException, IllegalBlockSizeException, InvalidAlgorithmParameterException {
		String pwd = "1234";
		String key = "%02x";
		String res1 = AES256.encryptAES256(pwd, key); // 암호화
		String res2 = AES256.decryptAES256(res1, key); // 복호화
		System.out.println("원래 비밀번호 : "+pwd);
		System.out.println("AES256 암호화된 비밀번호 : "+res1);
		System.out.println("AES256 복호화된 비밀번호 : "+res2);
		
	}

}
