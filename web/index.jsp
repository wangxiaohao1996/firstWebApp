<%--
  Created by IntelliJ IDEA.
  User: 王志豪
  Date: 2023/5/21
  Time: 19:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>王志豪</title>
</head>
<body>
<script type="text/javascript">
  /*
     表单验证需求：
     1、用户名不能为空
     2、用户名必须在6~14位之间
     3、用户名只能有数字和字母组成，不能含有其它符号（正则表达式）
     4、密码和确认密码一致，邮箱地址合法。
     5、统一失去焦点验证
     6、错误提示信息统一在span标签中，并且要求字体12号，红色
     7、文本框再次获得焦点后，清空错误提示信息，如果文本框中数据不合法要求清空文本框的value
     8、最终表单中所有项均合法方可提交

     解析所要添加的标签：用户名、密码、确认密码、邮箱、提交
  */
  window.onload=function(){                                                        //函数
    this.username;
    //密码框的value
    this.passWord;
    //确认密码框的value
    this.passWord1
    //邮箱框的value
    this.Email;

    //设置用户名框
    //给用户框绑定获得焦点事件
    document.getElementById("myusername").onfocus=function(){                       //函数
      var userName = document.getElementById("myusername").value;
      var unre = /^[A-Za-z0-9]{6,14}$/;
      var booleanunre = unre.test(userName);
      if(!booleanunre){
        //如果用户名格式错误，获得焦点的时候把用户名清空
        document.getElementById("myusername").value="";
      }
      //当用户名文本框获得焦点的时候，将id=usernamespan的span图层清空
      document.getElementById("usernamespan").innerHTML="";
    }

    //给用户框绑定失去焦点事件
    document.getElementById("myusername").onblur=function(){                      //函数
      var userName = document.getElementById("myusername").value;
      //去掉字符串两端空白
      var uN = userName.trim();
      //alert("---->"+uN+"<----");
      var unre = /^[A-Za-z0-9]{6,14}$/;
      var booleanunre = unre.test(userName);
      if(booleanunre){
      }else{
        if(uN==""){
          document.getElementById("usernamespan").innerHTML="<font size=1 color=red>用户名不能为空</font>";
        }else{
          document.getElementById("usernamespan").innerHTML="<font size=1 color=red>用户名必须由6~14个字母、数字组成</font>";
        }
      }
    }

    //设置密码框
    //给密码框绑定获得焦点事件
    document.getElementById("mypassword").onfocus=function(){                       //函数
      passWord = document.getElementById("mypassword").value;
      var psre = /^[A-Za-z0-9]{6,14}$/;
      var booleanpsre = psre.test(passWord);
      if(!booleanpsre){
        //如果密码格式错误，获得焦点的时候把密码清空
        document.getElementById("mypassword").value="";
      }
      //当用密码文本框获得焦点的时候，将id=passwordspan的span图层内容清空
      document.getElementById("passwordspan").innerHTML="";
    }

    //给密码框绑定失去焦点事件
    document.getElementById("mypassword").onblur=function(){                        //函数
      passWord = document.getElementById("mypassword").value;
      var pW = passWord.trim();
      var psre = /^[A-Za-z0-9]{6,14}$/;
      var booleanpsre = psre.test(passWord);
      if(booleanpsre){
      }else{
        if(pW==""){
          document.getElementById("passwordspan").innerHTML="<font size=1 color=red>密码不能为空</font>";
        }else{
          document.getElementById("passwordspan").innerHTML="<font size=1 color=red>密码必须由6~14个字母、数字组成</font>";
        }
      }
    }

    //设置确认密码框
    //给确认密码框绑定获得焦点事件
    document.getElementById("mypassword1").onfocus=function(){                   //函数
      passWord1 = document.getElementById("mypassword1").value;
      if(passWord1!==passWord){
        //如果两次输入的密码不一致，失去焦点的时候把确认密码清空
        document.getElementById("mypassword1").value="";
      }
      //当用密码文本框获得焦点的时候，将id=passwordspan1的span图层内容清空
      document.getElementById("password1span").innerHTML="";
    }
    //给确认密码框绑定失去焦点事件
    document.getElementById("mypassword1").onblur=function(){                   //函数
      passWord1 = document.getElementById("mypassword1").value;
      if(passWord1!==passWord){
        document.getElementById("password1span").innerHTML="<font size=1 color=red>两次输入的密码不一致</font>";
      }else{
      }
    }

    //设置邮箱文本框
    //给邮箱框绑定获得焦点事件
    document.getElementById("myemail").onfocus=function(){                      //函数
      Email = document.getElementById("myemail").value;
      var ere = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
      //验证输入的邮箱是否匹配
      var boolean = ere.test(Email);
      //如果邮箱格式错误，获得焦点的时候把邮箱清空
      if(!boolean ){
        document.getElementById("myemail").value="";
      }
      //当用邮箱文本框获得焦点的时候，将id=emailspan的span图层内容清空
      document.getElementById("emailspan").innerHTML="";
    }
    //给邮箱框绑定失去焦点事件
    document.getElementById("myemail").onblur=function(){                      //函数
      Email = document.getElementById("myemail").value;
      var e = Email.trim();
      var ere = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
      //验证输入的邮箱是否匹配
      var boolean = ere.test(Email);
      if(boolean){

      }else{
        if(e==""){
          document.getElementById("emailspan").innerHTML="<font size=1 color=red>邮箱不能为空</font>";
        }else{
          document.getElementById("emailspan").innerHTML="<font size=1 color=red>邮箱必须包含@</font>";
        }

      }
    }

    document.getElementById("mybutton").onclick=function(){                     //函数
      //alert(username);//true
      if( document.getElementById("usernamespan").innerHTML===""&&document.getElementById("passwordspan").innerHTML==""&&document.getElementById("emailspan").innerHTML==""){
        var form = document.getElementById("myform");
        form.action="http://localhost:safafda/dafd";
        form.submit();
      }
    }

  }
</script>
<form  Method="get" id="myform">
  <font color="black" size="3">用户名</font><br>
  <input type="text" id="myusername" name="username"/>
  <span id="usernamespan"></span>
  <br><br>

  <font color="black" size="3">密码</font><br>
  <input type="password" id="mypassword" name="password"/>
  <span id="passwordspan"></span>
  <br><br>

  <font color="black" size="3">确认密码</font><br>
  <input type="password" id="mypassword1" name="password1"/>
  <span id="password1span"></span>
  <br><br>
  <font color="black" size="3">邮箱</font><br>
  <input type="text" name="email" id="myemail"/>
  <span id="emailspan"></span><br>
  <br><br>
  <input type="button" value="注册" id="mybutton"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="reset" value="重置" id="myreset"/>

</form>
<style type="text/css">
  #myform{
    position:absolute;
    top:100px;
    left:600px;
  }
  span{
    width:100px;
    height:10px;
  }

</style>
</body>
</html>
