
<%inherit file="main.mako"/>
<%block name="subnav">
<%include file="subnav.mako" />
</%block>
<%!
	from tools import utils
%>
% if data is not None and fields is not None and len(fields)>0:
	<form method="post" action="update?id=${data.id}">
	<table>
		<% filtered_fields = utils.filter_fields(fields, 'update') %>
		% for field,finfo in filtered_fields.iteritems():
			<tr>
				<td>${finfo['name']}</td>
				<td><input type="text" name="${field}" id="${field}" value="${data.__dict__[field]}" /></td>
			</tr>
		%endfor
			<tr>
				<td>Submit</td>
				<td><input type="submit" value="Submit" /></td>
			</tr>
	</table>
	</form>
% else:
	No data found!
% endif