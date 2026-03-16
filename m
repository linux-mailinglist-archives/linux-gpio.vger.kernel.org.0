Return-Path: <linux-gpio+bounces-33483-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPt5COPNt2mDVgEAu9opvQ
	(envelope-from <linux-gpio+bounces-33483-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:31:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0956529707D
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:31:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3BDE33006780
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9914382370;
	Mon, 16 Mar 2026 09:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zo9lZgsf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LNo0VDGm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D342F2914
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653467; cv=none; b=qcCCsvZWGlh5SWccWm5zE4pviWezF+TXFuGzYmihE5QmGHJtbS4Rgy/VjWpqKpNMYQoPujEj0OJTtKOVcCC82xNYSOwpRBsOk1SXJSTfOtEQkH2tJmoOqMopAVGVQk84Q3t3YtDANYnDYLDRW0/LWCFgqyMFAvX5O1m9oXqu2Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653467; c=relaxed/simple;
	bh=XQDYYF98bQyZOpRMtoW5hQ3pUGJN+8XjPssWOvw/Yn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WJYDQ9LrEkc3CRKWqW0maDY5BKNKxl/cJDUTSEd5MiAJmC4JvdZ2PlFgeRBrMFIH2XusUOE21AgpN8UCDyJ05xggM1XYH1Sjc3b3EO8KCK3CS0ZR9CPTBPiEsSWXCfnQyT1Kn/slVSWQ6Mfpanax8dN9uOYstzFizq4QsDnVKSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zo9lZgsf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LNo0VDGm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64dZQ2583317
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q9WfWRDp14ESXJWEsXGDBNB87cy6DXhZrqwRwnaV2l4=; b=Zo9lZgsfa1rwaAXk
	wEFnRh3U4u9vvdmrmumak7GW/kj6FqTTp0gf09zqKozGJmdhpC9rm9qfsDRdb8xZ
	yEZF1hCCDrMpCxUUaFmWP6SDoZ2LBAXQgbwP0gGrSJsHri9CiHyjsFMycLTKB8w5
	/nLvXjmCwxXi4D3n4jsSayBmrs0OKZLmXlfYuV4vgQvJphFEhauZ62wSReQ7hURE
	PcUyxV0BZVc7WNFb2fazzKmy/Yh/SkiNJju6qQtH/uxRX8BWoH5eV7yHOcwiyvNI
	6xdLWb5+AUjpUWH/Fm2eP6NTWRQ82DczW4xaf31RKIzMrKSk6kesfigqXitYRO8o
	cAqxZQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0eccxpw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:31:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509181cc6ebso55851821cf.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 02:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773653464; x=1774258264; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q9WfWRDp14ESXJWEsXGDBNB87cy6DXhZrqwRwnaV2l4=;
        b=LNo0VDGm77KDCfemVjl3h+XWbiNGsKI9brwn2n4PBXCJ30W9X5r45urDIQ8S4IyrP3
         pEPXZpRejMImqf70XGKxEWh4lJcXIAlKvd+IBsa5N55BHjcrvxHmjZ70bkmjtftpAU6i
         OpB2EDoIglKhRQ2LllZRlDGBYHCOJ8WSlllUe60f/dGmX4u4CljgtZ1ba+bmgypie9uT
         6YvHNKwvffhFjoXXyQ7cpHNk756TY3QYWST/9CXE0KaU/JgDKynUf7otMNmNMUUP/6gY
         EMseQUo5OaYz7rVzrh+TBl0Q25A5jI8EnsPcEzkyiOeNJBgflZ422loRmf9CtQlO0ZKf
         D6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653464; x=1774258264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q9WfWRDp14ESXJWEsXGDBNB87cy6DXhZrqwRwnaV2l4=;
        b=gIuyB2WPpJ33IYum+tToOzX/smR5ymJnfcezLoH1tLQyMhJgo8f2CDyK3BqpEYlgbJ
         I2N0xfnxURPvW46iz/m2l+P+dpx+yz3BJx+YsnVXMatEZzXg6Rz52GEfYmcBCPp8hLvx
         kuzNtTLp4zwmFH77Tw6aNZC7TA1tomX0qJNiUmyyPxbliJSc5bEHPPYkxPPOS9IcK93+
         RhK5HyTX7srbfiMpVlbYN/E3svHld2EN/ICLX2LutbfBD258efXiHcu3mPavsU05fsGD
         5dT5/sdZFjaKNQBuyL40UhFFGdAwr52jeyRqE4AF3ZXkqYKKdxMSPcpGRiFzubu10Vxk
         eP1A==
X-Forwarded-Encrypted: i=1; AJvYcCUsOWPtW8hGlKSfmm5DsXMg8A/e897NxVdS5mbe275aRbmxahP1m4LJA2P3AUvlVSO2UEY11bsZj8QK@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2vjVxVdgVhh88eWogXFP31kerpXQDwc/OlKXqYyo4J7avqdI7
	hRCcxsyEHqMMPVLRiDL7BuIy8vdtGJLkMT+mvl7EVVxSYzMEZZzT4wW5iGFPa8qQZr/B6GOwfG5
	nhmGAlmOO5Yn44wwRtkOdrBP30cRDAKXLvCWQwfCpbl4dk/xmkbOZ6mheS1tXCRsCG4Y66LDI
X-Gm-Gg: ATEYQzxd1zk5fFi3Utut7mmuaGL2I6GxaEtB5+qX28oIlm8FpXk8LxQMcZhkkxTbAvC
	X58lASeUumO91QlNg1OxaAtcTPQYZ0Tgu5qjM9QDmaJtrhExQQnTAWFMhJShhpQG5DSGqD4KiA/
	jS6GEW8sZOXArCbrmJgu6tIY4Nd88TQK/fXTCiRdjOLHxlJstdC6HEW2YQcgmmWd6xH67oWAH2I
	Yy6ECEiGyOlmq4SIfh2JAm2uUkTWtwFGqjxlAZaJeUt40rm+0jrbij+4RYYWlu4hifep6OV83Mw
	pejwX5Z75CFGdZ8gVAp8kYqSEDwGFp03kr5amnuVIkosX/YgB3hO1G8QOlEJsp/N0WLYHXHgcfu
	Gaxkp8nFvbvG689cPUykBqlzjYm/d4gQJ3PKlNzyAZ3P5yMufRwQq
X-Received: by 2002:a05:622a:84:b0:509:3f5d:4f9c with SMTP id d75a77b69052e-50957cb5ac4mr159234531cf.15.1773653464343;
        Mon, 16 Mar 2026 02:31:04 -0700 (PDT)
X-Received: by 2002:a05:622a:84:b0:509:3f5d:4f9c with SMTP id d75a77b69052e-50957cb5ac4mr159234211cf.15.1773653463852;
        Mon, 16 Mar 2026 02:31:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19b936sm43930688f8f.5.2026.03.16.02.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:31:03 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:30:48 +0100
Subject: [PATCH v2 1/3] mfd: timberdale: set up a software node for the
 GPIO cell
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-gpio-timberdale-swnode-v2-1-ea0078066871@oss.qualcomm.com>
References: <20260316-gpio-timberdale-swnode-v2-0-ea0078066871@oss.qualcomm.com>
In-Reply-To: <20260316-gpio-timberdale-swnode-v2-0-ea0078066871@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2300;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=XQDYYF98bQyZOpRMtoW5hQ3pUGJN+8XjPssWOvw/Yn4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt83QfzFL+7cpQ12ziLg+wZMzt2QGHiSFfhTn2
 WU95mwuc6uJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfN0AAKCRAFnS7L/zaE
 w2tDD/0Wai5G75EadztT2nceaaIFBn+5Tf4psjoTnnfwzs8twrkYLk5fQJmS92OZi3XzyqN2+OW
 9oW66xdvY452h7bNbFCgIDx+8WZ8QXT5Wdr2XN3bnx/8QrpqLP5ksh5KaDb0H0YVxfwc0zfREK7
 sHxjvdDHoKm3zjSJ0tg3RobaxQPC+DLU4q7fMsXmxZccQxCbhgZaJZf0BHMwfnBQrlGWb+W+Ax5
 RU6h4kGZbNCwaqKKeuJyUbhgdCQayu8FkmmUKUs1vwbflRlWL3VwVq7e+90aMkgsRdhRBQLkLCN
 cnhQu0ZZbeNjRpXQBg8qeG4+roiZhmhds7SLgLoZQf7o+XrUbOCqhWGpwSXQmcrFzAFJCqRNRaN
 AF6z3asFjKLXys3RPK0SP159iqb+6f7NPT2UXyG3TKFCz8o66Wa87d4mwPp5Dt7hZVVvd9jmV7k
 e+Ja6YcAFb+tWqU/gUJUwpxj2HSaJUMPZek1MzC8u5n/XNH33YHzTs8BgVWAFbfw41q88eXvulU
 2XkGqt5E4yPAtbkBfB6JA1A4W3M6wR+j9mG9oO9rxMOKpXRfneOWA8VmFtZmqurCz/6TQADmdU+
 k++f376Q+su8B3t/v1j0xefOXXooTtnCQ7CCi/WKdMK7AGNe7ghevW6DFxuCaJ50XJrZg1kcSwO
 qtgB08mMIGUV8Gg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 94D-dk9RB43lIxC_9WBZGT_rbx78F4Nx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3MyBTYWx0ZWRfX9T0ezBsfi/IC
 NH2icr+om1ObcMQL7aX+6LE0sQzotMxRqOFKWy45yWhktnBYgIm/WdEZHuFkky+o1B8V6lxr+Tq
 dpeNIf9z2uLia/QGRRmpX7G0p6YOji5qRoWjHdTgp31BS6EIgOXFnIEosHUb/1g0I8hSteCrQv0
 ohWvNgN6hRgo1MgmOyqixczgPKDLsbXzLspkqvSC+h03mM4Lme84algSib3P4AcrE4+SyAPMEfg
 Jq3SrnNbZLKBrZcl7IrEn+ip+N/us0UYLwccstTdsVFjX9iLpJ4ktHlvfvOkaFICruU+mmTtqOn
 9m9oDJKg7w6qjg7S2TukG1pK3gvL3GsEFq+Lco/Rt1OauawHd7H3CHprSTt5+X+u9NUNUQSi2tD
 1AYqRrtixZPuWpsCJZBbtuy5otg03cBN0keJm3FPFFGZoWIcV/O9cghiXn1/8URQ5NfgkXnFavk
 nu1QUglma8tnSLj6W1Q==
X-Proofpoint-ORIG-GUID: 94D-dk9RB43lIxC_9WBZGT_rbx78F4Nx
X-Authority-Analysis: v=2.4 cv=BqqQAIX5 c=1 sm=1 tr=0 ts=69b7cdd9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=-0TENUa2BJN2KAeZntwA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160073
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33483-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 0956529707D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Create a software node with device properties for the GPIO cell and
attach it to all the GPIO cells.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/mfd/timberdale.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/mfd/timberdale.c b/drivers/mfd/timberdale.c
index a4d9c070d481a182890a58e4b8c850c4c29f7f17..8d7dfeaa76258d02e50528e39c4f7125d9201388 100644
--- a/drivers/mfd/timberdale.c
+++ b/drivers/mfd/timberdale.c
@@ -181,6 +181,18 @@ static struct timbgpio_platform_data
 	.irq_base = 200,
 };
 
+static const struct property_entry timberdale_gpio_properties[] = {
+	PROPERTY_ENTRY_U32("ngpios", GPIO_NR_PINS),
+	PROPERTY_ENTRY_U32("gpio-base", 0),
+	PROPERTY_ENTRY_U32("irq-base", 200),
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


