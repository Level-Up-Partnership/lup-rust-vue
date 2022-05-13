// #![feature(plugin)]
// #![plugin(rocket_codegen)]

#![feature(proc_macro_hygiene, decl_macro, plugin)]

#[macro_use]
extern crate rocket;

extern crate rocket_cors;
extern crate serde;
extern crate serde_derive;
extern crate serde_json;

use rocket::fs::NamedFile;
use rocket::http::Method;
use rocket_cors::{AllowedHeaders, AllowedOrigins, Cors, CorsOptions};
use serde::Serialize;

use std::io;
use std::path::{Path, PathBuf};


#[get("/")]
async fn index() -> io::Result<NamedFile> {
    NamedFile::open("webui/dist/index.html").await
}

#[get("/<file..>")]
async fn files(file: PathBuf) -> Option<NamedFile> {
    NamedFile::open(Path::new("webui/dist/").join(file))
        .await
        .ok()
}

#[derive(Serialize, Debug)]
struct Test {
    message: &'static str,
}

#[get("/hello")]
fn hello() -> String {
    let hello_message = Test {
        message: "hello world",
    };
    serde_json::to_string(&hello_message).unwrap()
}

#[launch]
fn rocket() -> _ {
    rocket::build().mount("/", routes![index, files, hello])
}