$(function() {
	$("#jqGrid").jqGrid({
		url : baseURL + 'sys/syslisence',
		datatype : "json",
		colModel : [ {
			label : 'lisenceId',
			name : 'lisenceId',
			index : 'lisence_id',
			width : 50,
			key : true
		}, {
			label : '私钥',
			name : 'privatekey',
			index : 'privateKey',
			width : 80
		}, {
			label : '公钥',
			name : 'publickey',
			index : 'publicKey',
			width : 80
		}, {
			label : '私钥2',
			name : 'privatekey2',
			index : 'privateKey2',
			width : 80
		}, {
			label : '公钥2',
			name : 'publickey2',
			index : 'publicKey2',
			width : 80
		}, {
			label : '系统唯一标识',
			name : 'systemuid',
			index : 'systemUid',
			width : 80
		}, {
			label : '授权key',
			name : 'signkey',
			index : 'signKey',
			width : 80
		}, {
			label : '申请日期',
			name : 'applydate',
			index : 'applyDate',
			width : 80
		}, {
			label : '授权日期',
			name : 'grantdate',
			index : 'grantDate',
			width : 80
		}, {
			label : '使用类型',
			name : 'usingtype',
			index : 'usingType',
			width : 80
		}, {
			label : '服务器IP',
			name : 'serverHost',
			index : 'serverHost',
			width : 80
		}, {
			label : '系统名称',
			name : 'systemName',
			index : 'systemName',
			width : 80
		}, {
			label : '授权期限',
			name : 'dueDays',
			index : 'dueDays',
			width : 80
		}, {
			label : '服务完整URL',
			name : 'serverUrl',
			index : 'serverUrl',
			width : 80
		} ],
		viewrecords : true,
		height : 385,
		rowNum : 10,
		rowList : [ 10, 30, 50 ],
		rownumbers : true,
		rownumWidth : 25,
		autowidth : true,
		multiselect : true,
		pager : "#jqGridPager",
		jsonReader : {
			root : "page.list",
			page : "page.currPage",
			total : "page.totalPage",
			records : "page.totalCount"
		},
		prmNames : {
			page : "page",
			rows : "limit",
			order : "order"
		},
		gridComplete : function() {
			// 隐藏grid底部滚动条
			$("#jqGrid").closest(".ui-jqgrid-bdiv").css({
				"overflow-x" : "hidden"
			});
		}
	});
});

var vm = new Vue({
	el : '#rrapp',
	data : {
		showList : true,
		isGrant : false,
		title : null,
		q : {
			key : null
		},
		// Get more form https://chmln.github.io/flatpickr/options/
		config : {
			defaultDate : "today",
			enableTime : true
		},
		sysLisence : {}
	},

	methods : {
		query : function() {
			vm.reload();
		},
		add : function() {
			vm.showList = false;
			vm.title = "新增";
			vm.sysLisence = {};
		},
		grantInit : function() {
			var lisenceId = getSelectedRow();
			if (lisenceId == null) {
				return;
			}
			vm.showList = false;
			vm.isGrant = true;
			vm.title = "授权";
			vm.getInfo(lisenceId)
		},
		update : function(event) {
			var lisenceId = getSelectedRow();
			if (lisenceId == null) {
				return;
			}
			vm.showList = false;
			vm.title = "修改";

			vm.getInfo(lisenceId)
		},
		saveOrUpdate : function(event) {
			var httpmethod = vm.sysLisence.lisenceId == null ? "POST" : "PUT";
			var url = vm.sysLisence.lisenceId == null ? "sys/syslisence"
					: "sys/syslisence";
			$.ajax({
				type : httpmethod,
				url : baseURL + url,
				contentType : "application/json",
				data : JSON.stringify(vm.sysLisence),
				success : function(r) {
					if (r.code === 0) {
						alert('操作成功', function(index) {
							vm.reload();
						});
					} else {
						alert(r.msg);
					}
				}
			});
		},
		del : function(event) {
			var lisenceIds = getSelectedRows();
			if (lisenceIds == null) {
				return;
			}

			confirm('确定要删除选中的记录？', function() {
				$.ajax({
					type : "DELETE",
					url : baseURL + "sys/syslisence",
					contentType : "application/json",
					data : JSON.stringify(lisenceIds),
					success : function(r) {
						if (r.code == 0) {
							alert('操作成功', function(index) {
								$("#jqGrid").trigger("reloadGrid");
							});
						} else {
							alert(r.msg);
						}
					}
				});
			});
		},
		getInfo : function(lisenceId) {
			$.get(baseURL + "sys/syslisence/" + lisenceId, function(r) {
				vm.sysLisence = r.sysLisence;
			});
		},
		grantNow : function() {
			$.ajax({
				url : baseURL + "sys/syslisence/grant/"
						+ vm.sysLisence.lisenceId + "?dueDays="
						+ vm.sysLisence.dueDays,
				type : 'PUT',
				success : function(response) {
					console.log(response)
					if (response.code == 0) {
						alert("授权成功。")
						vm.reload()
					} else {
						alert("授权失败。")
					}
				}
			});
			vm.isGrant = false;

		},
		reload : function(event) {
			vm.showList = true;
			vm.isGrant = false;
			var page = $("#jqGrid").jqGrid('getGridParam', 'page');
			$("#jqGrid").jqGrid('setGridParam', {
				postData : {
					'key' : vm.q.key
				},
				page : page
			}).trigger("reloadGrid");
		}
	}
});