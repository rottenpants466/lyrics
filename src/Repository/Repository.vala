
public class Lyrics.Repository : IRepository, Object {
    string[] viewlyrics_dbus = { "org.lyricsources.LyricSourcePlugin.viewlyrics",
                                 "/org/lyricsources/LyricSourcePlugin/viewlyrics"};

    Gee.HashMap<string, LyricSources.Repository> lyricsources = new Gee.HashMap<string, LyricSources.Repository> ();
    IRepository local_repository = new LocalRepository ();

    public Repository () {
        lyricsources["viewlyrics"] = new LyricSources.Repository (viewlyrics_dbus[0], viewlyrics_dbus[1]);
    }

    public ILyricFile? find_first (Metasong song) {
        return local_repository.find_first (song) ?? lyricsources["viewlyrics"].find_first (song);
    }

    public Gee.Collection<ILyricFile>? find (Metasong song) {
        var collection = new Gee.ArrayList<ILyricFile> ();
        collection.add (local_repository.find_first (song));
        collection.add_all (lyricsources["viewlyrics"].find (song));
        return collection;
    }
}