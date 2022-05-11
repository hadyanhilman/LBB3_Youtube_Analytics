
ui<- dashboardPage(
    dashboardHeader(title = "Youtube Analytics"),
    
    dashboardSidebar(
        sidebarMenu(
            menuItem(text = "Overview", tabName = "overview", icon = icon("video")),
            menuItem(text = "Analysis", tabName = "channel", icon = icon("bullseye"))
        )
    ),
    dashboardBody(
        
        tabItems(#berguna untuk mengakses menu per identitas yg dipanggil
            
            tabItem(
                tabName = "overview",
                
                box(
                    title = "Trending Category on US Youtube Recap 2017",
                    width =  12 , #nilai max adalah 12
                    plotlyOutput(outputId = "plot_trend")
                ),
                
                fluidRow(
                box(
                    title = "Average View Based on Publish Time",
                    width =  6 , #nilai max adalah 12
                    plotlyOutput(outputId = "bar_view")
                ),
                
                box(
                    title = "Publish Time Distribution",
                    width =  6 , #nilai max adalah 12
                    plotlyOutput(outputId = "hist_plot")
                ),
                
                )
                
            ),
            
            tabItem(
                tabName = "channel",
                box( width = 12,
                     selectInput(inputId = "category",
                                 label = "Choose Your Category",
                                 choices = unique(data$category_id),
                                 selected = "Entertainment")
                ),
                
                
                
                box(width = 12,
                        plotlyOutput(outputId = "plot_2")),
                fluidRow(
                box(width = 6,
                    plotlyOutput(outputId = "plot_1")),
                box(width = 6,
                    plotlyOutput(outputId = "plot_3"))
                )
            )
        )
        
    )
    
)
