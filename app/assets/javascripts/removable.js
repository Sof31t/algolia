$(document).ready(function() {
  $(document).on("click",".removable",function() {
    var app_id = $(this).attr('removable_id');
    var path = window.location.href.replace(/^(?:\/\/|[^\/]+)*\//, "");

    swal({
      title: 'Are you sure?',
      text: "You won't be able to revert this!",
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!',
      cancelButtonText: 'No, cancel!',
      confirmButtonClass: 'btn btn-success',
      cancelButtonClass: 'btn btn-danger',
      buttonsStyling: false
    }).then(function () {
      $.ajax({
        url: "/api/1/apps/"+app_id,
        type: 'DELETE',
        success: function() {
          swal({
            title: 'Deleted!',
            text: 'Your app has been deleted.',
            type: 'success',
            showConfirmButton: false,
            allowOutsideClick: false,
            timer: 2000
          }).then(
            function () {window.location.replace('/'+ path);},
            // handling the promise rejection
            function (dismiss) {
              if (dismiss === 'timer') {
                window.location.replace('/'+ path);
              }
            }
          )
        },
        error: function(){
          swal(
            '¯\_(ツ)_/¯',
            'An unknown error Happened.',
            'error'
          )
        }
      });
    }, function (dismiss) {
      // dismiss can be 'cancel', 'overlay',
      // 'close', and 'timer'
      if (dismiss === 'cancel') {
        swal(
          'Cancelled',
          'Your app is safe :)',
          'error'
        )
      }
    })
  });
});
