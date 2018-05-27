<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
        <link http-equiv="content-typee" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
        <link href="https://cdn.bootcss.com/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css" rel="stylesheet">
        <style>
            body{
                height: 100%;
                width: 100%;
            }
            label.col-2{
                text-align:right;
                padding-right: 3px;
                padding-top: 5px;
            }
            div.form-group.col-2{
                padding-left: 0px;
                border-left: 0px;
                margin-left: 0px;
            }
            .form-control{
                display: inline-block;
            }
            div.row{
                width:  100%;
            }
            .data-area{
                text-align:center;
                height: 100%;
            }
            .table-1{
                background-color:white;
                overflow:auto;
                text-align:center;
                margin: 0 auto;
                height: 140px;
                width: 80%;
                border-bottom: 1px solid lightgray;
            }
            .table-2{
                overflow:auto;
                border-top: 1px solid lightgray;
                background-color:white;
                text-align:center;
                margin: 0 auto;
                width: 80%;
            }
            .sync-data{
                padding-top: 10px;
                padding-bottom: 10px;
                text-align:center;
                margin:auto;
                width:80%;
                height: 50px;
            }
            .datepick-label{
                padding-top: 10px;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-light bg-light">
        <div class="container">
            <div class="row">
                <label class="col-2">线路</label>
                <div class="form-group col-2">
                    <select class="form-control" id="line">
                    </select>
                </div>
                <label class="col-2">子线</label>
                <div class="form-group col-2">
                    <select class="form-control" id="subLine">
                    <option value="0">--</option>
                    <option>请先选择路线</option> 
                    </select>
                </div>
                <label class="col-2">单程</label>
                <div class="form-group col-2">
                    <select class="form-control" id="way">
                    <option value="0">--</option>
                    <option>请先选择路线</option> 
                    </select>
                </div>
            </div>
        </div>
        </nav>
        <div class="data-area" width=80%>
            <div class="table-1">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>路线</th>
                            <th>子线</th>
                            <th>单程</th>
                            <th>站点1</th>
                            <th>站点2</th>
                            <th>站点3</th>
                            <th>站点4</th>
                            <th>站点4</th>
                            <th>站点4</th>
                            <th>站点4</th>
                            <th>站点4</th>
                            <th>站点4</th>
                            <th>站点4</th>
                            <th>站点4</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr id="data-row-1">

                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="sync-data">
                <div class="container">
                    <div class="row">
                        <span class="col datepick-label">日期选择</span>
                        <input class="datepicker" data-provide="datepicker">
                        <button type="button" id="sync" class="btn btn-outline-primary col">同步</button>
                    </div>
                </div>
            </div>
            <div class="table-2">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>路线</th>
                            <th>子线</th>
                            <th>单程</th>
                            <th>站点1</th>
                            <th>站点2</th>
                            <th>站点3</th>
                            <th>站点4</th>
                            <th>站点4</th>
                            <th>站点4</th>
                            <th>站点4</th>
                            <th>站点4</th>
                            <th>站点4</th>
                            <th>站点4</th>
                            <th>站点4</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </body>
    <script src="https://cdn.bootcss.com/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/bootstrap-datepicker/1.0.0/js/locales/bootstrap-datepicker.zh-CN.min.js" charset="UTF-8"></script>
    <script>
        $(document).ready(function(){
           // $('#line')
            $.getJSON("/lines", function(rv){
                var lines = rv['lines'];
                console.log(lines);
                addPlacehold($("#line"));
                for(var i=0; i<lines.length; i++){
                    addOption($("#line"), lines[i]);
                }
            })

            $('.datepicker').datepicker();

            function addOption(nod, val){
                nod.append("<option value="+val+">"+val+"</option>");
            }

            function addPlacehold(nod){
                nod.empty();
                nod.append("<option value="+0+">"+"--"+"</option>");
            }

            function addWaitSelect(nod){
                nod.append("<option value="+-1+">"+"请选择线路"+"</option>");
            }

            function rebase(nod){
                addPlacehold(nod);
                addWaitSelect(nod);
            }

            $("#line").change(function(){
                var v = $("#line").val();
                if(v > 0){
                    var url = "/sublines?line="+v;
                    $.ajax({
                        url: url,
                        async: false,
                        success: function(rv){
                            $("#subLine").empty();
                            addPlacehold($('#subLine'));
                            for(var i=0; i<rv.lines.length; i++){
                                addOption($("#subLine"), rv.lines[i]);
                            };
                        },
                    })
                    /*
                    $("#subLine").empty();
                    addPlacehold($("#subLine"));
                    addOption($("#subLine"), $("#line").val());
                    addOption($("#subLine"), $("#line").val()*2);
                    rebase($("#way"));
                    */
                }
            });
            $("#subLine").change(function(){
                var subLine_selected = $("#subLine").val();
                if(subLine_selected > 0){
                    $("#way").empty();
                    addPlacehold($("#way"));
                    addOption($("#way"), $("#subLine").val() * 2);
                }else{
                    rebase($("#way"));
                }
            })
            $("#way").change(function(){
                var way = $("#way").val();
                if(way > 0){
                    var line = $("#line").val();
                    var subLine = $("#subLine").val();
                    var d = {
                        'line': line,
                        'subLine': subLine,
                        'way': way,
                    }
                    $.ajax({
                        url: '/fetchall',
                        method:'post',
                        contentType: 'application/json',
                        data: JSON.stringify(d),
                        success: function(rv){
                            console.log('all received ' + rv);
                        },
                    })
                }
            })

            function dateFormat(d){
                year = ""+d.getFullYear();
                month = ""+(d.getMonth()+1);
                day = ""+d.getDate();
                month = (month.length == 2) ? month: ("0"+month);
                day = (day.length == 2) ? day: ("0"+day);
                return [year, month, day].join("-");
            }

            $("#sync").click(function(){
                var date = $(".datepicker").val();
                if(date){
                    date = new Date(date);
                    var d = dateFormat(date);
                    console.log(d);
                }
            })
        })
    </script>
</html>