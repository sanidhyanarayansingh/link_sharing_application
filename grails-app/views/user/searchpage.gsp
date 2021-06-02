<!DOCTYPE html>
<html>
<head>
    <title>
        Search
    </title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/9e8e6c9e0f.js" crossorigin="anonymous"></script>
</head>

<body>

<div class="container">
    <h3>Search</h3>

    <div class="panel panel-default ">
        <div class="panel-body">

            <div class="col-lg-4">
                <a href="#" style="font-size: 20px">Link Sharing</a>
            </div>

            <div class="col-lg-3">
                <div class="row">
                    <div class="col-lg-8"><input type="text" class="form-control" align="right"
                                                 placeholder="${searchedtext}"></div>

                    <div class="col-lg-4"><button type="submit" class="btn btn-primary" align="right">Submit</button>
                    </div>
                </div>
            </div>

            <div class="col-lg-1">
                <i class="far fa-comment fa-lg " data-toggle="modal" data-target="#myModal" align="center"></i>

                <div class="modal fade" id="myModal" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <g:form controller="topic" action="savetopic" method="post">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Create Topic</h4>
                                </div>

                                <div class="modal-body">
                                    <div class="form-group">
                                        <label>Name*</label>

                                        <div>
                                            <input type="text" class="form-control" name="tname" placeholder="Name"
                                                   required>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>Visibility*</label>

                                        <div>
                                            <select name="visib" id="visible">
                                                <option value="Public">Public</option>
                                                <option value="Private">Private</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">Save</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                </div>
                            </g:form>

                        </div>

                    </div>
                </div>
            </div>

            <div class="col-lg-1">
                <i class="far fa-envelope fa-lg " data-toggle="modal" data-target="#myModal2"></i>

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
                                        <label>Email*</label>

                                        <div>
                                            <input type="text" class="form-control" name="emailid" placeholder="Email"
                                                   required>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>Topic*</label>

                                        <div>
                                            <select name="itopic" id="visible">
                                                <g:each var="topics" in="${listoftopics}">
                                                    <option>${topics.topicName}</option>
                                                </g:each>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">Save</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                </div>
                            </form>

                        </div>

                    </div>
                </div>
            </div>

            <div class="col-lg-1">
                <i class="fas fa-link fa-lg " data-toggle="modal" data-target="#myModal3"></i>

                <div class="modal fade" id="myModal3" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <g:form controller="resource" action="savelinkresource" method="post">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Share Link</h4>
                                </div>

                                <div class="modal-body">
                                    <div class="form-group">
                                        <label>Link*</label>

                                        <div>
                                            <input type="text" class="form-control" name="link" placeholder="Link"
                                                   required>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>Description*</label>

                                        <div>
                                            <input type="text" class="form-control" name="description"
                                                   placeholder="Description" required>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>Topic*</label>

                                        <div>
                                            <select name="ltopic" id="visible">
                                                <g:each var="topics" in="${listoftopics}">
                                                    <option>${topics.topicName}</option>
                                                </g:each>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">Save</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                </div>
                            </g:form>

                        </div>

                    </div>
                </div>
            </div>


            <div class="col-lg-1">
                <i class="fas fa-file-medical fa-lg " data-toggle="modal" data-target="#myModal4"></i>

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
                                        <label>Document*</label>

                                        <div class="row">
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" name="doc"
                                                       placeholder="Document">
                                            </div>

                                            <div class="col-lg-6">
                                                <input type="file" name="document">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>Description*</label>

                                        <div>
                                            <input type="text" class="form-control" name="desc"
                                                   placeholder="Description" required>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>Topic*</label>

                                        <div>
                                            <select name="dtopic" id="visible">
                                                <g:each var="topics" in="${listoftopics}">
                                                    <option>${topics.topicName}</option>
                                                </g:each>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">Save</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                </div>
                            </g:form>

                        </div>

                    </div>
                </div>
            </div>


            <div class="col-lg-1">
                <div class="dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" id="menu1"
                            data-toggle="dropdown">${loggeduser.userName}
                        <span class="caret"></span></button>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                        <li role="presentation"><g:link controller="user" action="editpage" role="menuitem"
                                                        tabindex="-1">Profile</g:link></li>
                        <li role="presentation" class="divider"></li>
                        <g:if test="${loggeduser.admin == true}">
                            <li role="presentation"><g:link controller="admin" action="adminpage" role="menuitem"
                                                            tabindex="-1">Users</g:link></li>
                            <li role="presentation" class="divider"></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Topics</a></li>
                            <li role="presentation" class="divider"></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Posts</a></li>
                            <li role="presentation" class="divider"></li>
                        </g:if>
                        <li role="presentation"><g:link controller="user" action="home" role="menuitem"
                                                        tabindex="-1">Logout</g:link></li>

                    </ul>
                </div>
            </div>

        </div>

    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-lg-5">
            <div class="panel panel-default">
                <div class="panel-heading text">
                    <strong>Trending Topics</strong>
                </div>

                <div class="panel-body">
                    <g:each var="trend" in="${trending}">
                        <div class="row">
                            <div class="col-lg-4">
                                <img height="70" width="110"
                                     src="${createLink(controller: 'user', action: 'viewImage', params: ['tempid': trend.createdBy.id])}"/>
                            </div>

                            <div class="col-lg-8">
                                <div class="row">
                                    <div class="col-lg-8">
                                        ${trend.createdBy.firstName}  ${trend.createdBy.lastName}
                                    </div>

                                    <div class="col-lg-4">
                                        <g:link controller="topic" action="show"
                                                params="[tid: trend.id]">${trend.topicName}</g:link>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        @${trend.createdBy.userName}
                                    </div>

                                    <div class="col-lg-4">
                                        Subscriptions
                                    </div>

                                    <div class="col-lg-4">
                                        Post
                                    </div>

                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <g:if test="${trend.subscriptions.createdBy.id == loggeduser.id}">
                                            Unsubscribe
                                        </g:if>
                                        <g:else>
                                            <g:link controller="subscription" action="subs"
                                                    params="[loggeduser: loggeduser.id, tid: trend.id]">Subscribe</g:link>
                                        </g:else>
                                    </div>

                                    <div class="col-lg-4">
                                        ${trend.subscriptions.size()}
                                    </div>

                                    <div class="col-lg-4">
                                        ${trend.resources.size()}
                                    </div>

                                </div>

                            </div>
                        </div>
                        <hr>
                    </g:each>
                </div>

            </div>

            <div class="panel panel-default">
                <div class="panel-heading text">
                    <strong>Top Posts</strong>
                </div>

                <div class="panel-body">
                    <g:each var="res" in="${topres}">
                        <div class="row">
                            <div class="col-lg-3">
                                <img height="100" width="100"
                                     src="${createLink(controller: 'user', action: 'viewImage', params: ['tempid': res.topic.createdBy.id])}"/>
                            </div>

                            <div class="col-lg-9">
                                <div class="row">
                                    <div class="col-lg-4">${res.topic.createdBy.firstName} ${res.topic.createdBy.lastName}</div>

                                    <div class="col-lg-4">@${res.topic.createdBy.userName}</div>
                                    <g:link controller="topic" action="show" params="[tid: res.topic.id]"><div
                                            class="col-lg-4">${res.topic.topicName}</div></g:link>
                                </div>

                                <div class="row">
                                    <br>
                                </div>

                                <div class="row">
                                    Description : ${res.description}
                                </div>

                                <div class="row">
                                    <br>
                                </div>

                                <div class="row">
                                    <div class="col-lg-2">
                                        <i class="fab fa-facebook-square fa-lg"></i>
                                    </div>

                                    <div class="col-lg-2">
                                        <i class="fab fa-twitter-square fa-lg"></i>
                                    </div>

                                    <div class="col-lg-2">
                                        <i class="fab fa-google-plus-square fa-lg"></i>
                                    </div>

                                    <div class="col-lg-1">

                                    </div>

                                    <div class="col-lg-1">

                                    </div>

                                    <div class="col-lg-3">
                                        <g:link controller="resource" action="showpost"
                                                params="[rid: res.id]">View Post</g:link>
                                    </div>

                                </div>
                            </div>

                        </div>
                        <hr>
                    </g:each>

                </div>

            </div>

        </div>

        <div class="col-lg-7">
            <div class="panel panel-default">
                <div class="panel-heading text">
                    <strong>Search related to ${searchedtext}</strong>
                </div>

                <div class="panel-body">
                    <g:each var="posts" in="${relatedresource}">
                        <div class="row">
                            <div class="col-lg-3">
                                <img height="50" width="130"
                                     src="${createLink(controller: 'user', action: 'viewImage', params: ['tempid': 'posts.topic.createdBy.id'])}"/>
                            </div>

                            <div class="col-lg-9">
                                <div class="row">
                                    Description : ${posts.description}
                                </div>

                                <div class="row">
                                    <br>
                                </div>

                                <div class="row">
                                    <div class="col-lg-1">
                                        <i class="fab fa-facebook-square fa-lg"></i>
                                    </div>

                                    <div class="col-lg-1">
                                        <i class="fab fa-twitter-square fa-lg"></i>
                                    </div>

                                    <div class="col-lg-1">
                                        <i class="fab fa-google-plus-square fa-lg"></i>
                                    </div>

                                    <div class="col-lg-2">
                                        <g:link>Download</g:link>
                                    </div>

                                    <div class="col-lg-2">
                                        <g:link>View Full Site</g:link>
                                    </div>

                                    <div class="col-lg-2">
                                        <g:link>Mark as Read</g:link>
                                    </div>

                                    <div class="col-lg-2">
                                        <g:link controller="resource" action="showpost"
                                                params="[rid: posts.id]">View Post</g:link>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </g:each>

                </div>

            </div>

        </div>

    </div>
</div>

</body>
</html>