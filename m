Return-Path: <linux-gpio+bounces-34648-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHKgF87Gz2lH0QYAu9opvQ
	(envelope-from <linux-gpio+bounces-34648-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 15:55:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 08906394BE8
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 15:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23886306B170
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Apr 2026 13:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41279338596;
	Fri,  3 Apr 2026 13:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i31kDSEZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b2VNWYSc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A002632ED58
	for <linux-gpio@vger.kernel.org>; Fri,  3 Apr 2026 13:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224331; cv=none; b=QWj7z+fKoPXfXFhK/3eY3AKIFyeXRh5LI2kN7QQWTfoSlf8NIjo6+1/zuHmSMC/K2mXKzlyv61+88A+ld6IdH+GvgyED8FuofwKI7WpzLKr70ud8/ldehg0W+yKyu6KGDoJbXkKvH+A46T/1F61yRUqYV8ymwZSHLplKkWCSi1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224331; c=relaxed/simple;
	bh=2zTa1uQYxUxYRVUzJRipjA8BBDZOomn/630n+yTJVvA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EAlFJTgcCcDBIzGt0k02pfpszeD0i2ZYo0/+5ph1Fq7y+mmhzYqkZYdtNOrIZ3PzNA9W728Idl7WdxnFSq1NwkkMCs6rrao1EgMKCobct+VETvUGtq7rhtEuGy208CAm8WDAvzP7q+Px+JlsmzWBOEjIm07ZNwy1AYDnvn89Eyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i31kDSEZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b2VNWYSc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63373tO63449908
	for <linux-gpio@vger.kernel.org>; Fri, 3 Apr 2026 13:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YBOqdtkmDAapfYrIsDUHeJtnSWg5R+XBtBgMNTUB28I=; b=i31kDSEZTO6j14Yq
	54cDaSv3IS/hfSe+Rz9u5i5RKKRu4WBqnfUTRtdz2hgxm7sSR9z5T2yLEr+4AKhG
	tS/pCmxgrIN49cGzBR1606L33P9goC+5bFJSGkcSO46RFe45LXtuySdhFgMmrwrm
	g8wQEDABefLem7eDkTKDhFUq3rKJobyq5Fh3By+IXRd49VkwhTIJnajqw3xJk6zq
	W2+9Vx7P3vwfZ6ikFZsjRU8QkPohcmfRt86iMT074Rj7q7B9xWjJ4YnfdRygZLtC
	ZBlUs/ekD82i3yUCrSRPLOW/tG3X9xIa/53xZkUdueT84yC4fjKgI/iuV9F93d/B
	YUFYQQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da8u59472-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 13:52:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b802961ecso25225621cf.1
        for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 06:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775224326; x=1775829126; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBOqdtkmDAapfYrIsDUHeJtnSWg5R+XBtBgMNTUB28I=;
        b=b2VNWYSc0weob9aXUs1dmrVyEZ+eD1gk8q2M4VLb2hos3GloRxsdywCK0U6vnsTFdR
         jWW5iR3gvh5EBnLbw6tl9MV0yypukLaWxoldJ/Ydits5/LnotJtXYt6PjnbsQFXxvMR0
         okoFsh3BG941AzJfyiPglZ8Rey4r30gy/7Ew4EbCJczbL1dgGS+IP1tyS2ARMtuSm0Dz
         gCTOmpmuC2kgx2gk/7+liSEDVbIQ+aSWR1B116U7itQk6naD0jDosWXXhCx7m/yet5UN
         oxV6diE2UIj8TQ8tKy5eXnZRf4sTDBrg/0nYPwN2K24F/zGKNtj+l+WHHOanTXeBMqbd
         czsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224326; x=1775829126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YBOqdtkmDAapfYrIsDUHeJtnSWg5R+XBtBgMNTUB28I=;
        b=MuiWkFsEdLCKadevTkzdQZCNi0+S5fiqRmwLAhXU0VyeXWSRVoJODgNaiIP5ycLmfm
         6BOe+j2UdGYm+7k4xVdPe6DC1RrSdRKos7LlWtQ2hxf3A5QGfVg4bmIEJCzW2TDAjOaX
         HNvym6v0LmHM19ls0N4lJTSvOyY47uKH5AFBpl/Ca8erNbXsJa8l/lUwE6stKoea6bKB
         sAopyS/2sTjtybERqy7ZEGjUv79GMPiyhsaV43pEMLr9NFbr6sGZdhcfpeiZKYmSOFQz
         9GuxX1W+/oqjlDPkitKMCva+/s+j5q+nN2m6ndaoh/fdv53xu+weNTzxZVuuSpxh0xlE
         d8VA==
X-Forwarded-Encrypted: i=1; AJvYcCWBk+ZfvhGquvln+PZaZtDAns1eVe0WXnJZz659nw7Wg/mLo/5ZC7j8qWzScYYtlFLGYRRYDHtfxwy+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9zePX9RjTgebg5SrO+4eHtEfPMxHM/Gmr8+R6Ob+BbGrjWPY/
	QqmVgw7fQs8Cd81pgq7YysXziyV2xk8J/eINw+qMsxdC+pRHyKTQVkIxejlG0uv64cJ/IOLA5gn
	20AkSPS2TDWtqkrAWAzhSFn0JyKdvM8DlT7fuXXB2xT4rqxIRV2D3t9e194OvRD5k
X-Gm-Gg: ATEYQzwUEA4k5lO8gz5S8kGFfueSsD9mILmpbndogxs7om5eKaZ+eNR6c0eN9fw5aP/
	YKc31MBglQYg+ooJf1T4WldtdWT2VPTfMl3Mg0SPHvfgwbs8KnrkmRdB2CTiJ2Xg5y2rVV6V4hT
	6O5zhghGkRDfM2uJl4PEFONHtS6I4+Xwp3S0kv1OZea4iqcUFdNPaEd4jPyvtXlRoGuLIPthagI
	mo3ugHS0gWxNKSzv2iTurOWWU1kLnBWNgrmF1U8pIebFknaNQWae0vyRgOGKPO7i8uMRJae30QS
	A3x07fMVY8o2EvjimV6IHGeYueCUYmjbT1Rxuo171IFbQZq0HXhzLGf8cBGkPUl/vlGCxOlYgy0
	5ufXh+RVwm0WcNdRFp7mYbx/5rT2hRSS57aX0quMt8faM0IoDNrw4
X-Received: by 2002:a05:622a:6854:20b0:50b:3f50:178 with SMTP id d75a77b69052e-50d62772e90mr36398221cf.14.1775224326101;
        Fri, 03 Apr 2026 06:52:06 -0700 (PDT)
X-Received: by 2002:a05:622a:6854:20b0:50b:3f50:178 with SMTP id d75a77b69052e-50d62772e90mr36397991cf.14.1775224325617;
        Fri, 03 Apr 2026 06:52:05 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:129d:59e8:f7c9:47ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm16948132f8f.21.2026.04.03.06.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:52:04 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 03 Apr 2026 15:51:50 +0200
Subject: [PATCH v3 1/2] software node: return -ENOTCONN when referenced
 swnode is not registered yet
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-swnode-unreg-retcode-v3-1-7886092b28b4@oss.qualcomm.com>
References: <20260403-swnode-unreg-retcode-v3-0-7886092b28b4@oss.qualcomm.com>
In-Reply-To: <20260403-swnode-unreg-retcode-v3-0-7886092b28b4@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Len Brown <lenb@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1381;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=2zTa1uQYxUxYRVUzJRipjA8BBDZOomn/630n+yTJVvA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpz8X/37eCiBlH+aem1nIKwfVlK9GeJXczn48iF
 rKSzEir77eJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac/F/wAKCRAFnS7L/zaE
 w92hD/0WgKx1R1QdJujvcq6sffSUDfGGKkdEhTqJ1XuTfk9USZdzbNgpV04hIVe0Cc2kl53gVTS
 8sRcPAg0gkLKdvq4T0CIhQL5cQYK8nehO5qpF0FqyZ0ZYc1kgzRmTAIneqeRRJFqLK2zzt4NlNh
 Zo4U71ukvF6MpIXtQDp0q4gbXxdZb4R0hvWKZRQG/cv7++uYe/pQ0Xrju2LbrjxbMD99tu7tHBK
 cZUyzgnizNZi/AX9ssfQ0ENaZlG/yB8u3yoZEjXjwEj4qdHqGWhvswdtVaUZ225qMso8ICm4CRn
 1xQ0lXLzskXvwomct6OCN0PlRVgDL1Xqr+BXWnTUGB0bA3YRyXGHl6xN8/xQeDvXBg1PYkYqD30
 J9IFVBtFQz7/ZSkpHU15Z8Fv9W5xyMwKBGuIsOwEi2/y5Ukv7oqyH1DBmWxjNjo+UvIQF7ZK5kY
 BarEbjpFRoCdiSG8+cVTHbj8zh00WpFMnrLwqd6j8542JbnV7LLfD2Rh466JYurfzDObMAVQPhc
 1ltMJFE5Ocs3ON+UOcysGTNOaZF01BfieRp+Si9GR0XQlP2cnL6ycefpxJ1xEQ4RBAwSB9cg3Jm
 yxEhy7G2FlU40MrDwj8xEK7b76VPgVQBAyvSW1DvG1qHQ+UOUtYLR2y/KDN5Ob/6xVPVACGXBRR
 k64RKpZZ4Jzqgrg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEyMyBTYWx0ZWRfX5UJXSRxOrBaW
 QLKZ9LxEXb+rphSMfKq33qYrmVPyDfkyWI67zLAmTlgsujOuf4gU8xlmjxq/Fk001cE3zBtFP7U
 /ycR7gflzyV8c5G2Fq0twPTThmyrFnVvkAkql8aAJCD926YHAowAXqb+GeJiT51Tp6MjvWakJM/
 cMON5v8OU8elOyg5j21RBTb8xojL8TsUaTD/0RADw+FKSwJbnU7FDf/tOAI7ucHb8rTtevVYOCc
 ImJ1aC91kxXKd7GiExY4IFGtrRlVGZCeBfR3amlOTua7igSQPD/sfyOObUBqzBzppii82SYYSfi
 ggY5aHJg63dCfHG6FSHWlq2CtATg53ld6gvPXfucMQD7bF19MgsI4EFQ6HkCWE8PpQpt0ZgYkuX
 MxG470Y75VpNUQUs3/l13LmsQkJNoPqVkBbHY/mIVPfxUnpFiOvgiqMs2wFscLuDdEGQlEsXNdV
 kNGo1IJ7NO6Bo0scCfw==
X-Authority-Analysis: v=2.4 cv=W5g1lBWk c=1 sm=1 tr=0 ts=69cfc607 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=WW6vG2jIvFMNhbJRSCoA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: sZ_BH6M5CW-KmFxhsgpCYHbVR2w1SvW2
X-Proofpoint-GUID: sZ_BH6M5CW-KmFxhsgpCYHbVR2w1SvW2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030123
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34648-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 08906394BE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It's possible that at the time of resolving a reference to a remote
software node, the node we know exists is not yet registered as a full
firmware node. We currently return -ENOENT in this case but the same
error code is also returned in some other cases, like the reference
property with given name not existing in the property list of the local
software node.

It makes sense to let users know that we're dealing with an unregistered
software node so that they can defer probe - the situation is somewhat
similar to there existing a firmware node to which no device is bound
yet - which is valid grounds for probe deferral. To that end: use
-ENOTCONN to indicate the software node is "not connected".

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/swnode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 51320837f3a9f1bf4f65aa161d9b941affc74936..61e73417aee89feb855b0f429e112ca0af78a003 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -554,7 +554,7 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
 		return -EINVAL;
 
 	if (!refnode)
-		return -ENOENT;
+		return -ENOTCONN;
 
 	if (nargs_prop) {
 		error = fwnode_property_read_u32(refnode, nargs_prop, &nargs_prop_val);

-- 
2.47.3


