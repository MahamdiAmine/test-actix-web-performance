use actix_web::{web, App, HttpServer, Responder};

async fn hello() -> impl Responder {
    format!("Hello Rusty!")
}

async fn hello_json() -> impl Responder {
    web::Json("Hello Rusty-dusty")
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .route("/", web::get().to(hello))
            .route("/json", web::get().to(hello_json))
    })
    .bind(("0.0.0.0", 8080))?
    .run()
    .await
}