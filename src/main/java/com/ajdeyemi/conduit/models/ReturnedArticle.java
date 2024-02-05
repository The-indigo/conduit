package com.ajdeyemi.conduit.models;

import java.util.List;


public interface ReturnedArticle  {
    public Articles getArticle();
    public List<Tags> getTag();
    public Users getAuthor();


}
