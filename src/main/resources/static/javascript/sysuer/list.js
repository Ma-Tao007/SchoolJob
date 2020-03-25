
var contextpath = $("#contextpath").val()
layui.config({
    base: '/' //静态资源所在路径
}).extend({
    index: 'lib/index' //主入口模块
}).use(['index', 'table','form'], function(){
    var admin = layui.admin
        ,table = layui.table
        ,form = layui.form
        ,$ = layui.$;

    table.render({
        elem: '#test-table-height'
        ,url: contextpath + '/sysuser/getList'
        ,toolbar: '#test-table-toolbar-toolbarDemo'
        ,height: 'full-100'
        ,cellMinWidth: 80
        ,page: true
        ,limit: 20
        ,cols: [[
            {type:'checkbox'}
            ,{type:'numbers'}
            ,{field:'username', title: '用户名', width:100}
            ,{field:'sex', title: '性别', width:100,templet:'#test-table-switchTpl', unresize: true}
            ,{field:'phone', title: '电话', minWidth: 150}
            ,{field:'email', title: '邮箱', sort: true, align: 'right'}
            ,{
            field:'kind', title: '角色', sort: true,
                templet:function(row){
                return formatKind(row.kind)
                    },
                minWidth: 100, align: 'right'
                }
            ,{field:'status',title: '状态', sort: true, minWidth: 100,templet: '#test-table-checkboxTpl', align: 'right',unresize: true}
            ,{fixed: 'right', title:'操作', toolbar: '#test-table-toolbar-barDemo', width:150}
        ]]
    });

//监听性别操作
    form.on('switch(test-table-sexDemo)', function(obj){
        var json = JSON.parse(decodeURIComponent($(this).data('json')));
        layer.tips(this.value + ' ' + this.name + '：'+ obj.elem.checked, obj.othis);

        json = table.clearCacheKey(json);
        console.log(json); //当前行数据
    });

//监听锁定操作
    form.on('checkbox(test-table-lockDemo)', function(obj){
        var json = JSON.parse(decodeURIComponent($(this).data('json')));
        layer.tips(this.value + ' ' + this.name + '：'+ obj.elem.checked, obj.othis);

        json = table.clearCacheKey(json);
        console.log(json); //当前行数据
    });

    //头工具栏事件
    table.on('toolbar(test-table-toolbar)', function(obj){
        var checkStatus = table.checkStatus(obj.config.id);
        switch(obj.event){
            case 'getCheckData':
                var data = checkStatus.data;
                layer.alert(JSON.stringify(data));
                break;
            case 'getCheckLength':
                var data = checkStatus.data;
                layer.msg('选中了：'+ data.length + ' 个');
                break;
            case 'isAll':
                layer.msg(checkStatus.isAll ? '全选': '未全选');
                break;
        };
    });

    //监听行工具事件
    table.on('tool(test-table-toolbar)', function(obj){
        var data = obj.data;
        if(obj.event === 'del'){
            layer.confirm('真的删除行么', function(index){
                obj.del();
                layer.close(index);
            });
        } else if(obj.event === 'edit'){
            layer.prompt({
                formType: 2
                ,value: data.email
            }, function(value, index){
                obj.update({
                    email: value
                });
                layer.close(index);
            });
        }
    });

});

function formatKind(kind){
    return kind==0?'管理员':'学生'
}
function formatStatus(status){
    return status==0?"禁用":'启用'
}

