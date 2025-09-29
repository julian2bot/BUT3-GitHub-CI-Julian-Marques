
// // export class Constants {
// //     public static readonly API_BASE_URL = "https://api-julian-marques.iut.arcanit.io";
// //     public static readonly FIRSTNAME = "Julian";
// //     public static readonly LASTNAME = "Marques";
// // }


// export class Constants {
//     public static readonly API_BASE_URL = "https://__ENV__-api-julian-marques.iut.arcanit.io";
//     public static readonly FIRSTNAME = "Julian serv __ENV__";
//     public static readonly LASTNAME = "Marques serv __ENV__";
// }

export interface Config {
    API_BASE_URL: string;
    FIRSTNAME: string;
    LASTNAME: string;
}

export class Constants {
    private static _config: Config | null = null;

    // Charger la config au runtime
    public static async loadConfig(): Promise<void> {
        if (!this._config) {
            const res = await fetch('/config.json');
            this._config = await res.json();
        }
    }

    // Accès aux propriétés
    public static get API_BASE_URL(): string {
        if (!this._config) throw new Error("Config not loaded");
        return this._config.API_BASE_URL;
    }

    public static get FIRSTNAME(): string {
        if (!this._config) throw new Error("Config not loaded");
        return this._config.FIRSTNAME;
    }

    public static get LASTNAME(): string {
        if (!this._config) throw new Error("Config not loaded");
        return this._config.LASTNAME;
    }
}

Constants.loadConfig().catch(console.error);
