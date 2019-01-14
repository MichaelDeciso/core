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