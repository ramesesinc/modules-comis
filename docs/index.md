# Cemetery Operations and Management Information System #

## Introduction ##

Cemeteries are part of our cultural heritage and of cultural significance among Local Government Units. Preserving them in their glory is of utmost importance that cemeteries need to be carefully managed and maintained. The Cemetery Operations and Management Information System (COMIS) provides the data you need through a simple yet efficient solution and functionality.

## Features ##

* Cemetery Resource Management
    * Visualize grave information and ability to mark resources to be identified as reserved, leased, etc

* Burial Data Management
    * Record keeping of grave identification, deceased, owners, notes, reservations
    * Entry of the deceased and selection of burial location
    * Calendar of burials and cemetery occupancy
    * Utilization of cemetery resources


* Work Order Management
    * Automates issuance of work orders
    * Reports and output of work orders

* Records Management
    * Archive of  historical burial records
    * Storage of image data

* Search Facility
    * Interactive search map to easily locate grave information 
        

## Cemetery Resource Management ##

Operation of cemetery involves accurate inventory of resouces, property mainatenance and effecient allocation of such resources. 

### Transactions

- Cemetery Resource
    * Add, Edit, Update and Delete
    * Approve - changes not allowed when approved

- Cemetery    
    * Add, Edit, Update and Delete
    * Approve - changes not allowed when approved
    * Retire - when a cemetery is no longer utilized
    * Mapping and Viewing of Cemetery Sections
    * Mapping and Viewing of section resources    

### Database Tables 

#### resource
- Record the type of resources managed by the cemetery. The standard resource types are:
    * Chapel
    * Mausoleum
    * Crematorium
    * Tomb
    * Niche
    * Ossuary

#### cemetery
- List of cemeteries operated by the LGU

#### cemetery_section
- Registers the different sections of the cemetery. Sections can be created or removed to better respond to the needs of the 

#### cemetery_section_resource
- The list of available resources within a cemetery section. During mapping, the section could be plotted in a graphical view of the section for easy validation, tracking and monitoring.


