<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Refresh" content="900">
    <title></title>
    <asset:stylesheet src="my.css"/>
    <asset:javascript src="my.js"/>
</head>

<body>
<div class="navbar navbar-default" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="."><i class="glyphicon glyphicon-th-list"></i> feedstockr</a>
        </div>
        <div class="navbar-collapse collapse">

        </div>
    </div>
</div>

<div class="container small">
    <div class="row">
        <div class="col-xs-9 padding-3">
            <table class="table table-striped table-hover">
                <tbody>
                <g:each in="${entries}">
                    <tr>
                        <th class="text-right">${it.publishedDate.format("yyyy/MM/dd HH:mm")}</th>
                        <th class="text-center ${((new Date().time - 1000*60*60*24) < it.publishedDate.time)?'recent':''}">${it.feed.description}</th>
                        <td><g:if test="${it?.author}">${it?.author?.split("@")[0]?.replaceAll("[a-z][A-Z]", {it[0] + " " + it[1]})} - </g:if> <a href="${it.link}">${it.title}</a><br><small>${raw(it.description)}</small></td>
                    </tr>
                </g:each>
                </tbody>
            </table>
            <div class="clearfix">
                <g:paginate class="pagination" prev="«" next="»" max="50" controller="feed" action="feedstockr" total="${entryCount}" />
            </div>
        </div>

        <div class="col-xs-3 padding-3">
            <div class="panel panel-default">
                <div class="panel-heading">社内</div>

                <div class="list-group">
                    <a class="list-group-item"></a>

                    <g:each in="${feedsWithAuth}">
                        <g:link action="feedstockr" params="[feed:it.id]" class="list-group-item">${it.description}</g:link>
                        %{--<a class="list-group-item"><div class="checkbox">--}%
                            %{--<label><input type="checkbox"> ${it.description}</label>--}%
                        %{--</div></a>--}%
                    </g:each>

                    <a class="list-group-item"></a>
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">社外</div>

                <div class="list-group">
                    <a class="list-group-item"></a>

                    <g:each in="${feeds}">
                        <g:link action="feedstockr" params="[feed:it.id]" class="list-group-item">${it.description}</g:link>
                        %{--<a class="list-group-item"><div class="checkbox">--}%
                            %{--<label><input type="checkbox"> ${it.description}</label>--}%
                        %{--</div></a>--}%
                    </g:each>

                    <a class="list-group-item"></a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>