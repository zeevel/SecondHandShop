package com.hnust.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayFundTransToaccountTransferRequest;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.response.AlipayFundTransToaccountTransferResponse;
import com.alipay.api.response.AlipayTradePagePayResponse;
import com.hnust.util.AlipayConfig;
import com.hnust.util.KeyUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hnust.pojo.Goods;
import com.hnust.pojo.Orders;
import com.hnust.pojo.Purse;
import com.hnust.pojo.User;
import com.hnust.service.GoodsService;
import com.hnust.service.OrdersService;
import com.hnust.service.PurseService;

@Controller
@RequestMapping(value="/orders")
public class OrdersController {
	
	@Resource
	private OrdersService ordersService;
	@Resource
	private GoodsService goodsService;
	@Resource
	private PurseService  purseService;
	
    
    ModelAndView mv = new ModelAndView();
	
	 /**
     * 我的订单 买
     */
    @RequestMapping(value = "/myOrders")
    public ModelAndView orders(HttpServletRequest request) {
        User cur_user = (User)request.getSession().getAttribute("cur_user");
        Integer user_id = cur_user.getId();
        List<Orders> ordersList1=new ArrayList<Orders>();
        List<Orders> ordersList2=new ArrayList<Orders>();
        ordersList1 = ordersService.getOrdersByUserId(user_id);
        ordersList2 = ordersService.getOrdersByUserAndGoods(user_id);
        Purse myPurse=purseService.getPurseByUserId(user_id);
        mv.addObject("ordersOfSell",ordersList2);
        mv.addObject("orders",ordersList1);
        mv.addObject("myPurse",myPurse);
        mv.setViewName("/user/orders");
        return mv;
    }
    
    
	 /**
     * 提交订单
     */
    @RequestMapping(value = "/addOrders")
    public String addorders(HttpServletRequest request,Orders orders) {
    	Date d=new Date();//获取时间
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");//转换格式
        User cur_user = (User)request.getSession().getAttribute("cur_user");
        Integer user_id = cur_user.getId();
        orders.setUserId(user_id);
        orders.setOrderDate(sdf.format(d));
        Goods goods=new Goods();
        goods.setStatus(0);
        goods.setId(orders.getGoodsId());
        goodsService.updateGoodsByGoodsId(goods);
        ordersService.addOrders(orders);
        Float balance=orders.getOrderPrice();
        purseService.updatePurseOfdel(user_id,balance);
        return "redirect:/orders/myOrders";
    }
    
    /**
     * 发货 根据订单号
     */
    @RequestMapping(value = "/deliver/{orderNum}")
    public String deliver(HttpServletRequest request,@PathVariable("orderNum")Integer orderNum) {
      
    	ordersService.deliverByOrderNum(orderNum);
        
        
        return "redirect:/orders/myOrders";
    }
    
    
    
    /**
     * 收货
     */
    @RequestMapping(value = "/receipt")
    public String receipt(HttpServletRequest request) {
    Integer orderNum=Integer.parseInt(request.getParameter("orderNum"));
    	Float balance=Float.parseFloat(request.getParameter("orderPrice"));
    	Integer goodsId=Integer.parseInt(request.getParameter("goodsId"));
    	Integer userId=goodsService.getGoodsById(goodsId).getUserId();
    	ordersService.receiptByOrderNum(orderNum);
    	purseService.updatePurseByuserId(userId,balance);
    	/*买家确认收货后，卖家钱包+*/
        return "redirect:/orders/myOrders";
    }


    @RequestMapping("/ailpay")
    public void alipay(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        AlipayClient alipayClient = new
                DefaultAlipayClient("https://openapi.alipaydev.com/gateway.do",
                AlipayConfig.app_id,
                AlipayConfig.merchant_private_key,
                "json",
                AlipayConfig.charset,
                AlipayConfig.alipay_public_key,
                AlipayConfig.sign_type);
        //上面这个方法是不是很眼熟？就是刚才配置完公钥后生成的那段，你可以直接复制然后加上你的私钥就好
        String out_trade_no = KeyUtil.getUniqueKey();
        out_trade_no = URLDecoder.decode(out_trade_no,"UTF-8");
        String total_amount = "10";
        total_amount = URLDecoder.decode(total_amount,"UTF-8");
        String subject = "充值金币";
        subject = URLDecoder.decode(subject,"UTF-8");
        String body = "实惠划算";
        body = URLDecoder.decode(body,"UTF-8");

        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();//创建API对应的request
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
//        alipayRequest.setNotifyUrl("http://localhost:8081/orders/myOrders");
//        alipayRequest.setNotifyUrl("http://139.196.90.54/second-hand/orders/callback");
        alipayRequest.setBizContent("{" +
                "    \"out_trade_no\":\""+ out_trade_no +"\"," +
                "    \"product_code\":\"FAST_INSTANT_TRADE_PAY\"," +
                "    \"total_amount\":"+ total_amount +"," +
                "    \"subject\":\""+ subject +"\"," +
                "    \"body\":\""+ body +"\"" +
                "    }"+
                "  }");//填充业务参数
        String form="";
        try {
            form = alipayClient.pageExecute(alipayRequest).getBody(); //调用SDK生成表单
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().println(form);//直接将完整的表单html输出到页面
        response.getWriter().close();

    }

    @RequestMapping("/callback")
    public void callback(HttpServletRequest request, HttpServletResponse response) throws IOException, AlipayApiException {

        //获取支付宝POST过来反馈信息
        Map<String,String> params = new HashMap<String,String>();
        Map<String,String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }

        boolean signVerified = AlipaySignature.rsaCheckV1(params,
                AlipayConfig.alipay_public_key,
                AlipayConfig.charset,
                AlipayConfig.sign_type); //调用SDK验证签名

        if(signVerified) {//验证成功
            //商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
            //支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
            //付款金额
            String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");
//            //交易状态
//            String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");

            response.getWriter().println(out_trade_no + "   " + trade_no + "    " + total_amount);
//            User cur_user = (User)request.getSession().getAttribute("cur_user");
//            Integer user_id = cur_user.getId();
//            Purse myPurse = purseService.getPurseByUserId(user_id);
//            myPurse.setBalance(myPurse.getBalance() + Float.valueOf(total_amount));

        }else {//验证失败
            response.getWriter().println("fail");
        }
    }

    @RequestMapping(value="/withdraw")
    public void withdraw(HttpServletRequest request, HttpServletResponse response) throws AlipayApiException, IOException {
        AlipayClient alipayClient = new DefaultAlipayClient("https://openapi.alipaydev.com/gateway.do",
                AlipayConfig.app_id,
                AlipayConfig.merchant_private_key,
                "json",
                AlipayConfig.charset,
                AlipayConfig.alipay_public_key,
                AlipayConfig.sign_type);
        String out_biz_no = KeyUtil.getUniqueKey();
        out_biz_no = URLDecoder.decode(out_biz_no,"UTF-8");
        String payee_type = "ALIPAY_LOGONID";
        payee_type = URLDecoder.decode(payee_type,"UTF-8");
        String payee_account = "wciwno3848@sandbox.com";
        payee_account = URLDecoder.decode(payee_account,"UTF-8");
        String amount = "100";
        amount = URLDecoder.decode(amount,"UTF-8");

        AlipayFundTransToaccountTransferRequest alipayRequest = new AlipayFundTransToaccountTransferRequest();
        alipayRequest.setBizContent("{" +
                "   \"out_biz_no\": \"" + out_biz_no + "\"," +
                "   \"payee_type\": \"" + payee_type + "\"," +
                "   \"payee_account\": \"" + payee_account + "\"," +
                "   \"amount\": \"" + amount + "\"," +
                "}");
//        AlipayFundTransToaccountTransferResponse responseAli = alipayClient.execute(alipayRequest);
//        if(responseAli.isSuccess()){
//            response.getWriter().println("success");
//        } else {
//            response.getWriter().println("error");
//        }
        String form = "";
        try{
            form = alipayClient.pageExecute(alipayRequest).getBody();
        }catch (AlipayApiException e){
            e.printStackTrace();
        }
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().println(form);//直接将完整的表单html输出到页面
        response.getWriter().close();
    }

    @RequestMapping("/write")
    public void write(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.getWriter().println("hello,write world");
    }


}
