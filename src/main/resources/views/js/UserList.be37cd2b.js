(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["UserList"],{"56ee":function(e,t,r){"use strict";var i=r("d225"),a=r("b0b4"),s=function(){function e(){Object(i["a"])(this,e),this.createTime="",this.createUserId=0,this.email="",this.mobile="",this.password="",this.roleIdList=[],this.status=0,this.userAvatar="",this.userId="0",this.userType=0,this.username=""}return Object(a["a"])(e,null,[{key:"build",value:function(t){var r=new e;return r.createTime=t.createTime,r.email=t.email,r.mobile=t.mobile,r.password=t.password,r.roleIdList=t.roleIdList,r.status=t.status,r.userAvatar=t.userAvatar,r.userId=t.userId,r.userType=t.userType,r.username=t.username,r}}]),e}();r("7f7f");r.d(t,"a",function(){return s})},"575f":function(e,t,r){"use strict";r.d(t,"d",function(){return a}),r.d(t,"b",function(){return s}),r.d(t,"e",function(){return l}),r.d(t,"a",function(){return n}),r.d(t,"f",function(){return o}),r.d(t,"c",function(){return u});var i=r("b32d");function a(e){return Object(i["a"])({url:"/sys/user/list",method:"get",params:e})}function s(){return Object(i["a"])({url:"/sys/role/select",method:"get"})}function l(e){return Object(i["a"])({url:"/sys/user/save",method:"post",data:e})}function n(e){return Object(i["a"])({url:"/sys/user/delete",method:"delete",data:e})}function o(e){return Object(i["a"])({url:"/sys/user/update",method:"put",data:e})}function u(e){var t="/sys/user/getInfo/"+e;return Object(i["a"])({url:t,method:"get"})}},7948:function(e,t,r){"use strict";r.r(t);var i=function(){var e=this,t=e.$createElement,r=e._self._c||t;return r("div",{staticClass:"app-container"},[e.isShowList?r("div",[r("div",{staticClass:"filter-container"},[r("el-input",{staticClass:"filter-item",staticStyle:{width:"200px"},attrs:{clearable:""},nativeOn:{keyup:function(t){return!t.type.indexOf("key")&&e._k(t.keyCode,"enter",13,t.key,"Enter")?null:e.handleFilter(t)}},model:{value:e.listQuery.username,callback:function(t){e.$set(e.listQuery,"username",t)},expression:"listQuery.username"}}),r("el-button",{directives:[{name:"waves",rawName:"v-waves"}],staticClass:"filter-item",staticStyle:{"margin-left":"2px"},attrs:{icon:"el-icon-search"},on:{click:e.handleFilter}},[e._v("\n        "+e._s(e.$t("common.search"))+"\n      ")]),r("el-button",{staticClass:"filter-item",staticStyle:{"margin-left":"10px"},attrs:{type:"primary",icon:"el-icon-plus"},on:{click:e.handleCreate}},[e._v("\n        "+e._s(e.$t("common.create"))+"\n      ")]),r("el-button",{staticClass:"filter-item",staticStyle:{"margin-left":"10px"},attrs:{type:"primary",icon:"el-icon-edit"},on:{click:e.handleEdit}},[e._v("\n        "+e._s(e.$t("common.edit"))+"\n      ")]),r("el-button",{staticClass:"filter-item",attrs:{type:"primary",icon:"el-icon-delete"},on:{click:e.handleDelete}},[e._v("\n        "+e._s(e.$t("common.delete"))+"\n      ")])],1),r("table-list",{attrs:{data:e.list,columns:e.columns,"row-key":e.idKey},on:{handleSortChange:e.handleSortChange,handleSelectionChange:e.handleSelectionChange},scopedSlots:e._u([{key:"status",fn:function(t){return[r("el-tag",{attrs:{type:e._f("statusFilter")(t.row.status)}},[e._v("\n          "+e._s(e._f("statusTextFilter")(t.row.status))+"\n        ")])]}}],null,!1,1440214634)}),r("pagination",{directives:[{name:"show",rawName:"v-show",value:e.total>0,expression:"total > 0"}],attrs:{total:e.total,page:e.listQuery.page,limit:e.listQuery.limit},on:{"update:page":function(t){return e.$set(e.listQuery,"page",t)},"update:limit":function(t){return e.$set(e.listQuery,"limit",t)},pagination:e.getList}})],1):r("div",[r("el-tabs",{attrs:{type:"border-card"}},[r("el-tab-pane",{attrs:{label:e.tabLabel}},[r("edit",{attrs:{id:e.id,type:e.type},on:{"msg-from-child":e.getMsgFromChild}})],1)],1)],1)])},a=[],s=r("b0b4"),l=r("d225"),n=r("308d"),o=r("6bb5"),u=r("4e2b"),c=r("9ab4"),m=r("60a3"),d=r("0bfbe"),p=r("333d"),h=function(){var e=this,t=e.$createElement,r=e._self._c||t;return r("div",{staticClass:"app-container"},[r("el-form",{ref:"ruleForm",staticClass:"demo-ruleForm",attrs:{model:e.ruleForm,rules:e.rules,"label-width":"100px"}},[r("el-form-item",{attrs:{label:"用户名",prop:"username"}},[r("el-input",{model:{value:e.ruleForm.username,callback:function(t){e.$set(e.ruleForm,"username",t)},expression:"ruleForm.username"}})],1),r("el-form-item",{attrs:{prop:"save"===e.type?"password":"",label:"密码"}},[r("el-input",{model:{value:e.ruleForm.password,callback:function(t){e.$set(e.ruleForm,"password",t)},expression:"ruleForm.password"}})],1),r("el-form-item",{attrs:{label:"邮箱",prop:"email"}},[r("el-input",{model:{value:e.ruleForm.email,callback:function(t){e.$set(e.ruleForm,"email",t)},expression:"ruleForm.email"}})],1),r("el-form-item",{attrs:{label:"手机号",prop:"mobile"}},[r("el-input",{model:{value:e.ruleForm.mobile,callback:function(t){e.$set(e.ruleForm,"mobile",t)},expression:"ruleForm.mobile"}})],1),r("el-form-item",{attrs:{label:"角色",prop:"roleIdList"}},[r("el-checkbox-group",{model:{value:e.ruleForm.roleIdList,callback:function(t){e.$set(e.ruleForm,"roleIdList",t)},expression:"ruleForm.roleIdList"}},e._l(e.adminList,function(t){return r("el-checkbox",{key:t.roleId,attrs:{label:t.roleId,name:"roleIdList"}},[e._v("\n          "+e._s(t.roleName)+"\n        ")])}),1)],1),r("el-form-item",{attrs:{label:"状态",prop:"status"}},[r("el-radio-group",{model:{value:e.ruleForm.status,callback:function(t){e.$set(e.ruleForm,"status",t)},expression:"ruleForm.status"}},[r("el-radio",{attrs:{label:0}},[e._v("\n          禁用\n        ")]),r("el-radio",{attrs:{label:1}},[e._v("\n          正常\n        ")])],1)],1),r("el-form-item",{attrs:{label:"用户头像",prop:"userAvatar"}},[r("el-input",{attrs:{placeholder:"用户头像url"},model:{value:e.ruleForm.userAvatar,callback:function(t){e.$set(e.ruleForm,"userAvatar",t)},expression:"ruleForm.userAvatar"}})],1),r("el-form-item",{attrs:{label:"用户类型",prop:"userType"}},[r("el-select",{attrs:{placeholder:"请选择用户类型"},model:{value:e.ruleForm.userType,callback:function(t){e.$set(e.ruleForm,"userType",t)},expression:"ruleForm.userType"}},e._l(e.userTypeList,function(e,t){return r("el-option",{key:e,attrs:{label:e,value:t}})}),1)],1),r("el-form-item",[r("el-button",{attrs:{type:"primary"},on:{click:function(t){return e.submitForm("ruleForm")}}},[e._v("\n        "+e._s(e.$t("common.comfirm"))+"\n      ")]),r("el-button",{on:{click:e.cancel}},[e._v("\n        "+e._s(e.$t("common.cancel"))+"\n      ")])],1)],1)],1)},b=[],f=r("575f"),y=r("56ee"),v=function(e){function t(){var e;return Object(l["a"])(this,t),e=Object(n["a"])(this,Object(o["a"])(t).apply(this,arguments)),e.ruleForm=new y["a"],e.rules={username:[{required:!0,message:"请输入用户名",trigger:"blur"},{min:3,max:16,message:"长度在 3 到 16 个字符",trigger:"blur"}],password:[{required:!0,message:"请输入密码",trigger:"blur"},{min:3,max:32,message:"长度在 3 到 32 个字符",trigger:"blur"}],email:[{required:!0,message:"请输入邮箱",trigger:"blur"},{min:3,max:32,message:"长度在 3 到 32 个字符",trigger:"blur"},{pattern:/^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/,message:"请输入正确邮箱"}],mobile:[{pattern:/^1[34578]\d{9}$/,message:"目前只支持中国大陆的手机号码"}],roleIdList:[{type:"array",required:!0,message:"请至少选择一个角色",trigger:"change"}]},e.adminList=[],e.userTypeList=[],e}return Object(u["a"])(t,e),Object(s["a"])(t,[{key:"created",value:function(){"edit"===this.type&&this.getEditInfo(),this.getAdminList(),this.getUserTypeList()}},{key:"submitForm",value:function(e){var t=this,r=this.$refs[e];r.validate(function(e){if(!e)return console.log("error submit!!"),!1;"edit"===t.type?t.handleEdit():t.handleSubmit()})}},{key:"handleSubmit",value:function(){var e=this;Object(f["e"])(this.ruleForm).then(function(t){e.$emit("msg-from-child",e.type)})}},{key:"handleEdit",value:function(){var e=this;Object(f["f"])(this.ruleForm).then(function(t){e.$emit("msg-from-child",e.type)})}},{key:"cancel",value:function(){this.$emit("msg-from-child","cancel")}},{key:"getAdminList",value:function(){var e=this;Object(f["b"])().then(function(t){e.adminList=t.list})}},{key:"getEditInfo",value:function(){var e=this;Object(f["c"])(this.id).then(function(t){var r=t.user;e.ruleForm=y["a"].build(r)}).catch(function(e){console.log(e)})}},{key:"getUserTypeList",value:function(){this.userTypeList=["后台用户","前端用户","微信用户","QQ用户","微博用户","超级用户"]}}]),t}(m["c"]);c["a"]([Object(m["b"])()],v.prototype,"id",void 0),c["a"]([Object(m["b"])({default:"save"})],v.prototype,"type",void 0),v=c["a"]([Object(m["a"])({name:"UserEdit",components:{}})],v);var g=v,k=g,F=r("2877"),w=Object(F["a"])(k,h,b,!1,null,null,null),O=w.exports,j=r("27cf"),L=r("1162"),_=r("c119"),x=r("c0c7"),$=function(e){function t(){var e;return Object(l["a"])(this,t),e=Object(n["a"])(this,Object(o["a"])(t).apply(this,arguments)),e.userName="",e}return Object(u["a"])(t,e),t}(j["a"]),S=(L["a"],function(e){function t(){var e;return Object(l["a"])(this,t),e=Object(n["a"])(this,Object(o["a"])(t).apply(this,arguments)),e.isShowList=!0,e.listQuery=new $,e.list=[],e.newList=[],e.columns=[{label:"用户ID",key:"userId"},{label:"用户名",key:"username"},{label:"邮箱",key:"email"},{label:"手机号",key:"mobile"},{label:"状态",key:"status",slot:"status"},{label:"创建时间",key:"createTime",width:150}],e.total=0,e.type="",e.id="0",e.multipleSelection=[],e.idKey="userId",e}return Object(u["a"])(t,e),Object(s["a"])(t,[{key:"created",value:function(){this.getList()}},{key:"getList",value:function(){var e=this;Object(f["d"])(this.listQuery).then(function(t){var r=t.page;e.list=r.list,e.total=r.totalCount,e.newList=e.list.map(function(t){return t[e.idKey]});var i=document.querySelectorAll(".el-table__body-wrapper > table > tbody")[0];Object(x["a"])(i,e.list,e.newList)})}},{key:"handleFilter",value:function(){this.listQuery._search=!0,this.listQuery.page=1,this.getList()}},{key:"handleCreate",value:function(){this.type="save",this.isShowList=!1}},{key:"handleEdit",value:function(){var e=this;Object(_["a"])(this.multipleSelection,"one").then(function(){e.id=e.multipleSelection[0][e.idKey],e.type="edit",e.isShowList=!1})}},{key:"handleDelete",value:function(){var e=this;Object(_["a"])(this.multipleSelection).then(function(){e.$confirm("是否确定删除该数据?","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(function(){var t=[];e.multipleSelection.map(function(r){t.push(r[e.idKey])}),Object(f["a"])(t).then(function(t){e.$message({type:"success",message:"删除成功!"}),e.handleFilter()})}).catch(function(){})})}},{key:"handleSortChange",value:function(e){void 0!==e.sidx&&(this.listQuery.sidx=e.sidx),this.listQuery.order=e.order,this.handleFilter()}},{key:"handleSelectionChange",value:function(e){this.multipleSelection=e}},{key:"getMsgFromChild",value:function(e){"cancel"!==e&&this.handleFilter(),this.isShowList=!0}},{key:"tabLabel",get:function(){return"edit"===this.type?this.$t("common.edit"):this.$t("common.create")}}]),t}(m["c"]));S=c["a"]([Object(m["a"])({name:"UserList",components:{TableList:d["a"],Pagination:p["a"],Edit:O},filters:{statusFilter:function(e){var t={1:"success",0:"danger"};return t[e]},statusTextFilter:function(e){var t={1:"正常",0:"禁用"};return t[e]}}})],S);var C=S,I=C,T=Object(F["a"])(I,i,a,!1,null,null,null);t["default"]=T.exports}}]);
//# sourceMappingURL=UserList.be37cd2b.js.map