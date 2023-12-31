package com.example.back.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.back.vo.CartinfoVO;

@Mapper
public interface CartDao {

    public void insertCart(CartinfoVO cart);
    public ArrayList<CartinfoVO> selectCartList(String id);
    public void deleteCart(int num);
    
}
