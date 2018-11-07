import com.soecode.lyf.dao.SysUserMapper;
import com.soecode.lyf.entity.SysUser;
import com.soecode.lyf.service.impl.MobileServiceImpl;
import net.sf.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * @author rcp
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:spring/spring-*.xml")
public class ControllerTest {
    @Autowired
    private MobileServiceImpl mobileServiceImpl;

    @Autowired
    private SysUserMapper sysUserMapper;

    @Test
    public void test() {
        String name = mobileServiceImpl.getList("123").get(0).getName();
        System.out.println(name);
    }

    @Test
    public void test2() {
        String name = mobileServiceImpl.getList("123").get(1).getName();
        System.out.println(name);
    }

    @Test
    public void test3() {
        String name = mobileServiceImpl.getList("789").get(1).getName();
        System.out.println(name);
    }

    @Test
    public void test4() {
         SysUser item = sysUserMapper.selectByPrimaryKey("2");
        System.out.println(JSONObject.fromObject(item));

    }

}
