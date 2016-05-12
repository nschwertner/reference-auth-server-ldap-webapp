<%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="o" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<o:header title="Login"/>

<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="static/css/app.css">

   <style>
        .login-form {
            width: 500px;
            margin: 100px auto 0 auto;
            color: #58585A;
        }

        .login-form img {
            height: 100px;
            margin-bottom: 10px
        }

        .columns-group {
            display: table;
            box-sizing: border-box;
            border-spacing: 0;
            table-layout: fixed;
            width: 100%;
        }

        .single-column {
            display: table-cell;
            vertical-align: top;
        }

        .feature-checkmark-list {
            list-style: none;
            margin-left: 0;
            padding-left: 36px;
        }

        .feature-checkmark-list--item:before {
            color: #707070;
            content: '\2714';
            display: inline-block;
            font-size: 18px;
            margin: 0 0 0 -24px;
            width: 24px;
        }

        .login-form-info-box {
            //margin-left: 30px;
            font-size: 12px;
        }

        .login-form-info-box h1 {
            margin-top: 0;
            font-size: 14px;
            font-weight: 700;
            line-height: 1.42857143;
        }
	.note {
    	    margin: 10px 0;
            font-size: 12px;
            color: #707070;
            text-align: left;
            font-style: italic;
	}

        .note-2 {
            margin-top: 80px;
            font-size: 22px;
            text-align: left;
	    font-weight:normal;
	    color: #58585A;
        }

        .login-box {
            background: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin: 10px auto 60px;
            padding: 30px;
        }

        .login-section {
            /*border-top: 1px solid #ccc;*/
            display: inline-block;
            padding: 0;
            position: relative;
            width: 100%;
        }

	.logo {
	    
	}

    </style>

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
                <div class="logo">
                    <img src="static/images/SandboxLogo.png"/>
                </div>
                <div class="note">Note: This <b>test</b> version of the sandbox is for testing purposes only. Any changes you make will be <b>lost</b>. We'd love any help testing this. Please log defects <a href="https://healthservices.atlassian.net/secure/RapidBoard.jspa?rapidView=3&projectKey=SNDBX&view=planning.nodetail&versions=visible" target="_self">here</a>.</div>
                <div>
                    <div class="input-prepend input-block-level">
                        <%--<span class="add-on"> <i class='login-form-input-icon fa fa-user fa-lg'></i></span>--%>
                        <span class="add-on"><i class="icon-user"></i></span>
                        <input type="text" placeholder="Email Address" autocorrect="off" autocapitalize="off" required
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
                        <spring:eval var="newUserUrl" expression="@ldapProperties.newUserUrl" />
						<a href="${newUserUrl}" name="register_new_account"
                           target="_self" class="login-form-text">Create New Account</a>
     				</span>
                    <span class="help-block pull-right">
                        <spring:eval var="forgotPasswordUrl" expression="@ldapProperties.forgotPasswordUrl" />
                        <a href="${forgotPasswordUrl}" name="forgot_password"
                           target="_self" class="login-form-text">Forgot Password?</a>
                        </span>

                </div>
            </form>

<div class="note-2">Create your very own Sandbox</div>
    <div class="row login-box">
        <div class="col-lg-12 login-section ">

            <div class="columns-group">
                <div class="single-column">
                    <div class="login-form-info-box">
                        <h1>What is a sandbox?</h1>
                        <p>A sandbox is your very own instance of an HSPC Platform* combined with tools and utilities to help you build and test your medical apps.</p>

                        <ul class="feature-checkmark-list">
                            <li class="feature-checkmark-list--item">Create apps for practitioners that launch within an EHR, smart phone, tablet, or web browser</li>
                            <li class="feature-checkmark-list--item">Create apps for patients and their related persons that launch from a smart phone, tablet, web browser, or personal computer</li>
                            <li class="feature-checkmark-list--item">Create backend services that interact directly with HSPC Platforms*</li>
                            <li class="feature-checkmark-list--item">Verify your app follows the SMART security and launch context standards</li>
                            <li class="feature-checkmark-list--item">Run your app against your very own FHIR server</li>
                            <li class="feature-checkmark-list--item">Test your apps by creating various launch scenarios</li>
                            <li class="feature-checkmark-list--item">Create practitioners, patients, and clinical data</li>
                            <li class="feature-checkmark-list--item">Verify that your app is HSPC compliant</li>
                        </ul>

                        <p>*An HSPC Platform is a standardized way to interact with a medical system such as an EHR, Hospital, Clinic, HIE, PHR, Lab, Insurer, etc.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

        </div>
    </div>
</div>

<o:footer/>
