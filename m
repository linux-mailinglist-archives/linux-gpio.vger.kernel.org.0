Return-Path: <linux-gpio+bounces-33326-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMSpLzjis2ktcQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33326-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 11:08:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 62109281219
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 11:08:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9646F301D05F
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 10:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2D9138C400;
	Fri, 13 Mar 2026 10:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EMNFS5JH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="js3ljnDJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB4738BF6E
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 10:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773396309; cv=none; b=Le+eRwka7nB4NkBDPAdWfgKKBaVugEzm9s5924MNKEyjowzP/7NhSM+3DPBDHzfY97DuAt/Og8ZqUgFRVeqUEbkbdDi5mDunA53tcbpQbTKBS3gq/YYD9Ct+jUFoS3EiV8G9ray96OKjCKtZX5R0WSnXmaNg6K9Y3P14zoKwCsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773396309; c=relaxed/simple;
	bh=lKXOevRjUeTHp1K+VsoO8kLQA8YHlm6NMMbtBqxTy4I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P3ZQ9KockCQN9AvKuk0MmtHOPdwANq6KRynRcfdfa8dfXZCzGs+6gYVCgk0iH/IE79IN+fp5XJd6XJaeAAHrkdxHD94ihAq5gWDUXFh58JXxqtvQ/9Xm8QTXHaiROyHiE0VNhViL4x8UyUC+9TsxsLyWlVYIg/AHzIaypk5taZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EMNFS5JH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=js3ljnDJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tZb03229787
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 10:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PrUXit2bRtP69P5Vbs8fMIieANyGdPXS5MhLpPCipIY=; b=EMNFS5JHXDNtO2IS
	dkK7SHDGEUSH5jlAFE1ohzy8LGDe3g5nnMSv3o9zSBvRo0xeAKzEROcjVa/YG06g
	jfd+LeQ4vKIXDmwtEMUYZ1LbwXqO74Y2R0JV0W+N9Kq+2+5rYrL5wHUyD/iteCXQ
	fHV+Z84hvThbQamTkj7E3NYjduQJHqiVVV920z3tFoPR5GJeDy/jLQgpKZncSIO4
	m4uDS9x/JutfObf/JOtgbCLwvDaFk2a/to555NOl8th4PvjljH7dobx71XITkhpd
	23fC7KRra7Y6tZvLjBYCWz0i/utJEwkBq74I4uxMFGtjaBsgOswAU+d3PRzwhrTq
	tPGaXg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cv8n7hnhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 10:05:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd81506677so1178727685a.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 03:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773396304; x=1774001104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PrUXit2bRtP69P5Vbs8fMIieANyGdPXS5MhLpPCipIY=;
        b=js3ljnDJV6/szdr3i8VDkfaPr/lnPfKcfFDV5nZ4IHyI/C9CUuL9F/SOXCs5pUwcEs
         SUoOIWc/33PjLRPmJZUvtC7V9VpKcHZXe5JImmDlFdmPM9Ts8JI+dC4H2iQYm3q+cpco
         9TpieaYOQnM6F+XBG8FqFiGX88b1/TuSC3A9SPAcL+LYx67DKbBmJeQtHbjyvP2vZubd
         cY7dALSLADAtk+oMCJIkPqOopeSLhM1LCFcUmvkwHHKYsCefyZq/pBhG7PH2lwkjblSm
         wFU7l3E5AFnM6SfVOAgEdfZLJ1GTB98IX+IWBF6KBo1XgBIhgNL6d488y4+W6VM/zlwH
         ho0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773396304; x=1774001104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PrUXit2bRtP69P5Vbs8fMIieANyGdPXS5MhLpPCipIY=;
        b=nYNd3pH9TeUf/MeReYJN1dZDGKIU03o8PkjfhRilelP2tmzE73vFcZXr6l8E5+xJkS
         SLtTHCVqm6oMmZqYe++HeNIedqwnaQ+rJTwc3TshCzmqgTgUmSHlkMLshHcuRfJSt3Mf
         Zg7gdW6MjlzqHHgK8/BR/7FaxdfB/Of24os0cf7/81pDXDh/eTCf6tWTSN+cS8cLndRG
         57VFvc/jhCqWZt5UZKDfYt/1yJe64Eu3tDcmsJ7/rn+dFw0T78Nn4UaG4eMTOF9XLs2W
         7+bnNMUPO76jEFOZv71Sku6IrzVQK5mPWme5laxxBCdmSdin6M3o8Fkk4nagOy5DUGhd
         Ao6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW2ollvP8DX/maWiXslZvLOGLODt2AqRULsJdIx6bD8DSDdPZnrfgmJUJaW5vJ/jWbZplPHNx72CeuS@vger.kernel.org
X-Gm-Message-State: AOJu0YyLiki5tWd22TZi8eIY0K9p8dJEbLtscAkF96vk2Z4rQTK37XRH
	j6U0sDGOOkNGRhtcoK/wq6QT5+78eVoS0Vq07xq07lBo4zOuphrLMSrMaLSlNY0HIlqqHA0KtU0
	ZuOkajXsU8/r1D6qANGpJ/Xj+0tQH1r1sD7q+ya41kIJK3LKFjyJLsSawBZu0NeOA
X-Gm-Gg: ATEYQzz2mVinssB49nSh5zMsGA+u4vCqF5MnTJqHlGYl3s5atAmRg82jG5b3enEkr+T
	NnKYTdAEMmP9A5S2A5r/eN8z5yNygMaeQopyFXT7AgcMIdXjRDy6jjYeOnexVyvDSEfREXQfYjD
	OhmlLpzkEVeLGS9cI9pftbqxJdANdBkrf7qK3SaPM0ZnqhNsYTy9HK2Ymwq3CeG7l/tN8UAjpgj
	xVEWlRGT9KCC9d37NQbChZoaUSiHLl+8Du+DFb/tnb1iv0D27q94uZE5E6LTbGzg/UuxvY936Br
	AjU9PBNbIjGH+R387cvjchsRB3INYh9fcziGGekuSUub2jTj0RJXsqyaNVSueVjUHAHzB8ta67J
	LWT0yjNTo8DehRTZQua1kq9UnV/fWx3BtTwStLiWXFcBIJphczzcx
X-Received: by 2002:a05:620a:2910:b0:8cd:94da:433f with SMTP id af79cd13be357-8cdb5b5fc6cmr344624385a.48.1773396303971;
        Fri, 13 Mar 2026 03:05:03 -0700 (PDT)
X-Received: by 2002:a05:620a:2910:b0:8cd:94da:433f with SMTP id af79cd13be357-8cdb5b5fc6cmr344620785a.48.1773396303492;
        Fri, 13 Mar 2026 03:05:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:840f:d4e5:5fc0:62f6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5e9179sm194215785e9.3.2026.03.13.03.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 03:05:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 11:04:48 +0100
Subject: [PATCH 1/3] mfd: timberdale: set up a software node for the GPIO
 cell
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-gpio-timberdale-swnode-v1-1-4df2e9b1dab5@oss.qualcomm.com>
References: <20260313-gpio-timberdale-swnode-v1-0-4df2e9b1dab5@oss.qualcomm.com>
In-Reply-To: <20260313-gpio-timberdale-swnode-v1-0-4df2e9b1dab5@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2312;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=lKXOevRjUeTHp1K+VsoO8kLQA8YHlm6NMMbtBqxTy4I=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBps+FIXhavSC2C63xO/L8+VYKrGe+sdqUuao3G5
 DAD6F/PJUeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabPhSAAKCRAFnS7L/zaE
 w5lbD/44BzjGuNdb1dcrGfeNbXRhtOC29hPzanXNycDFUuzDx6gBgmzW3f2sOqYczuqbv0CFmaX
 FTVth+WZ94coV4lfnWofS3n27sjTwkBKpKlT4Jkh+DkC7lOczo+mqvLgdrniMISV73Io9p+peVf
 lsQHaqXHMLEMonGONM6QRZeqeX0o6Kkq4dGXoxdyPwH9lxFAuHfey3vOSpG+ZOoOsUu9+36nDEB
 EFCpxTnKwp/bMWEE5P0fN3HbpdQZndsjp6kjLzqFKKUkxMDzYfHcx1xtYJ3YaUr8UZTFAe1oep/
 usHU1VFEdZXKIjxYnBhumy2CNAui0CywQNhxfKD6e7/nWBfzBbT+UUC1mJJ0rtjlvmVUQK+vwuG
 5f+fr+PuSfIVJ0X2FQvlUvjHmibJ4bZeKL5Ebx6QvRqgS4IgMvBJHkYxL7cvGBBVUfRCq7XN5Xp
 fbTjXAhrpmdgZZ42y1YuxkxCgjS9+4CcvQud7OAkzaOcpxYAIsWn7xwmjLchiP/QbRD176YTAo+
 mi8FB5FKh4vfdI/bmOk54Tvna6RR1+iTDt1ZureJ7J2RP+2I4cLQuL5T24xIGafENh2vuQSuaof
 00IYuj0gGWPnMzyhZVXsyNGWv1pqk3Y6VGHyciVF4iT13wh32fcMluNMYqzrB6/Q7HNDse3dsY6
 +X4/qo3Xai//oBw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: PYlp8BW0u41RPSOzx5iFeqaNWV0SydKH
X-Proofpoint-GUID: PYlp8BW0u41RPSOzx5iFeqaNWV0SydKH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA3NSBTYWx0ZWRfX1HkD4kTQI0g9
 VZaqIMk4ezjaDpiVv+JTbYcoVbtUPtNV+SCydV9Kpnv0QQMX5F1RkTvoBH4rXBtsx6Zu7v1OSXA
 XLgyvpCjRjB0ERzOlR0Lm0zqf8vQXYyURvqlLvO6DcQR8JHBnMbRuDJAE3dqZ/MOX++rt4LIFX8
 +LIXvYuFGE7GKQgPyrlju6PJ9OyqTz+T++5l+xI7hdSoskXmn3fIxz/O82hgqAhHvhAwfTTgb8O
 sSWdGdgp8D1oTSffMTlTXTK5VVj31GpAse6AB/XKuR+R1xYak9vlIPVU1w7/YP5O8ltOMfC6a+V
 JctQzAVWFZezquEn041ssO7ViKmuV5l4W3NRSRrjCAhZEumer69iiUOiYPSRp4iM+2VJ1fo6oRH
 ENwyWBEWPOwe7aX1e13VqeXn24Bo64lKFoIXJTdP1wZDcDKZ1Zcz02E+rdcQb7wAKvZGP/aTIhy
 MKrijMqoadB6u429ldw==
X-Authority-Analysis: v=2.4 cv=CpCys34D c=1 sm=1 tr=0 ts=69b3e150 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=-0TENUa2BJN2KAeZntwA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33326-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 62109281219
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Create a software node with device properties for the GPIO cell and
attach it to all the GPIO cells.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/mfd/timberdale.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/mfd/timberdale.c b/drivers/mfd/timberdale.c
index a4d9c070d481a182890a58e4b8c850c4c29f7f17..2d76b6b58f9fa9a6f8b1b96d143d6724f3cd503d 100644
--- a/drivers/mfd/timberdale.c
+++ b/drivers/mfd/timberdale.c
@@ -181,6 +181,18 @@ static struct timbgpio_platform_data
 	.irq_base = 200,
 };
 
+static const struct property_entry timberdale_gpio_properties[] = {
+	PROPERTY_ENTRY_U32("ngpios", GPIO_NR_PINS),
+	PROPERTY_ENTRY_U32("intel,gpio-base", 0),
+	PROPERTY_ENTRY_U32("intel,irq-base", 200),
+	{ }
+};
+
+static const struct software_node timberdale_gpio_swnode = {
+	.name = "timb-gpio",
+	.properties = timberdale_gpio_properties,
+};
+
 static const struct resource timberdale_gpio_resources[] = {
 	{
 		.start	= GPIOOFFSET,
@@ -392,6 +404,7 @@ static const struct mfd_cell timberdale_cells_bar0_cfg0[] = {
 		.resources = timberdale_gpio_resources,
 		.platform_data = &timberdale_gpio_platform_data,
 		.pdata_size = sizeof(timberdale_gpio_platform_data),
+		.swnode = &timberdale_gpio_swnode,
 	},
 	{
 		.name = "timb-video",
@@ -454,6 +467,7 @@ static const struct mfd_cell timberdale_cells_bar0_cfg1[] = {
 		.resources = timberdale_gpio_resources,
 		.platform_data = &timberdale_gpio_platform_data,
 		.pdata_size = sizeof(timberdale_gpio_platform_data),
+		.swnode = &timberdale_gpio_swnode,
 	},
 	{
 		.name = "timb-mlogicore",
@@ -516,6 +530,7 @@ static const struct mfd_cell timberdale_cells_bar0_cfg2[] = {
 		.resources = timberdale_gpio_resources,
 		.platform_data = &timberdale_gpio_platform_data,
 		.pdata_size = sizeof(timberdale_gpio_platform_data),
+		.swnode = &timberdale_gpio_swnode,
 	},
 	{
 		.name = "timb-video",
@@ -566,6 +581,7 @@ static const struct mfd_cell timberdale_cells_bar0_cfg3[] = {
 		.resources = timberdale_gpio_resources,
 		.platform_data = &timberdale_gpio_platform_data,
 		.pdata_size = sizeof(timberdale_gpio_platform_data),
+		.swnode = &timberdale_gpio_swnode,
 	},
 	{
 		.name = "timb-video",

-- 
2.47.3


