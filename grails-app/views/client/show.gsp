<%@ page import="clientmap.Client" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<div class="row">
    <div class="col-md-5">

<div id="show-client" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list client">

        <g:if test="${clientInstance?.name}">
            <li class="fieldcontain">
                <span id="name-label" class="property-label"><g:message code="client.name.label" default="Name"/></span>

                <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${clientInstance}"
                                                                                        field="name"/></span>

            </li>
        </g:if>

        <g:if test="${clientInstance?.email}">
            <li class="fieldcontain">
                <span id="email-label" class="property-label"><g:message code="client.email.label"
                                                                         default="Email"/></span>

                <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${clientInstance}"
                                                                                         field="email"/></span>

            </li>
        </g:if>

        <g:if test="${clientInstance?.street}">
            <li class="fieldcontain">
                <span id="street-label" class="property-label"><g:message code="client.street.label"
                                                                          default="Street"/></span>

                <span class="property-value" aria-labelledby="street-label"><g:fieldValue bean="${clientInstance}"
                                                                                          field="street"/></span>

            </li>
        </g:if>

        <g:if test="${clientInstance?.zip}">
            <li class="fieldcontain">
                <span id="zip-label" class="property-label"><g:message code="client.zip.label" default="Zip"/></span>

                <span class="property-value" aria-labelledby="zip-label"><g:fieldValue bean="${clientInstance}"
                                                                                       field="zip"/></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: clientInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="btn btn-warning btn-md" action="edit" resource="${clientInstance}"><g:message code="default.button.edit.label"
                                                                                       default="Edit"/></g:link>
            <g:actionSubmit class="btn btn-danger btn-md" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
    </div>
    <div class="col-md-7">
        <br><br>
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

                if(${clientInstance.lat}&&${clientInstance.lng}) {
                    latlng = new google.maps.LatLng(${clientInstance.lat}, ${clientInstance.lng});
                    var marker = new google.maps.Marker({
                        position: latlng,
                        map: map
                    });

                    var contentString = '<h3>${clientInstance.name}</h3><p>${clientInstance.email}</p><p>${clientInstance.street} ${clientInstance.zip}</p>';

                    var infowindow = new google.maps.InfoWindow({
                        content: contentString
                    });

                    marker.addListener('click', function() {
                        infowindow.open(map, marker);
                    });

                    bounds.extend(latlng);
                }

                map.fitBounds(bounds);
            }

        </script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBlsVTMy_gNOBGGshqhMMDOWXQYnJGC8vU&callback=initMap"
                async defer></script>
        </div>

</div>
</body>
</html>
