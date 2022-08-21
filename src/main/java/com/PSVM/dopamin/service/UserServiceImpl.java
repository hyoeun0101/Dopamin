package com.PSVM.dopamin.service;

import com.PSVM.dopamin.dao.UserDaoImpl;
import com.PSVM.dopamin.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDaoImpl userDao;

    @Override
    public boolean idPwdCheck(String id, String pwd) throws NullPointerException{
        System.out.println("call idPwdCheck method in UserServiceImpl ");
        String user_pwd = userDao.selectUserPwd(id);
        //비밀번호 pwd 를 암호화해서 user_pwd와 체크
        //비밀번호 암호화 메서드 호출. pwd는 암호화된 pwd로 바꿔줘야함.
        if(user_pwd==null) {
            System.out.println("user_pwd is null");
            throw new NullPointerException("User doesn't exist");
        }
        System.out.println("id, pwd 일치?? "+pwd.equals(user_pwd));
        return pwd.equals(user_pwd);
    }


    @Override
    @Transactional(rollbackFor = DuplicateKeyException.class)
    public int joinUser(UserDto userDto) throws DuplicateKeyException{
        System.out.println("call joinUser method in ServiceImpl");
        //비밀번호 암호화 메서드 호출 필요
        int rowCnt1 = userDao.insertUser(userDto);
        int rowCnt2 = userDao.insertUserPwd(userDto);
        int rowCnt3 = userDao.insertCart(userDto.getUser_id());
        return rowCnt1 + rowCnt2 + rowCnt3;
    }

    @Override
    public UserDto getUser(String user_id) {
        return userDao.selectUser(user_id);
    }

    @Override
    public int idDuplCk(String user_id) {
        return userDao.selectIdDuplCnt(user_id);
    }

    @Override
    public int withdrawUser(String user_id) {
        return userDao.deleteUser(user_id);
    }

    @Override
    public String getCartId(String user_id) {
        return userDao.selectCartId(user_id);
    }


}