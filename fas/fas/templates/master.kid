<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<?python import sitetemplate ?>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:py="http://purl.org/kid/ns#" py:extends="sitetemplate">
  <head py:match="item.tag=='{http://www.w3.org/1999/xhtml}head'" py:attrs="item.items()">
    <title py:replace="''">Title</title>
    <link href="${tg.url('/static/css/style.css')}" rel="stylesheet" type="text/css" />
    <meta py:replace="item[:]"/>
  </head>
  <body py:match="item.tag=='{http://www.w3.org/1999/xhtml}body'" py:attrs="item.items()">
    <div id="wrapper">
      <div id="head">
        <h1><a href="http://fedoraproject.org/">Fedora</a></h1>
        <div id="searchbox">
          <form action="" method="get">
            <label for="q">Search:</label>
            <input type="text" name="q" id="q" />
            <input type="submit" value="Search" />
          </form>
        </div>
      </div>
      <div id="topnav">
        <ul>
          <li class="first"><a href="http://fedoraproject.org/">Learn about Fedora</a></li>
          <li><a href="http://fedoraproject.org/get-fedora.html">Download Fedora</a></li>
          <li><a href="http://fedoraproject.org/wiki/">Projects</a></li>
          <li><a href="http://fedoraproject.org/join-fedora.html">Join Fedora</a></li>
          <li><a href="http://fedoraproject.org/wiki/Communicate">Communicate</a></li>
          <li><a href="http://docs.fedoraproject.org/">Help/Documentation</a></li>
        </ul>
      </div>
      <div id="infobar">
        <div id="authstatus">
          <span py:if="not tg.identity.anonymous">
            <strong>Logged in:</strong> ${tg.identity.user.user_name}
          </span>
        </div>
        <div id="control">
          <ul>
            <li py:if="not tg.identity.anonymous"><a href="${tg.url('/viewAccount')}">My Account</a></li>
            <li py:if="not tg.identity.anonymous"><a href="${tg.url('/logout')}">Log Out</a></li>
            <li py:if="tg.identity.anonymous"><a href="${tg.url('/login')}">Log In</a></li>
          </ul>
        </div>
      </div>
      <div id="main">
        <div id="sidebar">
          <ul>
            <li class="first"><a href="${tg.url('/listGroup')}">Group List</a></li>
            <li py:if="'accounts' in tg.identity.groups"><a href="${tg.url('/listUser')}">User List</a></li>
            <li><a href="http://fedoraproject.org/wiki/FWN/LatestIssue">News</a></li>
            <li><a href="${tg.url('/listGroup', search='A*')}">Apply For a new Group</a></li>
          </ul>
        </div>
        <div id='content'>
          <div py:if="tg_flash" class="flash">
            ${tg_flash}
          </div>
          <div py:replace="[item.text]+item[:]" />
        </div> <!-- End main -->
        <div id="footer">
          <ul id="footlinks">
            <li class="first"><a href="/">About</a></li>
            <li><a href="http://fedoraproject.org/wiki/Communicate">Contact Us</a></li>
            <li><a href="http://fedoraproject.org/wiki/Legal">Legal &amp; Privacy</a></li>
            <!--<li><a href="/">Site Map</a></li>-->
            <li><a href="${tg.url('/logout')}">Log Out</a></li>
          </ul>
          <p class="copy">
          Copyright © 2007 Red Hat, Inc. and others.  All Rights Reserved.
          Please send any comments or corrections to the <a href="mailto:webmaster@fedoraproject.org">websites team</a>.
          </p>
          <p class="disclaimer">
          The Fedora Project is maintained and driven by the community and sponsored by Red Hat.  This is a community maintained site.  Red Hat is not responsible for content.
          </p>
        </div>
      </div>
    </div> <!-- End wrapper -->
  </body>
</html>
