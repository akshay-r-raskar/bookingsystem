<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th, td {
  padding: 10px;
}
</style>
<script>
function showAddBooking() {
    $("#addBookingDiv").toggle();
}
function addBooking() {
    var fromCity = $('#fromCity').val();
    var toCity = $('#toCity').val();
    var duration = $('#duration').val();
    $.ajax({
        type: "POST",
        url: "/addNew",
        data: `{
            "fromCity": "`+fromCity+ `",
            "toCity": "`+toCity+`",
            "duration": "`+duration+`"
        }`,
        dataType: "application/json",
        contentType:"application/json; charset=utf-8"
    }).done(reloadPage());
}

function reloadPage() {
    setTimeout(() => {
        location.reload();
    }, 2000);
}

$(function () { $(".select").click(function() {
    $("#modal").toggle();
    $("#idToBeUpdated").val($(this).parents("tr").find(".id").text());
    $("#updatedFromCity").val($(this).parents("tr").find(".fromCity").text());
    $("#updatedToCity").val($(this).parents("tr").find(".toCity").text());
    $("#updatedDuration").val($(this).parents("tr").find(".duration").text());
});
});

function updateThis() {
    var id = $("#idToBeUpdated").val();
    var fromCity = $('#updatedFromCity').val();
    var toCity = $('#updatedToCity').val();
    var duration = $('#updatedDuration').val();
    $.ajax({
        type: "PUT",
        url: "/update/" +id ,
        data: `{
            "fromCity": "`+fromCity+ `",
            "toCity": "`+toCity+`",
            "duration": "`+duration+`"
        }`,
        dataType: "application/json",
        contentType:"application/json; charset=utf-8"
    }).done(reloadPage());
}

function deleteThis(id) {
    $.ajax({
        type: "DELETE",
        url: "/delete/" +id ,
        dataType: "application/json",
        contentType:"application/json; charset=utf-8"
    }).done(reloadPage());
}

</script>
<html>
    <head>
        <title>View Bookings</title>
    </head>
    
    <body align="center">
        <div class="container">
            <div>
                <h2>Current bookings</h2>
            </div>
            <div>
                <button onclick="showAddBooking()">Click here to add a new booking</button>
            </div>
            <div id="addBookingDiv" style="display: none;">
                <label for="fromCity">From City</label>
                    <input name="fromCity" id="fromCity"/>
                <label for="toCity">To City</label>
                    <input name="toCity" id="toCity"/>
                <label for="duration">Duration</label>
                    <input name="duration" id="duration"/>
                <button onClick="addBooking()">Add</input>
            </div>

            <div id="modal" style="display: none;" role="dialog">
                <input name="idToBeUpdated" id="idToBeUpdated" type="hidden"/>
                <label for="updatedFromCity">From City</label>
                    <input name="updatedFromCity" id="updatedFromCity"/>
                <label for="updatedToCity">To City</label>
                    <input name="updatedToCity" id="updatedToCity"/>
                <label for="updatedDuration">Duration</label>
                    <input name="updatedDuration" id="updatedDuration"/>
                <button onClick="updateThis()">Update</input>
            </div>
            <div>
            <table>
                <thead>
                    <tr>
                        <th>Booking Id</th>
                        <th>From City</th>
                        <th>To City</th>
                        <th>Duration</th>
                        <th>Options</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${bookings}" var="booking">
                        <tr>
                            <td class="id">${booking.id}</td>
                            <td class="fromCity">${booking.fromCity}</td>
                            <td class="toCity">${booking.toCity}</td>
                            <td class="duration">${booking.duration}</td>
                            <td>
                                <input type="button" class="select" value="Load For Update" data-target="#modal">
                                <input type="button" value="Delete" onclick="deleteThis('${booking.id}')">
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            </div>
        </div>
    </body>
</html>