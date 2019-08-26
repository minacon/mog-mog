$(document).on("turbolinks:load",function(){
  function buildHTML(comment){
    let html = `<p>
                <strong>
                ${comment.user_name}：
                </strong>
                ${comment.text}
                </p>
                `
    return html;
  }

  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $('.comments').append(html)
      $('.comment-text').val('')
      $(".comment-submit").prop("disabled", false);
    })
    .fail(function(){
      alert('error');
    })
  })
});