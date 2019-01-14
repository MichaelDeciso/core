<?php include 'guiconfig.inc'; ?>
<?php print_service_banner('firewall'); ?>
<section class="col-xs-12">
    <ul class="nav nav-tabs" data-tabs="tabs" id="maintabs">
        {% for i, tabname in dataTabs %}
        <li {% if i == 0 %}class="active"{% endif %}>
        <a data-toggle="tab" href="#{{ tabname }}" id="{{ tabname }}_tab">
            {{ tabname }}
        </a>
        </li>
        {% endfor %}
    </ul>
    <div class="tab-content content-box">
        {% for i, tabname in dataTabs %}
        <div id="{{ tabname }}" class="tab-pane fade in {% if i == 0 %}active{% endif %}">
            <br/>
            <div class="container-fluid">
                <pre id="data_{{ tabname }}" class="pre-scrollable" >
                    {{ lang._('Gathering PF information, please wait…') }}
                </pre>
            </div>
            <br/>
        </div>
        {% endfor %}
    </div>
</section>

<script>
    'use strict';

    $(document).ready(function () {
        setInterval(function() {
            ajaxCall('/diag_pf_info.php', {}, function(data, status) {
                // push data into tabs
                $.each(data, function (key, value) {
                    if ($('#data_' + key.toLowerCase()).length > 0) {
                        $('#data_' + key.toLowerCase()).text(value);
                    }
                });
            });
        }, 2000);
    });
</script>