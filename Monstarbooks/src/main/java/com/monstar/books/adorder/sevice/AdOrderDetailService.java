package com.monstar.books.adorder.sevice;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.monstar.books.adorder.dao.AdOrderDao;
import com.monstar.books.adorder.dto.AdOrderDto;

@Service
public class AdOrderDetailService implements AdOrderService {

	
    private SqlSession sqlSession;

    public AdOrderDetailService(SqlSession sqlsession) {
        this.sqlSession = sqlsession;
    }

    @Override
    public void execute(Model model) {
        System.out.println(">>AdOrderDetailService");

        Map<String, Object> map = model.asMap();

        HttpServletRequest request = (HttpServletRequest) map.get("request");

        String orderNoStr = request.getParameter("orderNo");

        int orderNo = 0;

        try {
            orderNo = Integer.parseInt(orderNoStr);
        } catch (NumberFormatException e) {
            System.out.println("숫자 변환 불가: " + orderNoStr);
        }

        AdOrderDao dao = sqlSession.getMapper(AdOrderDao.class);

        if (orderNo != 0) {
          List<AdOrderDto> dto = dao.orderDetail(orderNo);
            
            System.out.println("dto:"+dto);
            // 주문 상세 정보를 모델에 추가
            model.addAttribute("orderDetail", dto);
        }
    }
}


 