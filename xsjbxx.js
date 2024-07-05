//数据有效性判断
function checkform() {
	var xingming = document.form1.xingming;
	var xuehao = document.form1.xuehao;
	var chushengriqi = document.form1.chushengriqi;
	var youxiang = document.form1.youxiang;
	var beizhu = document.form1.beizhu;

	//姓名
	if (isempty(xingming)) {
		alert("姓名不能为空！");
		document.form1.xingming.focus();
		return false;
	}

	if (!isChinese(xingming)) {
		alert("姓名必须为汉字，请重新输入！");
		document.form1.xingming.focus();
		return false;
	}
	
	if (checkLength(xingming, 4)) {
		alert("姓名长度不多于4个字符，请重新输入！");
		document.form1.xingming.focus();
		return false;
	}

	//学号
	if (isempty(xuehao)) {
		alert("学号不能为空！");
		document.form1.xuehao.focus();
		return false;
	}

	if (checkNumber(xuehao, 8)) {
		alert("学号必须为8位数字，请重新输入！");
		document.form1.xuehao.focus();
		return false;
	}

	if (!isposintger(xuehao)) {
		alert("学号必须为数字，请重新输入！");
		document.form1.xuehao.focus();
		return false;
	}

	//出生日期
	if (isempty(chushengriqi)) {
		alert("出生日期不能为空！");
		document.form1.chushengriqi.focus();
		return false;
	}
	if (isdate(chushengriqi) != true) { //判断日期格式
		alert(isdate(chushengriqi));
		document.form1.chushengriqi.focus();
		return false;
	}

	//电子邮箱
	if (isempty(youxiang)) {
		alert("电子邮箱不能为空！");
		document.form1.youxiang.focus();
		return false;
	}

	if (isMail(youxiang) != true) {
		alert(isMail(youxiang));
		document.form1.youxiang.focus();
		return false;
	}

	if (checkLength(youxiang, 30)) {
		alert("电子邮箱长度不能多于30个字符，请重新输入！");
		document.form1.youxiang.focus();
		return false;
	}

	//备注
	if (beizhu.value != "") {
		if (!isChinese(beizhu)) {
			alert("备注必须为汉字，请重新输入！");
			document.form1.beizhu.focus();
			return false;
		}
		if (checkLength(beizhu, 20)) {
			alert("备注长度不能多于20个字符！");
			document.form1.beizhu.focus();
			return false;
		}
	}
}

//判断函数
function isempty(object) { //检测是否为空
	var str = object.value;
	if (str == null || str == "")
		return true;
	else
		return false;
}

function isChinese(object) { //检测输入是否为中文
	var i;
	for (i = 0; i < object.value.length; i++) {
		if (object.value.charCodeAt(i) >= 32 && object.value.charCodeAt(i) <= 128)//Unicode
			return false;
	}
	return true;
}

function isposintger(object) { //检测输入是否为整数
	var inputstr = object.value.toString();
	var length = inputstr.length;
	if (length > 0) {
		for (var i = 0; i < inputstr.length; i++) {
			var onechar = inputstr.charAt(i);
			if (onechar < "0" || onechar > "9") {
				return false;
			}
		}
		return true;
	} else
		return false;
}

function isMail(youxiang) { //检查邮箱格式
	var youxiang = youxiang.value;
	var i = youxiang.indexOf("@");
	var j = youxiang.lastIndexOf("@");
	var k = youxiang.indexOf(".");
	var message;
	if (i == -1) {
		message = "电子邮箱中无@符号，请重新输入！";
		return message;
	}
	if (i == 0) {
		message = "电子邮箱中@符号不能是第一个字符，请重新输入！";
		return message;
	}
	if (i == youxiang.length - 1) {
		message = "电子邮箱中@符号不能是最后一个字符，请重新输入！";
		return message;
	}
	if (k == -1) {
		message = "电子邮箱中无.符号，请重新输入！";
		return message;
	}
	return true;
}

function checkLength(object, n) { //检验字符串长度
	if (object.length == 0)
		return false;
	if (object.value.length <= n)
		return false;
	else
		return true;
}

function checkNumber(object, n) { //检验学号长度
	if (object.value.length == n)
		return false;
	else
		return true;
}

function isdate(object) { //出生日期格式判断
	var date = object.value;
	var char1 = date.charAt(4);
	var char2 = date.charAt(7);
	var day1 = date.substring(8, 10);
	var length = day1.length;
	var message, flag;

	flag = 0;
	for (var j = 0; j < 4; j++) {//验证年份是否为数字
		var char3 = date.charAt(j);
		if (isNaN(char3)) {//isNaN()确定值是否为非数字
			message = "出生日期请按YYYY-MM-DD格式输入！";
			return message;
		}
	}
	for (var k = 5; k < 7; k++) {
		var char4 = date.charAt(k);
		if (isNaN(char4)) {
			message = "出生日期请按YYYY-MM-DD格式输入！";
			return message;
		}
	}
	for (var l = 8; l < 10; l++) {
		var char5 = date.charAt(l);
		if (isNaN(char5)) {
			message = "出生日期请按YYYY-MM-DD格式输入！";
			return message;
		}
	}
	if (char1 != "-" || char2 != "-" || length < 2) {//检查连接符
		message = "出生日期请按YYYY-MM-DD格式输入！";
		return message;
	} else {
		var year = date.substring(0, 4);
		var month = date.substring(5, 7);
		var day = date.substring(8, 10);
		var bj = 0;
		var message;
		if (year < "1900" || year > "2006") {//年、月、日是否在合理范围内
			message = "年份应在1900-2006之间,";
			bj = 1;
		}
		if (month < "01" || month > "12") {
			if (bj == 1)
				message = message + "月份应在01-12之间，";
			else {
				message = "月份应在01-12之间，";
				bj = 1;
			}
		}
		if (day < "01" || day > "31") {
			if (bj == 1)
				message = message + "日期应在01-31之间，";
			else {
				message = "日期应在01-31之间，";
				bj = 1;
			}
		}
		if (bj == 1) {
			message = "出生日期中" + message + "请重新输入！";
			return message;
		}

		if ((month == "04" || month == "06" || month == "09" || month == "11") && day > "30") {//特殊规则
			message = "出生日期中" + month + "是小月，日期应在01-30之间！";
			bj = 1;
			return message;
		}
		if (year % 4 > 0 && month == "02" && day > 28) {
			message = "出生日期中平年2月份不超过28天！";
			bj = 1;
			return message;
		} else if (month == "02" && day > 29) {
			message = "出生日期中闰年2月份不超过29天！";
			bj = 1;
			return message;
		}

		if (bj == 0)
			return true;
	}
}