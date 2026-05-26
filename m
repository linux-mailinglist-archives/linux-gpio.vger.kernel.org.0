Return-Path: <linux-gpio+bounces-37521-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNDIECx8FWpEVwcAu9opvQ
	(envelope-from <linux-gpio+bounces-37521-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 12:55:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 005B05D4741
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 12:55:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B97DC303BDC5
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 10:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D843DEAC2;
	Tue, 26 May 2026 10:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nWeeqZ9S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KTarg6xW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EAD3DDDBB
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 10:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779792908; cv=none; b=dhSJKPw7Vlqa9NIONVc/QGSo+erAqmuueS1/FvvfBlZQamv5WHrA8OM3iAGOabasTQQXh+Pi1CbLFa7TkslrLdckFbEckIf82ipk7QqWmzOh+I3/90y0Xh0JHvGWCyP314VmxuwK5z2zBF15cLi0pWGMR0m+9AH02Hz1bKWLSyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779792908; c=relaxed/simple;
	bh=kqY2/29JmPgmBngXGrtrrO/2RA0kHcTl6eZfMoAFqhg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FifdKEgPHEyo0nRuQmbTnbDaQMdYRUfNXpqm6mfQ85LFtA4qtrInJW0PsHCz8SQE0Trpq6vTkPLONtj8WXpy8SE4lbMI8vN1dFrYN+zXDRWOQOjAjJi6cRHOw9ZqXa178nfmFK9TBrhE+EYvzikVqKmRmBe2CIH2K1bD2tHZ/5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nWeeqZ9S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KTarg6xW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q83JiR3603971
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 10:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N1w4IHhemxgCn36ZGjFLqCPIQy9ZIU2j0GMZhJdSgDw=; b=nWeeqZ9Shbj09XdP
	RkwO/5rg9YIRJv6LgRFCfDp8hi9qwX5BjCS6KYkNncdfPM1XT2rprdZOYLMjHJBL
	6HxJezi7qvXxmZ2WCyjg3NxhAe3oqNH4fFL3Vx4D1BD1vGMf2bXyTz73NcqL0X/B
	9IMmbQt+IFo7qE+SWYRs/ktQLMafIgjTNOSThVObng7m23Xu1azh9oNhpUQA8/O5
	f13JhkxWp2gc6drtX/QROY7ybvdWqinwid6z2KuxvdNvZdPWYs9BUzyqm+kuyHPg
	06ZdJWoRC2NXZIA4O+HZ3RDx6XMKG5FB7ORZ9madBUz0cX/nNBvxkVDw1j2VLMMl
	uPa/Vw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpyqknhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 10:55:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bdaf8567f3so74003075ad.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 03:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779792905; x=1780397705; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N1w4IHhemxgCn36ZGjFLqCPIQy9ZIU2j0GMZhJdSgDw=;
        b=KTarg6xWVLyKJcrXhCib0X/2MHxqS3jB1QQaxLMLYfOU0z7tDGLSvr7en2GB2pKHAN
         QU4OY8OUn38kjOoifjDwRLWrQVdODM7oD6aNh0ng+u0+yuMxKAeTJi446qFv6nW01c3g
         Hsmu39N0CvK3Seq/T5dcdnRJS4llvtoQgpKtJlFd4a3M+j87UrenjAefNUp/ESvbAsXK
         Qd0D2NekaTWOSGSIRqzU5m9HxcBZdx8Tyb4AaTpLcAXV16ISv3XsiA9U8EJfdm+QPBdb
         KXbJYRcu4BPZ2USl2ialabNVTceMGO8YBRmdocqCHsFMqEOLLY+EBnXwl4fMuKtjy2rp
         7jag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779792905; x=1780397705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N1w4IHhemxgCn36ZGjFLqCPIQy9ZIU2j0GMZhJdSgDw=;
        b=GNhgC6dxOIXl1yLSVErOpDCOKHW1mRu9oB8xf1rg5r4GEFRGPBn8X2eKu8kgjbKQRE
         g6XidSCYbErgQcID+IG/7lYOBd01RgIJbsS4FcXVHm/OnAjPI5AB1ZSzbS+Mr+XqCDoL
         etx0czuMQw5gmxHdGwfoISibxOTSPl7pAxjTIe4lWth88MvPAC2vaC6msUmSoRtsABN+
         YQQklTja8js+ddvUc1YJXYp2HzhABbeL/tWvapUFaOTxkwCahehPB03HJU2FyuFsSxp0
         9mio2Qk5P/aSIQkVTdRLzTElyk0d4PckJLKo+H1Ncm8RHhWGXun7PqmQV1zAvLdKngTV
         5LRQ==
X-Forwarded-Encrypted: i=1; AFNElJ+8eskZGa2dvMBeWIKvnKwwHyt7EVPor/ZvuOfdZB7xVogaRu0x++IGvmR/hlh7S5OVVZ3TakXwU0aP@vger.kernel.org
X-Gm-Message-State: AOJu0YxHOAMxBa6OluxcUWwlDVf8rvX3zdkhfQfsJw6ol+7j7G8RVwhL
	U0qzhcacn4+4GoI0zg4hWNT6GdUg43qJ26hNrNkEYUoHmOSy+AW4SHldkyxz63nFBpqyj0xe5fc
	DmbxOVO9hWfuQelS6QuQyXDspgRQLevO/VmuEjNIi3lx8ywrQkTQFy/EnU5ed1HAo
X-Gm-Gg: Acq92OHaOFH2tiHRT4XM667hqFH6ExdW+VNX0b71KoXwhl13WZpmRax41DicKITXC1k
	keuvPTDBMYbHkJLDB2VccP0yHRTj1HkvNwlZGHGkEqIgv5R4u3EAX8GPWQIKx/r5zfq+M/2JsNt
	We7vxNCJ41SbNlAk2744oOTByY8BHEUjldLkyNLgPvbsStCFeXqTqGzhbyYH36iob0EmpZ8BnFs
	1XPsXm3KjX6DW6cgo9ZdQlDe77kcpeIq3tyyh4fB9G/BaXRWPjAvNR9piqSSD/nrrhKXXpb7yUP
	XciT/BFpNYdEHN/za8jqqcEym8FRCTCzue38u+7JUAwwgKip7LV7MGn13kNS6ryOC/Etm5Um8Bp
	U9aiRnSzdW6i7IIO/3X2MCs39MpawpKPe5uX1jxe0k4deoYM8wQ==
X-Received: by 2002:a17:903:94d:b0:2bd:9b0e:b43a with SMTP id d9443c01a7336-2beb07eae28mr160654525ad.7.1779792904616;
        Tue, 26 May 2026 03:55:04 -0700 (PDT)
X-Received: by 2002:a17:903:94d:b0:2bd:9b0e:b43a with SMTP id d9443c01a7336-2beb07eae28mr160654305ad.7.1779792904134;
        Tue, 26 May 2026 03:55:04 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f3dsm120890025ad.1.2026.05.26.03.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 03:55:03 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 26 May 2026 16:24:37 +0530
Subject: [PATCH v2 1/8] irqchip/qcom-pdc: restructure version support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-hamoa_pdc-v2-1-f6857af1ce91@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
In-Reply-To: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779792895; l=12245;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=kqY2/29JmPgmBngXGrtrrO/2RA0kHcTl6eZfMoAFqhg=;
 b=VGctHX5RZ1iP2KeUNFJSDyLN6n7NG1ZKU8do+c4S3wulHdvmm/7My5T9IKQYcjAMtyCbwFw2W
 MulykBtKibLAWR7LBmPHXzkhq+j37QBcoUi4DP/SGTJmxMWeNC74irX
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a157c09 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=uKrGy0FlPzkibCO8negA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: S7Auv7tBFAIi2DpKtwNbYr601Hq052P3
X-Proofpoint-ORIG-GUID: S7Auv7tBFAIi2DpKtwNbYr601Hq052P3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5NSBTYWx0ZWRfX0ZSSZ5dCDtEe
 bFhtDi1GnFrjmlwIrhV003oZG/+Duoq2+KP8Hnmypjv3Y7kXIWwUaSMWL2L/G5I+z6k+0O0Qbop
 2i1ckF1gnE17UGqVkooIzN8Cy80Cdck8+Lf1L/OuAKZ5//BjMqaJKWE+OmnpJw93jb/eals74ML
 sTfrNtbJOly+++7k+QOt/77QDbFzyTGCbkn07bUkOdnU3wmZYgG42QzS7BH47NL+8sng2rWvhRA
 XXbjxbPRTwNGxDdQuJ7/jKRZzG8QBGzEZt+OnRfP86tRY9yt+sP+Ssl8Jx4MgjZIQZW/ZGb6aB3
 tEnrvXBueiQxQfeImMdOs++Nr9pzlaIA5/EYul9YogiB4klGFUe92zkANNFOIAGcjTCdTC9kFia
 Rk6rI1PrL+XonLxUNRTDdoKxvY2J/uPiq8Jd+KJ46TCY+2fGFXDkEoRyBt4R/8UfDLf+e1CrQ2F
 mvRMZv9Fmil6mRpoAsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260095
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-37521-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 005B05D4741
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

PDC irqchip updates IRQ_ENABLE and IRQ_CFG and for three different
versions v2.7, v3.0 and v3.2. These registers are organized in H/W
as below on various SoCs.

+---------------------------------------------------------------+
| SM8350, SM8450    | SM8550, Hamoa     | SM8650, SM8750        |
|---------------------------------------------------------------|
|       v2.7        |       v3.0        |       v3.2            |
|---------------------------------------------------------------|
|   IRQ_ENABLE_BANK | IRQ_ENABLE_BANK   |       NA              |
|---------------------------------------------------------------|
|   IRQ_CFG         | IRQ_CFG           | IRQ_CFG               |
|                   |                   |                       |
|                   |                   | [31:6] Unused         |
|                   | [31:5] Unused     |    [5] GPIO_STATUS    |
|                   |    [4] GPIO_STATUS|    [4] GPIO_MASK      |
|   [31:3] Unused   |    [3] GPIO_MASK  |    [3] IRQ_ENABLE     |
|    [0:2] Type     |  [0:2] Type       |  [0:2] Type           |
+---------------------------------------------------------------|

All SoCs PDC irqchip supports "pass through mode" in which all interrupts
are forwarded to the GIC without any latching at PDC H/W.

So far irqchip did not utilize GPIO_STATUS and GPIO_MASK from IRQ_CFG
register for v3.0 and v3.2 since they are only needed to be configured
when PDC runs in specific mode named "second level interrupt controller"
where it can latch the GPIO interrupts in GPIO_STATUS and forward GPIO
interrupts to GIC as LEVEL_HIGH type SPI interrupt.

All the SoCs defaulted to pass through mode with the exception of some
x1e. x1e PDC may be set to secondary controller mode for builds on CRD
boards whereas it may be set to pass through mode for IoT-EVK boards.

Restructure in preparation to add the second level interrupt controller
mode utilizing GPIO_STATUS and GPIO_MASK bits which changed the bit
positions between v3.0 and v3.2.

No functional impact with the change.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 193 +++++++++++++++++++++++++++++++++++----------
 1 file changed, 150 insertions(+), 43 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 638b5d89a141..c5b64649b2a9 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -21,18 +21,10 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
-#define PDC_MAX_GPIO_IRQS	256
-#define PDC_DRV_SIZE		0x10000
-
-/* Valid only on HW version < 3.2 */
-#define IRQ_ENABLE_BANK		0x10
-#define IRQ_ENABLE_BANK_MAX	(IRQ_ENABLE_BANK + BITS_TO_BYTES(PDC_MAX_GPIO_IRQS))
-#define IRQ_i_CFG		0x110
+#define PDC_MAX_IRQS		256
+#define IRQ_ENABLE_BANK_MAX	BITS_TO_BYTES(PDC_MAX_IRQS)
 
-/* Valid only on HW version >= 3.2 */
-#define IRQ_i_CFG_IRQ_ENABLE	3
-
-#define IRQ_i_CFG_TYPE_MASK	GENMASK(2, 0)
+#define PDC_DRV_SIZE		0x10000
 
 #define PDC_VERSION_REG		0x1000
 #define PDC_VERSION_MAJOR	GENMASK(23, 16)
@@ -45,6 +37,98 @@
 
 /* Notable PDC versions */
 #define PDC_VERSION_3_2		PDC_VERSION(3, 2, 0)
+#define PDC_VERSION_3_0		PDC_VERSION(3, 0, 0)
+#define PDC_VERSION_2_7		PDC_VERSION(2, 7, 0)
+
+/*
+ * PDC H/W registers layout per version:
+ *
+ * IRQ_ENABLE_BANK[b], b = 0....BITS_TO_BYTES(PDC_MAX_IRQS)
+ * IRQ_CFG[n], n = 0....PDC_MAX_IRQS
+ *
+ * +---------------------------------------------------------------+
+ * |       v2.7        |       v3.0        |       v3.2            |
+ * |---------------------------------------------------------------|
+ * |       BASE        |       BASE        |       BASE            |
+ * |---------------------------------------------------------------|
+ * |                                                               |
+ * |   IRQ_ENABLE_BANK | IRQ_ENABLE_BANK   |       NA              |
+ * |---------------------------------------------------------------|
+ * |   IRQ_CFG         | IRQ_CFG           | IRQ_CFG               |
+ * |                   |                   |                       |
+ * |                   |                   | [31:6] Unused         |
+ * |                   | [31:5] Unused     |    [5] GPIO_STATUS    |
+ * |                   |    [4] GPIO_STATUS|    [4] GPIO_MASK      |
+ * |   [31:3] Unused   |    [3] GPIO_MASK  |    [3] IRQ_ENABLE     |
+ * |    [0:2] Type     |  [0:2] Type       |  [0:2] Type           |
+ * +---------------------------------------------------------------+
+ */
+
+/**
+ * struct pdc_regs: PDC registers location
+ *
+ * @irq_en_reg:     IRQ_ENABLE_BANK register location
+ * @irq_cfg_reg:    IRQ_CFG register location
+ */
+struct pdc_regs {
+	u32 irq_en_reg;
+	u32 irq_cfg_reg;
+};
+
+/**
+ * struct pdc_cfg: bit fields for PDC IRQ_CFG register
+ *
+ * @irq_enable:     bit mask for IRQ_ENABLE
+ * @irq_type:       bit mask for IRQ_TYPE
+ */
+struct pdc_cfg {
+	u32 irq_enable;
+	u32 irq_type;
+};
+
+/**
+ * struct pdc_desc: PDC driver state
+ *
+ * @base:           PDC base register for DRV2 / HLOS
+ * @prev_base:      PDC DRV1 base, applicable only for x1e RTL bug.
+ * @version:        PDC version
+ * @regs:           PDC regs (IRQ_ENABLE_BANK and IRQ_CFG)
+ * @cfg:            bit masks within for IRQ_CFG reg
+ */
+struct pdc_desc {
+	void __iomem *base;
+	void __iomem *prev_base;
+	u32 version;
+	const struct pdc_regs *regs;
+	const struct pdc_cfg *cfg;
+};
+
+static const struct pdc_regs pdc_v3_2 = {
+	.irq_cfg_reg = 0x110,
+};
+
+static const struct pdc_cfg pdc_cfg_v3_2 = {
+	.irq_enable = GENMASK(3, 3),
+	.irq_type = GENMASK(2, 0),
+};
+
+static const struct pdc_regs pdc_v3_0 = {
+	.irq_en_reg = 0x10,
+	.irq_cfg_reg = 0x110,
+};
+
+static const struct pdc_cfg pdc_cfg_v3_0 = {
+	.irq_type = GENMASK(2, 0),
+};
+
+static const struct pdc_regs pdc_v2_7 = {
+	.irq_en_reg = 0x10,
+	.irq_cfg_reg = 0x110,
+};
+
+static const struct pdc_cfg pdc_cfg_v2_7 = {
+	.irq_type = GENMASK(2, 0),
+};
 
 struct pdc_pin_region {
 	u32 pin_base;
@@ -55,12 +139,11 @@ struct pdc_pin_region {
 #define pin_to_hwirq(r, p)	((r)->parent_base + (p) - (r)->pin_base)
 
 static DEFINE_RAW_SPINLOCK(pdc_lock);
-static void __iomem *pdc_base;
-static void __iomem *pdc_prev_base;
 static struct pdc_pin_region *pdc_region;
 static int pdc_region_cnt;
 static void (*__pdc_enable_intr)(int pin_out, bool on);
 static bool pdc_x1e_quirk;
+static struct pdc_desc *pdc;
 
 static void pdc_base_reg_write(void __iomem *base, int reg, u32 i, u32 val)
 {
@@ -69,12 +152,12 @@ static void pdc_base_reg_write(void __iomem *base, int reg, u32 i, u32 val)
 
 static void pdc_reg_write(int reg, u32 i, u32 val)
 {
-	pdc_base_reg_write(pdc_base, reg, i, val);
+	pdc_base_reg_write(pdc->base, reg, i, val);
 }
 
 static u32 pdc_reg_read(int reg, u32 i)
 {
-	return readl_relaxed(pdc_base + reg + i * sizeof(u32));
+	return readl_relaxed(pdc->base + reg + i * sizeof(u32));
 }
 
 static void pdc_x1e_irq_enable_write(u32 bank, u32 enable)
@@ -85,24 +168,24 @@ static void pdc_x1e_irq_enable_write(u32 bank, u32 enable)
 	switch (bank) {
 	case 0 ... 1:
 		/* Use previous DRV (client) region and shift to bank 3-4 */
-		base = pdc_prev_base;
+		base = pdc->prev_base;
 		bank += 3;
 		break;
 	case 2 ... 4:
 		/* Use our own region and shift to bank 0-2 */
-		base = pdc_base;
+		base = pdc->base;
 		bank -= 2;
 		break;
 	case 5:
 		/* No fixup required for bank 5 */
-		base = pdc_base;
+		base = pdc->base;
 		break;
 	default:
 		WARN_ON(1);
 		return;
 	}
 
-	pdc_base_reg_write(base, IRQ_ENABLE_BANK, bank, enable);
+	pdc_base_reg_write(base, pdc->regs->irq_en_reg, bank, enable);
 }
 
 static void pdc_enable_intr_bank(int pin_out, bool on)
@@ -113,22 +196,25 @@ static void pdc_enable_intr_bank(int pin_out, bool on)
 	index = FIELD_GET(GENMASK(31, 5), pin_out);
 	mask = FIELD_GET(GENMASK(4, 0), pin_out);
 
-	enable = pdc_reg_read(IRQ_ENABLE_BANK, index);
+	enable = pdc_reg_read(pdc->regs->irq_en_reg, index);
 	__assign_bit(mask, &enable, on);
 
 	if (pdc_x1e_quirk)
 		pdc_x1e_irq_enable_write(index, enable);
 	else
-		pdc_reg_write(IRQ_ENABLE_BANK, index, enable);
+		pdc_reg_write(pdc->regs->irq_en_reg, index, enable);
 }
 
 static void pdc_enable_intr_cfg(int pin_out, bool on)
 {
 	unsigned long enable;
 
-	enable = pdc_reg_read(IRQ_i_CFG, pin_out);
-	__assign_bit(IRQ_i_CFG_IRQ_ENABLE, &enable, on);
-	pdc_reg_write(IRQ_i_CFG, pin_out, enable);
+	enable = pdc_reg_read(pdc->regs->irq_cfg_reg, pin_out);
+	if (on)
+		enable |= pdc->cfg->irq_enable;
+	else
+		enable &= ~pdc->cfg->irq_enable;
+	pdc_reg_write(pdc->regs->irq_cfg_reg, pin_out, enable);
 }
 
 static void pdc_enable_intr(struct irq_data *d, bool on)
@@ -216,9 +302,9 @@ static int qcom_pdc_gic_set_type(struct irq_data *d, unsigned int type)
 		return -EINVAL;
 	}
 
-	old_pdc_type = pdc_reg_read(IRQ_i_CFG, d->hwirq);
-	pdc_type |= (old_pdc_type & ~IRQ_i_CFG_TYPE_MASK);
-	pdc_reg_write(IRQ_i_CFG, d->hwirq, pdc_type);
+	old_pdc_type = pdc_reg_read(pdc->regs->irq_cfg_reg, d->hwirq);
+	pdc_type |= (old_pdc_type & ~pdc->cfg->irq_type);
+	pdc_reg_write(pdc->regs->irq_cfg_reg, d->hwirq, pdc_type);
 
 	ret = irq_chip_set_type_parent(d, type);
 	if (ret)
@@ -375,6 +461,34 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 	if (res_size > resource_size(&res))
 		pr_warn("%pOF: invalid reg size, please fix DT\n", node);
 
+	pdc = kzalloc_objs(*pdc, GFP_KERNEL);
+	if (!pdc)
+		return -ENOMEM;
+
+	pdc->base = ioremap(res.start, res_size);
+	if (!pdc->base) {
+		pr_err("%pOF: unable to map PDC registers\n", node);
+		ret = -ENXIO;
+		goto fail;
+	}
+
+	pdc->version = pdc_reg_read(PDC_VERSION_REG, 0);
+
+	if (pdc->version >= PDC_VERSION_3_2) {
+		pdc->cfg = &pdc_cfg_v3_2;
+		pdc->regs = &pdc_v3_2;
+		__pdc_enable_intr = pdc_enable_intr_cfg;
+	} else if (pdc->version < PDC_VERSION_3_2 &&
+		   pdc->version >= PDC_VERSION_3_0) {
+		pdc->cfg = &pdc_cfg_v3_0;
+		pdc->regs = &pdc_v3_0;
+		__pdc_enable_intr = pdc_enable_intr_bank;
+	} else {
+		pdc->cfg = &pdc_cfg_v2_7;
+		pdc->regs = &pdc_v2_7;
+		__pdc_enable_intr = pdc_enable_intr_bank;
+	}
+
 	/*
 	 * PDC has multiple DRV regions, each one provides the same set of
 	 * registers for a particular client in the system. Due to a hardware
@@ -384,25 +498,17 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 	 * region with the expected offset to preserve support for old DTs.
 	 */
 	if (of_device_is_compatible(node, "qcom,x1e80100-pdc")) {
-		pdc_prev_base = ioremap(res.start - PDC_DRV_SIZE, IRQ_ENABLE_BANK_MAX);
-		if (!pdc_prev_base) {
+		pdc->prev_base = ioremap(res.start - PDC_DRV_SIZE,
+					 pdc->regs->irq_en_reg + IRQ_ENABLE_BANK_MAX);
+		if (!pdc->prev_base) {
 			pr_err("%pOF: unable to map previous PDC DRV region\n", node);
-			return -ENXIO;
+			ret = -ENXIO;
+			goto fail;
 		}
 
 		pdc_x1e_quirk = true;
 	}
 
-	pdc_base = ioremap(res.start, res_size);
-	if (!pdc_base) {
-		pr_err("%pOF: unable to map PDC registers\n", node);
-		ret = -ENXIO;
-		goto fail;
-	}
-
-	__pdc_enable_intr = (pdc_reg_read(PDC_VERSION_REG, 0) < PDC_VERSION_3_2) ?
-			pdc_enable_intr_bank : pdc_enable_intr_cfg;
-
 	parent_domain = irq_find_host(parent);
 	if (!parent_domain) {
 		pr_err("%pOF: unable to find PDC's parent domain\n", node);
@@ -418,7 +524,7 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 
 	pdc_domain = irq_domain_create_hierarchy(parent_domain,
 					IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP,
-					PDC_MAX_GPIO_IRQS,
+					PDC_MAX_IRQS,
 					of_fwnode_handle(node),
 					&qcom_pdc_ops, NULL);
 	if (!pdc_domain) {
@@ -433,8 +539,9 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 
 fail:
 	kfree(pdc_region);
-	iounmap(pdc_base);
-	iounmap(pdc_prev_base);
+	iounmap(pdc->base);
+	iounmap(pdc->prev_base);
+	kfree(pdc);
 	return ret;
 }
 

-- 
2.43.0


