package com.soecode.lyf.web;

import com.soecode.lyf.entity.SysUser;
import com.soecode.lyf.entity.SysUserExample;
import com.soecode.lyf.service.SysUserService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @RequestMapping("/toList")
    public String toList() {
        return "/sys/sysUser/list";
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
        List<SysUser> sysUsers = sysUserService.queryAll(example);
        return sysUsers;
    }
}
