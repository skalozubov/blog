<!DOCTYPE html>
<html>
<head>
    <title>My Blog</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://s3.amazonaws.com/codecademy-content/courses/ltp2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/blog.css">
</head>
<body>
  <div class="blog-masthead">
        <div class="container">
          <nav class="blog-nav">
            <a class="blog-nav-item active" href="#">Home</a>
            <a class="blog-nav-item" href="#">New features</a>
            <a class="blog-nav-item" href="#">Press</a>
            <a class="blog-nav-item" href="#">New hires</a>
            <a class="blog-nav-item" href="#">About</a>
          </nav>
        </div>
  </div>

<#if username??>
    Welcome ${username} <a href="/logout">Logout</a> | <a href="/newpost">New Post</a>

    <p>
</#if>
<div class="container">

      <div class="blog-header">
        <h1 class="blog-title">My Blog</h1>
        <p class="lead blog-description">Small technical blog.</p>
      </div>

      <div class="row">

        <div class="col-sm-8 blog-main">

        <#list myposts as post>
          <div class="blog-post">
                <h2 class="blog-post-title"><a href="/post/${post["permalink"]}">${post["title"]}</a></h2>
                <p class="blog-post-meta">Posted ${post["date"]?datetime} by <a href="#">${post["author"]}</a></p>
                <hr>
                ${post["body"]!""}
                <p>

                <p>
                Comments:
                                <#if post["comments"]??>
                                    <#assign numComments = post["comments"]?size>
                                        <#else>
                                            <#assign numComments = 0>
                                </#if>

                                <a href="/post/${post["permalink"]}">${numComments}</a>

                    <em>Filed Under</em>:
                    <#if post["tags"]??>
                        <#list post["tags"] as tag>
                            <a href="/tag/${tag}">${tag}</a>
                        </#list>
                    </#if>

                <p>
          </div>
        </#list>
        <nav>
                    <ul class="pager">
                      <li><a href="#">Previous</a></li>
                      <li><a href="#">Next</a></li>
                    </ul>
        </nav>
        </div>
        <div class="col-sm-3 col-sm-offset-1 blog-sidebar">
                  <div class="sidebar-module sidebar-module-inset">
                    <h4>About</h4>
                    <p>Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur.</p>
                  </div>
                  <div class="sidebar-module">
                    <h4>Archives</h4>
                    <ol class="list-unstyled">
                      <li><a href="#">March 2014</a></li>
                      <li><a href="#">February 2014</a></li>
                      <li><a href="#">January 2014</a></li>
                      <li><a href="#">December 2013</a></li>
                      <li><a href="#">November 2013</a></li>
                      <li><a href="#">October 2013</a></li>
                      <li><a href="#">September 2013</a></li>
                      <li><a href="#">August 2013</a></li>
                      <li><a href="#">July 2013</a></li>
                      <li><a href="#">June 2013</a></li>
                      <li><a href="#">May 2013</a></li>
                      <li><a href="#">April 2013</a></li>
                    </ol>
                  </div>
                  <div class="sidebar-module">
                    <h4>Elsewhere</h4>
                    <ol class="list-unstyled">
                      <li><a href="#">GitHub</a></li>
                      <li><a href="#">Twitter</a></li>
                      <li><a href="#">Facebook</a></li>
                    </ol>
                  </div>
        </div><!-- /.blog-sidebar -->

      </div><!-- /.row -->

</div><!-- /.container -->

<footer class="blog-footer">
      <p>Blog template built for <a href="http://getbootstrap.com">Bootstrap</a> by <a href="https://twitter.com/mdo">@mdo</a>.</p>
      <p>
        <a href="#">Back to top</a>
      </p>
</footer>
</body>
</html>

