Return-Path: <linux-gpio+bounces-32549-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJTcAJdTqWmG5QAAu9opvQ
	(envelope-from <linux-gpio+bounces-32549-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 10:57:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6605D20F248
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 10:57:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94C5D308C5BC
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 09:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FABE37C93D;
	Thu,  5 Mar 2026 09:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kQwA0pAu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KY+fpuqx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB7D37C907
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 09:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704314; cv=none; b=NDydJWIEpEdZ4D3rwmdenxf8m0HNktIsFBS2gP+7VTbsUJ++w0QvXGOaVXqpFcNKMKLqgqEqDIrz3NWIHIycwjmh/pDPrat6Zm6noTPloSsl/GlPAY/5q+IZ7NN1/oQaUg4pPZOgyEVXTZOGESdHO7kuWp4uHYW4QkckFQb4k9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704314; c=relaxed/simple;
	bh=8am3cklRFDJocxOgWUQn9XpHwpcovSzr9V3lxqLF2xs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qkct7pFvubl0eX+zquh24VStPE3jI4PM4ND0Q0lX8Vh9YpmhumnPxFnBBFCTip3Ial52DeZbhEBEMve79/7JboeYlNbAf+2XnlhFJtmIU/3Tv6F9ctY8oYT1+ecZwzGXsIIUYdmSCV0OblCwyEZsYkleoKkykmM9Sr5gaFUpYbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kQwA0pAu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KY+fpuqx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6258sDPN3665129
	for <linux-gpio@vger.kernel.org>; Thu, 5 Mar 2026 09:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z6AFaegujHrYLKUvs6vRWTSfpz9cb1A1z4I6erVQ1fY=; b=kQwA0pAuCeOwVAYZ
	RXy6Wsvgbp6hQXd6o84FgJJJuRBK9kAAXKSG/jrAWzoAqBfkEYJeX7d6dkEAZvwh
	DahDEN5CzBYr+tG2fM3eaxvenVmu6fopzUzjDuMHeux822/bHEe6SciktIszjKRn
	qq9M53LVeCL6+qlCWX+FVEIZArQ+qGfycvxT32o0iE4oXZOLhSoKwb1AV1y56sJg
	W+O2ePi1iFVchVtcH/ZEGNVdfO4TQvZgNpXsuodXLduoqTTBSEvw0DT8zoxjgWab
	cqMPPltKzsRF3VuN5ucXqlm4UtWuGTidSXJHWaUoyYXw3zyIMvbGD+D8Jk+KWNmk
	RlLMqg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq04u1hmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2026 09:51:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71500f274so834065385a.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2026 01:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704310; x=1773309110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z6AFaegujHrYLKUvs6vRWTSfpz9cb1A1z4I6erVQ1fY=;
        b=KY+fpuqxSwxVCF6pnpoV1sAco7ivUVkIFd+QHFejMUwdMendSJeXvZx3vv2+GzMPqu
         g0L9yqSXASi+Au80al5eirgz+icVqk2mdCt1CqIe2zu4vFL1nWNSEMBQdqlW36qMXMdL
         PT7tiJSeKBYbi/8Qid0CF7/PVmgRz59HZEe+81uUx2YqZx7qNzNXY7J35D6TtrQPChhg
         55FcjTBv0CNT/h3N/MK4IcAb//FmRX+yJeJ3BMexdc7aY0PwxIPTHPSDCTM7qG/fnbFr
         otnxyhfpPCGD7kkYuXrBsagi9VoKtjpprJV1K5ZA5S1fPPfZDNa1/XbAYVvJ6w/KZtfS
         cxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704310; x=1773309110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z6AFaegujHrYLKUvs6vRWTSfpz9cb1A1z4I6erVQ1fY=;
        b=vVOgmcHp3u5CF+s65g+/QxGtL8cMnhP676zZLNsQ9w1LnD+FaBK0WCOfaXq3NNsJQx
         MywV1H+n3YLT3oXPp3y87B5nttNZuuJ5Dmln5b3C4NJA2MHS07Xhmrh+93R+axfRPYO2
         0YVkqxZr351pKzAap77SxyaamtvJTrI6IQvEIEPeTCnDbX4MXmGNYb6200Tx2nPuy1Zl
         0dvOYMPe+BkZbZqa+xjMhou3P8Csi/9vVSa8gPqaaKC+wT2+cAhv27Mq8jXjg+0rrob+
         Pmwhwq1dwLz8bBkMh35L/F/rFPXm6Tqa6tbBObCaqCiIQ/lOAeVE5PVvwO5DDELg73X0
         DDtQ==
X-Gm-Message-State: AOJu0Yyc2RjWxnk4nnVsI0//Bl3uWafqouabcEQf/Zv9w8BFS+nMXQII
	ruwEwLNU6cq3tBJGakIPeX/jKX7D23vDXTHZPvpTOxr2a/iWFfvhhC+lkgTzDFpW9jRphdCzEEr
	8n29N8zcTRTyuVE+fZELPT4TRKo1YrpOL/VZfhmhKQ7+oWiUNwldf8GWWxFfjsFXo
X-Gm-Gg: ATEYQzwHqygLkmx/Zy4Xy2x8Bw2w/LpXeL17m/02P0btQ9vd10NZx6k/ZIvZy3CZj3e
	xeQOSFMfOu0BTFDG6VE77wt+LJxdHqCNEfKSNmMivH+AmpvKktmj7XcHfrxeET4eIUYaNgBwHKD
	JcW2Ha4yH4al3pW6RDjRlF7CmEkP4VB7iJN5Qkgk+rZvzcCjSAPAUg9Pq+t7PbBp8NEQrtw5wsw
	0po1WSmzIzZ+cm18o7e7GeisKKw3pzANPC5Wad//hjrEONeg9S9rZwm6t3uD+snRFnjDPRKFaOo
	WVBr2D7NJhhBz+vlwGNHLxq/awfkcigsTma/pjS4zOsRJOgvTjOPkK4j3XKTEM0UQ4W1rG/vuSS
	QCvVTnlg2km+IvGmtY1MDioP+3POkpXRbVs0Uz69ysey3tX+do7AQ
X-Received: by 2002:a05:620a:1a22:b0:8c6:c08d:275b with SMTP id af79cd13be357-8cd5afacd78mr574626685a.58.1772704309896;
        Thu, 05 Mar 2026 01:51:49 -0800 (PST)
X-Received: by 2002:a05:620a:1a22:b0:8c6:c08d:275b with SMTP id af79cd13be357-8cd5afacd78mr574625085a.58.1772704309342;
        Thu, 05 Mar 2026 01:51:49 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8314:9d33:34c1:88ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad1656bsm35598215e9.24.2026.03.05.01.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:51:48 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 10:51:27 +0100
Subject: [PATCH 2/6] gpio: move hogs into GPIO core
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-gpio-hog-fwnode-v1-2-97d7df6bbd17@oss.qualcomm.com>
References: <20260305-gpio-hog-fwnode-v1-0-97d7df6bbd17@oss.qualcomm.com>
In-Reply-To: <20260305-gpio-hog-fwnode-v1-0-97d7df6bbd17@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Frank Rowand <frowand.list@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-doc@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13345;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8am3cklRFDJocxOgWUQn9XpHwpcovSzr9V3lxqLF2xs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqVIpw+ceJCTVZOWduEH5MNtRgdR8NJo3Rku41
 7uVtsZlneeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaalSKQAKCRAFnS7L/zaE
 wy3GD/9xv714Nm93dCYmmJT7KSdLjSn5jbo20BkakIk5YBEsBA5s0/Ghgu8xm/Svuxq5YVWbi9H
 5lKoYvS83/hw4g//7xN4aiVyROoFAUjW7cCfC027ABSgEaBWoX8WGN43r5RdrK8BWrLS+peC1hw
 /Dv/+prrxQ3RipDsCy7WS5VeOksjPvca4CQZCEyoW8RoNkoTexMrtp3qp8XZ6SEgur7cvO++iBC
 SKJfBf5PyBrx1KyKNxGxNL5J6DMW2SeIPg2tpht/DM+m7kzgn0+5jflf0pCa+bCx3dsAnoCp1AE
 yRBSE2HbxgJcd8ULE0XEQdQq1lcCjuaF8HfG7DaiQfZesIfGu5jvri1JTsFhZ3JI4ncVVPCEOaX
 C90UoH7JKoRZpcXS8L3glkarNB0Xzr9gBaNkWrp8/L86Z7x2ZsVG9f61NeJIfNey6I0whauEVPW
 NSTit/hdt0pkc+CAxPIHWhlad9waMZ+mXy6icl0axpc1Pzhdy2JSNIcBXgDYln0VVC8TEtLsuLN
 hXbctQJnQh7If9T/fIUhrPhuWxr64/oeIm6cCBV0kRp+aS37lUp68v10Z2Hu6quDenv4oB0D/f6
 dQDnwNda0ND8Ko3eMnhlaoLWkkSd8BBvYzm6viGpP8KjUWr8inQX1/L+/dtrxwZmhaCzm8VkNV+
 5TUEJGfRx3cEx2Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: fiTVzr-JrAk4ouj7b6s8s9hMCJBAgYdi
X-Authority-Analysis: v=2.4 cv=eqTSD4pX c=1 sm=1 tr=0 ts=69a95237 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=sl8yS17PtdFfKPVmjogA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: fiTVzr-JrAk4ouj7b6s8s9hMCJBAgYdi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3OSBTYWx0ZWRfX0Cv1vxt/fW08
 BhjUaHBjPo+SdzXGPrxEwvolZxcHFrYW5cqSxFBH1y1T0DfiYVLhYRZk86JKsx3Ozb4/4Nms5IC
 y4yrLtAZoCjrJTieYzbQbpok2O8ek9E+vn04fH/H78GTiiVhapSYI4L66CUZWEE5svbpjKA14Kz
 wuOECKOMyMs4wvLClIaIvpdDiILa5NT6oPnx8d3iAN/0+ichqm0Q/dxyJEFY9lwT713cC33zKZ5
 oFpkTHrt/ep6m2Nn1i2FfZR4tUZud91z8/jzbFtjAE7Po2Fy9Bs+fEcl78VMdJMyWaUj2HE5GjN
 BxaniWzuxcc41vQpHg9ilgpJTRf0DpcMn+3xoUfUOLBxU/4VtMtAqEIZJFGFL1RIv1FaRfnr2Fh
 yjfXSkm4QBz+LOw1Dtt2aFNJ0Sc29RmC3SVVTa0e5Z2NK9oL+xXlvdk0Cget7HtY7b8FPml30TM
 NbpXLspTXsbYvhRcbDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050079
X-Rspamd-Queue-Id: 6605D20F248
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32549-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gpiospec.np:url,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,linux.intel.com,iki.fi,atomide.com,armlinux.org.uk,lwn.net,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Refactor line hogging code by moving the parts duplicated in
gpiolib-acpi-core.c and gpiolib-of.c into gpiolib.c, leaving just the
OF-specific bits in the latter.

This makes fwnode the primary API for setting up hogs and allows to use
software nodes in addition to ACPI and OF nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-acpi-core.c |  70 --------------------
 drivers/gpio/gpiolib-of.c        | 139 +++------------------------------------
 drivers/gpio/gpiolib-of.h        |   9 +++
 drivers/gpio/gpiolib.c           | 100 +++++++++++++++++++++++++++-
 drivers/gpio/gpiolib.h           |   3 +
 5 files changed, 120 insertions(+), 201 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
index ced6375d1badf9e113e708ce4bc9f83071f9acca..09f860200a059b1d17c652b9aa66a49abea3cb4f 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -1220,75 +1220,6 @@ static void acpi_gpiochip_free_regions(struct acpi_gpio_chip *achip)
 	}
 }
 
-static struct gpio_desc *
-acpi_gpiochip_parse_own_gpio(struct acpi_gpio_chip *achip,
-			     struct fwnode_handle *fwnode,
-			     const char **name,
-			     unsigned long *lflags,
-			     enum gpiod_flags *dflags)
-{
-	struct gpio_chip *chip = achip->chip;
-	struct gpio_desc *desc;
-	u32 gpios[2];
-	int ret;
-
-	*lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
-	*dflags = GPIOD_ASIS;
-	*name = NULL;
-
-	ret = fwnode_property_read_u32_array(fwnode, "gpios", gpios,
-					     ARRAY_SIZE(gpios));
-	if (ret < 0)
-		return ERR_PTR(ret);
-
-	desc = gpiochip_get_desc(chip, gpios[0]);
-	if (IS_ERR(desc))
-		return desc;
-
-	if (gpios[1])
-		*lflags |= GPIO_ACTIVE_LOW;
-
-	if (fwnode_property_present(fwnode, "input"))
-		*dflags |= GPIOD_IN;
-	else if (fwnode_property_present(fwnode, "output-low"))
-		*dflags |= GPIOD_OUT_LOW;
-	else if (fwnode_property_present(fwnode, "output-high"))
-		*dflags |= GPIOD_OUT_HIGH;
-	else
-		return ERR_PTR(-EINVAL);
-
-	fwnode_property_read_string(fwnode, "line-name", name);
-
-	return desc;
-}
-
-static void acpi_gpiochip_scan_gpios(struct acpi_gpio_chip *achip)
-{
-	struct gpio_chip *chip = achip->chip;
-
-	device_for_each_child_node_scoped(chip->parent, fwnode) {
-		unsigned long lflags;
-		enum gpiod_flags dflags;
-		struct gpio_desc *desc;
-		const char *name;
-		int ret;
-
-		if (!fwnode_property_present(fwnode, "gpio-hog"))
-			continue;
-
-		desc = acpi_gpiochip_parse_own_gpio(achip, fwnode, &name,
-						    &lflags, &dflags);
-		if (IS_ERR(desc))
-			continue;
-
-		ret = gpiod_hog(desc, name, lflags, dflags);
-		if (ret) {
-			dev_err(chip->parent, "Failed to hog GPIO\n");
-			return;
-		}
-	}
-}
-
 void acpi_gpiochip_add(struct gpio_chip *chip)
 {
 	struct acpi_gpio_chip *acpi_gpio;
@@ -1321,7 +1252,6 @@ void acpi_gpiochip_add(struct gpio_chip *chip)
 	}
 
 	acpi_gpiochip_request_regions(acpi_gpio);
-	acpi_gpiochip_scan_gpios(acpi_gpio);
 	acpi_dev_clear_dependencies(adev);
 }
 
diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 08b7b662512b825086cd70440be98b59befc3ffe..4554d915d57d95aadae0e4d9ea30c3d9c2782984 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -735,139 +735,19 @@ struct gpio_desc *of_find_gpio(struct device_node *np, const char *con_id,
 	return desc;
 }
 
-/**
- * of_parse_own_gpio() - Get a GPIO hog descriptor, names and flags for GPIO API
- * @np:		device node to get GPIO from
- * @chip:	GPIO chip whose hog is parsed
- * @idx:	Index of the GPIO to parse
- * @name:	GPIO line name
- * @lflags:	bitmask of gpio_lookup_flags GPIO_* values - returned from
- *		of_find_gpio() or of_parse_own_gpio()
- * @dflags:	gpiod_flags - optional GPIO initialization flags
- *
- * Returns:
- * GPIO descriptor to use with Linux GPIO API, or one of the errno
- * value on the error condition.
- */
-static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
-					   struct gpio_chip *chip,
-					   unsigned int idx, const char **name,
-					   unsigned long *lflags,
-					   enum gpiod_flags *dflags)
+int of_gpiochip_get_lflags(struct gpio_chip *chip,
+			   struct of_phandle_args *gpiospec,
+			   unsigned long *lflags)
 {
-	struct device_node *chip_np;
 	enum of_gpio_flags xlate_flags;
-	struct of_phandle_args gpiospec;
 	struct gpio_desc *desc;
-	unsigned int i;
-	u32 tmp;
-	int ret;
-
-	chip_np = dev_of_node(&chip->gpiodev->dev);
-	if (!chip_np)
-		return ERR_PTR(-EINVAL);
-
-	xlate_flags = 0;
-	*lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
-	*dflags = GPIOD_ASIS;
-
-	ret = of_property_read_u32(chip_np, "#gpio-cells", &tmp);
-	if (ret)
-		return ERR_PTR(ret);
-
-	gpiospec.np = chip_np;
-	gpiospec.args_count = tmp;
 
-	for (i = 0; i < tmp; i++) {
-		ret = of_property_read_u32_index(np, "gpios", idx * tmp + i,
-						 &gpiospec.args[i]);
-		if (ret)
-			return ERR_PTR(ret);
-	}
-
-	desc = of_xlate_and_get_gpiod_flags(chip, &gpiospec, &xlate_flags);
+	desc = of_xlate_and_get_gpiod_flags(chip, gpiospec, &xlate_flags);
 	if (IS_ERR(desc))
-		return desc;
+		return PTR_ERR(desc);
 
 	*lflags = of_convert_gpio_flags(xlate_flags);
 
-	if (of_property_read_bool(np, "input"))
-		*dflags |= GPIOD_IN;
-	else if (of_property_read_bool(np, "output-low"))
-		*dflags |= GPIOD_OUT_LOW;
-	else if (of_property_read_bool(np, "output-high"))
-		*dflags |= GPIOD_OUT_HIGH;
-	else {
-		pr_warn("GPIO line %d (%pOFn): no hogging state specified, bailing out\n",
-			desc_to_gpio(desc), np);
-		return ERR_PTR(-EINVAL);
-	}
-
-	if (name && of_property_read_string(np, "line-name", name))
-		*name = np->name;
-
-	return desc;
-}
-
-/**
- * of_gpiochip_add_hog - Add all hogs in a hog device node
- * @chip:	gpio chip to act on
- * @hog:	device node describing the hogs
- *
- * Returns:
- * 0 on success, or negative errno on failure.
- */
-static int of_gpiochip_add_hog(struct gpio_chip *chip, struct device_node *hog)
-{
-	enum gpiod_flags dflags;
-	struct gpio_desc *desc;
-	unsigned long lflags;
-	const char *name;
-	unsigned int i;
-	int ret;
-
-	for (i = 0;; i++) {
-		desc = of_parse_own_gpio(hog, chip, i, &name, &lflags, &dflags);
-		if (IS_ERR(desc))
-			break;
-
-		ret = gpiod_hog(desc, name, lflags, dflags);
-		if (ret < 0)
-			return ret;
-
-#ifdef CONFIG_OF_DYNAMIC
-		WRITE_ONCE(desc->hog, hog);
-#endif
-	}
-
-	return 0;
-}
-
-/**
- * of_gpiochip_scan_gpios - Scan gpio-controller for gpio definitions
- * @chip:	gpio chip to act on
- *
- * This is only used by of_gpiochip_add to request/set GPIO initial
- * configuration.
- *
- * Returns:
- * 0 on success, or negative errno on failure.
- */
-static int of_gpiochip_scan_gpios(struct gpio_chip *chip)
-{
-	int ret;
-
-	for_each_available_child_of_node_scoped(dev_of_node(&chip->gpiodev->dev), np) {
-		if (!of_property_read_bool(np, "gpio-hog"))
-			continue;
-
-		ret = of_gpiochip_add_hog(chip, np);
-		if (ret < 0)
-			return ret;
-
-		of_node_set_flag(np, OF_POPULATED);
-	}
-
 	return 0;
 }
 
@@ -922,7 +802,7 @@ static int of_gpio_notify(struct notifier_block *nb, unsigned long action,
 		if (!gdev)
 			return NOTIFY_DONE;	/* not for us */
 
-		ret = of_gpiochip_add_hog(gpio_device_get_chip(gdev), rd->dn);
+		ret = gpiochip_add_hog(gpio_device_get_chip(gdev), of_fwnode_handle(rd->dn));
 		if (ret < 0) {
 			pr_err("%s: failed to add hogs for %pOF\n", __func__,
 			       rd->dn);
@@ -1201,9 +1081,10 @@ int of_gpiochip_add(struct gpio_chip *chip)
 
 	of_node_get(np);
 
-	ret = of_gpiochip_scan_gpios(chip);
-	if (ret)
-		of_node_put(np);
+	for_each_available_child_of_node_scoped(np, child) {
+		if (of_property_read_bool(child, "gpio-hog"))
+			of_node_set_flag(child, OF_POPULATED);
+	}
 
 	return ret;
 }
diff --git a/drivers/gpio/gpiolib-of.h b/drivers/gpio/gpiolib-of.h
index 2257f7a498a10d69980f0c8afd48d5b661632d87..f864597baaede1e601fc999514c129750c2a8317 100644
--- a/drivers/gpio/gpiolib-of.h
+++ b/drivers/gpio/gpiolib-of.h
@@ -24,6 +24,9 @@ int of_gpiochip_add(struct gpio_chip *gc);
 void of_gpiochip_remove(struct gpio_chip *gc);
 bool of_gpiochip_instance_match(struct gpio_chip *gc, unsigned int index);
 int of_gpio_count(const struct fwnode_handle *fwnode, const char *con_id);
+int of_gpiochip_get_lflags(struct gpio_chip *chip,
+			   struct of_phandle_args *gpiospec,
+			   unsigned long *lflags);
 #else
 static inline struct gpio_desc *of_find_gpio(struct device_node *np,
 					     const char *con_id,
@@ -44,6 +47,12 @@ static inline int of_gpio_count(const struct fwnode_handle *fwnode,
 {
 	return 0;
 }
+static inline int of_gpiochip_get_lflags(struct gpio_chip *chip,
+					 struct of_phandle_args *gpiospec,
+					 unsigned long *lflags)
+{
+	return -ENOENT;
+}
 #endif /* CONFIG_OF_GPIO */
 
 extern struct notifier_block gpio_of_notifier;
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 581d00c128b608c30f45c12e968c15628e205870..be2e6ed0e744c23939491717a060d3a8456c842b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -948,7 +948,7 @@ static void gpiochip_machine_hog(struct gpio_chip *gc, struct gpiod_hog *hog)
 			  __func__, gc->label, hog->chip_hwnum, rv);
 }
 
-static void machine_gpiochip_add(struct gpio_chip *gc)
+static void gpiochip_machine_hog_lines(struct gpio_chip *gc)
 {
 	struct gpiod_hog *hog;
 
@@ -960,6 +960,100 @@ static void machine_gpiochip_add(struct gpio_chip *gc)
 	}
 }
 
+int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
+{
+	struct fwnode_handle *gc_node = dev_fwnode(&gc->gpiodev->dev);
+	struct of_phandle_args gpiospec;
+	enum gpiod_flags dflags;
+	struct gpio_desc *desc;
+	unsigned long lflags;
+	const char *name;
+	int ret, argc;
+	u32 gpios[3]; /* We support up to three-cell bindings. */
+	u32 cells;
+
+	lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
+	dflags = GPIOD_ASIS;
+	name = NULL;
+
+	argc = fwnode_property_count_u32(fwnode, "gpios");
+	if (argc < 0)
+		return ret;
+	if (argc > 3)
+		return -EINVAL;
+
+	ret = fwnode_property_read_u32_array(fwnode, "gpios", gpios, argc);
+	if (ret < 0)
+		return ret;
+
+	if (is_of_node(fwnode)) {
+		/*
+		 * OF-nodes need some additional special handling for
+		 * translating of devicetree flags.
+		 */
+		ret = fwnode_property_read_u32(gc_node, "#gpio-cells", &cells);
+		if (ret)
+			return ret;
+		if (cells && argc != cells)
+			return -EINVAL;
+
+		memset(&gpiospec, 0, sizeof(gpiospec));
+		gpiospec.np = to_of_node(fwnode);
+		gpiospec.args_count = argc;
+		memcpy(&gpiospec.args, gpios, argc * sizeof(u32));
+
+		ret = of_gpiochip_get_lflags(gc, &gpiospec, &lflags);
+		if (ret)
+			return ret;
+	} else {
+		/*
+		 * GPIO_ACTIVE_LOW is currently the only lookup flag
+		 * supported for non-OF firmware nodes.
+		 */
+		if (gpios[1])
+			lflags |= GPIO_ACTIVE_LOW;
+	}
+
+	if (fwnode_property_present(fwnode, "input"))
+		dflags |= GPIOD_IN;
+	else if (fwnode_property_present(fwnode, "output-low"))
+		dflags |= GPIOD_OUT_LOW;
+	else if (fwnode_property_present(fwnode, "output-high"))
+		dflags |= GPIOD_OUT_HIGH;
+	else
+		return -EINVAL;
+
+	fwnode_property_read_string(fwnode, "line-name", &name);
+
+	desc = gpiochip_get_desc(gc, gpios[0]);
+	if (IS_ERR(desc))
+		return PTR_ERR(desc);
+
+	ret = gpiod_hog(desc, name, lflags, dflags);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int gpiochip_hog_lines(struct gpio_chip *gc)
+{
+	int ret;
+
+	device_for_each_child_node_scoped(&gc->gpiodev->dev, fwnode) {
+		if (!fwnode_property_present(fwnode, "gpio-hog"))
+			continue;
+
+		ret = gpiochip_add_hog(gc, fwnode);
+		if (ret)
+			return ret;
+	}
+
+	gpiochip_machine_hog_lines(gc);
+
+	return 0;
+}
+
 static void gpiochip_setup_devs(void)
 {
 	struct gpio_device *gdev;
@@ -1209,7 +1303,9 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 
 	acpi_gpiochip_add(gc);
 
-	machine_gpiochip_add(gc);
+	ret = gpiochip_hog_lines(gc);
+	if (ret)
+		goto err_remove_of_chip;
 
 	ret = gpiochip_irqchip_init_valid_mask(gc);
 	if (ret)
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 8d1a762f9d11bfc29c9102be02d7b640aa7daad3..dc4cb61a93187659d943f4ce3622bc1755e9fd42 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -23,6 +23,8 @@
 
 #define GPIOCHIP_NAME	"gpiochip"
 
+struct fwnode_handle;
+
 /**
  * struct gpio_device - internal state container for GPIO devices
  * @dev: the GPIO device struct
@@ -274,6 +276,7 @@ int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
 int gpio_set_debounce_timeout(struct gpio_desc *desc, unsigned int debounce);
 int gpiod_hog(struct gpio_desc *desc, const char *name,
 		unsigned long lflags, enum gpiod_flags dflags);
+int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode);
 int gpiochip_get_ngpios(struct gpio_chip *gc, struct device *dev);
 struct gpio_desc *gpiochip_get_desc(struct gpio_chip *gc, unsigned int hwnum);
 const char *gpiod_get_label(struct gpio_desc *desc);

-- 
2.47.3


