package com.poly.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedStoredProcedureQueries;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.OneToMany;
import javax.persistence.StoredProcedureParameter;
import javax.persistence.Table;

import com.poly.constrant.nameStored;

@NamedStoredProcedureQueries({
		@NamedStoredProcedureQuery(name = nameStored.FIND_USER_LIKED_VIDEO_BY_VIDEO_HREF, procedureName = "sp_selectUserLikedVideoByVideoHref", resultClasses = {
				User.class }, parameters = @StoredProcedureParameter(name = "videoHref", type = String.class)),

		@NamedStoredProcedureQuery(name = nameStored.STORED_FIND_USER_SHARE_VIDEO_BY_HREF, procedureName = "SP_UserShareVideoByHref", resultClasses = {
				User.class }, parameters = @StoredProcedureParameter(name = "videoHref", type = String.class)), })
@Entity
@Table(name = "`user`")
public class User {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "username")
	private String username;

	@Column(name = "password")
	private String password;

	@Column(name = "email")
	private String email;

	@Column(name = "isAdmin")
	private Boolean isAdmin;

	@Column(name = "isActive")
	private Boolean isActive;

	@OneToMany(mappedBy = "user")
	private List<Share> share;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Boolean getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(Boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public List<Share> getShare() {
		return share;
	}

	public void setShare(List<Share> share) {
		this.share = share;
	}

}
