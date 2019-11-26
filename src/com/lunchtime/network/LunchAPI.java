package com.lunchtime.network;

import com.lunchtime.network.apiObjects.ApiBaseResponse;
import com.lunchtime.network.apiObjects.requests.LoginRequest;
import com.lunchtime.network.apiObjects.requests.RegisterRequest;
import com.lunchtime.network.apiObjects.wrappers.MenuWrapper;
import com.lunchtime.network.apiObjects.wrappers.UserWrapper;
import retrofit2.Call;
import retrofit2.http.*;

public interface LunchAPI {

    @POST("login")
    Call<ApiBaseResponse<UserWrapper>> login(@Body LoginRequest loginRequest);

    @POST("register")
    Call<ApiBaseResponse> register(@Body RegisterRequest registerRequest);

    @GET("menu")
    Call<ApiBaseResponse<MenuWrapper>> getMenu();
}
