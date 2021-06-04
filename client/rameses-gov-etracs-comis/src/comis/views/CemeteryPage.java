/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package comis.views;

import com.rameses.rcp.ui.annotations.Template;
import com.rameses.seti2.views.CrudFormPage;

@Template(CrudFormPage.class)
public class CemeteryPage extends javax.swing.JPanel {

    /**
     * Creates new form ResourcePage
     */
    public CemeteryPage() {
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

        jPanel2 = new javax.swing.JPanel();
        xFormPanel1 = new com.rameses.rcp.control.XFormPanel();
        xLabel1 = new com.rameses.rcp.control.XLabel();
        xTextField1 = new com.rameses.rcp.control.XTextField();
        xTextField2 = new com.rameses.rcp.control.XTextField();
        xTextField3 = new com.rameses.rcp.control.XTextField();
        xCheckBox1 = new com.rameses.rcp.control.XCheckBox();
        jSplitPane1 = new javax.swing.JSplitPane();
        xSubFormPanel3 = new com.rameses.rcp.control.XSubFormPanel();
        jSplitPane4 = new javax.swing.JSplitPane();
        xSubFormPanel1 = new com.rameses.rcp.control.XSubFormPanel();
        xSubFormPanel2 = new com.rameses.rcp.control.XSubFormPanel();

        setLayout(new java.awt.BorderLayout());

        xFormPanel1.setPreferredSize(new java.awt.Dimension(190, 100));

        xLabel1.setCaption("State");
        xLabel1.setExpression("#{entity.state}");
        xLabel1.setCellPadding(new java.awt.Insets(0, 0, 10, 0));
        xLabel1.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        xLabel1.setForeground(new java.awt.Color(255, 0, 0));
        xFormPanel1.add(xLabel1);

        xTextField1.setCaption("Code");
        xTextField1.setName("entity.code"); // NOI18N
        xTextField1.setRequired(true);
        xFormPanel1.add(xTextField1);

        xTextField2.setCaption("Name");
        xTextField2.setName("entity.name"); // NOI18N
        xTextField2.setPreferredSize(new java.awt.Dimension(0, 20));
        xTextField2.setRequired(true);
        xFormPanel1.add(xTextField2);

        xTextField3.setCaption("Location");
        xTextField3.setName("entity.location"); // NOI18N
        xTextField3.setPreferredSize(new java.awt.Dimension(0, 20));
        xTextField3.setRequired(true);
        xFormPanel1.add(xTextField3);

        xCheckBox1.setName("entity.isnew"); // NOI18N
        xCheckBox1.setShowCaption(false);
        xCheckBox1.setText("Is new?");
        xFormPanel1.add(xCheckBox1);

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(xFormPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 436, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(346, Short.MAX_VALUE))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(xFormPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 121, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        add(jPanel2, java.awt.BorderLayout.NORTH);

        jSplitPane1.setDividerLocation(350);

        xSubFormPanel3.setHandler("sectionsOpener");
        xSubFormPanel3.setName("selectedSection"); // NOI18N

        javax.swing.GroupLayout xSubFormPanel3Layout = new javax.swing.GroupLayout(xSubFormPanel3);
        xSubFormPanel3.setLayout(xSubFormPanel3Layout);
        xSubFormPanel3Layout.setHorizontalGroup(
            xSubFormPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 349, Short.MAX_VALUE)
        );
        xSubFormPanel3Layout.setVerticalGroup(
            xSubFormPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 297, Short.MAX_VALUE)
        );

        jSplitPane1.setLeftComponent(xSubFormPanel3);

        jSplitPane4.setDividerLocation(350);

        xSubFormPanel1.setDepends(new String[] {"selectedBlock"});
        xSubFormPanel1.setHandler("resourcesOpener");
        xSubFormPanel1.setName("selectedResource"); // NOI18N
        xSubFormPanel1.setDynamic(true);

        javax.swing.GroupLayout xSubFormPanel1Layout = new javax.swing.GroupLayout(xSubFormPanel1);
        xSubFormPanel1.setLayout(xSubFormPanel1Layout);
        xSubFormPanel1Layout.setHorizontalGroup(
            xSubFormPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 80, Short.MAX_VALUE)
        );
        xSubFormPanel1Layout.setVerticalGroup(
            xSubFormPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 295, Short.MAX_VALUE)
        );

        jSplitPane4.setRightComponent(xSubFormPanel1);

        xSubFormPanel2.setDepends(new String[] {"selectedSection"});
        xSubFormPanel2.setHandler("blocksOpener");
        xSubFormPanel2.setName("selectedBlock"); // NOI18N
        xSubFormPanel2.setDynamic(true);

        javax.swing.GroupLayout xSubFormPanel2Layout = new javax.swing.GroupLayout(xSubFormPanel2);
        xSubFormPanel2.setLayout(xSubFormPanel2Layout);
        xSubFormPanel2Layout.setHorizontalGroup(
            xSubFormPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 349, Short.MAX_VALUE)
        );
        xSubFormPanel2Layout.setVerticalGroup(
            xSubFormPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 295, Short.MAX_VALUE)
        );

        jSplitPane4.setLeftComponent(xSubFormPanel2);

        jSplitPane1.setRightComponent(jSplitPane4);

        add(jSplitPane1, java.awt.BorderLayout.CENTER);
    }// </editor-fold>//GEN-END:initComponents
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel jPanel2;
    private javax.swing.JSplitPane jSplitPane1;
    private javax.swing.JSplitPane jSplitPane4;
    private com.rameses.rcp.control.XCheckBox xCheckBox1;
    private com.rameses.rcp.control.XFormPanel xFormPanel1;
    private com.rameses.rcp.control.XLabel xLabel1;
    private com.rameses.rcp.control.XSubFormPanel xSubFormPanel1;
    private com.rameses.rcp.control.XSubFormPanel xSubFormPanel2;
    private com.rameses.rcp.control.XSubFormPanel xSubFormPanel3;
    private com.rameses.rcp.control.XTextField xTextField1;
    private com.rameses.rcp.control.XTextField xTextField2;
    private com.rameses.rcp.control.XTextField xTextField3;
    // End of variables declaration//GEN-END:variables
}
