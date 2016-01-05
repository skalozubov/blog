package org.askalozubov.blog;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.WriteResult;

import java.util.List;

public class BlogPostDAO {
    DBCollection postsCollection;

    public BlogPostDAO(final DB blogDatabase) {
        postsCollection = blogDatabase.getCollection("posts");
    }

    public DBObject findByPermalink(String permalink) {
        DBObject post = postsCollection.findOne(new BasicDBObject("permalink", permalink));


        return post;
    }

    public List<DBObject> findByDateDescending(int limit) {
        List<DBObject> posts;
        DBCursor cursor = postsCollection.find().sort(new BasicDBObject().append("date", -1)).limit(limit);
        try {
            posts = cursor.toArray();
        } finally {
            cursor.close();
        }
        return posts;
    }

    public List<DBObject> findByTagDateDescending(final String tag) {
        List<DBObject> posts;
        BasicDBObject query = new BasicDBObject("tags", tag);
        System.out.println("/tag query: " + query.toString());
        DBCursor cursor = postsCollection.find(query).sort(new BasicDBObject().append("date", -1)).limit(10);
        try {
            posts = cursor.toArray();
        } finally {
            cursor.close();
        }
        return posts;
    }

    public String addPost(String title, String body, List tags, String username) {

        System.out.println("inserting blog entry " + title + " " + body);

        String permalink = title.replaceAll("\\s", "_"); // whitespace becomes _
        permalink = permalink.replaceAll("\\W", ""); // get rid of non alphanumeric
        permalink = permalink.toLowerCase();

        BasicDBObject post = new BasicDBObject("title", title);
        post.append("author", username);
        post.append("body", body);
        post.append("permalink", permalink);
        post.append("tags", tags);
        post.append("comments", new java.util.ArrayList());
        post.append("date", new java.util.Date());

        try {
            postsCollection.insert(post);
            System.out.println("Inserting blog post with permalink " + permalink);
        } catch (Exception e) {
            System.out.println("Error inserting post");
            return null;
        }

        return permalink;
    }

    public void addPostComment(final String name, final String email, final String body, final String permalink) {
        BasicDBObject comment = new BasicDBObject("author", name).append("body", body);
        if (email != null && !email.equals("")) {
            comment.append("email", email);
        }

        WriteResult result = postsCollection.update(new BasicDBObject("permalink", permalink),
                new BasicDBObject("$push", new BasicDBObject("comments", comment)), false, false);
    }

}
