package com.mobileplan.model;

import java.util.Date;


public class Auditlog {
    
	private Long id;
    private String operationType;
    private String entityJson;
    private String mpName;
    private String mpDisc;
    private int mpVal;
    private int mpPric;
    

	private Long mpId;
    private String up;
   	private Date modificationDate;
    
    public Auditlog() {
        super();
    }

    public Auditlog(String operationType, String entityJson ,String mpName, Long mpId,String mpDisc,int mpVal,int mpPric,String up, Date date) {
        super();
        this.operationType = operationType;
        this.entityJson = entityJson;
        this.mpName = mpName;
        this.mpId = mpId;
        this.mpDisc = mpDisc;
        this.mpVal = mpVal;
        this.mpPric= mpPric;
        this.up = up;
        this.modificationDate = date;
    }

   public Long getId() {
        return id;
    }

   public void setId(Long id) {
        this.id = id;
    }

   public String getOperationType() {
        return operationType;
    }

   public void setOperationType(String operationType) {
        this.operationType = operationType;
    }

   public String getEntityJson() {
        return entityJson;
    }

   public void setEntityJson(String entityJson) {
        this.entityJson = entityJson;
    }

   public Long getMpId() {
		return mpId;
	}

	public void setMpId(Long mpId) {
		this.mpId = mpId;
	}
	
	public String getMpName() {
		return mpName;
	}

	public void setMpName(String mpName) {
		this.mpName = mpName;
	}
	public String getMpDisc() {
		return mpDisc;
	}

	public void setMpDisc(String mpDisc) {
		this.mpDisc = mpDisc;
	}
	public int getMpVal() {
		return mpVal;
	}

	public void setMpVal(int mpVal) {
		this.mpVal = mpVal;
	}

	public int getMpPric() {
		return mpPric;
	}

	public void setMpPric(int mpPric) {
		this.mpPric = mpPric;
	}
	
	public String getUp() {
		return up;
	}

	public void setUp(String up) {
		this.up = up;
	}

   public Date getModificationDate() {
        return modificationDate;
    }

   public void setModificationDate(Date modificationDate) {
        this.modificationDate = modificationDate;
    }
}