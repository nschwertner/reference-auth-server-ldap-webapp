 <%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="o" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<o:header title="Login"/>

<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="static/css/app.css">


<script type="text/javascript">
    <!--

    $(document).ready(function () {
        // select the appropriate field based on context
        $('#<c:out value="${ login_hint != null ? 'j_password' : 'j_username' }" />').focus();
    });

    //-->
</script>
<%--<o:topbar />--%>
<%--<div class="container-fluid main">--%>
<div class="container-fluid full-screen login-form">

    <%--<h1><spring:message code="login.login_with_username_and_password"/></h1>--%>

    <c:if test="${ param.error != null }">
        <div class="alert alert-error"><spring:message code="login.error"/></div>
    </c:if>

    <div class="row-fluid">
        <%--<div class="span6 offset1 well">--%>
        <div class="col-lg-12">
            <form action="<%=request.getContextPath()%>/j_spring_security_check"
                  method="POST">
                <div>
                    <img src="static/images/company-logo.png"/>
                </div>
                <div>
                    <div class="input-prepend input-block-level">
                        <%--<span class="add-on"> <i class='login-form-input-icon fa fa-user fa-lg'></i></span>--%>
                        <span class="add-on"><i class="icon-user"></i></span>
                        <input type="text" placeholder="User Name" autocorrect="off" autocapitalize="off" required
                               autocomplete="off" spellcheck="false" value="<c:out value="${ login_hint }" />"
                               id="j_username" name="j_username">
                    </div>
                </div>
                <div>
                    <div class="input-prepend input-block-level">
                        <%--<span class="add-on"><i class='login-form-input-icon fa fa-lock fa-lg'></i></span>--%>
                        <span class="add-on"><i class="icon-lock"></i></span>
                        <input type="password" placeholder="Password" autocorrect="off" autocapitalize="off" required
                               autocomplete="off" spellcheck="false" id="j_password" name="j_password">
                    </div>
                </div>
                <div>
                    <input type="submit" class="btn-block login-form-btn" value="Sign in" name="submit">
                </div>
                <div>
					<span class="help-block pull-left">
						<a href="https://service.smarthealthit.org/public/NewUser" name="register_new_account"
                           target="_self" class="login-form-text">Create New Account</a>
     				</span>
                    <span class="help-block pull-right">
                        <a href="https://service.smarthealthit.org/public/ForgottenPassword" name="forgot_password"
                           target="_self" class="login-form-text">Forgot Password?</a>
                        </span>

                </div>
            </form>
        </div>
    </div>
</div>

<o:footer/>
