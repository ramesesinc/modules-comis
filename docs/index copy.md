# Cemetery Operations and Management Information System #

## Introduction ##

Cemeteries are part of our cultural heritage and of cultural significance among Local Government Units. Preserving them in their glory is of utmost importance that cemeteries need to be carefully managed and maintained. The Cemetery Operations and Management Information System (COMIS) provides a simple yet efficient solution to properly manage the day to day operation of cemeteries.

## Features of Version 0.1.0 ##

* Cemetery Resource Management
    * Visualize grave information and ability to mark resources to be identified as open, reserved, leased and expired

* Burial Data Management
    * Record keeping of grave identification, deceased, owners, notes, reservations
    * Entry of the deceased and selection of burial location
    * Calendar of burials and cemetery occupancy
    * Utilization of cemetery resources

* Work Order Management
    * Maintenance of work personnels
    * Automates issuance of work orders
    * Reports and output of work orders

* Records Management
    * Archive of  historical burial records
    * Storage of image data

* Search Facility
    * Interactive search map to easily locate grave information 
        

### Transactions

- Cemetery Resource
    * Add, Edit, Delete, Approve and Update
        * Approve - changes not allowed 
        * Update - supersedes current record

- Cemetery    
    * Add, Edit, Delete, Approve and Update 
        * Approve - changes not allowed 
        * Update - supersedes current record
    * Retire - when a cemetery is no longer utilized
    * Mapping and Viewing of Cemetery Sections
    * Mapping and Viewing of section resources    

- Burial Permit Application
    * Add, Edit, Delete, Approve and Update New Application
        * Approve - changes not allowed 
        * Update - supersedes current record
    * Automatic computation of burial taxes and fees
    * Collection of burial taxes and fees
    * Printing of burial application
    * Add, Edit, Delete, Approve and Update Burial Permit Extention application
        * Approve - changes not allowed 
        * Update - supersedes current record

- Work Order Management
    * Add, Edit, Delete, Approve and Update work personnel
        * Approve - changes not allowed 
        * Update - supersedes current record

    * Add, Edit, Delete, Approve and Update work order
        * Approve - changes not allowed 
        * Update - supersedes current record

    * Completion of work order
    * Cancellation of work order
    * Reassignment of work order

- Online Transaction
    * Appliction for burial extension
    * Online payment of taxes and fees 
    

### Database Tables 

- Cemetery Resource
    * Add, Edit, Delete, Approve and Update
        * Approve - changes not allowed 
        * Update - supersedes current record

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


