(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["MenuManage"],{1576:function(e,t,n){"use strict";n.r(t);var l=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{staticClass:"app-container"},[e.isShowList?n("div",[n("div",{staticClass:"filter-container"},[n("el-button",{staticClass:"filter-item",staticStyle:{"margin-left":"10px"},attrs:{type:"primary",icon:"el-icon-plus"},on:{click:e.handleCreate}},[e._v("\n        "+e._s(e.$t("common.create"))+"\n      ")]),n("el-button",{staticClass:"filter-item",staticStyle:{"margin-left":"10px"},attrs:{type:"primary",icon:"el-icon-edit"},on:{click:e.handleEdit}},[e._v("\n        "+e._s(e.$t("common.edit"))+"\n      ")]),n("el-button",{staticClass:"filter-item",attrs:{type:"primary",icon:"el-icon-delete"},on:{click:e.handleDelete}},[e._v("\n        "+e._s(e.$t("common.delete"))+"\n      ")]),n("el-button",{staticClass:"filter-item",attrs:{type:"primary"},on:{click:e.handleIcon}},[e._v("\n        图标\n      ")])],1),n("TreeTable",{attrs:{data:e.list,columns:e.columns,single:"",border:""},on:{handleSelectionChange:e.handleSelectionChange},scopedSlots:e._u([{key:"type",fn:function(t){return[e._v("\n        "+e._s(e._f("statusFilter")(t.row.type))+"\n      ")]}}],null,!1,3555681243)})],1):n("div",[n("el-tabs",{attrs:{type:"border-card"}},[n("el-tab-pane",{attrs:{label:e.tabLabel}},[n("edit",{attrs:{id:e.id,type:e.type},on:{"msg-from-child":e.getMsgFromChild}})],1)],1)],1)])},a=[],i=n("b0b4"),r=n("d225"),o=n("308d"),s=n("6bb5"),u=n("4e2b"),c=n("9ab4"),m=n("60a3"),d=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("el-table",e._b({attrs:{data:e.formatData,"row-class-name":e.showRow},on:{"selection-change":e.handleSelectionChange,select:e.select}},"el-table",e.$attrs,!1),[n("el-table-column",{attrs:{type:"selection",width:"55"}}),0===e.columns.length?n("el-table-column",{attrs:{width:"150"},scopedSlots:e._u([{key:"default",fn:function(t){return[e._l(t.row._level,function(e){return n("span",{key:e,staticClass:"ms-tree-space"})}),e.iconShow(0,t.row)?n("span",{staticClass:"tree-ctrl",on:{click:function(n){return e.toggleExpanded(t.$index)}}},[t.row._expanded?n("i",{staticClass:"el-icon-minus"}):n("i",{staticClass:"el-icon-plus"})]):e._e(),e._v("\n      "+e._s(t.$index)+"\n    ")]}}],null,!1,3406409064)}):e._l(e.columns,function(t,l){return n("el-table-column",{key:t.key,attrs:{label:t.label,width:t.width},scopedSlots:e._u([{key:"default",fn:function(a){return[e._l(a.row._level,function(t){return n("span",{key:t},[0===l?n("span",{staticClass:"ms-tree-space"}):e._e()])}),e.iconShow(l,a.row)?n("span",{staticClass:"tree-ctrl",on:{click:function(t){return e.toggleExpanded(a.$index)}}},[a.row._expanded?n("i",{staticClass:"el-icon-minus"}):n("i",{staticClass:"el-icon-plus"})]):e._e(),t.slot?n("span",[e._t(t.slot,null,{row:a.row})],2):n("span",[e._v("\n        "+e._s(a.row[t.key])+"\n      ")])]}}],null,!0)})}),e._t("default")],2)},p=[],h=n("a745"),f=n.n(h),b=n("774e"),v=n.n(b),y=(n("ac6a"),n("2b0e"));function g(e,t){var n=arguments.length>2&&void 0!==arguments[2]?arguments[2]:null,l=arguments.length>3?arguments[3]:void 0,a=[];return v()(e).forEach(function(e){void 0===e._expanded&&y["default"].set(e,"_expanded",t);var i=1;if(void 0!==l&&null!==l&&(i=l+1),y["default"].set(e,"_level",i),n&&y["default"].set(e,"parent",n),a.push(e),e.list&&e.list.length>0){var r=g(e.list,t,e,i);a=a.concat(r)}}),a}var k=function(e){function t(){return Object(r["a"])(this,t),Object(o["a"])(this,Object(s["a"])(t).apply(this,arguments))}return Object(u["a"])(t,e),Object(i["a"])(t,[{key:"showRow",value:function(e){var t=!e.row.parent||e.row.parent._expanded&&e.row.parent._show;return e.row._show=t,t?"animation":"hidden"}},{key:"toggleExpanded",value:function(e){var t=this.formatData[e];t._expanded=!t._expanded}},{key:"iconShow",value:function(e,t){return 0===e&&t.list&&t.list.length>0}},{key:"handleSelectionChange",value:function(e){this.$emit("handleSelectionChange",e)}},{key:"select",value:function(e,t){this.single&&e.length>1&&e.shift()}},{key:"formatData",get:function(){var e;e=f()(this.data)?this.data:[this.data];var t=this.evalFunc||g,n=this.evalArgs?[e,this.expandAll].concat(this.evalArgs):[e,this.expandAll];return t.apply(null,n)}}]),t}(m["c"]);c["a"]([Object(m["b"])({required:!0})],k.prototype,"data",void 0),c["a"]([Object(m["b"])({required:!0})],k.prototype,"columns",void 0),c["a"]([Object(m["b"])({default:!1})],k.prototype,"single",void 0),c["a"]([Object(m["b"])()],k.prototype,"evalFunc",void 0),c["a"]([Object(m["b"])()],k.prototype,"evalArgs",void 0),c["a"]([Object(m["b"])({default:!1})],k.prototype,"expandAll",void 0),k=c["a"]([Object(m["a"])({name:"TreeTable"})],k);var _=k,F=_,w=(n("e9b3"),n("ed25"),n("2480"),n("2877")),O=Object(w["a"])(F,d,p,!1,null,"85387586",null),j=O.exports,x=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{staticClass:"app-container"},[n("el-form",{ref:"ruleForm",staticClass:"demo-ruleForm",attrs:{model:e.ruleForm,rules:e.rules,"label-width":"100px"}},[n("el-form-item",{attrs:{label:"类型",prop:"type"}},[n("el-radio-group",{model:{value:e.ruleForm.type,callback:function(t){e.$set(e.ruleForm,"type",t)},expression:"ruleForm.type"}},[n("el-radio",{attrs:{label:0}},[e._v("\n          目录\n        ")]),n("el-radio",{attrs:{label:1}},[e._v("\n          菜单\n        ")]),n("el-radio",{attrs:{label:2}},[e._v("\n          按钮\n        ")])],1)],1),n("el-form-item",{attrs:{label:"菜单名称",prop:"name"}},[n("el-input",{attrs:{placeholder:"菜单名称或按钮名称"},model:{value:e.ruleForm.name,callback:function(t){e.$set(e.ruleForm,"name",t)},expression:"ruleForm.name"}})],1),n("el-form-item",{attrs:{label:"上级菜单",prop:"parentName"}},[n("el-input",{attrs:{readonly:""},nativeOn:{click:function(t){e.isShowDialog=!0}},model:{value:e.ruleForm.parentName,callback:function(t){e.$set(e.ruleForm,"parentName",t)},expression:"ruleForm.parentName"}})],1),1===e.ruleForm.type||0===e.ruleForm.type?n("el-form-item",{attrs:{label:"菜单URL",prop:"url"}},[n("el-input",{attrs:{placeholder:"菜单URL"},model:{value:e.ruleForm.url,callback:function(t){e.$set(e.ruleForm,"url",t)},expression:"ruleForm.url"}})],1):e._e(),1===e.ruleForm.type||2===e.ruleForm.type?n("el-form-item",{attrs:{label:"授权标识",prop:"perms"}},[n("el-input",{attrs:{placeholder:"多个用逗号分隔，如：user:list,user:create"},model:{value:e.ruleForm.perms,callback:function(t){e.$set(e.ruleForm,"perms",t)},expression:"ruleForm.perms"}})],1):e._e(),2!==e.ruleForm.type?n("el-form-item",{attrs:{label:"排序号"}},[n("el-input",{attrs:{placeholder:"排序号"},model:{value:e.ruleForm.orderNum,callback:function(t){e.$set(e.ruleForm,"orderNum",t)},expression:"ruleForm.orderNum"}})],1):e._e(),2!==e.ruleForm.type?n("el-form-item",{attrs:{label:"图标"}},[n("el-input",{attrs:{placeholder:"菜单图标"},model:{value:e.ruleForm.icon,callback:function(t){e.$set(e.ruleForm,"icon",t)},expression:"ruleForm.icon"}}),n("code",{staticStyle:{"margin-top":"4px",display:"block"}},[e._v("获取图标：http://fontawesome.io/icons/")])],1):e._e(),2!==e.ruleForm.type?n("el-form-item",{attrs:{label:"是否可见"}},[n("el-switch",{attrs:{"active-value":1,"inactive-value":0,"active-color":"#13ce66","inactive-color":"#ff4949"},model:{value:e.ruleForm.isDisplay,callback:function(t){e.$set(e.ruleForm,"isDisplay",t)},expression:"ruleForm.isDisplay"}})],1):e._e(),n("el-form-item",[n("el-button",{attrs:{type:"primary"},on:{click:function(t){return e.submitForm("ruleForm")}}},[e._v("\n        "+e._s(e.$t("common.comfirm"))+"\n      ")]),n("el-button",{on:{click:e.cancel}},[e._v("\n        "+e._s(e.$t("common.cancel"))+"\n      ")])],1)],1),n("el-dialog",{directives:[{name:"drag-dialog",rawName:"v-drag-dialog"}],attrs:{visible:e.isShowDialog,title:"选择菜单"},on:{"update:visible":function(t){e.isShowDialog=t}}},[n("el-tree",{ref:"tree",attrs:{data:e.selectList,props:e.defaultProps,"highlight-current":!0,"expand-on-click-node":!1,"node-key":"menuId",accordion:""},on:{"node-click":e.handleNodeClick}}),n("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[n("el-button",{on:{click:function(t){e.isShowDialog=!1}}},[e._v("\n        "+e._s(e.$t("common.cancel"))+"\n      ")]),n("el-button",{attrs:{type:"primary"},on:{click:function(t){return e.handleChange("ruleForm")}}},[e._v("\n        "+e._s(e.$t("common.comfirm"))+"\n      ")])],1)],1)],1)},S=[],$=(n("7f7f"),n("b32d"));function C(e){return Object($["a"])({url:"/sys/menu/list",method:"get",params:e})}function I(e){var t="/sys/menu/info/"+e;return Object($["a"])({url:t,method:"get"})}function L(){return Object($["a"])({url:"/sys/menu/select",method:"get"})}function N(e){return Object($["a"])({url:"/sys/menu/save",method:"post",data:e})}function E(e){return Object($["a"])({url:"/sys/menu/update",method:"put",data:e})}function D(e){var t="/sys/menu/delete/"+e;return Object($["a"])({url:t,method:"delete"})}var M=n("c328"),T=n("a32f"),A=function(e){function t(){var e;return Object(r["a"])(this,t),e=Object(o["a"])(this,Object(s["a"])(t).apply(this,arguments)),e.ruleForm=new M["a"],e.rules={name:[{required:!0,message:"请输入菜单名称",trigger:"blur"}],url:[{required:!0,message:"请输入菜单url",trigger:"blur"}]},e.defaultProps={children:"list",label:"name"},e.isShowDialog=!1,e.selectMenu=new M["a"],e.selectList=[],e}return Object(u["a"])(t,e),Object(i["a"])(t,[{key:"created",value:function(){this.ruleForm.parentId="0",this.ruleForm.parentName="一级菜单","edit"===this.type&&this.getEditInfo(),this.getMenuList()}},{key:"submitForm",value:function(e){var t=this,n=this.$refs[e];n.validate(function(e){if(!e)return console.log("error submit!!"),!1;"edit"===t.type?t.handleEdit():t.handleSubmit()})}},{key:"handleSubmit",value:function(){var e=this;N(this.ruleForm).then(function(t){e.$emit("msg-from-child",e.type)})}},{key:"handleEdit",value:function(){var e=this;E(this.ruleForm).then(function(t){e.$emit("msg-from-child",e.type)})}},{key:"cancel",value:function(){this.$emit("msg-from-child","cancel")}},{key:"getMenuList",value:function(){var e=this;L().then(function(t){var n=Object(T["a"])(t.menuList);e.selectList=[{name:"一级菜单",menuId:0,list:n}],"edit"===e.type&&e.getEditInfo()})}},{key:"getEditInfo",value:function(){var e=this;I(this.id).then(function(t){var n=t.menu;e.ruleForm=M["a"].build(n);for(var l=0;l<e.selectList.length;l++){if(e.selectList[l].menuId===e.ruleForm.parentId){e.ruleForm.parentName=e.selectList[l].name;break}for(var a=0,i=e.selectList[l].list.length;a<i;a++){var r=e.selectList[l].list[a];if(r.menuId===e.ruleForm.parentId){e.ruleForm.parentName=r.name;break}for(var o=0,s=r.list.length;o<s;o++){var u=r.list[o];if(u.menuId===e.ruleForm.parentId){e.ruleForm.parentName=u.name;break}}}}}).catch(function(e){console.log(e)})}},{key:"handleNodeClick",value:function(e){this.selectMenu=e}},{key:"handleChange",value:function(){this.ruleForm.parentName=this.selectMenu.name,this.ruleForm.parentId=this.selectMenu.menuId,this.isShowDialog=!1}}]),t}(m["c"]);c["a"]([Object(m["b"])()],A.prototype,"id",void 0),c["a"]([Object(m["b"])({default:"save"})],A.prototype,"type",void 0),A=c["a"]([Object(m["a"])({name:"MenuEdit"})],A);var R=A,q=R,B=Object(w["a"])(q,x,S,!1,null,null,null),Q=B.exports,K=n("27cf"),U=n("c119"),J=function(e){function t(){var e;return Object(r["a"])(this,t),e=Object(o["a"])(this,Object(s["a"])(t).apply(this,arguments)),e.menuName="",e}return Object(u["a"])(t,e),t}(K["a"]),P=function(e){function t(){var e;return Object(r["a"])(this,t),e=Object(o["a"])(this,Object(s["a"])(t).apply(this,arguments)),e.isShowList=!0,e.listQuery=new J,e.list=[],e.newList=[],e.columns=[{label:"菜单ID",key:"menuId"},{label:"菜单名称",key:"name"},{label:"上级菜单",key:"parentName"},{label:"图标",key:"icon"},{label:"类型",key:"type",slot:"type"},{label:"排序号",key:"orderNum"},{label:"菜单URL",key:"url"},{label:"权限标识",key:"perms"}],e.total=0,e.type="",e.id="0",e.multipleSelection=[],e.idKey="menuId",e}return Object(u["a"])(t,e),Object(i["a"])(t,[{key:"created",value:function(){this.getList()}},{key:"getList",value:function(){var e=this;C(this.listQuery).then(function(t){e.list=Object(T["a"])(t.menuList)})}},{key:"handleFilter",value:function(){this.listQuery._search=!0,this.listQuery.page=1,this.getList()}},{key:"handleCreate",value:function(){this.type="save",this.isShowList=!1}},{key:"handleEdit",value:function(){var e=this;Object(U["a"])(this.multipleSelection,"one").then(function(){e.id=e.multipleSelection[0][e.idKey],e.type="edit",e.isShowList=!1})}},{key:"handleDelete",value:function(){var e=this;Object(U["a"])(this.multipleSelection,"one").then(function(){e.$confirm("是否确定删除该数据?","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(function(){var t=[];e.multipleSelection.map(function(n){t.push(n[e.idKey])}),D(t).then(function(t){e.$message({type:"success",message:"删除成功!"}),e.handleFilter()})}).catch(function(){})})}},{key:"handleSelectionChange",value:function(e){this.multipleSelection=e}},{key:"getMsgFromChild",value:function(e){"cancel"!==e&&this.handleFilter(),this.isShowList=!0}},{key:"handleIcon",value:function(){this.$router.push("/example/icon")}},{key:"tabLabel",get:function(){return"edit"===this.type?this.$t("common.edit"):this.$t("common.create")}}]),t}(m["c"]);P=c["a"]([Object(m["a"])({name:"MenuManage",components:{TreeTable:j,Edit:Q},filters:{statusFilter:function(e){var t=["目录","菜单","按钮"];return t[e]}}})],P);var z=P,G=z,H=Object(w["a"])(G,l,a,!1,null,null,null);t["default"]=H.exports},2480:function(e,t,n){"use strict";var l=n("b96d"),a=n.n(l);a.a},"27cf":function(e,t,n){"use strict";n("ac6a");var l=n("d225"),a=n("b0b4"),i=function(){function e(){Object(l["a"])(this,e),this.page=1,this.limit=10,this._search=!0,this.sidx="",this.order="desc"}return Object(a["a"])(e,null,[{key:"build",value:function(t){var n=new e;return n.page=t.page,n.limit=t.limit,n._search=t._search,n.sidx=t.sidx,n.order=t.order,n}},{key:"builds",value:function(e){var t=this,n=[];return e.forEach(function(e){var l=t.build(e);n.push(l)}),n}}]),e}();n.d(t,"a",function(){return i})},a32f:function(e,t,n){"use strict";function l(e){var t=[];e.map(function(e){"0"===e.parentId&&t.push(e)});for(var n=function(n){var l=t[n];l.list=[],e.map(function(e){e.parentId===l.menuId&&l.list.push(e)});for(var a=function(t,n){l.list[t].list=[],e.map(function(e){e.parentId===l.list[t].menuId&&l.list[t].list.push(e)});for(var a=function(n,a){l.list[t].list[n].list=[],e.map(function(e){e.parentId===l.list[t].list[n].menuId&&l.list[t].list[n].list.push(e)})},i=0,r=l.list[t].list.length;i<r;i++)a(i,r)},i=0,r=l.list.length;i<r;i++)a(i,r)},l=0;l<t.length;l++)n(l);return t}n.d(t,"a",function(){return l})},b96d:function(e,t,n){},be00:function(e,t,n){},c119:function(e,t,n){"use strict";n.d(t,"a",function(){return r});var l=n("795b"),a=n.n(l),i=n("5c96");function r(e,t){return new a.a(function(n,l){0===e.length?i["MessageBox"].alert("请选择一条记录"):"one"===t&&e.length>1?i["MessageBox"].alert("只能选择一条记录"):n()})}},c79c:function(e,t,n){},e9b3:function(e,t,n){"use strict";var l=n("be00"),a=n.n(l);a.a},ed25:function(e,t,n){"use strict";var l=n("c79c"),a=n.n(l);a.a}}]);
//# sourceMappingURL=MenuManage.254a892a.js.map