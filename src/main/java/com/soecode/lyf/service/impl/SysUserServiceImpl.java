package com.soecode.lyf.service.impl;

import com.soecode.lyf.dao.SysUserMapper;
import com.soecode.lyf.entity.SysUser;
import com.soecode.lyf.entity.SysUserExample;
import com.soecode.lyf.service.SysUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author rcp
 */
@Service
public class SysUserServiceImpl implements SysUserService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private SysUserMapper sysUserMapper;

	@Override
	public List<SysUser> queryAll(SysUserExample example) {
        List<SysUser> sysUsers = sysUserMapper.selectByExample(example);
        return sysUsers;
    }
}
