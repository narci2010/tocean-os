(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["wechatCallback"],{"3f1e":function(n,t,e){"use strict";var o=e("879a"),i=e.n(o);i.a},"55d5":function(n,t,e){"use strict";e.r(t);var o=function(){var n=this,t=n.$createElement,e=n._self._c||t;return n.isNeedBinding?e("div",{staticClass:"login-container"},[e("el-form",{ref:"loginForm",staticClass:"login-form",attrs:{model:n.loginForm,rules:n.loginRules,"auto-complete":"on","label-position":"left"}},[e("div",{staticClass:"title-container"},[e("h3",{staticClass:"title"},[n._v("\n        绑定账号\n      ")]),e("lang-select",{staticClass:"set-language"})],1),e("el-form-item",{attrs:{prop:"username"}},[e("span",{staticClass:"svg-container"},[e("svg-icon",{attrs:{"icon-class":"user"}})],1),e("el-input",{attrs:{placeholder:"用户名",name:"username",type:"text","auto-complete":"on"},model:{value:n.loginForm.username,callback:function(t){n.$set(n.loginForm,"username",t)},expression:"loginForm.username"}})],1),e("el-form-item",{attrs:{prop:"password"}},[e("span",{staticClass:"svg-container"},[e("svg-icon",{attrs:{"icon-class":"password"}})],1),e("el-input",{attrs:{type:n.passwordType,placeholder:"密码",name:"password","auto-complete":"on"},nativeOn:{keyup:function(t){return!t.type.indexOf("key")&&n._k(t.keyCode,"enter",13,t.key,"Enter")?null:n.handleBinding(t)}},model:{value:n.loginForm.password,callback:function(t){n.$set(n.loginForm,"password",t)},expression:"loginForm.password"}}),e("span",{staticClass:"show-pwd",on:{click:n.showPwd}},[e("svg-icon",{attrs:{"icon-class":"eye"}})],1)],1),e("el-button",{staticStyle:{width:"100%","margin-bottom":"30px"},attrs:{loading:n.loading,type:"primary"},nativeOn:{click:function(t){return t.preventDefault(),n.handleBinding(t)}}},[n._v("\n      绑定\n    ")])],1)],1):n._e()},i=[],a=e("17b9"),s={name:"WechatCallback",data:function(){return{isNeedBinding:!0,loginForm:{username:"",password:""},passwordType:"password",loginData:{}}},created:function(){var n=this,t={code:this.$route.query.code,state:this.$route.query.state};Object(a["c"])(t).then(function(t){n.loginData={openid:t.openid,state:t.state},!1===t.isNeedBinding||!0===t.isBinding?n.$store.dispatch("LoginByWechat",n.loginData).then(function(){window.opener.location.href=window.location.origin+"/#/home",window.close()}):n.isNeedBinding=!0}).catch(function(){})},methods:{showPwd:function(){"password"===this.passwordType?this.passwordType="":this.passwordType="password"},handleBinding:function(){var n=this;this.$refs.loginForm.validate(function(t){if(!t)return console.log("error submit!!"),!1;n.loading=!0,n.loginForm.openid=n.loginData.openid,n.loginForm.state=n.loginData.state,Object(a["g"])(n.loginForm).then(function(t){n.loading=!1;var e={openid:t.openid,state:t.state};n.$store.dispatch("LoginByWechat",e).then(function(){window.opener.location.href=window.location.origin+"/#/home",window.close()})}).catch(function(){n.loading=!1})})}}},r=s,l=(e("3f1e"),e("a632"),e("2877")),c=Object(l["a"])(r,o,i,!1,null,"d3b0d4de",null);t["default"]=c.exports},"879a":function(n,t,e){},a632:function(n,t,e){"use strict";var o=e("d25f"),i=e.n(o);i.a},d25f:function(n,t,e){}}]);
//# sourceMappingURL=wechatCallback.c7d0088f.js.map