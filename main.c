#include <gtk/gtk.h>
#include <panel.h>

static void activate(GtkApplication *app, gpointer user_data) {
    // Create a panel instance
    Panel *panel = panel_new();
    
    // Setup the panel (you can customize it more)
    panel_set_orientation(panel, PANEL_ORIENTATION_HORIZONTAL);

    // Create a window for your DE (if you want a custom window)
    GtkWidget *window = gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), "Custom Desktop Environment");
    gtk_window_set_default_size(GTK_WINDOW(window), 800, 600);
    
    // Start the GTK main loop
    gtk_widget_show_all(window);
}

int main(int argc, char **argv) {
    GtkApplication *app;
    int status;

    app = gtk_application_new("com.mycompany.mycustomde", G_APPLICATION_FLAGS_NONE);
    g_signal_connect(app, "activate", G_CALLBACK(activate), NULL);
    
    status = g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    return status;
}
