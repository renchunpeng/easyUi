package com.soecode.lyf.web;

import com.soecode.lyf.common.parse.otherSupport.ValidateUtil;
import com.soecode.lyf.dto.Result;
import com.soecode.lyf.entity.SysUser;
import com.soecode.lyf.entity.SysUserExample;
import com.soecode.lyf.entity.User;
import com.soecode.lyf.service.SysUserService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
import java.util.List;

/**
 *
 * @author rcp
 * @date 2018/11/8
 */
@Controller
@RequestMapping("/sysUser")
public class SysUserController {

    @Autowired
    private SysUserService sysUserService;

    /**
     * 跳转到用户list页面
     * @return
     */
    @RequestMapping("/toList")
    public String toList() {
        return "/sys/sysUser/list";
    }

    /**
     * 跳转到用户信息编辑页面
     * @return
     */
    @RequestMapping("/toEdit")
    public String toEdit(Model model,String userId) {
        model.addAttribute("validate", ValidateUtil.getValidate(SysUser.class));
        SysUser sysUser = sysUserService.get(userId);
        model.addAttribute("sysUser",sysUser);
        return "/sys/sysUser/edit";
    }

    @RequestMapping(value = "/getListVal",method = RequestMethod.POST)
    @ResponseBody
    public List<SysUser> getListVal(SysUser user) {
        SysUserExample example = new SysUserExample();
        SysUserExample.Criteria criteria = example.createCriteria();
        if(StringUtils.isNotBlank(user.getName())){
            criteria.andNameEqualTo(user.getName());
        }
        if(StringUtils.isNotBlank(user.getLoginName())){
            criteria.andLoginNameEqualTo(user.getLoginName());
        }
        if(StringUtils.isNotBlank(user.getLoginName())){
            criteria.andLoginNameEqualTo(user.getLoginName());
        }
        if(null != user.getSex()){
            criteria.andSexEqualTo(user.getSex());
        }
        List<SysUser> sysUsers = sysUserService.queryAll(example);
        return sysUsers;
    }

    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    @ResponseBody
    public Result edit(@Valid SysUser user){
        try {
            int i = sysUserService.edit(user);
            String Msg = "信息修改失败";
            if (i == 1 ){
                return new Result(true,null);
            }else {
                return new Result(false,Msg);
            }
        }catch (Exception e){
            return new Result(false,"系统内部错误");
        }
    }
}
