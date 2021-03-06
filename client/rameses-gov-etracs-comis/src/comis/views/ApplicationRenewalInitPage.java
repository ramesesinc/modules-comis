/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package comis.views;

import com.rameses.osiris2.themes.FormPage;
import com.rameses.rcp.ui.annotations.Template;

@Template(FormPage.class)
public class ApplicationRenewalInitPage extends javax.swing.JPanel {

    /**
     * Creates new form ApplicationRenewalInitPage
     */
    public ApplicationRenewalInitPage() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        xFormPanel1 = new com.rameses.rcp.control.XFormPanel();
        xLookupField2 = new com.rameses.rcp.control.XLookupField();
        xLookupField3 = new com.rameses.rcp.control.XLookupField();
        xComboBox2 = new com.rameses.rcp.control.XComboBox();
        xLabel8 = new com.rameses.rcp.control.XLabel();
        xLabel1 = new com.rameses.rcp.control.XLabel();
        xLabel2 = new com.rameses.rcp.control.XLabel();
        xLabel3 = new com.rameses.rcp.control.XLabel();
        xLabel7 = new com.rameses.rcp.control.XLabel();
        xLabel4 = new com.rameses.rcp.control.XLabel();
        xLabel6 = new com.rameses.rcp.control.XLabel();
        xLabel5 = new com.rameses.rcp.control.XLabel();
        xLabel9 = new com.rameses.rcp.control.XLabel();

        xFormPanel1.setCaptionWidth(120);
        xFormPanel1.setPreferredSize(new java.awt.Dimension(0, 100));

        xLookupField2.setCaption("Application No.");
        xLookupField2.setExpression("#{item.appno}");
        xLookupField2.setHandler("lookupApplication");
        xLookupField2.setName("entity.prevapp"); // NOI18N
        xLookupField2.setPreferredSize(new java.awt.Dimension(0, 20));
        xLookupField2.setRequired(true);
        xFormPanel1.add(xLookupField2);

        xLookupField3.setCaption("Applicant");
        xLookupField3.setDepends(new String[] {"entity.prevapp"});
        xLookupField3.setDisableWhen("#{entity.prevapp == null}");
        xLookupField3.setExpression("#{item.name}");
        xLookupField3.setHandler("lookupApplicant");
        xLookupField3.setName("entity.applicant"); // NOI18N
        xLookupField3.setCellPadding(new java.awt.Insets(10, 0, 0, 0));
        xLookupField3.setPreferredSize(new java.awt.Dimension(0, 20));
        xLookupField3.setRequired(true);
        xFormPanel1.add(xLookupField3);

        xComboBox2.setCaption("Relationship");
        xComboBox2.setDepends(new String[] {"entity.prevapp"});
        xComboBox2.setDisableWhen("#{entity.prevapp == null}");
        xComboBox2.setExpression("#{item.title}");
        xComboBox2.setItems("relations");
        xComboBox2.setName("entity.relation"); // NOI18N
        xComboBox2.setCellPadding(new java.awt.Insets(0, 0, 10, 0));
        xComboBox2.setPreferredSize(new java.awt.Dimension(0, 20));
        xComboBox2.setRequired(true);
        xFormPanel1.add(xComboBox2);

        xLabel8.setDepends(new String[] {"entity.prevapp"});
        xLabel8.setExpression("#{\"APPLICANT\"}");
        xLabel8.setVisibleWhen("#{entity.prevapp != null}");
        xLabel8.setCellPadding(new java.awt.Insets(10, 0, 0, 0));
        xLabel8.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        xLabel8.setPreferredSize(new java.awt.Dimension(0, 19));
        xLabel8.setShowCaption(false);
        xFormPanel1.add(xLabel8);

        xLabel1.setCaption("Name");
        xLabel1.setDepends(new String[] {"entity.prevapp"});
        xLabel1.setExpression("#{entity.prevapp.applicant.name}");
        xLabel1.setVisibleWhen("#{entity.prevapp != null}");
        xLabel1.setCellPadding(new java.awt.Insets(0, 30, 0, 0));
        xLabel1.setPreferredSize(new java.awt.Dimension(0, 19));
        xFormPanel1.add(xLabel1);

        xLabel2.setCaption("Address");
        xLabel2.setDepends(new String[] {"entity.prevapp"});
        xLabel2.setExpression("#{entity.prevapp.applicant.address}");
        xLabel2.setVisibleWhen("#{entity.prevapp != null}");
        xLabel2.setCellPadding(new java.awt.Insets(0, 30, 0, 0));
        xLabel2.setPreferredSize(new java.awt.Dimension(0, 19));
        xFormPanel1.add(xLabel2);

        xLabel3.setCaption("Relationship");
        xLabel3.setDepends(new String[] {"entity.prevapp"});
        xLabel3.setExpression("#{entity.prevapp.relation.title}");
        xLabel3.setVisibleWhen("#{entity.prevapp != null}");
        xLabel3.setCellPadding(new java.awt.Insets(0, 30, 0, 0));
        xLabel3.setPreferredSize(new java.awt.Dimension(0, 19));
        xFormPanel1.add(xLabel3);

        xLabel7.setDepends(new String[] {"entity.prevapp"});
        xLabel7.setExpression("#{\"DECEASED\"}");
        xLabel7.setVisibleWhen("#{entity.prevapp != null}");
        xLabel7.setCellPadding(new java.awt.Insets(10, 0, 0, 0));
        xLabel7.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        xLabel7.setPreferredSize(new java.awt.Dimension(0, 19));
        xLabel7.setShowCaption(false);
        xFormPanel1.add(xLabel7);

        xLabel4.setCaption("Name");
        xLabel4.setDepends(new String[] {"entity.prevapp"});
        xLabel4.setExpression("#{entity.prevapp.deceased.name}");
        xLabel4.setVisibleWhen("#{entity.prevapp != null}");
        xLabel4.setCellPadding(new java.awt.Insets(0, 30, 0, 0));
        xLabel4.setPreferredSize(new java.awt.Dimension(0, 19));
        xFormPanel1.add(xLabel4);

        xLabel6.setCaption("Nationality");
        xLabel6.setDepends(new String[] {"entity.prevapp"});
        xLabel6.setExpression("#{entity.prevapp.deceased.nationality}");
        xLabel6.setVisibleWhen("#{entity.prevapp != null}");
        xLabel6.setCellPadding(new java.awt.Insets(0, 30, 0, 0));
        xLabel6.setPreferredSize(new java.awt.Dimension(0, 19));
        xFormPanel1.add(xLabel6);

        xLabel5.setCaption("Age");
        xLabel5.setDepends(new String[] {"entity.prevapp"});
        xLabel5.setExpression("#{entity.prevapp.deceased.age}");
        xLabel5.setVisibleWhen("#{entity.prevapp != null}");
        xLabel5.setCellPadding(new java.awt.Insets(0, 30, 0, 0));
        xLabel5.setPreferredSize(new java.awt.Dimension(0, 19));
        xFormPanel1.add(xLabel5);

        xLabel9.setCaption("Sex");
        xLabel9.setDepends(new String[] {"entity.prevapp"});
        xLabel9.setExpression("#{entity.prevapp.deceased.sex}");
        xLabel9.setVisibleWhen("#{entity.prevapp != null}");
        xLabel9.setCellPadding(new java.awt.Insets(0, 30, 0, 0));
        xLabel9.setPreferredSize(new java.awt.Dimension(0, 19));
        xFormPanel1.add(xLabel9);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(xFormPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 455, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(48, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(xFormPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 320, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(49, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.control.XComboBox xComboBox2;
    private com.rameses.rcp.control.XFormPanel xFormPanel1;
    private com.rameses.rcp.control.XLabel xLabel1;
    private com.rameses.rcp.control.XLabel xLabel2;
    private com.rameses.rcp.control.XLabel xLabel3;
    private com.rameses.rcp.control.XLabel xLabel4;
    private com.rameses.rcp.control.XLabel xLabel5;
    private com.rameses.rcp.control.XLabel xLabel6;
    private com.rameses.rcp.control.XLabel xLabel7;
    private com.rameses.rcp.control.XLabel xLabel8;
    private com.rameses.rcp.control.XLabel xLabel9;
    private com.rameses.rcp.control.XLookupField xLookupField2;
    private com.rameses.rcp.control.XLookupField xLookupField3;
    // End of variables declaration//GEN-END:variables
}
