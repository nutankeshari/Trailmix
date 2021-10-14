<aura:application extends="force:slds">

    <div class="slds-grid slds-wrap">
        <div class="slds-size--1-of-1 slds-medium-size_1-of-2 slds-p-around_large">
            <c:TestComp height="{
                              'large' : '600px',
                              'medium': '400px',
                              'small' : '300px'
                              }" 
                      duration="3000" 
                      showCaption="true" 
                      circular="true" 
                      autoMove="true" 
                      animType="horizontal-slide" 
                      navigation="horizontal" 
                      imageArray="[
                                  {src: '/resource/1503375651000/car1', caption:'caption1'},
                                  {src: '/resource/1503375675000/car2', caption:'caption2'},
                                  {src: '/resource/1503375694000/car3', caption:'caption3'},
                                  {src: '/resource/1503375710000/car4', caption:'caption4'}
                                  ]"/>
        </div>
    </div>

</aura:application>