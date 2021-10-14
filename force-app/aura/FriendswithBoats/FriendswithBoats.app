<aura:application access="GLOBAL" extends="force:slds">
    
    <lightning:layout >
            <lightning:card title="Find a Boat" class="slds-m-bottom_10px" >
                <c:BoatSearchForm />
            </lightning:card>	
    </lightning:layout>      
    <lightning:layout >
        <lightning:layoutItem > 
            <lightning:card title="Matching Boats">
                <c:BoatSearchResults />
            </lightning:card>
        </lightning:layoutItem>
    </lightning:layout>
</aura:application>