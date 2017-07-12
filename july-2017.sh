#!/bin/bash

# IMAGE TO REPLACE
#blog.jpg
wget https://raw.githubusercontent.com/techmore/blog/master/blog.jpg
wget https://raw.githubusercontent.com/techmore/blog/master/july-10-2017.png

sed -i.bak s=/w3images/woods.jpg=blog.jpg=g index.html

cp index.html July-9-2017.html

cat <<EOF >> index.html

<!-- Blog entries -->
<div class="w3-col l8 s12">

<div class="w3-card-4 w3-margin w3-white">
    <img src="july-10-2017.png" alt="Nature" style="width:50%">
    <div class="w3-container">
      <h3><b>Creating a post</b></h3>
      <h5>Finally putting in content, <span class="w3-opacity">July 10, 2017</span></h5>
    </div>
    <div class="w3-container">
      <p>I'm finally getting that hang out this. So the content is stored and edited on Github, it's free and public and I can always pull from it and recreate the blog. It's easier then a public google drive link that doesn't seem to allow a wget. I can copy and paste 3 lines and build the site again in docker. If you want to update the content, you just update github and rebuild the server in a few seconds and it's good to go.</p>
      <p>The cooler thing is the paypal store i've made with the same foundation, update coming soon.</p>
      <div class="w3-row">
        <div class="w3-col m8 s12">
          <a href="July-10-2017.html" class="button"> READ MORE </a>
        </div>
        <div class="w3-col m4 w3-hide-small">
          <p><span class="w3-padding-large w3-right"><b>Comments  </b> <span class="w3-tag">0</span></span></p>
        </div>
      </div>
    </div>
  </div>
  <hr>
  
  <div class="w3-card-4 w3-margin w3-white">
    <img src="blog.jpg" alt="Nature" style="width:20%">
    <div class="w3-container">
      <h3><b>Day 1 Blogging</b></h3>
      <h5>Creation of a reuseable blog, <span class="w3-opacity">July 9, 2017</span></h5>
    </div>

    <div class="w3-container">
      <p>I Hate Macish</p>
      <div class="w3-row">
        <div class="w3-col m8 s12">
          <a href="July-9-2017.html" class="button"> READ MORE </a>

        </div>
        <div class="w3-col m4 w3-hide-small">
          <p><span class="w3-padding-large w3-right"><b>Comments  </b> <span class="w3-tag">0</span></span></p>
        </div>
      </div>
    </div>
  </div>
  <hr>
<!-- END BLOG ENTRIES -->
</div>




EOF

cat <<EOF-july >> July-9-2017.html

<!-- Blog entries -->
<div class="w3-col l8 s12">

<div class="w3-card-4 w3-margin w3-white">
    <img src="blog.jpg" alt="Nature" style="width:20%">
    <div class="w3-container">
      <h3><b>Day 1 Blogging</b></h3>
      <h5>Creation of a reuseable blog, <span class="w3-opacity">July 9, 2017</span></h5>
    </div>

    <div class="w3-container">
      <p>I Hate Macish</p>
      <div class="w3-row">
        <div class="w3-col m8 s12">
          <p><button class="w3-button w3-padding-large w3-white w3-border"><b>READ MORE »</b></button></p>
        </div>
        <div class="w3-col m4 w3-hide-small">
          <p><span class="w3-padding-large w3-right"><b>Comments  </b> <span class="w3-tag">0</span></span></p>
        </div>
      </div>
    </div>
  </div>
  <hr>
<!-- END BLOG ENTRIES -->
</div>

EOF-july

