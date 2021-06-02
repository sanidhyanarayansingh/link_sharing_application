<!DOCTYPE html>
<html>
<head>
    <title>
        Admin
    </title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/9e8e6c9e0f.js" crossorigin="anonymous"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
    <asset:javascript src="table" />

</head>
<body>

<div class="container">
    <h3>Users (for Admin)</h3>
    <div class="panel panel-default ">
        <div class="panel-body">


            <div class="col-lg-4">
                <a href="#" style="font-size: 20px">Link Sharing</a>
            </div>


            <div class="col-lg-3">
                <input type="text" class="form-control" align="right" placeholder="Search..">
            </div>

            <div class="col-lg-1">
                <i class="far fa-comment fa-lg " data-toggle="modal" data-target="#myModal" align="center" ></i>

                <div class="modal fade" id="myModal" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <g:form controller="topic" action="savetopic" method="post" >
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Create Topic</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label >Name* </label>
                                        <div >
                                            <input type="text" class="form-control" name="tname" placeholder="Name" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label >Visibility* </label>
                                        <div>
                                            <select name="visib" id="visible">
                                                <option value="Public">Public</option>
                                                <option value="Private">Private</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary" >Save</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                </div>
                            </g:form>

                        </div>

                    </div>
                </div>
            </div>

            <div class="col-lg-1">
                <i class="far fa-envelope fa-lg " data-toggle="modal" data-target="#myModal2" ></i>
                <div class="modal fade" id="myModal2" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <form action="" method="post">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Send invitation</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label >Email* </label>
                                        <div >
                                            <input type="text" class="form-control" name="emailid" placeholder="Email" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label >Topic* </label>
                                        <div>
                                            <select name="itopic" id="visible">
                                                <g:each var="topics" in="${listoftopics}">
                                                    <option> ${topics.topicName} </option>
                                                </g:each>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary" >Save</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                </div>
                            </form>

                        </div>

                    </div>
                </div>
            </div>

            <div class="col-lg-1">
                <i class="fas fa-link fa-lg " data-toggle="modal" data-target="#myModal3" ></i>
                <div class="modal fade" id="myModal3" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <g:form controller="resource" action="savelinkresource" method="post" >
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Share Link</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label >Link* </label>
                                        <div >
                                            <input type="text" class="form-control" name="link" placeholder="Link" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label >Description* </label>
                                        <div >
                                            <input type="text" class="form-control" name="description" placeholder="Description" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label >Topic* </label>
                                        <div>
                                            <select name="ltopic" id="visible">
                                                <g:each var="topics" in="${listoftopics}">
                                                    <option> ${topics.topicName} </option>
                                                </g:each>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary" >Save</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                </div>
                            </g:form>

                        </div>

                    </div>
                </div>
            </div>


            <div class="col-lg-1">
                <i class="fas fa-file-medical fa-lg " data-toggle="modal" data-target="#myModal4" ></i>
                <div class="modal fade" id="myModal4" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <g:form controller="resource" action="savedocumentresource" method="post">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Share Document</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label >Document*  </label>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" name="doc" placeholder="Document">
                                            </div>
                                            <div class="col-lg-6">
                                                <input type="file" name="document">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label >Description* </label>
                                        <div >
                                            <input type="text" class="form-control" name="desc" placeholder="Description" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label >Topic* </label>
                                        <div>
                                            <select name="dtopic" id="visible">
                                                <g:each var="topics" in="${listoftopics}">
                                                    <option> ${topics.topicName} </option>
                                                </g:each>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary" >Save</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                </div>
                            </g:form>

                        </div>

                    </div>
                </div>
            </div>


            <div class="col-lg-1">
                <div class="dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">${loggeduser.userName}
                        <span class="caret"></span></button>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                        <li role="presentation"><g:link controller="user" action="editpage" role="menuitem" tabindex="-1" >Profile</g:link></li>
                        <li role="presentation" class="divider"></li>
                        <g:if test="${loggeduser.admin == true}">
                            <li role="presentation"><g:link controller="admin" action="adminpage" role="menuitem" tabindex="-1">Users</g:link></li>
                            <li role="presentation" class="divider"></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Topics</a></li>
                            <li role="presentation" class="divider"></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Posts</a></li>
                            <li role="presentation" class="divider"></li>
                        </g:if>
                        <li role="presentation"><g:link controller="user" action="home" role="menuitem" tabindex="-1">Logout</g:link></li>

                    </ul>
                </div>
            </div>

        </div>


    </div>
</div>
<div class="container">
    <table id="admintable" class="table table-striped table-bordered">
        <thead>
        <tr>
            <th colspan='7'> Users</th>
            <!--<th colspan='4'> All Users</th> -->
        </tr>
        <tr>
            <th>Id</th>
            <th>Username</th>
            <th>Email</th>
            <th>Firstname</th>
            <th>Lastname</th>
            <th>Active</th>
            <th>Manage</th>
        </tr>
        </thead>
        <tbody>
        <g:each var="users" in="${listofusers}">
        <tr>
            <td>${users.id}</td>
            <td>${users.userName}</td>
            <td>${users.email}</td>
            <td>${users.firstName}</td>
            <td>${users.lastName}</td>
            <td>${users.active}</td>
            <td>
            <g:if test="${users.active == true}" > <g:link controller="admin" action="changeactivation" params="[user:users.id]">Deactivate</g:link></g:if>
            <g:else> <g:link controller="admin" action="changeactivation" params="[user:users.id]">Activate</g:link></g:else>
            </td>
        </tr>
        </g:each>
        </tbody>
    </table>
</div>

</body>
</html>