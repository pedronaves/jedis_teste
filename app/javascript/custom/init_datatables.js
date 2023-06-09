import $ from 'jquery'
import DataTable from 'datatables.net-bs5'
import 'datatables.net-buttons-bs5'
import 'datatables.net-buttons-html5'
import 'jquery-highlight'

// https://datatables.net/blog/2014-10-22#Initialisation
// Highlight text that was found by searching in DataTables
function highlight( body, table )
{
  // Removing the old highlighting first
  body.unhighlight();

  // Don't highlight the "not found" row, so we get the rows using the api
  if ( table.rows( { filter: 'applied' } ).data().length ) {
    table.columns().every( function () {
        var column = this;
        column.nodes().flatten().to$().unhighlight({ className: 'column_highlight' });
        column.nodes().flatten().to$().highlight( column.search().trim().split(/\s+/), { className: 'column_highlight' } );
    } );
    body.highlight( table.search().trim().split(/\s+/) );
  }
}
// Listen for DataTables initialisations
$(document).on( 'init.dt.dth', function (e, settings, json) {
  if ( e.namespace !== 'dt' ) {
    return;
  }

  var table = new $.fn.dataTable.Api( settings );
  var body = $( table.table().body() );

  if (
    $( table.table().node() ).hasClass( 'searchHighlight' ) || // table has class
    settings.oInit.searchHighlight                          || // option specified
    $.fn.dataTable.defaults.searchHighlight                    // default set
  ) {
    table
      .on( 'draw.dt.dth column-visibility.dt.dth column-reorder.dt.dth', function () {
        highlight( body, table );
      } )
      .on( 'destroy', function () {
        // Remove event handler
        table.off( 'draw.dt.dth column-visibility.dt.dth column-reorder.dt.dth' );
      } );

    // initial highlight for state saved conditions and initial states
    if ( table.search() ) {
      highlight( body, table );
    }
  }
} );

$(document).on('turbo:load', function(e) {

  var datatable_table = $('#datatable').DataTable({
    dom: 'Bfrtip',
    language: {
        url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/pt-BR.json',
    },
    destroy: true,
    searchHighlight: true,
    paging:          true,
    buttons: [
      { extend: 'copy',
        text: 'Copiar'
      },
      { extend: 'csv',
        text: 'Download CSV'
      }
    ]
  });

  datatable_table.buttons().container().appendTo( '#datatable_wrapper .col-md-6:eq(0)' );

});

// Before caching the page, clear the search input field
$(document).on('turbo:before-cache', function() {
  if ( $('table#datatable').length > 0 ) {
    $.fn.dataTable.tables( { api: true } ).search("").draw();
    $.fn.dataTable.tables( { api: true } ).destroy();
  }
});
