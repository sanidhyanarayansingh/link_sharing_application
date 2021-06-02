<%--
  Created by IntelliJ IDEA.
  User: sanidhya
  Date: 26/03/20
  Time: 7:07 PM
--%>

<!DOCTYPE html>
<html>
<head>
    <title>
        Home Page
    </title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/9e8e6c9e0f.js" crossorigin="anonymous"></script>

</head>

<body>

<div class="container">
    <h3>Home Page</h3>

    <div class="panel panel-default ">
        <div class="panel-body">

            <div class="col-lg-10">
                <a href="#" style="font-size: 20px">Link Sharing</a>
            </div>

            <div class="col-lg-2">
                <input type="text" class="form-control" align="right" placeholder="Search..">
            </div>

        </div>
    </div>
</div>


<div class="container">
    <div class="row">
        <div class="col-lg-7">
            <div class="panel panel-default">
                <div class="panel-heading text">
                    <strong>Recent Shares</strong>
                </div>

                <div class="panel-body">
                    <g:each var="res" in="${resources.flatten()}">
                        <div class="row">
                            <div class="col-lg-3">
                                <img height="100" width="130"
                                     src="${createLink(controller: 'user', action: 'viewImage', params: ['tempid': res.topic.createdBy.id])}"/>
                            </div>

                            <div class="col-lg-9">
                                <div class="row">
                                    <div class="col-lg-4">${res.topic.createdBy.firstName} ${res.topic.createdBy.lastName}</div>

                                    <div class="col-lg-4">@${res.topic.createdBy.userName}</div>
                                    <g:link controller="topic" action="show" params="[tid: res.topic.id]"><div class="col-lg-4">${res.topic.topicName}</div></g:link>
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

            <div class="panel panel-default">
                <div class="panel-heading text">
                    <strong>Top Posts</strong>
                </div>

                <div class="panel-body">
                    <g:each var="res" in="${topres}">
                        <div class="row">
                            <div class="col-lg-3">
                                <img height="100" width="130"
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

        <div class="col-lg-5">
            <div class="panel panel-default">
                <div class="panel-heading text">
                    <strong>Login</strong>
                </div>

                <div class="panel-body">
                    <g:form controller="user" action="loginuser" class="form-horizontal" method="post">
                        <div class="form-group">
                            <label class="col-lg-4 control-label">Username*</label>

                            <div class="col-lg-8">
                                <input type="text" class="form-control" name="username" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-4 control-label">Password*</label>

                            <div class="col-lg-8">
                                <input type="password" class="form-control" name="password" required>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-4"></div>

                            <div class="col-lg-8">
                                <button type="submit" name="register" class="btn btn-primary btn-lg btn-block"
                                        align="right">Login</button>
                            </div>
                            <g:if test="${flash.error}">
                                <div class="alert alert-error" style="display: block"
                                     align="center ">${flash.error}</div>

                            </g:if>


                        </div>

                    </g:form>
                    <div class="col-lg-4"></div>
                    <div class="col-lg-8"> <br>
                        <button type="submit" name="forgot" class="btn btn-primary btn-lg btn-block"
                                align="right" data-toggle="modal" data-target="#myModal2">Forgot</button>

                        <div class="modal fade" id="myModal2" role="dialog">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <g:form controller="user" action="forgotpassword" method="post">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Forgot Password </h4>
                                        </div>

                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label>Username*</label>

                                                <div>
                                                    <input type="text" class="form-control" name="username" placeholder="Username"
                                                           required>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label>Email*</label>

                                                <div>
                                                    <input type="email" class="form-control" name="email"
                                                           placeholder="EmailId " required>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-primary">Send</button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                        </div>
                                    </g:form>

                                </div>

                            </div>
                        </div>

                    </div>

                </div>

            </div>

            <div class="panel panel-default">
                <div class="panel-heading text">
                    <strong>Registration</strong>
                </div>

                <div class="panel-body">
                    <g:form controller="user" action="save" method="post">
                        <div class="form-group">
                            <label class="col-lg-4 control-label">First Name*</label>

                            <div class="col-lg-8">
                                <input type="text" class="form-control" name="firstname" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-4 control-label">Last Name*</label>

                            <div class="col-lg-8">
                                <input class="form-control" type="text" name="lastname" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-4 control-label">Email*</label>

                            <div class="col-lg-8">
                                <input type="email" class="form-control" name="emailid" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-4 control-label">Username*</label>

                            <div class="col-lg-8">
                                <input type="text" class="form-control" name="uname" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-4 control-label">Password*</label>

                            <div class="col-lg-8">
                                <input type="password" class="form-control" name="password" minlength="5" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-4 control-label">Confirm *</label>

                            <div class="col-lg-8">
                                <input type="password" class="form-control" name="cpassword" minlength="5" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-4 control-label">Photo</label>

                            <div class="col-lg-8">
                                <input type="file" name="photo" accept="image/*">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-8"></div>

                            <div class="col-lg-4">
                                <button type="submit" name="register" class="btn btn-primary" align="right"
                                        data-toggle="modal" data-target="#myModal">Register</button>

                                <div class="modal " id="myModal" role="dialog">
                                    <div class="modal-dialog">

                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close"
                                                        data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">Successfully Registered</h4>
                                            </div>

                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default"
                                                        data-dismiss="modal">Cancel</button>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </g:form>

                </div>

            </div>

        </div>

    </div>
</div>


</body>
</html>