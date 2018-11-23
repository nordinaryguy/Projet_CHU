<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title> Générateur de questionnaire</title>

    <link href="/Projet_ESTER/css/old/bootstrap-responsive.min.css" rel="stylesheet">
    <link href="/Projet_ESTER/css/old/bootstrap.min.css" rel="stylesheet">
    <link href="/Projet_ESTER/css/style.css" rel="stylesheet">
    <script src="/Projet_ESTER/js/old/jquery.min.js"></script>
    <script src="/Projet_ESTER/js/popper.min.js"></script>
    <script src="/Projet_ESTER/js/old/bootstrap.min.js"></script>
    <script src="/Projet_ESTER/js/fb.js"></script>
    <script src="/Projet_ESTER/js/slideBare.js"></script>
      
    
  </head>

  <body>
  <!-- entete de page (logo) -->
 
 
  <div class="shadowbottom" >
    <div class="repeating-linear">
      <div class="row">
            <div class="col-md-7" style="text-align: center;" >
              <img src="/Projet_ESTER/img/irset.png" width="150px";margin-top="80px" >
            </div>
            <div class="col-md-3" style="text-align: center;" >
              <img src="/Projet_ESTER/img/ua_h.png" width="150px" >
            </div>
    	 </div>
   
     </div>
   </div>
 
   <!-- questionnaire -->
    <div class="container">
      <div class="row clearfix">
        <div class="col-md-8">
          <div class="clearfix">
           <div class="shadowbottom">
            <h2  style="border-radius: 10px; text-align:center">Questionnaire </h2>
           </div>
            <div class="shadowbottom" >
	            <div id="build" >
	              <form id="target" class="form-horizontal"  method="post" style="word-wrap: break-word;overflow: auto; background:white;min-height: 400px ;">
	                <fieldset>
	                  <div id="legend" class="component" rel="popover" title="Form Title" trigger="manual"
	                    data-content="
	                    <form class='form'>
	                      <div class='form-group col-md-12'>
	                        <label class='control-label'>titre</label> <input class='form-control' type='text' name='title' id='text'>
	                        <hr/>
	                        <button class='btn btn-info'>enregistrer</button><button class='btn btn-danger'>fermer</button>
	                      </div>
	                    </form>" data-html="true"
	                    >
	                    <legend class="valtype" data-valtype="text">Veuillez saisir le nom de votre questionnaire ... </legend>
	                  </div>
	                </fieldset>
	              </form>
	            </div>
            </div>
          </div>
        </div>

        <div class="col-md-4">
         <div class="shadowbottom">
            <h2 style="border-radius: 10px; text-align:center"> Faites glisser les élements de votre questionnaire</h2>
         </div>
          <div class="tabbable">
            <ul class="nav nav-tabs" id="navtab" >
              <li class="active" ><a href="#1" data-toggle="tab" style="background:#6bb8c8">Questions</a></li>
              <li class><a id="sourcetab" href="#5" data-toggle="tab" style="background:#6bb8c8">Html source </a></li>
            </ul>
           <div class="shadowbottom">
            <form class="form-horizontal" id="components"style="background:white" method="post">
              <fieldset>
                <div class="tab-content">
                  <div class="tab-pane active" id="1">
                    <div class="form-group component active" data-type="text" rel="popover" title="Text Input" trigger="manual"
                      data-content="
                      <form class='form'>
                        <div class='form-group col-md-12'>
                          <label class='control-label'>veuillez saisir votre texte</label> <input class='form-control' type='text' name='label' id='label'>
                          <label class='control-label'>texte par defaut</label> <input type='text' name='placeholder' id='placeholder' class='form-control'>
                          <hr/>
                          <button class='btn btn-info'>enregistrer</button><button class='btn btn-danger'>fermer</button>
                        </div>
                      </form>" data-html="true" 
                      >
                      <!-- Text input-->
                      <label class="col-md-4 control-label valtype" name="label01" for="input01" data-valtype='label'>Question de type texte (court):</label>
                      <div class="col-md-4">
                        <input type="text" placeholder="texte par defaut" name="input01" class="form-control input-md valtype" data-valtype="placeholder" >
                      </div>
                    </div>

                    <div class="form-group component" rel="popover"  trigger="manual"
                      data-content="
                      <form class='form'>
                        <div class='form-group col-md-12'>
                          <label class='control-label'>Texte</label> <input class='form-control' type='text' name='label' id='label'>
                          <label class='control-label'>Options: </label>
                          <textarea class='form-control' style='min-height: 200px' id='option'></textarea>
                          <hr/>
                          <button class='btn btn-info'>enregistrer</button><button class='btn btn-danger'>fermer</button>
                        </div>
                      </form>" data-html="true"
                      >
                      <!-- Select Multiple -->
                      <label class="col-md-4 control-label valtype" data-valtype="label">Question choix unique (liste déroulante) :</label>
                      <div class="col-md-4">
                        <select class="form-control input-md valtype" multiple="multiple" data-valtype="option">
                          <option>Veuillez </option>
                          <option>Entrer</option>
                          <option>Vos</option>
                          <option>Options !</option>
                        </select>
                      </div>
                    </div>

                    <div class="form-group component" rel="popover" title="Multiple Checkboxes" trigger="manual"
                      data-content="
                      <form class='form'>
                        <div class='form-group col-md-12'>
                          <label class='control-label'>texte</label> <input class='form-control' type='text' name='label' id='label'>
                          <label class='control-label'>Options: </label>
                          <textarea class='form-control' style='min-height: 200px' id='checkboxes'> </textarea>
                          <hr/>
                          <button class='btn btn-info'>enregistrer</button><button class='btn btn-danger'>fermer</button>
                        </div>
                      </form>" data-html="true"
                      >
                      <!-- Multiple Checkboxes -->
                      <label class="col-md-4 control-label valtype" data-valtype="label">Question à choix multiple</label>
                      <div class="col-md-4 valtype" data-valtype="checkboxes">

                        <label class="checkbox">
                          <input type="checkbox" value=" Option one ">
                          Option 1
                        </label>
                        <label class="checkbox">
                          <input type="checkbox" value=" Option two ">
                          Option 2
                        </label>
                      </div>
                    </div>
                    
                  
                    <div class="form-group component" rel="popover" title="Multiple Radios" trigger="manual"
                      data-content="
                      <form class='form'>
                        <div class='form-group col-md-12'>
                          <label class='control-label'>Label Text</label> <input class='form-control' type='text' name='label' id='label'>
                          <label class='control-label'>Group Name Attribute</label> <input class='form-control' type='text' name='name' id='name'>
                          <label class='control-label'>Options: </label>
                          <textarea class='form-control' style='min-height: 200px' id='radios'></textarea>
                          <hr/>
                          <button class='btn btn-info'>enregistrer</button><button class='btn btn-danger'>fermer</button>
                        </div>
                      </form>" data-html="true"
                      >
                       <!-- Multiple Radios -->
                      <label class="col-md-4 control-label valtype" data-valtype="label">Question à choix unique:  </label>
                      <div class="col-md-4 valtype" data-valtype="radios">
                        <label class="radio">
                          <input type="radio" value="Option one" name="group" checked="checked">
                          premiere option
                        </label>
                        <label class="radio">
                          <input type="radio" value="Option two" name="group">
                           deuxieme option
                        </label>
                      </div>
                    </div>
                   
                    <div class="form-group component" rel="popover"  trigger="manual"
                        data-content="
                        <form class='form'>
                          <div class='form-group col-md-12'>
                            <label class='control-label'>texte</label> <input class='form-control' type='text' name='label' id='label'>
                            <label class='control-label'>texte par defaut </label>
                            <textarea class='form-control' style='min-height: 200px' id='option'> </textarea>
                            <hr/>
                            <button class='btn btn-info'>enregistrer</button><button class='btn btn-danger'>fermer</button>
                          </div>
                        </form>" data-html="true"
                        >
                    
                        <!-- Textarea -->
                        <label class="col-md-4 control-label valtype" data-valtype="label">Question de type texte(long) :</label>
                        <div class="col-md-4">
                          <div class="textarea">
                                <textarea class="form-control valtype" data-valtype="checkbox" /> </textarea>
                          </div>
                        </div>
                    </div>
                    <div class="form-group component" rel="popover" title="File Upload" trigger="manual"
                      data-content="
                      <form class='form'>
                        <div class='form-group col-md-12'>
                          <label class='control-label'>Label Text</label> <input class='form-control' type='text' name='label' id='label'>
                          <hr/>
                          <button class='btn btn-info'>enregistrer</button><button class='btn btn-danger'>fermer</button>
                        </div>
                      </form>" data-html="true"
                     >
                     <div class="row">
                     
                      <label class="col control-label valtype" data-valtype="label" style="text-align:center; margin-left: 50px;">Image à télécharger </label>
                      </div>
                      <!-- File Upload -->
                      <div class="row">
	                      <div class="col-md-4 " style="margin-left: 50px; margin-top:7px">
	                       <input class="input-file" id="fileInput" type="file">
	                      </div>
	                  </div>    
                    </div>

                    <div class="form-group component" rel="popover" title="slideBare" trigger="manual"
                      data-content= "<form class='form'>
                        <div class='form-group col-md-12'>
                          <label class='control-label'>Label Text</label> <input class='form-control' type='text' name='label' id='label'>
                          <hr/>
                          <button class='btn btn-info'>enregistrer</button><button class='btn btn-danger'>fermer</button>
                        </div>
                      </form>"data-html="true">
                       <!-- slide  -->
                      <label class="col-md-4 control-label valtype" data-valtype="label"> Question  : </label>
                      <form  style="position: relative; width: 1200px;">
                        <input type="range" name="foo" min="0" max="100">
                        <output for="foo" onforminput="value = foo.valueAsNumber;"></output>
                      </form>
                     </div>
                  </div>
                  <div class="tab-pane" id="5">
                    <textarea name="source" id="source" class="col-md-12"></textarea>
                    <input type="submit"  value="enregistrer" > 
                  </div>
                </div>
                </fieldset>
              </form>
             </div> 
            </div>
          </div> <!-- row -->
      <div class="row clearfix">
        <div class="col-md-12"></div>
      </div>
    </div>
    </div><!-- /container -->
    
      	<c:import url="/jsp/Footer.jsp"/>
    
  </body>
</html>

