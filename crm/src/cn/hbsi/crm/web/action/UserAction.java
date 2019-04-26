package cn.hbsi.crm.web.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.google.code.kaptcha.Constants;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.hbsi.crm.domain.User;
import cn.hbsi.crm.service.UserService;

public class UserAction extends ActionSupport implements ModelDriven<User>{
	
	//通过ModelDriven实现数据的封装
	private User user = new User();
	
	@Override
	public User getModel() {
		
		return user;
	}
	
	//注入UserService
	private UserService userService;	

	public void setUserService(UserService userService) {
		this.userService = userService;
	}


	public String register(){
		
		//接收表单的数据，并保存到数据库
		userService.register(user);
		return LOGIN;
	}

	//用户登录验证的方法
	public String login(){
		
		//1.先验证验证码是否正确
		//2.再来验证用户名、密码是否正确
		HttpServletRequest request = ServletActionContext.getRequest();
		
		//获取jar包生成的验证码
		String captcha = (String) request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
		
		//获取用户输入的验证码
		String inputCaptcha = request.getParameter("captcha");
		
		if(!captcha.equals(inputCaptcha)){
			//验证码错误
			//错误信息回显,将错误信息封装到request域对象
			this.addActionError("验证码错误");
			return "login2";
		}
		
		//执行到这里，说明验证码正确，然后验证用户名密码
		//登录成功后，返回登录成功的用户信息
		User existUser = userService.login(user);		
		//将用户的信息保存到session域对象，便于在index.jsp页面共享用户的信息
		request.getSession().setAttribute("existUser", existUser);
		
		//登录成功，跳转到index视图页面
		return "index";
	}
}
