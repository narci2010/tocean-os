(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["SociaEdit"],{"3d1c":function(e,t,n){},"4b63":function(e,t,n){},c2c8:function(e,t,n){"use strict";n.r(t);var i=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{staticClass:"app-container"},[n("el-form",{ref:"ruleForm",staticClass:"demo-ruleForm",attrs:{model:e.ruleForm,"label-width":"170px"}},[n("el-form-item",{attrs:{label:"微信登陆是否需要绑定"}},[n("el-switch",{attrs:{"active-text":"是"},model:{value:e.ruleForm.wechatNeedBinding,callback:function(t){e.$set(e.ruleForm,"wechatNeedBinding",t)},expression:"ruleForm.wechatNeedBinding"}})],1),n("el-form-item",{attrs:{label:"sina登陆是否需要绑定"}},[n("el-switch",{attrs:{"active-text":"是"},model:{value:e.ruleForm.sinaNeedBinding,callback:function(t){e.$set(e.ruleForm,"sinaNeedBinding",t)},expression:"ruleForm.sinaNeedBinding"}})],1),n("el-form-item",{attrs:{label:"qq登陆是否需要绑定"}},[n("el-switch",{attrs:{"active-text":"是"},model:{value:e.ruleForm.qqNeedBinding,callback:function(t){e.$set(e.ruleForm,"qqNeedBinding",t)},expression:"ruleForm.qqNeedBinding"}})],1),n("el-button",{attrs:{type:"primary"},on:{click:function(t){return e.submitForm("ruleForm")}}},[e._v("\n      "+e._s(e.$t("common.comfirm"))+"\n    ")]),n("el-button",{on:{click:e.getData}},[e._v("\n      "+e._s(e.$t("common.cancel"))+"\n    ")])],1)],1)},a=[],r=n("b32d");function o(e){return Object(r["a"])({url:"/social/config",method:"get",params:e})}function c(e){return Object(r["a"])({url:"/social/saveConfig",method:"post",data:e})}var s=n("f0d0"),l={name:"SociaEdit",directives:{waves:s["a"]},data:function(){return{ruleForm:{}}},created:function(){this.getData()},methods:{getData:function(){var e=this;this.listLoading=!0,o().then(function(t){console.log(t),e.ruleForm=t.config})},submitForm:function(){var e=this;c(this.ruleForm).then(function(t){e.$message({type:"success",message:"保存成功"})})}}},u=l,m=(n("dd2f"),n("f547"),n("2877")),d=Object(m["a"])(u,i,a,!1,null,"4a9954aa",null);t["default"]=d.exports},dd2f:function(e,t,n){"use strict";var i=n("4b63"),a=n.n(i);a.a},f547:function(e,t,n){"use strict";var i=n("3d1c"),a=n.n(i);a.a}}]);
//# sourceMappingURL=SociaEdit.e1c6d14f.js.map