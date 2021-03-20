# Cemetery Operations and Management Information System #
<link rel="stylesheet" type="text/css" media="all" href="styles.css">

## Cemetery Resource Management

Operation of cemetery involves accurate inventory of resources, property maintenance and efficient allocation of such resources. 

******
### Master Data

#### resource
- Record the type of resources managed by the cemetery. The standard resource types are:
    * Chapel
    * Mausoleum
    * Crematorium
    * Tomb
    * Niche
    * Ossuary

**_Table Structure_**
<div class="table">

|Field   |Type              |Remarks   |
|--------|------------------|----------|
|objid   |varchar(50)       |primary key
|state   |varchar(25)       |DRAFT, ACTIVE, INACTIVE
|name    |varchar(50)       |name of resource
    
</div>

**_actions_**
- Add, Edit, Delete
- Approve - changes not allowed 
- Update - supersedes current record


******
### Master Data

#### cemetery
List of cemeteries operated by the LGU

#### cemetery_section
Registers the different sections of the cemetery. Sections can be created or removed to better respond to the needs of the LGU

#### cemetery_section_resource
The list of available resources within a cemetery section. During mapping, the section could be plotted in a graphical view of the section for easy validation, tracking and monitoring.


**_Table ERD_**

![alt erd][logo]


**_Implementation Notes_**

- **cemetery**
    - valid states (DRAFT, ACTIVE, INACTIVE)
    - inactive cemetery will inactivate all associated resources

- **cemetery_section_resource**
    - _currentinfoid_ references current section resource info. In case the section resource is updated, the currentinfoid will be set to the new info. The original section resource info is retained in the  **cemetery_section_resource_info** table.

    - _currentappid_ references current burial application. 

- **cemetery_section_resource_info**    
    - records the detailed information of a section resource 
    - contains the resource's change history



**_Transactions_**

* Add, Edit, and Delete
* Approve - changes not allowed 
* Update - supersedes current record
* Retire - when a cemetery is no longer utilized


[logo]: res/erd-cemetery.png