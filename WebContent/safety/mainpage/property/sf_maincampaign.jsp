<%@page import="vo.CampaignVO"%>
<%@page import="dao.CampaignDAO"%>

<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

	String cp = request.getParameter("cp");

	int currentPage = 0;

	if(cp!=null){
		currentPage = Integer.parseInt(cp);
	}else {
		currentPage = 1;
	}

	CampaignDAO dao = new CampaignDAO();


	int totalCount = dao.getTotalCount();


	int recordByPage = 3;

	// 총 페이지 수
	int totalPage =
		(totalCount%recordByPage==0)?totalCount/recordByPage:totalCount/recordByPage+1;





	int startNo = (currentPage-1)*recordByPage+1;


 	int endNo = currentPage*recordByPage;


%>

<link rel="stylesheet" href="../css/safety_mainpage_maincampaign.css">
<div class="sf_div_wrap">
	<div id="contents">
		<div id="container">
		<%

			ArrayList<CampaignVO> list = dao.getAllData(startNo, endNo);

			for(CampaignVO vo : list) {

		%>
		<div id="com">

			<a href="<%=vo.getCamlink() %>?bno=<%=vo.getBno() %>">
				<img id="camimg" src="../<%=vo.getCamimg() %>" alt="<%=vo.getCamtitle() %>" />
			</a>
			<div class="p1"><%=vo.getCamtitle() %></div>
			<div class="p2"><%=vo.getCamcontents() %></div>


		</div>

		<%
			}
		%>
		</div>
	<div id="paging">
	<table id="tb1">
	<tr id="tr1">
			<td id="pageList">
				<%
					for(int i=currentPage-3; i<=currentPage+3; i++){
						if(i<=0){
							continue;
						}else if(i>totalPage){
							break;
						}else {
				%>

				<a href="test4.jsp?cp=<%=i %>"><span id="page"></span></a>
				<%
					}// if end

				}// for end

				%>

			</td>
		</tr>
	</table>

	<div>
	<a href="test4.jsp?cp=<%=currentPage+1 %>">
		<div class="sf_div_page1">
			<img src="../image/right.png" alt="" style="width: 100%; height: 100%;" />
		</div>
	</a>
	<a href="test4.jsp?cp=<%=currentPage-1 %>">
	 	<div class="sf_div_page2">
			<img src="../image/left.png" alt="" style="width: 100%; height: 100%;" />
		</div>
	</a>
	</div>
	</div>
	</div>
</div>