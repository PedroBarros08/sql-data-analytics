-- ============================================================
-- Exercise: Cumulative Song Plays
-- Company: Spotify
-- Platform: DataLemur
-- Difficulty: Intermediate
-- ============================================================



WITH weekly_plays AS (

    -- Aggregate weekly streaming data up to August 4th, 2022.
    -- songs_weekly contains data for August 1st to August 7th.

    SELECT 
        user_id, 
        song_id,
        COUNT(*) AS weekly_song_plays
    FROM songs_weekly 
    WHERE listen_time <= '08/04/2022 23:59:59'
    GROUP BY user_id, song_id
),

combined_songs AS (

    -- Use FULL JOIN to preserve users and songs that appear
    -- only in the historical or weekly data.

    SELECT 
        h.user_id AS history_user_id,
        w.user_id AS weekly_user_id,
        h.song_id AS history_song_id,
        w.song_id AS weekly_song_id,
        h.song_plays AS historical_song_plays,
        w.weekly_song_plays AS weekly_song_plays
    FROM songs_history h
    FULL JOIN weekly_plays w
        ON h.user_id = w.user_id 
        AND h.song_id = w.song_id
)

-- Calculate the cumulative number of plays up to August 4th.

SELECT 
    user_id,
    song_id,
    historical_song_plays + weekly_song_plays AS cumulative_song_plays
FROM (
    SELECT
        COALESCE(history_user_id, weekly_user_id) AS user_id,
        COALESCE(history_song_id, weekly_song_id) AS song_id,
        COALESCE(historical_song_plays, 0) AS historical_song_plays,
        COALESCE(weekly_song_plays, 0) AS weekly_song_plays
    FROM combined_songs
) t
ORDER BY cumulative_song_plays DESC;