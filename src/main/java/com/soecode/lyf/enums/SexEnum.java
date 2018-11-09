package com.soecode.lyf.enums;


import com.soecode.lyf.common.tld.ICommonEnum;

/***
 ** @category 关系
 ** @author hss
 ** @date 2017年7月2日 下午9:56:33
 ***/
public enum SexEnum implements ICommonEnum {
	/**
	 * 1.男 2.女
	 */
	man(1,"男"),
	woman(2,"女");
	private int key;
	private String value;

    SexEnum(int key, String value) {
		this.key = key;
		this.value = value;
	}
	@Override
	public Integer getKey() {
		return this.key;
	}

	@Override
	public String getValue() {
		return this.value;
	}
	
	public static String getValueByKey(Integer key) {
		for (ICommonEnum item : values()) {
			if (item.getKey() == key) {
				return item.getValue();
			}
		}
		return null;
	}
	
	public static Integer getKeyByValue(String value) {
		for (ICommonEnum item : values()) {
			if (item.getValue().equals(value)) {
				return (Integer)item.getKey();
			}
		}
		return null;
	}
	
	public static Integer getKeyByItemName(String itemName) {
		Integer res = null;
		try{
			res = valueOf(itemName).getKey();
		}catch(IllegalArgumentException |NullPointerException e){
		}
		return res; 
	}
		
	
}
