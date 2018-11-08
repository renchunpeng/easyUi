package com.soecode.lyf.enums;


import com.soecode.lyf.common.tld.ICommonEnum;

/**
 * 通用枚举：基本药物属性0国基药1.省基药2非基药
 * @author
 *
 */
public enum DrugAttr implements ICommonEnum {

	GZY(0, "国基药"),
	SJY(1, "省基药"),
	FJY(2, "非基药");
	private int key;
	private String value;

	private DrugAttr(int key, String value) {
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
		for (ICommonEnum<Integer> item : values()) {
			if (item.getKey() == key) {
				return item.getValue();
			}
		}
		return null;
	}
	
	public static Integer getKeyByValue(String value) {
		for (ICommonEnum<Integer> item : values()) {
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
