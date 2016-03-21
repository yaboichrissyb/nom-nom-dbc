// key =8e399149c84faa2a335f632deecce2cb
// id = 8bf48580

function MiniListing(response){
  this.name = response.recipeName;
  this.imageUrl = response.imageUrlsBySize[90].replace(/=.*$/,"");
  this.ingredients = response.ingredients;
  this.id = response.id;
};

function FullListing(response){
  this.responseUrl = response.source.sourceRecipeUrl;
  this.ingredients = response.ingredientLines;
  this.imageUrl = response.images[0].imageUrlsBySize[360].replace(/=.*$/,"");
}

MiniListing.prototype.returnHtml=function(){
  var html = ""
  html += "<a href ='" + this.id + "' class = 'recipe-link'><div class='recipe-listing'><div class = 'recipe-name'>" + this.name + "</div>";
  // html += "<img src='" + this.imageUrl + "' class = 'recipe-image' />";
  html += "<ul class='ingredients'>";
  // this.ingredients.forEach(function(ingredient){
  //   html += "<li>"+ingredient+"</li>";
  // });
  html += "</ul></div></a>";
  return html;
}
FullListing.prototype.returnHtml=function(){
  var html = ""
  html += "<div data-id=" + this.listing_id + " class='listing'>";
  html += "<a href='" + this.url + "' target=_blank>";
  // html += "<img src='" + this.image_url + "' />";
  html += "<p>" + this.title + "</p>";
  html += "</a>";
  html += "</div>";
  return html;
}
$(document).ready(function() {
  //datepicker
  $(function() {
      $( ".datepicker" ).datepicker();
    });

  $(".get-recipes").on("submit", function(event){
    event.preventDefault();
    $(".hidden-recipes").children().remove();
    var baseURL = "http://api.yummly.com/v1/api/recipes?_app_id=8bf48580&_app_key=***************************";
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
      console.log(response.matches)
      var html = "";
      for(var index = 0; index<matches.length; index++){

      var recipe = new MiniListing(matches[index]);
      // var imageUrl = response.imageUrlsBySize[90].replace(/=.*$/,"");
      // var ingredients = ""
      // var ingredients += recipe.ingredients.toString().substring(0,25)
      // html += "<div class = 'recipe-name'><a href='" + recipe.id +"' class = 'recipe-link'>" +recipe.recipeName+ "</a></div>"
      // html += "<div class = 'recipe-name'>" + recipe.recipeName + "</div>"
      // html += "<div class = 'ingredients'>" + ingredients + "</div>"
      // html += "<div class = '"
      $(".hidden-recipes").append(recipe.returnHtml());
      $(".recipe-listing").last().css("background-image","url("+ recipe.imageUrl+")");
      // $(".recipe-listing").last().css("background-repeat","no-repeat");
      // $(".recipe-listing").last().css("background-size","cover");
    }


      // var data = response.attribution
    });
  });

  $(".hidden-recipes").on("click", ".recipe-link", function(event){
    event.preventDefault();
    var recipeId = $(this).attr("href");
    var url = "http://api.yummly.com/v1/api/recipe/"+recipeId+"?_app_id=8bf48580&_app_key=*************************";
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
      };
    });
  });
});






//   $(".post-container").on("click", ".vote-button", function(event){
//     event.preventDefault();
//     var url = $(this).children("a").attr("href")
//     $that = $(this)
//     $.ajax({
//       method: "GET",
//       url: url
//     })
//     .done(function(response){
//     $that.children("a").css("color", "red")
//     $that.parent().find(".points").html(response)
//     $(".comment-points").html(response)
//     });
//   });

//   $(".post-comments").on("click", ".comment-vote-button", function(event){
//     event.preventDefault();
//     var url = $(this).children("a").attr("href")
//     $that = $(this)
//     $.ajax({
//       method: "GET",
//       url: url
//     })
//     .done(function(response){
//     $that.children("a").css("color", "red")
//     });
//   });

//   $(".post-container").on("click", ".delete", function(event){
//     event.preventDefault();
//     var url = $(this).attr("href")
//     $that = $(this)
//     $.ajax({
//       method: "DELETE",
//       url: url
//     })
//     .done(function(response){
//       $that.parents("#post"+response).remove()
//     });
//   });

//   $("#comment").on("submit", function(event){
//     event.preventDefault();
//     $that = $(this)
//     var currentCount = +$(".comments-count").html()
//     var data = $(this).serialize()
//     var url = $(this).attr("action")
//     $.ajax({
//       method: "POST",
//       url: url,
//       data: data
//     })
//     .done(function(response){
//       $(".post-comments").append(response)
//       $that.children("textarea").val("")
//       $(".comments-count").html(currentCount+1)
//     });
//   });

//   $("#posts").on("submit", function(event){
//     event.preventDefault();
//     $that = $(this)
//     var data = $(this).serialize()
//     var url = $(this).attr("action")
//     $.ajax({
//       method: "POST",
//       url: url,
//       data: data
//     })
//     .done(function(response){
//       $("#posts-container").append(response)
//       $that.children("input[name = 'title']").val("")
//       $that.children("input[name = 'url']").val("")
//     });
//   });

//   $("a[href='/sort/new']").on("click", function(){
//     event.preventDefault();
//     $.ajax({
//       method: "GET",
//       url: "/posts/new/sort"
//     })
//     .done(function(response){
//       $("#posts-container").children().remove()
//       $("#posts-container").append(response)
//     });
//   });

//   $("a[href='/sort/comments']").on("click", function(){
//     event.preventDefault();
//     $.ajax({
//       method: "GET",
//       url: "/posts/comments/sort"
//     })
//     .done(function(response){
//       $("#posts-container").children().remove()
//       $("#posts-container").append(response)
//     });
//   });

//   $("a[href='/sort/popular']").on("click", function(){
//     event.preventDefault();
//     $.ajax({
//       method: "GET",
//       url: "/posts/popular/sort"
//     })
//     .done(function(response){
//       $("#posts-container").children().remove()
//       $("#posts-container").append(response)
//     });
//   });

// });
