<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 가입</title>
</head>
<body>
    <h2>회원 가입</h2>
    <hr>
    <form action="" method="post">
        <p><strong style="color:red">*</strong> 는 필수 입력 요소입니다.</p>
        <fieldset>
            <legend>기본 정보</legend>
            <table>
                <tbody>
                    <tr>
                        <th><label for="id"><strong style="color:red">*</strong> 아이디</label></th>
                        <td>
                            <p>영문 소문자로 시작하면서 숫자를 혼합한 6글자 이상 12글자 이내로 조합</p>
                            <input type="text" name="id" id="id" placeholder="아이디 입력" pattern="[a-z0-9]{6,}" maxlength="12" autofocus required>
                            <button type="button" style="background:deepskyblue;color:#fff;border: none;">아이디 중복 확인</button>
                            <input type="hidden" name="idck" id="idck" value="no">
                        </td>
                    </tr>
                    <tr>
                        <th><label for="pw"><strong style="color:red">*</strong> 비밀번호</label></th>
                        <td>
                            <p>비밀번호는 최소 8글자 이상 12글자 이내로 입력</p>
                            <input type="password" name="pw" id="pw" pattern="{8,}" maxlength="12" placeholder="비밀번호 입력" required>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="pw2"><strong style="color:red">*</strong> 비밀번호 확인</label></th>
                        <td>
                            <input type="password" name="pw2" id="pw2" placeholder="비밀번호 확인 입력" required>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="name"><strong style="color:red">*</strong> 이름</label></th>
                        <td>
                            <input type="text" name="name" id="name" placeholder="이름 입력" required>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="tel"><strong style="color:red">*</strong> 전화번호</label></th>
                        <td>
                            <input type="tel" name="tel" id="tel" pattern="" placeholder="전화번호 입력" required>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="email"><strong style="color:red">*</strong> 이메일 주소</label></th>
                        <td>
                            <input type="email" name="email" id="email" pattern="" placeholder="이메일 주소 입력" required>
                        </td>
                    </tr>
                </tbody>
            </table>
        </fieldset>
        <fieldset>
            <legend>추가 정보</legend>
            <table>
                <tbody>
                    <tr>
                        <th><label for="birth"><strong style="color:red">*</strong>생년월일</label></th>
                        <td><input type="date" name="birth" id="birth"></td>
                    </tr>
                    <tr>
                        <th><label for="gender"><strong style="color:red">*</strong>성별</label></th>
                        <td><input type="radio" name="gender" id="gender1" value="1" checked> 
                            <label for="gender1"> 남</label><br>
                            <input type="radio" name="gender" id="gender2" value="2"> 
                            <label for="gender2"> 여</label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label for="memo">하고 싶은 말</label><br>
                            <textarea name="memo" id="memo" cols="80" rows="10"></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
        </fieldset>
        <table>
            <tbody>
                <tr>
                    <td>
                        <button type="submit">회원 가입</button>&nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="reset">취소</button>  
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</body>
</html>