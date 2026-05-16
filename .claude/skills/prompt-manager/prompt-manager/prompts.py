#!/usr/bin/env python3
import argparse
import sqlite3
import sys
from datetime import datetime, timezone
from pathlib import Path

DEFAULT_DB = Path(__file__).parent / "prompts.db"


def now_iso() -> str:
    return datetime.now(timezone.utc).strftime("%Y-%m-%d %H:%M:%S")


def init_db(conn: sqlite3.Connection) -> None:
    conn.execute("""
        CREATE TABLE IF NOT EXISTS prompts (
            id           INTEGER PRIMARY KEY AUTOINCREMENT,
            prompt       TEXT    NOT NULL,
            created_at   TEXT    NOT NULL,
            completed_at TEXT,
            is_complete  INTEGER NOT NULL DEFAULT 0
        )
    """)
    conn.commit()


def cmd_add(conn: sqlite3.Connection, text: str) -> None:
    cur = conn.execute(
        "INSERT INTO prompts (prompt, created_at) VALUES (?, ?)",
        (text, now_iso()),
    )
    conn.commit()
    print(f"Added prompt #{cur.lastrowid}")


def cmd_list(conn: sqlite3.Connection) -> None:
    rows = conn.execute(
        "SELECT id, is_complete, created_at, completed_at, prompt FROM prompts ORDER BY created_at DESC"
    ).fetchall()
    if not rows:
        print("No prompts found.")
        return
    id_w = max(len(str(r[0])) for r in rows)
    col_widths = [
        max(id_w, 2),
        4,
        19,
        19,
        max(len(r[4]) for r in rows),
    ]
    headers = ["ID", "Done", "Created", "Completed", "Prompt"]
    sep = "  ".join("-" * w for w in col_widths)
    header = "  ".join(h.ljust(w) for h, w in zip(headers, col_widths))
    print(header)
    print(sep)
    for row_id, complete, created, completed, prompt in rows:
        done = "yes" if complete else "no"
        completed = completed or ""
        print(
            "  ".join(
                str(v).ljust(w)
                for v, w in zip(
                    [row_id, done, created, completed, prompt], col_widths
                )
            )
        )


def cmd_get(conn: sqlite3.Connection, row_id: int) -> None:
    row = conn.execute(
        "SELECT id, is_complete, created_at, completed_at, prompt FROM prompts WHERE id = ?",
        (row_id,),
    ).fetchone()
    if row is None:
        print(f"No prompt with id {row_id}.", file=sys.stderr)
        sys.exit(1)
    row_id, complete, created, completed, prompt = row
    print(f"ID:          {row_id}")
    print(f"Prompt:      {prompt}")
    print(f"Created:     {created}")
    print(f"Completed:   {completed or '—'}")
    print(f"Complete:    {'yes' if complete else 'no'}")


def cmd_complete(conn: sqlite3.Connection, row_id: int) -> None:
    cur = conn.execute(
        "UPDATE prompts SET is_complete = 1, completed_at = ? WHERE id = ?",
        (now_iso(), row_id),
    )
    conn.commit()
    if cur.rowcount == 0:
        print(f"No prompt with id {row_id}.", file=sys.stderr)
        sys.exit(1)
    print(f"Marked prompt #{row_id} as complete.")


def main() -> None:
    parser = argparse.ArgumentParser(description="Manage prompts in a local SQLite database.")
    parser.add_argument("--db", default=str(DEFAULT_DB), help="Path to SQLite database file")
    sub = parser.add_subparsers(dest="command", required=True)

    add_p = sub.add_parser("add", help="Add a new prompt")
    add_p.add_argument("text", help="Prompt text")

    sub.add_parser("list", help="List all prompts")

    get_p = sub.add_parser("get", help="Get a single prompt by ID")
    get_p.add_argument("id", type=int, help="Prompt ID")

    complete_p = sub.add_parser("complete", help="Mark a prompt as complete")
    complete_p.add_argument("id", type=int, help="Prompt ID")

    args = parser.parse_args()

    with sqlite3.connect(args.db) as conn:
        init_db(conn)
        if args.command == "add":
            cmd_add(conn, args.text)
        elif args.command == "list":
            cmd_list(conn)
        elif args.command == "get":
            cmd_get(conn, args.id)
        elif args.command == "complete":
            cmd_complete(conn, args.id)


if __name__ == "__main__":
    main()
