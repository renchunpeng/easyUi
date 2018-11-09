package com.soecode.lyf.service;

import com.soecode.lyf.entity.SysUser;
import com.soecode.lyf.entity.SysUserExample;

import java.util.List;

/**
 * @author rcp
 */
public interface SysUserService {

    /**
     * 返回所有用户信息
     * @return
     */
	List<SysUser> queryAll(SysUserExample example);

    /**
     * 修改用户信息
     * @return
     */
    int edit(SysUser user);

    /**
     * 根据主键查询用户信息
     * @return
     */
    SysUser get(String id);
}
