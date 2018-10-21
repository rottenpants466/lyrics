
public class Lyrics.Lyric : Object {
    private struct Metadata {
        string tag;
        string info;
    }

    private Metadata[] metadata = {};
    Gee.TreeMap<uint64?, string> lines = new Gee.TreeMap<uint64?, string> ();
    Gee.BidirMapIterator<uint64?, string> lrc_iterator;

    public void add_metadata (string _tag, string _info) {
        metadata += Metadata () { tag = _tag, info = _info };
    }

    public void add_line (uint64 time, string text) {
        lines.set (time, text);
    }

    Gee.BidirMapIterator<uint64?, string> get_iterator () {
        if (lrc_iterator == null) {
            lrc_iterator = lines.bidir_map_iterator ();
            lrc_iterator.first ();
        }

        return lrc_iterator;
    }

    public string get_current_line (uint64? elapsed_time) {
        while (get_iterator ().get_key () < elapsed_time) {
            print (@"IT $(get_iterator ().get_key ())\n");
            if (!get_iterator ().has_next ()) {
                get_iterator ().first ();
                warning ("File has ended");
                return "";
            }

            get_iterator ().next ();
        }

        print (@"$(get_iterator ().get_value ())\n");
        return get_iterator ().get_value ().to_string ();
    }

    public string to_string () {
        var builder = new StringBuilder ();

        builder.append (@"Metadata:\n");
        foreach (var data in metadata) {
            builder.append (@"$(data.tag) = ");
            builder.append (@"$(data.info)\n");
        }

        builder.append (@"Lyric:\n");
        lines.foreach ((item) => {
            builder.append (@"$(item.key) : $(item.value)");
            return true;
        });

        return builder.str;
    }
}
