<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>




<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Add Approval Process</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Approval Process</li>
                           <li class="breadcrumb-item active" aria-current="page">Approval Processes</li>
                        </ol>
                     </nav>
                  </div>

               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active"  href="addApprovalMaster">Add</a>
                              <a class="nav-item nav-link "  href="viewApprovalMaster" >View</a>
                           </ul>
                           <div class="indicatorslist">
                              
                              
                              <p class="ml-2" style="color: red;">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        <form:form action="addApprovalMaster" autocomplete="off" method="post" modelAttribute="processObj" id="processForm" >
                      <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                        <div class="card-body">
                           <!--Static-->
                           <!--Text Input-->
                             <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-text-input2">Process Name <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <input type="text" id="processName" class="form-control" placeholder="Process Name" name="txtProcessName" maxlength="50" autofocus="autofocus" tabindex="1">
                                 
                              </div>
                           </div>
                            <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label" for="demo-textarea-input">Description</label>
                              <div class="col-12 col-md-6 col-xl-4"><span class="colon">:</span>
                                 <textarea id="demo-textarea-input" rows="4" class="form-control" name="desc" placeholder="Description"maxlength="200" tabindex="2"></textarea><div id="charNum"></div>
                              </div>
                           </div>
                             <div class="form-group row pad-ver">
                              <label class="col-12 col-md-2 col-xl-2 control-label">Status</label>
                              <div class="col-12 col-md-6 col-xl-4">
                              <span class="colon">:</span>
                                 <div class="radio">
                                    <input id="demo-form-radio" class="magic-radio sampleyes" type="radio" checked="checked" name="intDeletedFlag" value="false" >
                                    <label for="demo-form-radio" tabindex="3">Active</label>
                             
                                    <input id="demo-form-radio-2" class="magic-radio sampleno" type="radio" name="intDeletedFlag" value="true" >
                                    <label for="demo-form-radio-2" tabindex="4">Inactive</label>
                                 </div>
                              </div>
                           </div>
                           <div class="form-group row">
                              <label class="col-12 col-md-2 col-xl-2 control-label"></label>
                              <div class="col-12 col-md-6 col-xl-4">
                                 
                                 <button class="btn btn-primary mb-1" id="btnSubmitId" tabindex="5">Submit</button>
                                 <button type="reset" class="btn btn btn-danger mb-1" tabindex="6" id="btnResetId">Reset</button>
                                 
                              </div>
                           </div>
                        </div>
                        </form:form>
                        <!--===================================================-->
                        <!-- END BASIC FORM ELEMENTS -->
                     </div>
                  </div>
               </div>
            </div>
         </div>
  
<script>
	$(function(){

		   $(".selectall").click(function(){
			$(".individual").prop("checked",$(this).prop("checked"));
			});
		
		
	});
</script>


<script>
$(document).ready(function(){
	   $('#btnSubmitId').click(function(){
		   event.preventDefault();
		   var desc=$('#demo-textarea-input').val();
		   var processname = $('#processName').val();
		   var desc_regex = /^([a-zA-Z0-9 (:)#;/,.-]){0,200}$/;
		  
		   if (processname == ""){
		     	swal("Error", "Please enter the Process Name", "error").then(function() {
						   $("#processName").focus();
					   });
		         return false;
		     }
		     
		     if(processname.charAt(0)== ' ' || processname.charAt(processname.length - 1)== ' '){
					   swal("Error", "White space is not allowed at initial and last place in Process Name", "error").then(function() {
						   $("#processName").focus();
					   });
			            return false;
				   }
		     if(processname!=null)
		  	{
			   		var count= 0;
			   		var i;
			   		for(i=0;i<processname.length && i+1 < processname.length;i++)
			   		{
			   			if ((processname.charAt(i) == ' ') && (processname.charAt(i + 1) == ' ')) 
			   			{
							count++;
						}
			   		}
			   		if (count > 0) {
			   			swal("Error", "Process Name should not contain consecutive blank spaces", "error").then(function() {
						   $("#processName").focus();
						});
						return false;
					}
		  	}
		     if(/^[a-zA-Z ]*$/.test(processname) == false) {
		     	swal("Error","Process Name accept only alphabets", "error").then(function() {
						   $("#processName").focus();
					   });
		     	return false;
		     }
		   if(desc.charAt(0)== ' ' || desc.charAt(desc.length - 1)== ' '){
			   swal("Error", "White space is not allowed at initial and last place in Description", "error").then(function() {
				   $("#demo-textarea-input").focus();
			   });
	            return false;
		   }
     if(!desc.match(desc_regex))
  	{
  		swal("Error", "Description accept only alphabets,numbers and (:)#;/,.-\\ characters", "error").then(function() {
				   $("#demo-textarea-input").focus();
			});
			return false;
  	}
	   	if(desc!=null)
  	{
	   		var count= 0;
	   		var i;
	   		for(i=0;i<desc.length && i+1 < desc.length;i++)
	   		{
	   			if ((desc.charAt(i) == ' ') && (desc.charAt(i + 1) == ' ')) 
	   			{
					count++;
				}
	   		}
	   		if (count > 0) {
	   			swal("Error", "Description should not contain consecutive blank spaces", "error").then(function() {
				   $("#demo-textarea-input").focus();
				});
				return false;
			}
  	}
	   	var descLen=desc.length;
	   	if (desc.charAt(0) == '!' || desc.charAt(0) == '@' 
			|| desc.charAt(0) == '#' || desc.charAt(0) == '$' 
			|| desc.charAt(0) == '&' || desc.charAt(0) == '*' 
			|| desc.charAt(0) == '(' || desc.charAt(0) == ')' 
			|| desc.charAt(descLen - 1) == '!' || desc.charAt(descLen - 1) == '@' 
			|| desc.charAt(descLen - 1) == '#' || desc.charAt(descLen - 1) == '$' 
			|| desc.charAt(descLen - 1) == '&' || desc.charAt(descLen - 1) == '*' 
			|| desc.charAt(descLen - 1) == '(' || desc.charAt(descLen - 1) == ')') 
	   	{
			swal("Error", "!@#$&*() characters are not allowed at initial and last place in Description", "error").then(function() {
				   $("#demo-textarea-input").focus();
			});
			return false;
		}else{ 
        	swal({
           		title: ' Do you want to submit?',
           		  type: 'warning',
           		  showCancelButton: true,
           		  confirmButtonText: 'Yes',
           		  cancelButtonText: 'No',
       	    }).then((result) => {
       	    	  if (result.value) {
       	    		 $("#processForm").submit(); 
       	    		  }
       	    		})
        }
          return false; 	
	   });
	   });
</script>

<script>
$(document).ready(function(){
	 var text_max = 200;
	 $('#btnResetId').click(function() {
		 $('#charNum').html('Maximum characters :' + '200');
	 });
	 
	 $('#charNum').html('Maximum characters :' + text_max);

	 $('#demo-textarea-input').keyup(function() {
	     var text_length = $('#demo-textarea-input').val().length;
	     var text_remaining = text_max - text_length;

	     $('#charNum').html('Maximum characters :' + text_remaining);
	 });
});
</script> 
<c:if test="${not empty msg}">

	<script>
	 $(document).ready(function(){   
	swal("Success", "<c:out value='${msg}'/> ", "success"); 
	 });
</script>
</c:if>
      <c:if test="${not empty errMsg}">
	<script>
	 $(document).ready(function(){   
	swal("${errMsg}"," ", "error"); 
	 });
</script>
</c:if>
<script>
	   $(document).ready(function(){
	   	if('${errMsg}' != '')
	   	{
	   		swal("Error", "${errMsg}", "error");
			document.getElementById('${FieldId}').focus();
	   	}	
	   });
</script>