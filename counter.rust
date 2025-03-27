pub async fn page(
    State(app_state_arc): State<Arc<Mutex<AppState>>>,
) -> Markup {
    let input = if let Ok(app_state) = app_state_arc.lock() {
        counter_input(&app_state)
    } else {
        html! {
            "Unable to get app state"
        }
    };

    html! {
        (header("Counter"))
        body {
            h1 { "Counter" }

            form {
                fieldset {
                    label {
                        "Server value: "
                        (input)
                    }
                    button
                        type="submit"
                        hx-post="/counter-increase"
                        hx-target="#counter-input"
                        hx-swap="outerHTML"
                        hx-trigger="click"
                        { "Increment" };
                }
            }
        }
    }
}

pub fn counter_input(app_state: &AppState) -> Markup {
    html! {
        input
            #counter-input
            type="number"
            value=(app_state.counter)
            name="counter"
        ;
    }
}

pub async fn increase(
    State(app_state_arc): State<Arc<Mutex<AppState>>>,
) -> Markup {
    let data = if let Ok(mut app_state) = app_state_arc.lock() {
        app_state.counter += 1;
        counter_input(&app_state)
    } else {
        html! {
            "Unable to get app state"
        }
    };

    data
}

pub struct AppState {
    counter: i32,
}

#[tokio::main]
async fn main() {
    // ...

    let app = Router::new()
        .route("/", get(page))
        .route("/counter", get(counter::page))
        .route("/counter-increase", post(counter::increase))
        // ...
        .with_state(Arc::new(Mutex::new(AppState {
            counter: 0,
        })));

    // ...
}