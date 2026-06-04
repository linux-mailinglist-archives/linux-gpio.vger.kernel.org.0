Return-Path: <linux-gpio+bounces-37923-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5K6IKkIuIWrRAAEAu9opvQ
	(envelope-from <linux-gpio+bounces-37923-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 09:50:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CB363DBDE
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 09:50:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YU501RTL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IPXHB8TJ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37923-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37923-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7251D307D1C0
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 07:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F0C93C277C;
	Thu,  4 Jun 2026 07:48:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3108F37D137
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jun 2026 07:48:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559308; cv=none; b=pO1SrWh2Q7guGJY2P821oE+3KZmaIH7/ZlO1pl+Nzh3uzU7P1JPIWQRbseT3TpqvlSuFuoqqTWKnsV4wudMrT2izhQR+3+Goc5+Ee8ghHJqG3flcRUlILp3985l1bUSMfzmQq8tJXx7uvQX7g+6jQJg+43bBWO/ccy1WpcMLYHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559308; c=relaxed/simple;
	bh=Zsa8Fm2x+c75Op5z93e8dy7VJ+lF9JDqgKdVsC4hIRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YJtY6+JVz6QrrCBXjZvNM/74FOA6id8mhb0QHlAmfrX427Ax8IK/QctIOUmXMSoMlqzjoD7GOQTveat4O6Ga1OwXs+635V0xSnMSsVi8OHvb0SZ0u2CtLpvzxEtZPLGk2G95QxZNRu7HsOhqRST41gwrIKtIkp5SlJlCUaihOQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YU501RTL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IPXHB8TJ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6542MQ1K2368045
	for <linux-gpio@vger.kernel.org>; Thu, 4 Jun 2026 07:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uQNseA5kD8DUXndbaEYdWpZmhHn14gUvA4vfelGUeBk=; b=YU501RTL06I3zM4a
	3nHZaDGU8Az1R+978D0a8I7Mc3mMp3j2P8G7RqOXQ1cIU8BA/I+osByzBBAOrJle
	4jKPkNxt3uU8WjcQ3yC4P0gtXg+eXefssoHpxbYeasAlC4WBDUkCmJgF6z4frdKe
	6H9HTTnupzEw2frDVyWTusMCLrFsojVNV+IE7t3ngn620RUmn+Qu5T0EQZVMR1wB
	Avx2lh9+8PkYKxCLoUpcpxjr2oojDIgLFlkgBAWw0s05vtv+uT1o2l7+IHhU09Oy
	UWspLUCLgzCHaJxx4GZM96BAT+RXhC5nDjB6JrifKyewLRn5zs+k1+Nt08HBAzR1
	SFc50g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj3gmmcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 07:48:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517787172b0so9586741cf.0
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 00:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780559305; x=1781164105; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uQNseA5kD8DUXndbaEYdWpZmhHn14gUvA4vfelGUeBk=;
        b=IPXHB8TJG5YIuZpEKyUu9e6rj95nItzVQXlklXgfg5xjkHqmgfYsItP5rxgW+qyRnd
         /DpoG+fjaVUAvGERleZgrFrmTyMaZpThsXyiRC/cS52HtWjgbsj25vmZsmL642HAOrdV
         gvlPq/04YaahtXjTnKegM9YnttsYtVW0WbfIbZa1vRCvZI1vFkEgBycGkizDy7oCaPEy
         +Sxe/+1ZL4pVUlAYYbxIpYifzmboGaeAKUrVFqoXEUxSSa1uNupoyMDZEzbO/JY+l6Cz
         eLqlBWu4sz4sZUDRGIzETXhwHHNlkUX1+yoFTS7jjJt1SSFx5dYkrgCwrFxNkqd/+OmK
         2/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780559305; x=1781164105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uQNseA5kD8DUXndbaEYdWpZmhHn14gUvA4vfelGUeBk=;
        b=ashxZ/hPvuQiQXQNJnUKzmWjmHWnG3kY/ifITgnH+2+g2YssrgtLsr034EVaxC69Z/
         c2tWWZV5+KtcWVsFkZ3md6/BTeein4ejqMBJNd3ai0zFWfucmfAhtTN4Tx0fSiGp8zx2
         XgmyRuLAinWALjCig6d0fJpp+iZuwaVKZXJKatjlSGde7DNsGq1ammcbPFOXMA/yjoNJ
         7HEJoa7q1ZyuvqhtkZvZNSh+rChxASTESbygkWaXNYjrh5pYHLmqhOVQ711ZKLxj2gSE
         /7VZoNEarO/uyEzbTQyZp0CxFkZsV/vhpOGGAYosc/7oR7R99ha5ztU/WsdZMIB16tdR
         c/og==
X-Forwarded-Encrypted: i=1; AFNElJ9PR/C9qlTWWKZvtmR0jeX05xONO9sgCwQ5WcP2rrJ2zd8gGGtjjEY5OGP0OHMTIw14tPseC3Ly6wjj@vger.kernel.org
X-Gm-Message-State: AOJu0YzFAm9PPOiZXFcyzOryRvocUwpZOXcQhfJmm1tV4WGe3ChThh/1
	cNWh2keRGxmu4DPL6+tkrIAUUimqyUrl5oJ/YGEGR6WrwRbEaNc1tN9+Rs9WZEd2IeoURx2YBz7
	oCMbQIJyXBNvGi0uHUSRDYXvcYLkM15KBIyYnKu1VVu7KOGBUJAbCYSEhgOmPdMjW
X-Gm-Gg: Acq92OG7KF/LwJmZbPojGlWf4dGfKXq+UIu4cF8BUaRN3GKzvfbiXrPrlEz9jZFljhd
	bLzjEYs6n7SsOgNwzi8mwy66gaIDUM90xM/USBX+ONI4G3rQ40ZFHgj4vNPtb+4nALZLMFU3nUL
	MPGDnfBv3IyAWs3pTMHmijyvTPSWCcMk0aD1e5l6NoI4iXrMrPNLugDZn0vQOekDVNSAVL0uJHW
	gh6VJ8fUMMZHr1fV5PmEAUuOhDCjeZqRok3zqZkrVbJRTCbQDVo++EavYGuoISJmif0ic+CORXe
	iPwYDKNl+QHVMgE3Kb3UXNKI4+hDr+59Hi0LzywfGvK1rIOYbcRaBJjFjIhrjihMhxA1Fg9i/NQ
	AU8uxnJcRstxn09yF8oE950fuKpsYqdvTZd3SH2ZocLb/VZN4OndENX0c+BNJCMXjQ1bwI4eQmH
	2ecuU7ubo=
X-Received: by 2002:a05:622a:618c:b0:516:d943:175f with SMTP id d75a77b69052e-5177878697bmr100611351cf.52.1780559305542;
        Thu, 04 Jun 2026 00:48:25 -0700 (PDT)
X-Received: by 2002:a05:622a:618c:b0:516:d943:175f with SMTP id d75a77b69052e-5177878697bmr100611071cf.52.1780559305101;
        Thu, 04 Jun 2026 00:48:25 -0700 (PDT)
Received: from brgl-qcom.local (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b7d6b990sm71092725e9.2.2026.06.04.00.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 00:48:24 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 09:47:48 +0200
Subject: [PATCH libgpiod v2 05/15] tests: gpiosim: remove dead
 container_of() assignment in gpiosim_dev_enable()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-pre-2-3-fixes-v2-5-781bcaf47475@oss.qualcomm.com>
References: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
In-Reply-To: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=938;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Zsa8Fm2x+c75Op5z93e8dy7VJ+lF9JDqgKdVsC4hIRE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqIS2uOh+fxjAn2xC+vuDK8kOWh1i0DC2inrmVp
 Df5OQv8EI+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaiEtrgAKCRAFnS7L/zaE
 w4U8D/9cnOGZL20iNu/eG+NI8hOgaTLs0qNs4EsK3p7ZEidY8c+rxsp4VeQws2n8ojBuETjGfBy
 lajm/xFNUqcDG0mmtdRLjse69cmCexso9WlQ2Wumb1NThxSMr1gBAEdhAxvwnMSXM2u6yFFqPzq
 AmteBsd1Z6CgAPiGriVCaZ8yhJcrab7YjBzmbh/muhkYGCLotKqNSLCu6oMh1ilDtMyG/xElW08
 VJFvu0hn4QR58qdRAq+3I1aWXoWIoPgg991F/Qmi+5u7T9OIDtbEc3SsTrYHE+4g5iY6XJLxEEN
 CjnOr8E55PizSZotfVmGmI4aExsY2ee2wBxNba0d092VSPNNX0MxWguWxSfAm+8L11cmq4fLhlZ
 XnwQ5B1uKBCZRez3VJjl0rTizXPm4Oy1DzkH0QTBECJ1HhkAeSympfMkOfmltWJVHHiqZXmRX3E
 rQKDFHkDEmvEfr68PwMdj1Ig15iteyvg8Py3h5FxFx+XAxxHEw9LSa0a1I+ZkPMVqETtaOi27LR
 7O6Ag5k+UOSpFTY8ZRiYXQoqRIxZf7zLfDd0ykW2MJmW9OWFVbPB+UZZo3FmH2RoFMsRFM0nMga
 E9kZXqHkulLVkY0Ivb4LRBOlI0CE8thLq/YklfzoaS9UvmaFYacdNjeZnxsN49ppOB0S30+HciW
 wwjzw5HfTDaNj0Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA3NSBTYWx0ZWRfXxY4ulnL5boZQ
 NpmRGu0vosKepJ2aaRaZZvRBCE6+8vt6860bKauuQD4a7xa2aErDybg6/aPWVW3hwlZ39DRkQof
 r7wqWeOftZDqMCRsKW+XRkbHGjFbDJRcJtQNLO5cR/EeX+hrWDyg4XieZMSLiXXGRWNZcyddfM8
 6+xnvu3FN5Qj7HdxgmESyZngAwXoHUyRcS0K3bwduV9di+rbU3buMnce3T1Z3FrO++RVOhqVeiX
 hU4ufwDQQ5iuPVhFiOtPZMjhD5hs+g5b6HNjqnUvkEBFeJUdGnRrimT5qKnAlMFK9KeEIPhEPdP
 9KLwsKc1NhncGX8OoaJWKrXBWwh8HoQtk2mLve4XdPjVjh/q2uk40MaAIgUGTeeljxtnDr143gC
 5XGG9+qEjCOcyANTslkEnSNTm0HffYG7KR3G6r6J8Hl0HCblzNsBeXlh1vTLjkS4LjJ2r90g7OY
 9BHGTRDarJbe8ngxuKA==
X-Proofpoint-GUID: zgErjzCQiXNmoHEIoiuk9rqh-o9Vs8wi
X-Proofpoint-ORIG-GUID: zgErjzCQiXNmoHEIoiuk9rqh-o9Vs8wi
X-Authority-Analysis: v=2.4 cv=UvhT8ewB c=1 sm=1 tr=0 ts=6a212dca cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=3W9sBVhNAAAA:8 a=EUspDBNiAAAA:8 a=J0onJY3hBJrmla36YHoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=38sOm0jhF1M2KuwyeTFR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37923-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:warthog618@gmail.com,m:erik@riscstar.com,m:viresh.kumar@linaro.org,m:vfazio@xes-inc.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,xes-inc.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[gmail.com,riscstar.com,linaro.org,xes-inc.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 90CB363DBDE

The assignment to bank via container_of() immediately before the
list_for_each_entry() loop is dead code: the loop macro reinitialises
bank on every iteration and the initial value is never read.

Assisted-by: Claude Sonnet 4.6
Acked-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 tests/gpiosim/gpiosim.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/gpiosim/gpiosim.c b/tests/gpiosim/gpiosim.c
index 449dfbee29358f14d6aca0e438ca93b937c90dda..920edb4774ed3de0572c90a9009201390a145730 100644
--- a/tests/gpiosim/gpiosim.c
+++ b/tests/gpiosim/gpiosim.c
@@ -813,8 +813,6 @@ GPIOSIM_API int gpiosim_dev_enable(struct gpiosim_dev *dev)
 		return -1;
 	}
 
-	bank = container_of(&dev->banks, struct gpiosim_bank, siblings);
-
 	list_for_each_entry(bank, &dev->banks, siblings) {
 		ret = bank_enable(bank);
 		if (ret) {

-- 
2.47.3


