package com.soecode.lyf.web;

import com.soecode.lyf.common.Constants;
import com.soecode.lyf.common.CreateMenuTree;
import com.soecode.lyf.common.DesUtil;
import com.soecode.lyf.dto.Result;
import com.soecode.lyf.entity.Menu;
import com.soecode.lyf.service.LoginService;
import com.soecode.lyf.task.sendemail.BookUpdate;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/test")
public class TestController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private LoginService loginService;

	@RequestMapping("/index")
	public String index(Model model) {
        Map map = CreateMenuTree.create(loginService.getUserMenu());
        JSONObject retVal = JSONObject.fromObject(map);
        model.addAttribute("menus",retVal);
        return "/test/index";
	}

    @RequestMapping("/getTestValue")
    @ResponseBody
    public List<Map> getTestValue(HttpSession session, Model model) {
        Map map = new HashMap();
        map.put("productid","456");
        map.put("productid","456");
        map.put("productid","456");

        List<Map> lists = new ArrayList<>();
        lists.add(map);

        return lists;
    }

	@RequestMapping("/easyui")
	public String easyui() {
		return "/test/easyUi";
	}

	/**
	 * 执行bean文件的测试方法
	 */
	@Test
	public void rcp(){
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/spring-*.xml");
		WeatherController bean = context.getBean("weatherController",WeatherController.class);
    }

	/**
	 * 加减密测试
	 */
	@Test
	public  void testPwd(){
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/spring-*.xml");
		DesUtil bean = context.getBean("desUtil",DesUtil.class);
		String data = "rcp";
		System.out.println("加密前===>"+data);
		try {
			System.err.println(bean.encrypt(data));
			System.err.println(bean.decrypt(bean.encrypt(data)));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 定时器测试
	 */
	@Test
	public  void testDSQ(){
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/spring-*.xml");
		BookUpdate bean = context.getBean("bookUpdate",BookUpdate.class);
		try {
			bean.task();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
