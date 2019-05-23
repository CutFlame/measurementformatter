function showRelated(link) {
  $(".toggle").hide()
  var target = $(link).data("target");
  $(target).show();
}

function formatDate() {
    var value = $("#value").val();
    var dimension = $("#dimension option:selected").val();
    var unitOptions = $("#unitOptions option:selected").val();
    var unitStyle = $("#unitStyle option:selected").val();
    var locale = $("#locale option:selected").val();

    var params = $.param({
                    value: value, // need to properly escape the +
                    dimension: dimension,
                    unitOptions: unitOptions,
                    unitStyle: unitStyle,
                    locale: locale
    });

    var exampleCode = `
func format(value: Double) -> String {
    let formatter = MeasurementFormatter()
    formatter.locale = Locale(identifier: "${locale}")
    formatter.unitOptions = MeasurementFormatter.UnitOptions.${unitOptions}
    formatter.unitStyle = MeasurementFormatter.UnitStyle.${unitStyle}

    let measurement = Measurement(value: value, unit: ${dimension})
    let result = formatter.string(from: measurement)
    return result
}

func unitSymbol() -> String {
    let formatter = MeasurementFormatter()
    formatter.locale = Locale(identifier: "${locale}")
    formatter.unitOptions = MeasurementFormatter.UnitOptions.${unitOptions}
    formatter.unitStyle = MeasurementFormatter.UnitStyle.${unitStyle}
    let result = formatter.string(from: ${dimension})
    return result
}
`;
    $("#codeExample").html(exampleCode);
    
    document.querySelectorAll('pre code').forEach((block) => {
                                                  hljs.highlightBlock(block);
                                                  });

    $("#result").html("...");
    $.ajax('/format', {
        type: "post",
        data: params,
        dataType: 'json',
        success: function(data, status, xhr) {
            if (data.status == "ok") {
                $("#result").text(data.result);
            } else {
                $("#result").html("<em>Invalid value</em>");
            }
        }
    })
}

$(function() {
  var activeLink = $("ul.nav li a.active")[0];
  showRelated(activeLink);

  $("ul.nav li a").click(function(e) {
    e.preventDefault();
    $("ul.nav li a").removeClass("active");
    $(this).addClass("active");
    showRelated(this);
    return false;
  });

  $(".try input[type='text']").on('keypress', function(e) {
    if (e.keyCode == 13) {
      e.preventDefault()
      formatDate()
    }
  });

  $(".try input[type='text']").change(function() {
    formatDate();
  })

  $(".try input[type='number']").on('keypress', function(e) {
                                  if (e.keyCode == 13) {
                                  e.preventDefault()
                                  formatDate()
                                  }
                                  });

  $(".try input[type='number']").change(function() {
                                      formatDate();
                                      })
  $('#dimension').change(function() {
                         formatDate()
                         });

  $('#unitOptions').change(function() {
                      formatDate()
                      });

  $('#unitStyle').change(function() {
                         formatDate()
                         });

  $('#locale').change(function() {
                      formatDate()
                      });

  // also run on load
  formatDate();
});
