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
}
