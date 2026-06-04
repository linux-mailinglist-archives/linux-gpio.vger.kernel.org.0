Return-Path: <linux-gpio+bounces-37925-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PZNtNtcuIWoIAQEAu9opvQ
	(envelope-from <linux-gpio+bounces-37925-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 09:52:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F2B63DC4B
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 09:52:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Tydm8EmX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BhM43Mgg;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37925-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37925-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D502309A9CF
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 07:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9FF33C277C;
	Thu,  4 Jun 2026 07:48:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBA137D137
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jun 2026 07:48:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559313; cv=none; b=t2S892NaNJONr/RZaKdP4kz2qSInHY7rspn51IoLTRGVvp8lizXZHU/lansJdpTYPhY3fmvZk+MibECVuKKL49ZXynkggljGSVywfwXKmFPS1y1NZtB2m1K2a8nleB+7T1ygahIm6IQYkADt4P//caJWc8V0jPGgf4N8yb3hRnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559313; c=relaxed/simple;
	bh=7xihVO4IdDQCMHFvIKcMKTS9tU7gHxEayVJ9HgH4R/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h9TP5ZlXHc+OtPF97pZRMqvZ+ScX6snTIJUpHwMhO/A+IDhyrLl+yr/cQUegsnq1XF8rrzOYwoS+2JFS9J//cIEwFShBsh9Fe8CJ2htiHFnBR4lf7N1UpZrdqx+0RqBZRXBzhrTvgB/eorZCNa9U+lnsoOfqjHxjyODkPvhsfwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tydm8EmX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BhM43Mgg; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6546c72W3241141
	for <linux-gpio@vger.kernel.org>; Thu, 4 Jun 2026 07:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y0e8xzmVwgfeLR22rpKNTg7zn+PEAWBY5bchAc3768w=; b=Tydm8EmXaDVgcMAD
	5t4w36UThGCP2i4JJYSOIGHrEax7GZ2JXrweEIU/E6GPxaCSjiupTMjydswatYxC
	8Ri1WB9zvtxSOTi3dQ05f7Fcf46PZHPntn9Az1ncbXPstFUfGxWo7O00RFmLXJjF
	GmmGRWfhUKGKep69F1/zwVyZV9Qjy1wPW7g9dReYxUNbcdBKKgo3F39xcl21VCiq
	KGB1/FY9O4Ks1I6hs33Mis+Ig7G+qVqdISMOF6rEF0DuZwdotCtAgdiLx49BeAO1
	KwNftKUYj/AqRwQRsLkd0eJ9xUuF3EagVQTRAiWSwZazqZaW+y2EjUTXhOSX3Cqq
	HmyAcQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejvd09sun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 07:48:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5175a1e32e3so12504281cf.0
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 00:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780559310; x=1781164110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y0e8xzmVwgfeLR22rpKNTg7zn+PEAWBY5bchAc3768w=;
        b=BhM43MggX1gGM/N8uRSd647Ts/YQA4y3P/CLJ+EtaL+u3x0VUdIXdOgDmmz7a/WrsK
         wZjAvppBo5qsD+yaY6oJQxYQrl1FuSwlCDZkhMLr2Atnt9v3krnalWc54BcFZE59fCW5
         3e9JYkIx+im7fFy8IczTDerFOF9W4OAPvegDtCK86Vd1tHehmIbrqlczBf3MQkpPudED
         wGlHYgaM9d1C9tiOoE3sj8hLDHtQw+0sIMuQMeZMNgf0tlgBLVbsj5n8JFyju9oSnA9g
         Cr2pu7Ipmy7tSqnVeXnIwIbdSEmMBjKrZk99NCUl9WEjft08CwEbsnqG6bB1v8Ku8x3K
         K9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780559310; x=1781164110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y0e8xzmVwgfeLR22rpKNTg7zn+PEAWBY5bchAc3768w=;
        b=KCG3V6XeVlMjfjK4oQeJ8PB9bTy6VjJAoD8fNt0kbhfeyE0KV3DL5O17svrT3P8RQ2
         GpRSi4K0UeLYD8L6LV/4x1o1aNk4WaY6WGDL1Yszg1AsQWcn6UPLNd5jRchKR+XSO0U/
         zQsFCWwuydIbmuylAZib7z+fpbocgxBvXKhW9NoAP5Hbf3Ga5K4QRrNThySrfTVZvqjF
         fp9YHxhVyTuYze3LIk+mpfJnA1ZDGTyDpDwxN266Me1xtSPRVlAks+D/3QygCXCFPMY7
         w/wezOt2BJnRjcmpgLwe8ZuCmf5vAid0q0vv6M3xumcrJRMEP8Rf1sPHpHZ3GNIAuSXe
         kA+A==
X-Forwarded-Encrypted: i=1; AFNElJ8ASW0nSg6ZS9Hoc1s7LvV1Q9rF9IpuFsZxnhoEf99kMizWuMZy/Tbtd9a9nf35Cwh61KlVH+4aPHMt@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7BjgR7vddlKs6J1P8ge/j/+sG1rDXDuEd+thUACVgsfFC9Tjq
	tjy7R5YbcG1JmMpTJMI9ijMut/kt0E6RiAeT4bobuujDcL7ctu0ruV/Z3f6MSKFVa9r95riy/uM
	MzSVABHGWx165li8vlUyphPqvePNyXxc2u8d++Wis5qXtzg4xNmPJcPpqpnS6dm81
X-Gm-Gg: Acq92OFin6Qqg3t6+xBmWyDzzXTH8jh2cYiR8e4NJb2MNXycCXwSzoAkXrZnvTx1XTK
	qJYwPPXQa9clBaM6slvgYcGFJ3iWMFRybJecZQnDkWJJvTB5Pn5jzlsmuDUzSWSN/7duc2141IK
	fcZBKJBAqoutHhePJiNejEg3DZ5YRhh6haQ0E070y7rCRD30S0k74mnxZLazL5q92xWxrUYCbBc
	Ms/7oaypSo0P96dJcJXiLxU9ZWz7joKh9fZ1tDgtPzGkuX6HYwKaBLX0Faq4KpFf6RR0YvWOMqK
	X293g3kDWyxL3irb9JEfEOR9AYDEUAqaBcpw4PEswDcOl78q48GcT5OGUZgR2Y9CMU6SlR0WJPV
	1OJ6jRHBwIt7Wy3YeOWSUPNPfgtyPHW1Ycbu72sBygPpdDvX5R/3yH6x3tviWNDLXEX4Tk+/R/S
	uu8NntkGE=
X-Received: by 2002:a05:622a:8d11:b0:517:2c1e:8b6 with SMTP id d75a77b69052e-51778705ac9mr87653231cf.38.1780559310562;
        Thu, 04 Jun 2026 00:48:30 -0700 (PDT)
X-Received: by 2002:a05:622a:8d11:b0:517:2c1e:8b6 with SMTP id d75a77b69052e-51778705ac9mr87653101cf.38.1780559310183;
        Thu, 04 Jun 2026 00:48:30 -0700 (PDT)
Received: from brgl-qcom.local (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b7d6b990sm71092725e9.2.2026.06.04.00.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 00:48:29 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 09:47:50 +0200
Subject: [PATCH libgpiod v2 07/15] bindings: cxx: drop redundant class
 qualifier in line_request::set_value
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-pre-2-3-fixes-v2-7-781bcaf47475@oss.qualcomm.com>
References: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
In-Reply-To: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7xihVO4IdDQCMHFvIKcMKTS9tU7gHxEayVJ9HgH4R/8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqIS2xM1+rwiNzcfYqNryt1HM9RgsWUr+g3j61Y
 1A8lSMhV1mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaiEtsQAKCRAFnS7L/zaE
 w1Q5EACWjENs+XghvSGOPm67aM84DbXBZV3Wt2SjJjgVXYHVNfVfwImuKgooai23Fz3DkFPlMO/
 yoj7hqjvqvsy6v260sWfmFfehQvT8e490/BKGlvj9xJNG/CBj9M0cCszdJMIfU3d00qrHgLSyKQ
 riUP9XB9/XVP60bCZ9kMfDGXUbWVhIi/RjRam+ckAhx/aGMcI43+AlGCjae2CyT7g6q/W2pgiki
 4Fvnlztz71toq+pcpc1pqfGvrn20Za7xWXaeWWn2ctfkiyQOlGEe/G89JRr56PtkyDhY2uCQufC
 m7ajVs9mJlJM2mmv+K613PxcoFNfWTO3QRQjxeE9V9rbCiPI5lVq7hNeGdzLV+iIKx/gG0huoHR
 sfOYf2IsQ6WqGdMwCpzuGA7BTJvlVIwOcw8K+5mO9elQIdlNhczYvMVUDxAx3gKQ3nVGzEDF0Fj
 U9mZCCgtlGFSczh2HDTKVNWFQLoDbSSMpuGjV4u2YZlLY2bdrToxrebK/ZPyesdVBdHnqa/FWBy
 sTy/zBqMcExIpf3ANZboeRstNaAOfWce8jHIL+EOFvczYWZ0wh29bOGpvSuLnIzVfnkYg+mb3wo
 cIKaZqDYcqF7IAl9I+kjS1Ln3LxIt5f+Mnpid1LHhiO61Vki8bGuf/kBF0nzZm8NuYZoM13sYTP
 T71cITcOBmTNRTQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: cNP1KRHaqlkdiLHE-3vb-JRkfHOZYISt
X-Authority-Analysis: v=2.4 cv=M8h97Sws c=1 sm=1 tr=0 ts=6a212dcf cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=3W9sBVhNAAAA:8 a=EUspDBNiAAAA:8 a=-k1jFxHUnkbkSjS2ChMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=38sOm0jhF1M2KuwyeTFR:22
X-Proofpoint-ORIG-GUID: cNP1KRHaqlkdiLHE-3vb-JRkfHOZYISt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA3NSBTYWx0ZWRfX8+GqsbZYiJ2r
 7y63O3WFGjZxzH1+m+0Rfb1wD3OXHAYjAKw7jQ4Kds3SLInlh70yzkJ6jQCn42/JNKOXRxwJmNO
 RJFO2osNIQSiG/9QrfgFYAcPyH4q/5+4VDKJv/6/wUZC627F+YB3z18J8L0VzoiNaiPYji1CiKr
 SvpykSq+Zklz0BS4UPq6icIvr4ySzh0C5vHvBVqHJP4xMPGrNp2sBDTQ3WXG+StTsX4Fb+HwoFU
 8+qmsafiPIb97B3O0N4Vj4GN9xwyzBv7bhkI6SEkFu3d4yrly3hJ0JYIDOxwrD5Wbn9/pP3tmrf
 xajknLLgddW2vzjz2xPkSTAS5DHmYy8y73NBn8Yv1XXPhDK24JartX1HcJr9WncprxkWb/DwCPd
 IVe9nlftXw0oRNkmkzkaue+y7Xl3Z7YCCsAwD2Mi+6lnGhy2GUbcuFIpGRo00q4JvtAI5CfbsXz
 g9ugENGUK8cv5zS576w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37925-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:warthog618@gmail.com,m:erik@riscstar.com,m:viresh.kumar@linaro.org,m:vfazio@xes-inc.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xes-inc.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,riscstar.com,linaro.org,xes-inc.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 97F2B63DC4B

The definition of set_value() carried a duplicate class name prefix
(line_request::line_request::set_value) which compiles correctly but
is misleading and inconsistent with every other method definition in
the same file.

Fixes: b7ba732e6a93 ("treewide: libgpiod v2 implementation")
Assisted-by: Claude Sonnet 4.6
Acked-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 bindings/cxx/line-request.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/cxx/line-request.cpp b/bindings/cxx/line-request.cpp
index f6b0a66f65fdb48d90739b19e3da6db024dade07..ee8f68748932fe61296055530722870f02cb2be1 100644
--- a/bindings/cxx/line-request.cpp
+++ b/bindings/cxx/line-request.cpp
@@ -136,7 +136,7 @@ GPIOD_CXX_API void line_request::get_values(line::values& values)
 }
 
 GPIOD_CXX_API line_request&
-line_request::line_request::set_value(line::offset offset, line::value value)
+line_request::set_value(line::offset offset, line::value value)
 {
 	return this->set_values({ offset }, { value });
 }

-- 
2.47.3


