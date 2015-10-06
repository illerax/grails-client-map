<div id="header">
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${resource(dir:'')}">Client Map</a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="/ClientMap/client/index">Clients</a></li>
                    <li><a href="/ClientMap/user/index">Users</a></li>
                </ul>
                <form class="navbar-form navbar-left" role="search" action="/ClientMap/client/search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search" name="search">
                    </div>
                    <button type="submit" class="btn btn-default">Submit</button>
                </form>

                <g:formForUsers />

                <ul class="nav navbar-nav navbar-right">
                    <li><g:loginControl /></li>
                </ul>
            </div>
            <script>
                $(function(){
                    $('#my_form').on('submit', function(e){
                        e.preventDefault();
                        var $that = $(this),
                                formData = new FormData($that.get(0));
                        $.ajax({
                            url: $that.attr('action'),
                            type: $that.attr('method'),
                            contentType: false,
                            processData: false,
                            data: formData,
                            success: function(data){
                                alert(data);
                            }
                        });
                    });
                });
            </script>
        </div>
    </nav>
</div>