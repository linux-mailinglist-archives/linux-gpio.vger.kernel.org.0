Return-Path: <linux-gpio+bounces-34246-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CH5zOApdxmm+JAUAu9opvQ
	(envelope-from <linux-gpio+bounces-34246-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 11:33:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9693429BD
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 11:33:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2748D307ECF6
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 10:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 903C43BA223;
	Fri, 27 Mar 2026 10:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pYDhOn8G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="COn68SCa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3793B5832
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 10:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607498; cv=none; b=N8ERYz8+1jf1NV2UBZLNo1E9luRIPXVBnedIU5Nuzw3OdJeG4hMVlWxFhoyd0pw5pOOXZa7usj4HyyBxLRHXU31EUCPnkoYNJYbRAjJ/V3N/9HdlT9OO7pF0KtGWhEK0V+juBDfv7p7lqQKkGvA7DAXpNl6wM+YHtIA2w/E8iLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607498; c=relaxed/simple;
	bh=q/vXhHDoFJqrdpA76UB07ULdvhJqcsq8Sba4mXCbT/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GGP2rQbcM/u5W5Rf7xsV1wymrYX4BnP86qXuUb9IwdcwLSqZJ7y2taeIPfyEzGF7y+/zDaBeRVeTTkx6VALswI5FHaSJMX9ADts+O7MIk9DPE+CkMrDyTUAcb19gtFq0t0d8hiHIhKnSozEyn5P8zJVBACDyE2GM9uhORr9ZIsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pYDhOn8G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=COn68SCa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6wwMG2846540
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 10:31:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3/k4engZPj/RiobDJAVbe81ltf6mEEKXLxF5f98ke8s=; b=pYDhOn8GWhyV8LJM
	Vc/eiIkKRgmp7Yzw0sgSZAwY3X5izJ0alPrl8oLLpd6hv0qZQ936ayM0R8gF3B0Y
	PyvJOf1uT7DtQmxl02puaAlIAUF1l1HV59J18O+DJW2vxj8Y/lRVUOa+xrH7+MZh
	FFL4+q6p+89bzUDVz9MZQMb4q4dG6CyVrAvROzP8Yf5k8Hb54Yn6fOMJ9enjv7OF
	Gnob3OuRIPaserW+nPHOkb0kbxBAEyOkp8RyVKRX70p3nXAfEmEs1SJkD7AP1rE0
	qxTko1xH5GYT0zXIzmatJr50Dd2pdYyvwJ1Sd4ZFrEIxnxsLIaJze2AsJIZXgbs9
	nEIupw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d53eqmmv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 10:31:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cfbeca17b2so793060585a.0
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 03:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774607495; x=1775212295; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3/k4engZPj/RiobDJAVbe81ltf6mEEKXLxF5f98ke8s=;
        b=COn68SCaGxHwUJ6ao52vv85WkKNAmSMivdIOZWlTrVNVBjIMaBknvbIxV8A2my9apl
         ypVXwqNhETuQ9BCpe5zAs8piS9Clpi/0pjLFyMvdgVxlokmblFhM+nvGMmEXt0E6a73/
         9LuKGWPRYvSO67IbpScehv+JdBM/1ul4EGBdV0XAnPbMpeKZUBfiSRRs04id0x0sCAmG
         3KkiKOqhtKigsdont41A8V5Yk8gAhugIe3X+/jUYFMJiH7eWwwi3uEDwbCDOVmrp9Ktl
         XVgQxzPV1jlOieJ/4mYTBGXLXbyCvJw3Hgf5CvleFP44pGuMVWwDLcM2O/upPbwX3Ixi
         Cm+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774607495; x=1775212295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3/k4engZPj/RiobDJAVbe81ltf6mEEKXLxF5f98ke8s=;
        b=Ryf150kNmt+gU8SQT5yyU9dNnHCPd7AlfcTcLidFk7/cigN1XiQRCg0Ef+LpKq2rpj
         z4GDF+u6MSQghmBOxyMDw1cJtxEg4kIBzZRIN35o7AOjoTWPOPz7OoPta7/B5KrQYefO
         ywPcvUoAOsbutjLDOj4UHi8B5JJL4HMFSkfkRFFIg17fbTzgCKGUIqdP/M93eOGOyrcj
         sn5k0g4glnMaIzfcmDdqIbMcmwoSXflnJiFAmLucvcSc7o39eClPoFMhVaIR7o8jls7n
         brnK4yAqlgjKKjQjpyyCGBmjE4eOPuceXPCGHUKdnZ+qJ9syQ1k07eV8QFplTZdCD0Zv
         4JWg==
X-Gm-Message-State: AOJu0YzsraExc9z3Xv9Z0UZVyznOE+gMB8E13J1mIU4k0QoXCVtxo3zm
	SyjaNLWdYL+ZD4PrDw0odsx3xCMdTAINc7t9yeHoEPI7afMfZmiR0PKNOi+tv39alYpOTm/jXbb
	7mUaV2maD11/B0XE60t+5kQHQ6aVHQKR1c4J2sZ3XgjXwvPnJWGo/wX12fkkDGE97
X-Gm-Gg: ATEYQzyD+ccJsjk5664T20r3nEGR5FSm6vUJmSSgysKVQo2ear3wcPHIt0kyZYnUhu1
	no/Zj/S7Ad97IFX41Agkl0cBE710gsGNCBMZq5isMheDAakBHNhncxb7WYe0aWyUh6xsuEP0lCJ
	p0psZdlZxZnGVCmsp+CaIb7KzrDnrMPQswDhIuEids/cZaPjKI9SHShu1R/B4Tl7wbwaBfwXjLX
	4mImNY7t4YTQLO2jD/yAIFD+ME+fcDoLiwLi9lKKdBCcUJ0zth8LqxhG9vbcABr4F/RkU8la6t+
	9zZt+YdKWoVoVp3Z8hPFcUycM3MvssBbGVT1gjsTkSRutI3FW86ezySH3oNjTyfEL0MqY2dZgSm
	zZt0x4T9vfC8Ej+BfgO+6ngM+e1Zy3jJsOjdupmIQ93MSCDgGheI=
X-Received: by 2002:a05:622a:14b:b0:509:144a:43bd with SMTP id d75a77b69052e-50b9938983bmr59466141cf.3.1774607494596;
        Fri, 27 Mar 2026 03:31:34 -0700 (PDT)
X-Received: by 2002:a05:622a:14b:b0:509:144a:43bd with SMTP id d75a77b69052e-50b9938983bmr59465761cf.3.1774607494087;
        Fri, 27 Mar 2026 03:31:34 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:94ec:a3a:baff:9151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919588e6sm13382138f8f.16.2026.03.27.03.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:31:33 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 11:31:13 +0100
Subject: [PATCH 3/4] gpio: virtuser: stop using dev-sync-probe
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-gpio-kill-dev-sync-probe-v1-3-efac254f1a1d@oss.qualcomm.com>
References: <20260327-gpio-kill-dev-sync-probe-v1-0-efac254f1a1d@oss.qualcomm.com>
In-Reply-To: <20260327-gpio-kill-dev-sync-probe-v1-0-efac254f1a1d@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3646;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=q/vXhHDoFJqrdpA76UB07ULdvhJqcsq8Sba4mXCbT/w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpxlx8ngUkGTup2/Q6rOFiB8rh7VNTI/rHOyn5Z
 ygK8SZ8qi6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacZcfAAKCRAFnS7L/zaE
 wzT4D/4vtUnZRLGALIT9cgohlC+n+TmdnZZ95emyzO3t+Vdm54HMUu4Mj553eFmFauAJ1PnrETX
 YPFPEnQNuQo3F9I54S48dP++uXRPmd35Ug2S1P9bZOz4B3QheCo21EnlSVIjPZjQjRtcctDOlqh
 fhe9y8qLaK4E9Ez2iekLGEhURDzTErhfShzAD49NRPcpPbOtYMrzGBaaLmV+KrnAFYSPIRAWmqx
 8KkNfYI1lMAeEjVc5tmfJJF5N3ouz0NVeNnYL1SxTVPO1GcJS4Gy51Hi73T/KTIjLc6D0ClNUrV
 soc31xfGiULvnISjRhSH2jduwutJBfmVdGP/LsOZ2FEDKpMl1kC17/k1oZseummCxGz9indWEw3
 th2hy8dBOPyko01U63hX1HFntoViGNORAFIEHo86BzT5l4fW0ig0c8Zkvd4Yh6zDdgJ1JdKiZxr
 uOeoq7gqMXDi4uW1MO6qq/W0L/wLmaTIsnUyNohE57i2Z6/D3HhZQKVy8Ww98BgOkVrbMV9M7GM
 hswxWGwnIq3EVVsTVnOfbjTejySYuVCgOlG5QBgsB6fUR0c4DOXTPLaFGUzCKvAcu5kwSU+c0Po
 QcUkDblbdKuHOqT94NNegxod7LCqgR/a/5Mb63p7EaV7BHyPvITW/0JzWBbkO8Y6ufLHCf7MbkG
 hUqfYaSf9ahbtDA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NiBTYWx0ZWRfX3PNPCN3Js99v
 +R6gBUcL7sbc3NHx5RGxtRGLA4vlt9N+gAnM63PPSkvIkKNxFENpjPHyvdLQjEVUVlg/QSsoC4V
 v0dC3S8+8EpZ7sPH7xxVEj7lzxJwCeNtJdCEUEz9CMzC8VYItV/OAnsHm4lmt+3sif5ZbPpneuT
 pChAXyYam+D39koVsj/pXdHuQk1Lb0AvY80fToH0oUUt+JOPvZe4waU8CQjX2HUfMW7OhK7lyQZ
 Oe536QiwR5qwjsq7cjiDQap73EOCFBLtYF+T0oOs7OiDuxh+whvS6iq31DTxeMkJjEbBQ/HpVl8
 9W5IRweHwcdXxx7Mk+8BrAV39p0X24oWB9iHWIpl0tWu4tOZ2pnbYHGND4dWlrLMtwhakBM0gPu
 C6kz/jxW4v6AFA3Ua1R0lr6KhfhA4Lgf7RUoBKDdwZmeKy4KkG+IMaS5A75+1xtGnZxAhkkcJJ6
 ummR8t1tV/4nsDT0fRQ==
X-Proofpoint-GUID: FCfzlyV3taBf-3qDaIgJvNatsEE_zPG-
X-Authority-Analysis: v=2.4 cv=S4bUAYsP c=1 sm=1 tr=0 ts=69c65c88 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=eBvw1o6kvFRJjbXN8kYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: FCfzlyV3taBf-3qDaIgJvNatsEE_zPG-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270076
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34246-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8F9693429BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

dev-err-probe is an overengineered solution to a simple problem. Use a
combination of wait_for_probe() and device_is_bound() to synchronously
wait for the platform device to probe.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/Kconfig         |  1 -
 drivers/gpio/gpio-virtuser.c | 30 ++++++++++++++++++++----------
 2 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 09db777938f3723e5dbd895dd1b30d39a21a2da1..56a7ddaa95eac07ee4f7b755335595805a316319 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -2072,7 +2072,6 @@ config GPIO_VIRTUSER
 	select DEBUG_FS
 	select CONFIGFS_FS
 	select IRQ_WORK
-	select DEV_SYNC_PROBE
 	help
 	  Say Y here to enable the configurable, configfs-based virtual GPIO
 	  consumer testing driver.
diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index 955b5efc283ef565f8c1cfcaccd6d653f2f78f19..fe0eac920ced323926b2bc83ca0a2eb5f85c2154 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -36,8 +36,6 @@
 #include <linux/string_helpers.h>
 #include <linux/types.h>
 
-#include "dev-sync-probe.h"
-
 #define GPIO_VIRTUSER_NAME_BUF_LEN 32
 
 static DEFINE_IDA(gpio_virtuser_ida);
@@ -978,7 +976,7 @@ static struct platform_driver gpio_virtuser_driver = {
 };
 
 struct gpio_virtuser_device {
-	struct dev_sync_probe_data probe_data;
+	struct platform_device *pdev;
 	struct config_group group;
 
 	int id;
@@ -1002,7 +1000,7 @@ gpio_virtuser_device_is_live(struct gpio_virtuser_device *dev)
 {
 	lockdep_assert_held(&dev->lock);
 
-	return !!dev->probe_data.pdev;
+	return !!dev->pdev;
 }
 
 struct gpio_virtuser_lookup {
@@ -1342,7 +1340,7 @@ gpio_virtuser_device_config_dev_name_show(struct config_item *item,
 
 	guard(mutex)(&dev->lock);
 
-	pdev = dev->probe_data.pdev;
+	pdev = dev->pdev;
 	if (pdev)
 		return sprintf(page, "%s\n", dev_name(&pdev->dev));
 
@@ -1450,6 +1448,7 @@ static int
 gpio_virtuser_device_activate(struct gpio_virtuser_device *dev)
 {
 	struct platform_device_info pdevinfo;
+	struct platform_device *pdev;
 	struct fwnode_handle *swnode;
 	int ret;
 
@@ -1471,12 +1470,23 @@ gpio_virtuser_device_activate(struct gpio_virtuser_device *dev)
 	if (ret)
 		goto err_remove_swnode;
 
-	ret = dev_sync_probe_register(&dev->probe_data, &pdevinfo);
-	if (ret)
+	pdev = platform_device_register_full(&pdevinfo);
+	if (IS_ERR(pdev)) {
+		ret = PTR_ERR(pdev);
 		goto err_remove_lookup_table;
+	}
+
+	wait_for_device_probe();
+	if (!device_is_bound(&pdev->dev)) {
+		ret = -ENXIO;
+		goto err_unregister_pdev;
+	}
 
+	dev->pdev = pdev;
 	return 0;
 
+err_unregister_pdev:
+	platform_device_unregister(pdev);
 err_remove_lookup_table:
 	gpio_virtuser_remove_lookup_table(dev);
 err_remove_swnode:
@@ -1492,8 +1502,9 @@ gpio_virtuser_device_deactivate(struct gpio_virtuser_device *dev)
 
 	lockdep_assert_held(&dev->lock);
 
-	swnode = dev_fwnode(&dev->probe_data.pdev->dev);
-	dev_sync_probe_unregister(&dev->probe_data);
+	swnode = dev_fwnode(&dev->pdev->dev);
+	platform_device_unregister(dev->pdev);
+	dev->pdev = NULL;
 	gpio_virtuser_remove_lookup_table(dev);
 	fwnode_remove_software_node(swnode);
 }
@@ -1723,7 +1734,6 @@ gpio_virtuser_config_make_device_group(struct config_group *group,
 				    &gpio_virtuser_device_config_group_type);
 	mutex_init(&dev->lock);
 	INIT_LIST_HEAD(&dev->lookup_list);
-	dev_sync_probe_init(&dev->probe_data);
 
 	return &no_free_ptr(dev)->group;
 }

-- 
2.47.3


