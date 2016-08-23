// key =8e399149c84faa2a335f632deecce2cb
// id = 8bf48580

function MiniListing(response){
  this.name = response.recipeName;
  this.imageUrl = response.imageUrlsBySize[90].replace(/=.*$/,"");
  this.ingredients = response.ingredients;
  this.id = response.id;
}

function FullListing(response){
  this.responseUrl = response.source.sourceRecipeUrl;
  this.ingredients = response.ingredientLines;
  this.imageUrl = response.images[0].imageUrlsBySize[360].replace(/=.*$/,"");
}

MiniListing.prototype.returnHtml=function(){
  var html = "";
  html += "<a href ='" + this.id + "' class = 'recipe-link'><div class='recipe-listing'><div class = 'recipe-name'>" + this.name + "</div>";
  // html += "<img src='" + this.imageUrl + "' class = 'recipe-image' />";
  html += "<ul class='ingredients'>";
  // this.ingredients.forEach(function(ingredient){
  //   html += "<li>"+ingredient+"</li>";
  // });
  html += "</ul></div></a>";
  return html;
};
FullListing.prototype.returnHtml=function(){
  var html = "";
  html += "<div data-id=" + this.listing_id + " class='listing'>";
  html += "<a href='" + this.url + "' target=_blank>";
  // html += "<img src='" + this.image_url + "' />";
  html += "<p>" + this.title + "</p>";
  html += "</a>";
  html += "</div>";
  return html;
};
$(document).ready(function() {
  $(function() {
      $( ".datepicker" ).datepicker();
    });
  $(".get-recipes .add-event-form").on("click", function(event){
    event.preventDefault();
    $(".hidden-recipes").children().remove();
    var baseURL = "http://api.yummly.com/v1/api/recipes?_app_id=8bf48580&_app_key=8e399149c84faa2a335f632deecce2cb";
    var data = $(this).serialize();
    var url = baseURL + data;
    // $(".hidden-recipes").toggle();
    var ajaxRequest = $.ajax({
      method: "GET",
      url: url
    });

    ajaxRequest.done(function(response){
      // $(".hidden-recipes").text(response);
      var matches = response.matches;
      var html = "";
      for(var index = 0; index<matches.length; index++){
      var recipe = new MiniListing(matches[index]);
      var imageUrl = matches[index].imageUrlsBySize[90].replace(/=.*$/,"");
      var ingredients = recipe.ingredients.toString().substring(0,25);
      html += "<div class = 'recipe-name'><a href='" + recipe.id +"' class = 'recipe-link'>" +recipe.recipeName+ "</a></div>";
      html += "<div class = 'recipe-name'>" + recipe.recipeName + "</div>";
      html += "<div class = 'ingredients'>" + ingredients + "</div>";
      html += "<div class = '";
      $(".hidden-recipes").append(recipe.returnHtml());
      $(".recipe-listing").last().css("background-image","url("+ recipe.imageUrl+")");
      $(".recipe-listing").last().css("background-repeat","no-repeat");
      $(".recipe-listing").last().css("background-size","cover");
    }
      var data = response.attribution;
    });
  });

  $(".hidden-recipes").on("click", ".recipe-link", function(event){
    event.preventDefault();
    var recipeId = $(this).attr("href");
    var url = "http://api.yummly.com/v1/api/recipe/"+recipeId+"?_app_id=8bf48580&_app_key=8e399149c84faa2a335f632deecce2cb";
    var ajaxRequest = $.ajax({
      method: "GET",
      url: url
    });
    ajaxRequest.done(function(response){
      var recipe = new FullListing(response);
      var win = window.open(recipe.responseUrl, "recipe");
      if(win){
          win.focus();
      }else{
          alert('Please allow popups for this site');
      }
    });
  });
});






