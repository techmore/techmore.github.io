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
    <img src="july-15-2017.png" alt="Nature" style="width:50%">
    <div class="w3-container">
      <h3><b>Mead staggard nutrient fermentation</b></h3>
      <h5>Optomizing yeast and time<span class="w3-opacity">July 15, 2017</span></h5>
    </div>
    <div class="w3-container">
      <p>Requirements Sanitizer spray bottle, 1 gallon carboy, funnel, 3 lbs honey, teaspoon.</p>
      <p> Start yeast - sterilize bowl 2oz water @ 104-109 f for 15 minutes</p>
      <p> Fill carboy 1/3 with water, add honey and stir vigorously.</p>
      <p>    Note : Avoid heating the honey for better flavor or effect.</p>
      <p>           Potable water probably brewable water. </p>
      <p> Add yeast to carboy fill with water until 3 inches left.</p>
      <p> Fit airlock with sterile water.</p>
      <p> Staggard Nutrient Bonus rounds!</p>
      <p> Add yeast nutrients on the following days after initial creation</p>
      <p>  day 2</p>
      <p>  day 3</p>
      <p>  day 5</p>      
      <p>Rack after clear, approximately 2 - 3 weeks.</p>
      <p>Possibly drinkable or rack another 3 weeks.</p>
      <p></p>
      <p>Recipe is inspired by these links
      <a href="http://brewingtv.com/episodes/2010/10/8/brewing-tv-episode-21-making-mead-with-curt-stock.html">Brewing TV Episode 21 Making Mead With Curt Stock</a>
      <a href="https://www.youtube.com/watch?v=_Ld4hO_GeP0">Ask This Old House - Homebrew Mead</a>
      
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

