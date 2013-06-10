<cfscript>
	personalInfo = {name='Scott', dob='7/18/1975', address='123 A Street', phonenumber='(919) 555- 3228', email='scott@somewhere.com', website='http://www.somewhere.com', skype='mySkypeName'};
</cfscript>	
<cfimport taglib="customTags/" prefix="layout" />
<layout:page section="about">	

		<!-- Content Start -->
  	
		<div id="content">
			<div class="card-pattern">
			<!-- about -->
				<div id="about">
					<div class="clr">
						<div class="top-bg1">
							<div class="top-left">
								<div><h1>About me</h1></div>
							</div> 
						</div>
						<div class="clr">
							<div class="pat-bottomleft">&nbsp;</div>
							<div class="pat-bottomright">&nbsp;</div>
						</div>
					</div>
					<div class="clr">
						<h6>
							<span>A little about myself, and the UI &amp; UX design services I provide. </span> <br />.If you are interested to know something about me then you can read the info below.
						</h6>
					</div>
					<div class="clr hline">&nbsp;</div>
					<div class="clr">
						<div class="left">
							<div id="SliderBackground">
								<div id="Slider" align="center" >
									<img src="assets/images/headshot/headshot.jpg" alt="photo" />
								</div><!-- #Slider -->   
							</div><!-- #SliderBackground -->
						</div>
						<div class="content">
							<h2>A brief info about me</h2>
							<p>
								I am an experienced Software Developer with a Master's Degree in Software Engineering and 15+ years of IT experience.  I have been working with C# and ASP.NET for the last 5 years as well as other technologies including JavaScript XML-based Web Services, T-SQL, HTML ColdFusion and TFS.  I have played multiple roles including Developer and Systems Analyst, and most recently I was a key client-facing liaison, helping clients with implementation, integration and production support.  I have interfaced with CRM systems such as SalesForce and ServiceDesk.  I have strong communication and interpersonal skills and I work well in a team environment. 
							</p>
						</div>
						<!-- Personal Information Output -->
						<cfoutput>
							
						<div class="right">
							<h2>Personal Info</h2>
							<div class="clr"><div class="input-box">Name </div><span>#personalInfo.name#</span> </div>
							<div class="clr"><div class="input-box">Date of birth </div><span>#personalInfo.DOB#</span></div>
							<div class="clr"><div class="input-box">Address </div><span>#personalInfo.address#</span></div>
							<div class="clr"><div class="input-box">Phone </div> <span>#personalInfo.phonenumber#</span>  </div>
							<div class="clr"><div class="input-box">E-mail </div><span>#personalInfo.email#</span>  </div>
							<div class="clr"><div class="input-box">Website </div> <span>#personalInfo.website#</span> </div> 
							<div class="clr"><div class="box1">Skype </div> <span>#personalInfo.skype#</span> </div> 
						</div>
						
						</cfoutput>

					</div>
					<div class="clr"></div>
				</div><!--about end -->

</layout:page>
