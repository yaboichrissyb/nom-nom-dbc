$(document).ready(function() {

  $(".post-container").on("click", ".vote-button", function(event){
    event.preventDefault();
    var url = $(this).children("a").attr("href")
    $that = $(this)
    $.ajax({
      method: "GET",
      url: url
    })
    .done(function(response){
    $that.children("a").css("color", "red")
    $that.parent().find(".points").html(response)
    $(".comment-points").html(response)
    });
  });

  $(".post-comments").on("click", ".comment-vote-button", function(event){
    event.preventDefault();
    var url = $(this).children("a").attr("href")
    $that = $(this)
    $.ajax({
      method: "GET",
      url: url
    })
    .done(function(response){
    $that.children("a").css("color", "red")
    });
  });

  $(".post-container").on("click", ".delete", function(event){
    event.preventDefault();
    var url = $(this).attr("href")
    $that = $(this)
    $.ajax({
      method: "DELETE",
      url: url
    })
    .done(function(response){
      $that.parents("#post"+response).remove()
    });
  });

  $("#comment").on("submit", function(event){
    event.preventDefault();
    $that = $(this)
    var currentCount = +$(".comments-count").html()
    var data = $(this).serialize()
    var url = $(this).attr("action")
    $.ajax({
      method: "POST",
      url: url,
      data: data
    })
    .done(function(response){
      $(".post-comments").append(response)
      $that.children("textarea").val("")
      $(".comments-count").html(currentCount+1)
    });
  });

  $("#posts").on("submit", function(event){
    event.preventDefault();
    $that = $(this)
    var data = $(this).serialize()
    var url = $(this).attr("action")
    $.ajax({
      method: "POST",
      url: url,
      data: data
    })
    .done(function(response){
      $("#posts-container").append(response)
      $that.children("input[name = 'title']").val("")
      $that.children("input[name = 'url']").val("")
    });
  });

  $("a[href='/sort/new']").on("click", function(){
    event.preventDefault();
    $.ajax({
      method: "GET",
      url: "/posts/new/sort"
    })
    .done(function(response){
      $("#posts-container").children().remove()
      $("#posts-container").append(response)
    });
  });

  $("a[href='/sort/comments']").on("click", function(){
    event.preventDefault();
    $.ajax({
      method: "GET",
      url: "/posts/comments/sort"
    })
    .done(function(response){
      $("#posts-container").children().remove()
      $("#posts-container").append(response)
    });
  });

  $("a[href='/sort/popular']").on("click", function(){
    event.preventDefault();
    $.ajax({
      method: "GET",
      url: "/posts/popular/sort"
    })
    .done(function(response){
      $("#posts-container").children().remove()
      $("#posts-container").append(response)
    });
  });

});
