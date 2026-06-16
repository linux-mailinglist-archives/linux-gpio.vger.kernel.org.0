Return-Path: <linux-gpio+bounces-38565-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H0MsN/QXMWoZbgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38565-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 11:31:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC0468D8F6
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 11:31:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Y/D7ugGP";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SOnFjHmw;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38565-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38565-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 922CB304483E
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 09:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525464218B5;
	Tue, 16 Jun 2026 09:26:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B9B4218B4
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 09:26:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781601986; cv=none; b=kc5/DVIpwd4ERLneiKQ5Yyh53XV9FfGd6BdeiRjOi0ydgMZ0ey5WX1HfCSifVmmcuWoPY+s4OXV9dYOSzB3Xg6F6l2KZnyhA+GlGZ6htxGCl0ulxoEfirtg4w1giVNJU8NaoHe1ikd/X3FXVDaMm7uv++EjrAZ+A/OKM+ezShg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781601986; c=relaxed/simple;
	bh=l0yvFWCjGqALYpibJwYjgc+rbMxGpbSzkybRumcJUbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kd0JkUTCrE55fsgPm60+XeHVV40+FpSW7jQtM1krrTZrqtnVIgv/8MiLKlqGCiUKe2wv+iLO2Ju5WogtPmvZVb0TlOQg+IzDoJAHrGDYbZkyJ7Z/O8fghPkB0+0V9qbC6NJbpw10xEJP0CNm1/6X2rSxRK5m134nXyrdsILw5ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y/D7ugGP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SOnFjHmw; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G65gNh2699680
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 09:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NAXb5yw4TktASaT4DIdQAQD/zAZTtEP96c+FwsmHD0Y=; b=Y/D7ugGPjv9iybTU
	P4uQNU4dRPV9ztHfKO1MCjttfnHtqxITMICXOif/wPArbbgOXJQfg73sGfedGxnT
	KA07PNfEqRdFtTu+nBALstgjgb+LMYXufsWNl0vnqtOUvsttaaMUxT2ki9Twbgyp
	4H0uwTnwcO/pRPkZsYB2r0VvqZ0/BFRLBHbGxotBu0Nmg/64Ya4tNQnoV3mGrdlm
	n/wVYBuNyREAyUwA2jo+LFcUbl5D8AnJIOr0BC5jEra5CdJEjDTBDIRoMavwaWS+
	fmTuknrPLEmywe43gHwBVspzhIKqKaycM8FzKNPkZP/2/RavG3G1ZiPnTM0USu0+
	YRGmug==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09k914n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 09:26:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c272e532so45506015ad.1
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 02:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781601983; x=1782206783; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NAXb5yw4TktASaT4DIdQAQD/zAZTtEP96c+FwsmHD0Y=;
        b=SOnFjHmwTSk51ba1gs3bciphQp1odY58jI4DGHr6OYwWClAeXMxR1kw67IUV0tfcma
         YLQNoMRgUgJGdB6oiVj18TDe/fTNbcVYyf1VekEsj/Ba22h34z9kK03ndPFUtq3sRBOx
         /GfgMJ88m1bH3T5RaERVx27tbPtCZOE0DO2QgH1p+xNpgJSIi0xqOZDLOqGI7j9Qet5u
         k9xKrRYRisYHDIQ6i8bh9Cvg/9fiI4LofMj67rswqWNd5OcKc8LqD9iyr5oTNzhgdC1B
         PQnBrTVfoKq9843rhuqWRx7PYPdFiN8p+NaXoiJTI95kwpO47dHaPW8DWkNMBemcYb6n
         1DjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781601983; x=1782206783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NAXb5yw4TktASaT4DIdQAQD/zAZTtEP96c+FwsmHD0Y=;
        b=P3BQNId7luW1DVPcLsPXx5wIV0RoP2hqnreyl62q6d2mlglFY+J0OCsuRl4e6V5pYL
         LLoA+dje2Cf8mHm7EZrdcUiW606PGKg0ZW/wsD9IZ+25oXnt8O4ZkIptLUyH0SZXvo1i
         aS/KC8v8wNkIJ8ETOwkF53JFFdCVF30rcJnZRVAhO4hMqbxKJ4e/4wpmjnIGTucFsgxg
         TYm5ILA61m7HAc2yPIoUxFMr2DZAPCJp5wJgnLPHnkAYF6gwfduPuL7HdzTe5vQ0OWbg
         55WOMujY3xx28da78p7GnHG3ehI6TGQfjDg95079NsHIOBxDmhyL7vVvPGG5k/5dYfY/
         Oz9Q==
X-Forwarded-Encrypted: i=1; AFNElJ/TMdVKbtTKsVCY8ctcNLs0k7PQqEWhsCht7DmMRUwg+YFSnedegWGM48vct7SChQTDp8HeD2HmKktR@vger.kernel.org
X-Gm-Message-State: AOJu0YzMgFcHrrmtLfhUNRyzdogUSSRt/gyPwDq/pYuQFEo9bSKq7JRK
	NfUeCo3HfzUdFQVNvU6qg1f4bGZlkuJm1svXd8EDj1CYUyUrdrGgltbSh0m/OUPYa/G8mDnMVoY
	W5vV/13kb5RqfFbDPosc7WRkTigV8s3gRYeGAJeIiF6JySu/1DDlw2HrdRGZH8Cs2
X-Gm-Gg: Acq92OEtQVxHfTE/3fY63RursaYoEKTBWNSUs24rCK+vCc9VpQEe43HMa8iTSFtvutm
	XjnlhdgrfQqFHJ27UAmzV7r8z5WZXB9IoqnIJauoT/UnB2v+rTj/UYb0CaY+yDP2CfjERBz0CZi
	xXhvT5K9G2VnROfDFoXsdnHcMXH0kLiuOBHmfBXroPVZLrEnrvKOS51sQfe+gxt3gEW98xeTLNO
	T4xLTcTtlnkgaoX+mfB5tJfM7i23pMn0+oZ1ZI5AE8H9Yx26lOyh4Jgvg8E3FUhd3xARxubVBsk
	jKsrZKdNytBlVTEMMDfwQchvpw73AzF41lfw4d7oClKiUNaGeCZSdMseCNm1U/zuM8pOzowhy84
	nyA8UPa4jeJXSlwyvTrGvzLsyBjxpJvi4929xFB8IwLW5zkJgQA==
X-Received: by 2002:a17:903:1b43:b0:2bf:23ad:8595 with SMTP id d9443c01a7336-2c66414887cmr157520285ad.4.1781601982599;
        Tue, 16 Jun 2026 02:26:22 -0700 (PDT)
X-Received: by 2002:a17:903:1b43:b0:2bf:23ad:8595 with SMTP id d9443c01a7336-2c66414887cmr157519965ad.4.1781601982122;
        Tue, 16 Jun 2026 02:26:22 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e586bsm130042025ad.12.2026.06.16.02.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 02:26:21 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:55:54 +0530
Subject: [PATCH v3 4/8] irqchip/qcom-pdc: Differentiate between direct SPI
 and GPIO as SPI
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-hamoa_pdc_v3-v3-4-4d8e1504ea75@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
In-Reply-To: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781601959; l=4386;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=l0yvFWCjGqALYpibJwYjgc+rbMxGpbSzkybRumcJUbA=;
 b=7z/PfdFzn0Z2mVeQg6VszqurdrtfvdA77vqiVY0xFhHQc551CE2kd9GB72v4jpDGHsanN7C3M
 sgE4calTATJClaY7EXUKR86+lap8JkQeDta5mcqpvV8b7WTTYKWNhQ6
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA5NCBTYWx0ZWRfX7B1dfZqyWPeF
 AGifChONjd9mgSO7MWzIuM+GSwilxKIEoYtlnMhaHhlpohDdafRRZ10KXVz0og+6rrQHGTeA7R/
 iX7UcAjHYajf36PUEsThgvImYB0S+48=
X-Proofpoint-GUID: xNOZlCXNutsuUCsG420s-48jyxE-qhGS
X-Authority-Analysis: v=2.4 cv=DoZmPm/+ c=1 sm=1 tr=0 ts=6a3116bf cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_ArkcH_OKHg-bdOJ338A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: xNOZlCXNutsuUCsG420s-48jyxE-qhGS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA5NCBTYWx0ZWRfX04CYAErDGudQ
 AylkgOIj5balepQR9Pq+rweepVfyn2CUb2TCI2Yx+RkiXdNsS64Yxjuv2vdkBTPGGxs1QgyqnyV
 bKCtTAxlqlcWRvLdRlETP84EctVxKTqyS2R50AL8RrjQ4HrDn8GcVNTUTXksrhwN/QOre1PHzFF
 0Kphmdhle2yaf+X+mHh9XrsuH6HqqrWkOG3EjpIeH1S25PI+qWphyztKGkAz1Tk9cBbY3LB1DEk
 aNDQr1xnQfKacQttZQbv8ZJtCO64OM0C6hwEs4XOQT7bsM0ZpAKoeT4KaTRASbjFgZeZV90Vkj/
 cu9VHIoeqv7qG3Sg36wk9vzzL1iUdsaGT81wnj1dCejIPQcBRNr14gUnpIpz4E69JVd/WieKnyX
 LOj6JbID6fdLanIkqS5NYUAMd8T4Ew95UQtRC8kcKo6pK827f3q/xXiOHI+pgsikG0JSRfLeLIp
 16VoPM3ODNcCqeAQ9kA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38565-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4DC0468D8F6

Before commit 4dc70713dc24 ("irqchip/qcom-pdc: Kill non-wakeup irqdomain")
there are separate domains for direct SPIs and GPIO used as SPIs. Separate
domains can be useful in case irqchip want to differentiate both of them.
Since commit unified both the domains there is no way to differentiate.

In preparation to add the second level interrupt controller support where
GPIO interrupts get latched at PDC (but not direct SPIs) there is a need to
differentiate between SPIs and GPIOs as SPIs. Reverting above commit do not
seem a good option either which leads to waste of resources.

PDC HW have the IRQ_PARAM register telling number of direct SPIs and number
of GPIOs as SPIs. Further PDC allocates direct SPIs at the beginning and
all GPIOs as SPIs are allocated at the end. This information can be used in
driver to differentiate them.

Add the support to read this register and keep this information in
struct pdc_desc. Later change utilizes same.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 6c556464d37c..1aa6be42307c 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -61,6 +61,11 @@
  * |                   |    [4] GPIO_STATUS|    [4] GPIO_MASK      |
  * |   [31:3] Unused   |    [3] GPIO_MASK  |    [3] IRQ_ENABLE     |
  * |    [0:2] Type     |  [0:2] Type       |  [0:2] Type           |
+ * |---------------------------------------------------------------|
+ * |   IRQ_PARAM       | IRQ_PARAM         | IRQ_PARAM             |
+ * |                   |                                           |
+ * |   [15:8] NUM_GPIO | [15:8] NUM_GPIO   | [15:8] NUM_GPIO       |
+ * |    [7:0] NUM_SPI  |  [7:0] NUM_SPI    |  [7:0] NUM_SPI        |
  * +---------------------------------------------------------------+
  */
 
@@ -69,10 +74,12 @@
  *
  * @irq_en_reg:     IRQ_ENABLE_BANK register location
  * @irq_cfg_reg:    IRQ_CFG register location
+ * @irq_param_reg:  IRQ_PARAM register location
  */
 struct pdc_regs {
 	u32 irq_en_reg;
 	u32 irq_cfg_reg;
+	u32 irq_param_reg;
 };
 
 /**
@@ -92,6 +99,8 @@ struct pdc_irq_cfg {
  * @base:           PDC base register for DRV2 / HLOS
  * @prev_base:      PDC DRV1 base, applicable only for x1e RTL bug.
  * @version:        PDC version
+ * @num_spis:       Total number of direct SPI interrupts
+ * @num_gpios:      Total number of GPIOs forwarded as SPI interrupts
  * @region:         PDC interrupt continuous range
  * @region_cnt:     Total PDC ranges
  * @x1e_quirk:      x1e H/W Bug handling
@@ -104,6 +113,8 @@ struct pdc_desc {
 	void __iomem			*base;
 	void __iomem			*prev_base;
 	u32				version;
+	u32				num_spis;
+	u32				num_gpios;
 
 	struct pdc_pin_region		*region;
 	int				region_cnt;
@@ -120,6 +131,7 @@ struct pdc_desc {
 
 static const struct pdc_regs pdc_v3_2 = {
 	.irq_cfg_reg	= 0x110,
+	.irq_param_reg	= 0x100c,
 };
 
 static const struct pdc_irq_cfg pdc_cfg_v3_2 = {
@@ -130,6 +142,7 @@ static const struct pdc_irq_cfg pdc_cfg_v3_2 = {
 static const struct pdc_regs pdc_v3_0 = {
 	.irq_en_reg	= 0x10,
 	.irq_cfg_reg	= 0x110,
+	.irq_param_reg	= 0x100c,
 };
 
 static const struct pdc_irq_cfg pdc_cfg_v3_0 = {
@@ -139,6 +152,7 @@ static const struct pdc_irq_cfg pdc_cfg_v3_0 = {
 static const struct pdc_regs pdc_v2_7 = {
 	.irq_en_reg	= 0x10,
 	.irq_cfg_reg	= 0x110,
+	.irq_param_reg	= 0x100c,
 };
 
 static const struct pdc_irq_cfg pdc_cfg_v2_7 = {
@@ -449,6 +463,7 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 	struct device *dev = &pdev->dev;
 	resource_size_t res_size;
 	struct resource res;
+	u32 irq_param;
 	int ret;
 
 	/* compat with old sm8150 DT which had very small region for PDC */
@@ -505,6 +520,10 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 		pdc->x1e_quirk = true;
 	}
 
+	irq_param = pdc_reg_read(pdc->regs->irq_param_reg, 0);
+	pdc->num_spis = FIELD_GET(GENMASK(7, 0), irq_param);
+	pdc->num_gpios = FIELD_GET(GENMASK(15, 8), irq_param);
+
 	parent_domain = irq_find_host(parent);
 	if (!parent_domain) {
 		pr_err("%pOF: unable to find PDC's parent domain\n", node);

-- 
2.43.0


