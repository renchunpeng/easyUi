package com.soecode.lyf.web;

import com.soecode.lyf.common.Constants;
import com.soecode.lyf.common.CreateMenuTree;
import com.soecode.lyf.common.DesUtil;
import com.soecode.lyf.dto.Result;
import com.soecode.lyf.entity.Menu;
import com.soecode.lyf.task.sendemail.BookUpdate;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

	@RequestMapping("/index")
	public String index(Model model) {
		Menu menu1 = new Menu();
		menu1.setMenuid("1");
        menu1.setParentid("0");
        menu1.setIcon("icon-sys");
        menu1.setMenuname("系统基本设置");
        menu1.setType("1");
        menu1.setUrl("");

        Menu menu2 = new Menu();
        menu2.setMenuid("12");
        menu2.setParentid("1");
        menu2.setIcon("icon-add");
        menu2.setMenuname("Angel工作室官方");
        menu2.setType("2");
        menu2.setUrl("");

        Menu menu3 = new Menu();
        menu3.setMenuid("10");
        menu3.setParentid("12");
        menu3.setIcon("icon-role");
        menu3.setMenuname("权限设置");
        menu3.setType("3");
        menu3.setUrl("/test/easyui");

        List<Menu> lists = new ArrayList<>();
        lists.add(menu1);
        lists.add(menu2);
        lists.add(menu3);
        Map map = CreateMenuTree.create(lists);
        JSONObject retVal = JSONObject.fromObject(map);
        model.addAttribute("menus",retVal);
        return "/test/index";
	}

    @RequestMapping("/getTestValue")
    @ResponseBody
    public List<Map> getTestValue(HttpSession session, Model model) {
        Map map = new HashMap();
        map.put("productid","123");
        
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
