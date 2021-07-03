package forum.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 主题
 */
public class Topic {
    private User user;
    private Tab tab;
    private Integer countReplies;//回复数
    private Integer id;
    private Integer userId;
    private Date createTime;
    private Date updateTime;
    private String title;
    private Integer click;
    private Byte tabId;
    private String content;
    private Integer isEssence;

    public Integer getIsEssence() {
        return isEssence;
    }

    public void setIsEssence(Integer isEssence) {
        this.isEssence = isEssence;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Tab getTab() {
        return tab;
    }

    public void setTab(Tab tab) {
        this.tab = tab;
    }

    public Integer getCountReplies() {
        return countReplies;
    }

    public void setCountReplies(Integer countReplies) {
        this.countReplies = countReplies;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getClick() {
        return click;
    }

    public void setClick(Integer click) {
        this.click = click;
    }

    public Byte getTabId() {
        return tabId;
    }

    public void setTabId(Byte tabId) {
        this.tabId = tabId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    /**
     * Date日期转字符串
     */
    public String getLocalCreateTime() {
        if (createTime == null) {
            return null;
        }
        //设置日期格式
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return df.format(createTime);
    }

    public String getLocalUpdateTime() {
        if (updateTime == null) {
            return null;
        }
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return df.format(updateTime);
    }

}

