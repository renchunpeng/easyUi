package com.soecode.lyf.common;

import com.soecode.lyf.entity.Menu;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by rcp on 2018/11/7.
 */
public class CreateMenuTree {

    public static Map create(List<Menu> lists){
        List<Menu> list1 = new ArrayList<>();
        List<Menu> list2 = new ArrayList<>();
        List<Menu> list3 = new ArrayList<>();

//        将三级菜单分别拆分开来
        for(int i=0;i<lists.size();i++){
            if(lists.get(i).getType().equals("1")){
                list1.add(lists.get(i));
            }else if(lists.get(i).getType().equals("2")){
                list2.add(lists.get(i));
            }else{
                list3.add(lists.get(i));
            }
        }

//        将三级菜单作为child放入二级菜单
        if(list2.size()>0&&list3.size()>0){
            for(int i=0;i<list2.size();i++){
                List<Menu> temp = new ArrayList<>();
                String menuid = list2.get(i).getMenuid();
                for(int k=0;k<list3.size();k++){
                    String menuid2 = list3.get(k).getParentid();
                    if (menuid.equals(menuid2)){
                        temp.add(list3.get(k));
                    }
                }
                list2.get(i).setChild(temp);
            }
        }

//        将二级菜单作为child放入一级菜单
        if(list1.size()>0&&list2.size()>0){
            for(int i=0;i<list1.size();i++){
                List<Menu> temp = new ArrayList<>();
                String menuid = list1.get(i).getMenuid();
                for(int k=0;k<list2.size();k++){
                    String menuid2 = list2.get(k).getParentid();
                    if (menuid.equals(menuid2)){
                        temp.add(list2.get(k));
                    }
                }
                list1.get(i).setMenus(temp);
            }
        }

        Map map = new HashMap(16);
        map.put("menus",list1);
        return map;
    }
}
