package com.soecode.lyf.enums;


import com.soecode.lyf.common.tld.ICommonEnum;

/***
 ** @category 关系
 ** @author hss
 ** @date 2017年7月2日 下午9:56:33
 ***/
public enum confirmStatus implements ICommonEnum {
	//drugpur_company_relation  drugpur_company_distri_relation  0待上传合同 1生产企业已上传合同 2配送企业确认并上传合同 3配送关系建立 4 已到期 5解除申请已提交 6已部分解除(drugpur_company_relation) 7已(全部)解除(drugpur_company_distri_relation,drugpur_company_relation) 8拒绝解除 9待同步(drugpur_company_distri_relation) 10待部分同步(drugpur_company_relation) 11待全部同步(drugpur_company_relation)
	dscht(0,"待上传合同"),
	scqysc(1,"生产企业已上传合同"),
	psqysc(2,"配送企业确认并上传合同"),
	gxjl(3,"配送关系建立"),
	ydq(4,"已到期"),
	jcsqytj(5,"生产企业申请解除关系"),
	ybfjc(6,"已部分解除"),
	yqbjc(7,"已解除"),
	jjjc(8,"拒绝解除"),
	dtb(9,"待同步"),
	dbftb(10,"待部分同步"),
	dqbtb(11,"待全部同步");
	private int key;
	private String value;

	private confirmStatus(int key, String value) {
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
