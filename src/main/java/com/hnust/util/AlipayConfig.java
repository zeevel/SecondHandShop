package com.hnust.util;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016100100637612";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCGPa0k0lbu8CZhEOo2naC6GXbnNXAEDxm1UA6ihcbg1E5kPHpMQ1OhiM7YGzTYGh3bU1mB/IxG67kuOGvhy7YESh+FfJd9w8dc1rzPPsStL3RBtC/eB/69NjI735piCsX21iNVUkM83jQIHjaoanNgKNZm/ZLCmKcxVK2o7mOFZ4Oef89DrGmPDeEX+oKY3iy48shzkA8cwC4+NaZKxVGWlUrRAzk4N343PJFR+au4W7chB8/NykIQ4cJBxb+crfpY6NAf7YckaEfxSN8yPacS4oq//VbsrFC1wfC46a0g9AaYX8HW5dJM2HgSYR0xQV+sezjkcARA3Huve8CqNZoNAgMBAAECggEAVprp3oyZK1Ph3tOT1yKAtC+Dh4zxNJ0tX81Dc9TMxvYRkRd3a0YwaVGi6Mc8o4LN6lbusy7krUic0tXxu926EzBi/7Ku5aNuNlYPv8DmEDlCTrVaAGu2DAowBHKw3jnHGAV1DDGjUVylwusDJkpvHwWZtR45FbR4gRn5Y7hQmpqKUHG9yI21kkJd/+nOFr7joXdBExY4bRWIPOOKQMfux1jI1XJdcdk1oQ5PTd2QPLuhsOzBvmXqLpFKRhJ31imDoildWr5uwZurBElz4wD0xx1NbThPDFajLyosqoBZswMUcHfFjG2q3ZLA90IXl2p4j4/6YFGud6Os8UBoAluQIQKBgQDNszXameEmodq1z01/I+AazL+nt/AW0G0dgffTFWudwXGso7zhvxC1DFP6coMSSycl7nx76jONyN7kQtZfkjIUg8/7byDVS0Sr7tgt2UivSpk/YfbhqSx/Oht/1GgTq8tw5CJYM5L9qFXOppzQiIuh96/FheKxtSafksmWAuzd5QKBgQCnESL8cRm/hV4hwhMHlT8CwN9uGSHgiA+I97NGGE4Dccu4ZHZhbQnAIFTQwUsZ/awGQAmbbLlssXze9NNB7tqn0NctIBY4ZvZmqV3CMe3XwiuoxseaMALSQM7hrQ6TmC+9HfXSSWW83sung36zhQ2hsmTPrxqTEzn5/hyFvHXJCQKBgDviCzCLka9UeT5qjk4QHKLQro7eDoglv05S0tnhp4WylixDMq6pl+yNHTmQ8rV1qXzyc80DPmTtcG4VQyFphyjPwtGY5X8SvXgsPUUDt5RIbFq2Y1AIlwqm2PCa3n2zirNfxtvUj9tGkUxq1sYiqjvJxqMDOh6v9QGJkyQXz+s9AoGAM5aSFBuklMRNDeWM1MGcRHBkTe4KzPeWvHeobxOgO2YPPzAecfUmlqIlLpURaMQxM3jgvpKzK0IfSgWVmn10HW/akf+ffOkmWwsffZDHXeGCc8p15kG/DUef2oYCw0ayLxaqSrYJaWnuvxpWrH6AeBbLFGqArTu5ol16Vz2brWkCgYAk9zvcj1Zsu84OvUHQ1JCnz09rtz+iwkz4Y4iNSwy7wE6WjffFudaTXw01ofKUQzb8X0BEmhLBL+tz/lim0BJJCFvbGoMKCrA3rOgV0IHt0Zi9LPOeNb58NXJxNMrBKmsZi4bhmg8imTV2dCsdC7FaeCxjzv656NSqNsFHg/nLbA==";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAuQzlC1bdCLt+6NSNEjI/En7BYb2PfmRYaLCNNtzrAaaCNKDi9jTTGHj1yeGbL16o/xD5ApuBtS8z/Yq5ySrn6eAHJU/CFeoBqvhTHUqOuluft2eV6GazuLMcFbaIalYValjVK1aFR3oEeaf4g3cK2+2FccYeN6PWSBurZzJ/bwsgpcki6j7siy/FZ8OG/KqaEuzstANMxu1ziWNZNice4LddVXLTLAivWasG/vjdwUeNZzuD3F7I2ULuKjbt5g1Gs13ROWOJtiy2DroMdpSHcxSBa/uc7DKmjNck0PzyOM548XFPygbNdpjzL1BP1m3PkYCuqUSH+ETQXLUECVJNqQIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://139.196.90.54/second-hand/orders/callback";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
//	public static String return_url = "http://127.0.0.1:8081/orders/callback";
	public static String return_url = "http://127.0.0.1:8081/user/callback";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipay.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

