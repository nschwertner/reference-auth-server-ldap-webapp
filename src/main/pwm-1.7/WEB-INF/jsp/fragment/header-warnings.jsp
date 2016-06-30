<%--
  ~ Password Management Servlets (PWM)
  ~ http://code.google.com/p/pwm/
  ~
  ~ Copyright (c) 2006-2009 Novell, Inc.
  ~ Copyright (c) 2009-2015 The PWM Project
  ~
  ~ This program is free software; you can redistribute it and/or modify
  ~ it under the terms of the GNU General Public License as published by
  ~ the Free Software Foundation; either version 2 of the License, or
  ~ (at your option) any later version.
  ~
  ~ This program is distributed in the hope that it will be useful,
  ~ but WITHOUT ANY WARRANTY; without even the implied warranty of
  ~ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  ~ GNU General Public License for more details.
  ~
  ~ You should have received a copy of the GNU General Public License
  ~ along with this program; if not, write to the Free Software
  ~ Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  --%>

<%@ page import="password.pwm.AppProperty" %>
<%@ page import="password.pwm.Permission" %>
<%@ page import="password.pwm.PwmApplication" %>
<%@ page import="password.pwm.PwmConstants" %>
<%@ page import="password.pwm.http.PwmURL" %>
<%@ page import="password.pwm.http.servlet.PwmServletDefinition" %>
<%
    boolean includeHeader = false;
    boolean adminUser = false;
    boolean configMode = false;
    try {
        final PwmRequest pwmRequest = PwmRequest.forRequest(request, response);
        final PwmApplication.MODE applicationMode = pwmRequest.getPwmApplication().getApplicationMode();
        configMode = applicationMode == PwmApplication.MODE.CONFIGURATION;
        adminUser = pwmRequest.getPwmSession().getSessionManager().checkPermission(pwmRequest.getPwmApplication(), Permission.PWMADMIN);
        if (Boolean.parseBoolean(pwmRequest.getConfig().readAppProperty(AppProperty.CLIENT_WARNING_HEADER_SHOW))) {
            if (!new PwmURL(request).isConfigManagerURL()) {
                if (configMode || PwmConstants.TRIAL_MODE) {
                    includeHeader = true;
                } else if (pwmRequest.isAuthenticated()) {
                    if (adminUser && !pwmRequest.isForcedPageView()) {
                        includeHeader = true;
                    }
                }
            }
        }
    } catch (Exception e) {
        /* noop */
    }
%>
<% if (includeHeader) { %>
<pwm:script-ref url="/public/resources/js/configmanager.js"/>
<pwm:script-ref url="/public/resources/js/admin.js"/>
<pwm:script>
    <script type="text/javascript">
        PWM_GLOBAL['startupFunctions'].push(function(){
            PWM_CONFIG.initConfigHeader();
        });
    </script>
</pwm:script>
<div id="header-warning" style="display: none">
    <div class="header-warning-row header-warning-version"><%=PwmConstants.PWM_APP_NAME_VERSION%></div>
    <div id="header-warning-message" class="header-warning-row header-warning-message">
    <% if (PwmConstants.TRIAL_MODE) { %>
    <pwm:display key="Header_TrialMode" bundle="Admin" value1="<%=PwmConstants.PWM_APP_NAME%>"/>
    <% } else if (configMode) { %>
    <pwm:display key="Header_ConfigModeActive" bundle="Admin" value1="<%=PwmConstants.PWM_APP_NAME%>"/>

    <pwm:if test="showIcons"><span id="icon-configModeHelp" class="btn-icon fa fa-question-circle"></span></pwm:if>
        <br/><br/>
    <% } else if (adminUser) { %>
    <pwm:display key="Header_AdminUser" bundle="Admin" value1="<%=PwmConstants.PWM_APP_NAME%>"/>
    <% } %>
    </div>
    <div class="header-warning-row header-warning-buttons">
        <a class="header-warning-button" id="header_configManagerButton" href="<pwm:url addContext="true" url="<%=PwmServletDefinition.ConfigManager.servletUrl()%>"/>">
            <pwm:if test="showIcons"><span class="btn-icon fa fa-gears"></span></pwm:if>
            <pwm:display key="MenuItem_ConfigManager" bundle="Admin"/>
        </a>
        <a class="header-warning-button" id="header_configEditorButton">
            <pwm:if test="showIcons"><span class="btn-icon fa fa-edit"></span></pwm:if>
            <pwm:display key="MenuItem_ConfigEditor" bundle="Admin"/>
        </a>
        <% if (adminUser) { %>
        <a class="header-warning-button" id="header_administrationButton" href="<pwm:url url="/private/admin"/>">
            <pwm:if test="showIcons"><span class="btn-icon fa fa-list-alt"></span></pwm:if>
            <pwm:display key="Title_Admin"/>
        </a>
        <pwm:if test="forcedPageView" negate="true">
        <a class="header-warning-button" id="header_openLogViewerButton">
            <pwm:if test="showIcons"><span class="btn-icon fa fa-list-alt"></span></pwm:if>
            <pwm:display key="MenuItem_ViewLog" bundle="Config"/>
            &nbsp;
            <pwm:if test="showIcons"><span class="btn-icon fa fa-external-link"></span></pwm:if>
        </a>
        </pwm:if>
        <% } %>
    </div>
    <div id="panel-header-healthData" class="header-warning-row header-warning-healthData"></div>
    <div id="button-closeHeader" title="<pwm:display key="Button_Hide"/>">
        <span class="fa fa-chevron-circle-right"></span>
    </div>
</div>
<div id="button-openHeader" title="<pwm:display key="Button_Show"/>">
    <span class="fa fa-chevron-circle-left"></span>
</div>
<% } %>
