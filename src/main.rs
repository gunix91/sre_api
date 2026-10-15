use axum::{routing::get, Router};
use std::net::SocketAddr;


#[tokio::main]
async fn main() {
    
    let app = Router::new()
    .route("/health", get(|| async{"OK - Service is running !"}));
    
    let listener = tokio::net::TcpListener::bind("0.0.0.0:8080")
    .await.unwrap();
    
    axum::serve(listener, app).await.unwrap();
}
