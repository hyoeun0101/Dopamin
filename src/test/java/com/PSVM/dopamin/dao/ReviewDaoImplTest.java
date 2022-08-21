package com.PSVM.dopamin.dao;

import com.PSVM.dopamin.domain.ReviewDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ReviewDaoImplTest {

    @Autowired
    ReviewDao reviewDao;

    //데이터 접근 테스트
    @Test
    public void selectAllRevw() {
        List<ReviewDto> reviewDtoList = reviewDao.selectAllRevw(1);
        System.out.println("한줄평(컨텐츠 리뷰): " + reviewDtoList);
    }
}