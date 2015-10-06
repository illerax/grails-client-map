<%@ page import="clientmap.Client" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>


</head>

<body>
<div class="row">
<div class="col-md-5">
<div>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table class="table table-condensed">
        <thead>
        <tr>

            <g:sortableColumn property="name" title="${message(code: 'client.name.label', default: 'Name')}"/>

            <g:sortableColumn property="email" title="${message(code: 'client.email.label', default: 'Email')}"/>

            <g:sortableColumn property="street" title="${message(code: 'client.street.label', default: 'Street')}"/>

            <g:sortableColumn property="zip" title="${message(code: 'client.zip.label', default: 'Zip')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${clientInstanceList}" status="i" var="clientInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${clientInstance.id}">${fieldValue(bean: clientInstance, field: "name")}</g:link></td>

                <td>${fieldValue(bean: clientInstance, field: "email")}</td>

                <td>${fieldValue(bean: clientInstance, field: "street")}</td>

                <td>${clientInstance.zip}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

</div>
    <div >
           <g:link class="btn btn-primary btn-md" role="button" action="create"><g:message code="default.new.label"
                                                                  args="[entityName]"/></g:link>
    </div>
</div>
<div class="col-md-7">

    <div id="map"  style="width:100%; height:450px">
    </div>

    <script>

        var map;
        function initMap() {
            map = new google.maps.Map(document.getElementById('map'), {
                center: {lat: -34.397, lng: 150.644},
                zoom: 8
            });

            var bounds = new google.maps.LatLngBounds();

            var latlng;
            <g:each in="${clientInstanceList}" var="location">
            if(${location.lat}&&${location.lng}) {
                latlng = new google.maps.LatLng(${location.lat}, ${location.lng});
                var marker${location.id} = new google.maps.Marker({
                    position: latlng,
                    map: map
                });

                var contentString${location.id} = '<h3>${location.name}</h3><p>${location.email}</p><p>${location.street} ${location.zip}</p>';

                var infowindow${location.id} = new google.maps.InfoWindow({
                    content: contentString${location.id}
                });

                marker${location.id}.addListener('click', function() {
                    infowindow${location.id}.open(map, marker${location.id});
                });

                bounds.extend(latlng);
            }
            </g:each>
            map.fitBounds(bounds);
        }

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBlsVTMy_gNOBGGshqhMMDOWXQYnJGC8vU&callback=initMap"
            async defer></script>
</div>
</div>

</body>
</html>
