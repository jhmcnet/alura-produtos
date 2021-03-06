<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="<c:url value="/js/jquery.js"/>"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		function removeProduto(id){
			$("#mensagem").load('<c:url value="/produto/remove"/>' + '?produto.id=' + id);
			$("#produto" + id).remove();
		}
	</script>
	<h2><fmt:message key="mensagem.bemvindo"/></h2>
	<h1>Produtos</h1>
	<div id="mensagem"></div>
	<table width="100%">
		<tr>
			<td>NumInteração</td>
			<td width="20%">Nome</td>
			<td>Preco</td>
			<td>Descricao</td>
			<td>Data de Inicio da Venda</td>
			<td>Usado?</td>
			<td width="20%">Remover?</td>
		</tr>
		<c:forEach var="p" varStatus="st" items="${produtoList }">
			<tr id="produto${p.id }">
				<td>${st.count }</td>
				<td>${p.nome.toUpperCase()}</td>
				<td><fmt:formatNumber value="${p.preco}" type="currency"/></td>
				<td>${p.descricao}></td>
				<td><fmt:formatDate value="${p.dataInicioVenda.time}" pattern="EEEE, dd 'de' MMMM 'de' yyyy"/></td>
				<c:choose>
					<c:when test="${p.usado }">																																																																																																																																																																																																																																																																																																																																																																																																																																																																																							
						<td>sim</td>
					</c:when>
					<c:otherwise>
						<td>Nao</td>	
					</c:otherwise>																																																																																																																																																																																																																																																																																																										
				</c:choose>
				<td><a href="#" onclick="return removeProduto(${p.id})">Remover</a></td>
			</tr>
		</c:forEach>
	</table>
	<c:url value="/produto/formulario" var="formularioProduto" />
	<br>
	<a href=${formularioProduto }><fmt:message key="mensagem.novoProduto"/></a>
	<br>

	<c:set var="nome" value="João da Silva" />
<c:out value="${nome}" />

<c:import url="../_comum/rodape.jsp"></c:import>

</body>
</html>