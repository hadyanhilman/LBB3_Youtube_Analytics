
server <- function(input,output){
    
    output$plot_trend <- renderPlotly({
        plot1 <- ggplot(vids_count2, aes(x =count_cat , y=  reorder(category_id, count_cat), text = label)) +
            geom_col(aes(fill = count_cat)) +
            scale_fill_gradient(low = "red", high ="black") +
            labs(title = "Trending Categories of US Youtube 2017",
                 x = "Video_count",
                 y = NULL) +
            theme_minimal() +
            theme(legend.position = "none")
        
        ggplotly(plot1, tooltip = "text")
    })
    
    output$bar_view <- renderPlotly({
        plot1 <- ggplot(publish_time, aes(x =average_views , y=  reorder(publish_when, average_views), text = label)) +
            geom_col(aes(fill = average_views)) +
            scale_fill_gradient(low = "red", high ="black") +
            labs(title = "Average View Based on Publish Time",
                 x = "average_views",
                 y = NULL) +
            theme_minimal() +
            theme(legend.position = "none")
        
        ggplotly(plot1, tooltip = "text")
    })
    
    output$hist_plot <- renderPlotly({
        p <- ggplot(vids_clean, aes(x=publish_hour)) + 
            geom_histogram(bins = 10)
        
        ggplotly(p)
    })
    
    output$plot_1 <- renderPlotly({
        likes_view <- vids_clean %>% 
            filter(category_id==input$category)
        
        
        p2 <- ggplot(likes_view, aes(x=likes, y=views)) + 
            geom_point()+
            scale_y_continuous(labels = comma)+
            scale_x_continuous(labels = comma)+
            geom_smooth(method=lm , color="red", fill="#69b3a2", se=TRUE) +
            labs(title = "Correllation between likes and views") +
            theme_ipsum()
        
        
        ggplotly(p2)
    })
    
    output$plot_2 <- renderPlotly({
        comment_view <- vids_clean %>% 
            filter(category_id==input$category)
        
        p3 <- ggplot(comment_view, aes(x=comment_count, y=views)) + 
            geom_point()+
            scale_y_continuous(labels = comma)+
            scale_x_continuous(labels = comma)+
            geom_smooth(method=lm , color="red", fill="#69b3a2", se=TRUE) +
            labs(title = "Correllation between comment and views") +
            theme_ipsum()
        
        ggplotly(p3)
    })
    
    output$plot_3 <- renderPlotly({
        dislike_view <- vids_clean %>% 
            filter(category_id==input$category)
        
        
        p4 <- ggplot(dislike_view, aes(x=dislikes, y=views)) + 
            geom_point()+
            scale_y_continuous(labels = comma)+
            scale_x_continuous(labels = comma)+
            geom_smooth(method=lm , color="red", fill="#69b3a2", se=TRUE) +
            labs(title = "Correllation between dislikes and views") +
            theme_ipsum()
        
        ggplotly(p4)
    })
    
}