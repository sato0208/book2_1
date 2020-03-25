/*
 * This is a manifest file that'll be compiled into application.css, which will include all the files
 * listed below.
 *
 * Any CSS and SCSS file within this directory, lib/assets/stylesheets, or any plugin's
 * vendor/assets/stylesheets directory can be referenced here using a relative path.
 *
 * You're free to add application-wide styles to this file and they'll appear at the bottom of the
 * compiled file so the styles you add here take precedence over styles defined in any other CSS/SCSS
 * files in this directory. Styles in this file should be added after the last require_* statement.
 * It is generally better to create a new file per style scope.
 *
 *= require_tree .
 *= require_self
 */

@import 'bootstrap-sprockets';
@import 'bootstrap';


* {
  margin:0; padding:0;
}

html {
    font-size: 10px;
    font-family: sans-serif;
}

body {
    font-family: "Helvetica Neue", Helvetica, Arial,
    sans-serif;
    line-height: 1.42857143;
    display: block;
    margin-top: 60px;
    color: #333333;
    background-color: #fff;
    }

div {
    display: block;
    }

div.actions {
    margin-bottom: 10px;
    }

div.field {
    margin-bottom: 10px;
    }

a {
color: #333333;
text-decoration:none;
}

body a:hover {
color: #337ab7;
text-decoration:underline;
}

header {
    color: white;
    margin: 0,auto;
}

header li {
  display: inline-block;
  padding: 0 15px;
  color: #9d9d9d;
  font-family: 'Glyphicons Halflings';
  }

header .glyphicon {
    position: relative;
    color: #9d9d9d;
    top: 1px;
    margin-right: 5px;
    display: inline-block;
    font-family: 'Glyphicons Halflings';
    font-style: normal;
    font-weight: normal;
    line-height: 1;
    }

header .navbar-left span {
    font-size: 20px;
    padding-top: 10px;
    }

header a:hover {
color: white;
background-color: #222;
text-decoration:none;
}

.col-xs-3, .col-xs-9,{
    float: left;
    }


h1, .h1, h2, .h2, h3, .h3 {
    margin-top: 20px;
    margin-bottom: 10px;
    }

h1, h2, h3, h4 {
    font-family: inherit;
    font-weight: 500;
    line-height: 1.1;
    color: inherit;
    }


li {
    color: #9d9d9d;
    }

.container {
    margin-right: auto;
    margin-left: auto;
    padding-left: 15px;
    padding-right: 15px;
}

.row {
    margin-left: -15px;
    margin-right: -15px;
    }



.btn-sm, .btn-group-sm>.btn {
    padding: 5px 10px;
    font-size: 12px;
    line-height: 1.5;
    border-radius: 3px;
    }

.btn-success {
    color: #666;
    background-color: #5cb85c;
    border-color: #4cae4c;
    }

.btn-danger {
    color: #666;
    }

.btn-info {
    color: #666;
    background-color: #5bc0de;
    border-color: #46b8da;
    }

.table>thead>tr>th, .table>thead>tr>td, .table>tbody>tr>th, .table>tbody>tr>td {
    padding: 8px;
    margin: 33px;
    font-family: verdana, arial, helvetica, sans-serif;
    font-size: 13px;

    }

.table>thead:first-child>tr:first-child>th,
.table>tbody:first-child>tr:first-child>th {
    border-top: 0;
    }

    .btn-block + .btn-block {
    margin-top: 0px;
}

footer{
    width: 100%;
    text-align: center;
    padding: 30px 0;
    position: absolute;
    bottom: 0;
    }

.info {
    background-color: #fff;
    color: #333333;
}
 .success {
    color: green;
    background-color: #fff;
  }
.image1 {
background-image: url(image1.jpg);
}
.image2 {
background-image: url(image2.jpg);
}
.image3 {
background-image: url(image3.jpg);
}
.image4 {
background-image: url(image4.jpg);
}
.image5 {
background-image: url(image5.jpg);
}
#theTarget{
    height: 500px;
}
#theTarget>div{
    height: 500px;
    width: 100%;
}
.container{
    height: auto;
}