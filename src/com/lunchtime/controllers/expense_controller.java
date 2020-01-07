/**
 * @author Kiran Pradhan
 * This controller class fetches the user order whose status is Received and populates the response to a table view. All the Graphs are also updated with the response.
 * */

package com.lunchtime.controllers;

import com.jfoenix.controls.JFXTreeTableView;
import com.jfoenix.controls.RecursiveTreeItem;
import com.jfoenix.controls.datamodels.treetable.RecursiveTreeObject;
import com.lunchtime.network.NetworkManager;
import com.lunchtime.network.NetworkResponseListener;
import com.lunchtime.network.apiObjects.ApiBaseResponse;
import com.lunchtime.network.apiObjects.models.MyOrder;
import com.lunchtime.network.apiObjects.wrappers.OrderWrapper;
import javafx.application.Platform;
import javafx.beans.property.IntegerProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.Group;
import javafx.scene.chart.*;
import javafx.scene.control.Label;
import javafx.scene.control.TreeItem;
import javafx.scene.control.TreeTableColumn;
import javafx.scene.layout.VBox;

import java.net.URL;
import java.util.ResourceBundle;

public class expense_controller implements Initializable {

    @FXML
    private VBox ChartRootView;

    @FXML
    private Label totalMoneyLabel;

    int totalMoney = 0;
    int totalFood = 0;


    @FXML
    private Label totalFoodOrderLabel;

    @FXML
    private JFXTreeTableView<Order> expenseTableView;

    @FXML
    private TreeTableColumn<Order, String> dateColumn;

    @FXML
    private TreeTableColumn<Order, String> foodNameColumn;

    @FXML
    private TreeTableColumn<Order, String> foodPriceColumn;

    ObservableList<Order> orders = FXCollections.observableArrayList();


    @FXML
    void areaChartButtonClicked(ActionEvent event) {
        loadChart("Area");
    }

    @FXML
    void barChartButtonClicked(ActionEvent event) {
        loadChart("Bar");
    }

    @FXML
    void pieChartButtonClicked(ActionEvent event) {
        loadChart("Pie");
    }

    public void loadChart(String chart) {

        if (chart == "Area") {
            //Defining the X axis
            CategoryAxis xAxis = new CategoryAxis();

            //defining the y Axis
            NumberAxis yAxis = new NumberAxis();
            yAxis.setLabel("Price");

            //Creating the Area chart
            AreaChart<String, Integer> areaChart = new AreaChart(xAxis, yAxis);
            areaChart.setAnimated(true);
//            areaChart.setTitle(duration.equals("All") ? "All Time Expenses" : duration.equals("Week") ? "Expenses During One Week" : "Expenses During One Month");

            //Prepare XYChart.Series objects by setting data
            XYChart.Series series1 = new XYChart.Series();
            series1.setName("Food");

            //Creating a Group object
            Group root = new Group(areaChart);
            ChartRootView.getChildren().clear();
            ChartRootView.getChildren().add(root);


            for (Order order : orders) {
                series1.getData().add(new XYChart.Data(order.getFoodName(), order.getPrice()));
            }
            //Setting the XYChart.Series objects to area chart
            areaChart.getData().addAll(series1);
            areaChart.setPrefWidth(396);
        } else if (chart == "Bar") {

            CategoryAxis xAxis = new CategoryAxis();
            NumberAxis yAxis = new NumberAxis();
            yAxis.setLabel("Price");

            //Creating the Bar chart
            BarChart<String, Integer> barChart = new BarChart(xAxis, yAxis);
            barChart.setAnimated(true);
            barChart.setTitle("Expenses during one week");
            //Prepare XYChart.Series objects by setting data
            XYChart.Series series1 = new XYChart.Series();
            series1.setName("Food");

            //Creating a Group object
            Group root = new Group(barChart);
            ChartRootView.getChildren().clear();
            ChartRootView.getChildren().addAll(root);

            for (Order order : orders) {
                series1.getData().add(new XYChart.Data(order.getFoodName(), order.getPrice()));
            }

            //Setting the XYChart.Series objects to Bar chart
            barChart.getData().addAll(series1);
            barChart.setPrefWidth(396);
        } else if (chart == "Pie") {
            //Creating the Pie chart
            PieChart pieChart = new PieChart();
            pieChart.setAnimated(true);
            pieChart.setTitle("Expenses during one week");
            //Creating a Group object
            Group root = new Group(pieChart);
            ChartRootView.getChildren().clear();
            ChartRootView.getChildren().add(root);

            ObservableList<PieChart.Data> pieChartData = FXCollections.observableArrayList();
            for (Order order : orders) {
                pieChartData.addAll(new PieChart.Data(order.getFoodName(), order.getPrice()));
            }
            pieChart.setData(pieChartData);
            pieChart.setPrefWidth(396);
        }
    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        dateColumn.setCellValueFactory(param -> param.getValue().getValue().date);
        foodNameColumn.setCellValueFactory(param -> param.getValue().getValue().foodName);
        foodPriceColumn.setCellValueFactory(param -> param.getValue().getValue().price.asString());

        NetworkManager.getInstance().ExpenseOrder(login_controller.userId, new NetworkResponseListener<ApiBaseResponse<OrderWrapper>>() {
            @Override
            public void onResponseReceived(ApiBaseResponse<OrderWrapper> orderWrapperApiBaseResponse) {
                for (int i = 0; i < orderWrapperApiBaseResponse.getData().getOrder().size(); i++) {
                    MyOrder myOrder = orderWrapperApiBaseResponse.getData().getOrder().get(i);
//                    Timestamp timestamp = new Timestamp(myOrder.getDate());
//                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("E, MMM dd yyyy");
//                    String date = simpleDateFormat.format(timestamp);
                    orders.add(new Order(myOrder.getDate(), myOrder.getFood_name(), myOrder.getTotal_price()));
                    totalFood = orderWrapperApiBaseResponse.getData().getOrder().size();
                    totalMoney = myOrder.getTotal_price() + totalMoney;
                }
            }

            @Override
            public void onError() {
                System.out.println("Some Error");
            }
        });

        Platform.runLater(() -> {
            final TreeItem<Order> root = new RecursiveTreeItem<>(orders, RecursiveTreeObject::getChildren);
            expenseTableView.setRoot(root);
            expenseTableView.setShowRoot(false);
            totalMoneyLabel.setText(String.valueOf(totalMoney));
            totalFoodOrderLabel.setText(String.valueOf(totalFood));
            loadChart("Area");
        });

    }

    class Order extends RecursiveTreeObject<Order> {
        StringProperty date;
        StringProperty foodName;
        IntegerProperty price;

        public Order(String date, String foodName, Integer price) {
            this.date = new SimpleStringProperty(date);
            this.foodName = new SimpleStringProperty(foodName);
            this.price = new SimpleIntegerProperty(price);
        }

        public String getDate() {
            return date.get();
        }

        public String getFoodName() {
            return foodName.get();
        }

        public int getPrice() {
            return price.get();
        }

    }
}
