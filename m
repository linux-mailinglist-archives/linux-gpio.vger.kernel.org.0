Return-Path: <linux-gpio+bounces-37524-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOYBI6V9FWpEVwcAu9opvQ
	(envelope-from <linux-gpio+bounces-37524-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 13:01:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCBF5D48FE
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 13:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2DAF3138616
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 10:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6943DEFE6;
	Tue, 26 May 2026 10:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VZvBDMMc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VV/GxMgi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410683D890E
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 10:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779792921; cv=none; b=jqerNALCSvtBO2p9Mm6nTOmTD9fsSw/wbkKXNMCppaTjWDkHBE+b8yLefCdwyTgY3CsBt4cj1NGEBGPEp+SNQCcAh6ZP7KAGGqY495boRq4Jd/vWbK1CHN9OjKtVJzz1h513W/U6GAHoD1V2X/XSp4Qjd+xb0N8xl1zz6cIf+g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779792921; c=relaxed/simple;
	bh=6EQ6AEy/sFGbv0oRWgjY13Wwv75cbd1+f0Br4cSZjD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D0zZmy/UHRsVtmAxgdlgvuGf4TU2VobKx5UyT58IzliMpEx0Xr33l5Iw/FXE6xM4I2XkIEQesxa5wXBAcw+5XMMVTguII6RTD7fZzxmoTdmwpWmAKfKrihnJ1CCU6D3D07s8M96wYKO+YvcrBjtWVGcqCYDYMO5hKBJyUsbXgr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VZvBDMMc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VV/GxMgi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q92RPm4117645
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 10:55:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lBvxffGLGjap0F10y6akuJqbuU0quUpXU7b/5dedjVA=; b=VZvBDMMc4AlN8xWn
	A3y272eDSVznYXmeu8kVruVA/8TzLZAWQ+kmuzu3mJu+J9udLUU2l2oaqjX2cTDC
	q0J99DcuP1WwKY/5+goiLjRmtg8tg0H9tkCiV4K4coyRFunX4yawBSGpZOcI6bwT
	ajvTA7bhk/q4csUWuYjrvIWW6kkN/BKeWh64ZkMolKZjU87KFwFiMs7pVKsBX+zX
	EcS314JtCAdcTf9kRJXSsWpRbZzxGLUBgw49MhtpEMwhrAH/RpvJjrT60PMyjY6R
	HaGdH54SpTPeNyqglyYbbcDmNoNWHaIyhTaWbEOHo7lVDMbJdn1gp24UkG1dgC+s
	ZSpeYw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqudbgnt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 10:55:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba3245a43dso116278315ad.0
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 03:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779792918; x=1780397718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBvxffGLGjap0F10y6akuJqbuU0quUpXU7b/5dedjVA=;
        b=VV/GxMgi9b9KwrTEltO0KqXZqU/hIkPE/pcU7yZvQUf8bIE03IuQvWdCAmfklw0Mn+
         WO6QDXb9ly2ag8TV0uPN68WZGqkv8ucexJXLhsKrBWV7MyD/iQM5IMikJaI0RL10LtTd
         w4Oz3ScCcgrP4IA3xVhqpOKbR4ZnC1nTp7nZ2dSGoQBao02bKea+qzVrLHB1hqKTSaN7
         H788iqIfo4YWsO180MujVoRcmcoOPr0bOzUU4dpHWBP6rb07jQpaQ9Vt3OwXeEfwWehZ
         vIjl7XsjjC33b+5BfdPUWUESByxvtHfU/qgq53aNvAHoXGMCyqvUACpzXSSddiINusct
         lljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779792918; x=1780397718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lBvxffGLGjap0F10y6akuJqbuU0quUpXU7b/5dedjVA=;
        b=eC+ob+bAnANT70cbJG4/n7V9AE2gCbukosoOPBeJ5V96G8fKHa0WELVOT82w9k2tUc
         yzNqkSgnSw1PV7garlOuGShRV2uP2ko3o5Jvm0jZwAU2mjy01Ss/8agy2IAq4WeSkgyU
         l7GuZh5nD8y3WYJC9R96wWGF0eVMeJ1bXrxAbGu9q/rOAKbIZDk7mcLH/qFDGXSYtpTi
         WRQ6ZvXmc+YgNPwEoLAz8dydo+nnCr0AYT1C1L1lerG031r9hkVyjKcJg2/g4KRCRu5m
         LATR0UDUDL9s3SDOAhAu1Ee7EdInSHcPbTbxxZVz3w5/cDUtf+sTdfV36zb/6ZPcbk2B
         yfMA==
X-Forwarded-Encrypted: i=1; AFNElJ9QeaScSX5l3muhgJ85HFKGr4/V+d1FS7fG/03WvLROvYroAtrN45m1q1kDPPJLFJQjjRKf/M0ClVIs@vger.kernel.org
X-Gm-Message-State: AOJu0YylbCbCAUHdnBxd+YXSJIAb8QOyrWcDSFROalRxSAZWcjWF4JT2
	9zYL68Kg2XGksrp/Id/NhpOntZOeTV1VP34qxYBlqA+QXx13ylTSjnp4MHlekuBd19fQhm1eB4Q
	WCXEESVkF+6TdVaErZ48gd7YgOmfrW8blKOrrOCLo9i8BXL3Xvq7SRfqbSo5pvUT7
X-Gm-Gg: Acq92OFxQRx8MkVRooo1dirmE8dyNcay+hgRXPzcqy4Kmh5sAaQrAXj7gMNGHODk4WU
	8pxBrmt48Af8Y1S7OyfWKTl4ef1dTg7z8aIhWr4BiEENseGVRNhe6TL2mjeuPieDCidvCZDEbpI
	vI4w9+i2+W1YZRkDUeVReNF2sDsv2zWl1L4MQAfXWIfMW9q+Yu8KJZSmdlDng+HQMkWwQye1uLT
	wL8OVnwoTKitwZUqBneTfTUVRfyKxL+o6TUNkeGxtT2GMR1Is2Pvva5NnRLEAjIRKMWFegGq53W
	Hu/vVa7sxSQgLvb98uZpUjQzSDVrMio6il2gcVTqbwAuh7Sm5o1as8tWU0K/A6OfV5N7ruNvQSq
	vB6UPyt4tIHAvsWuEJadHS4WL30u7BuCBkpKx2MfDGsh8Gt+9LA==
X-Received: by 2002:a17:902:ccca:b0:2bd:a413:6b07 with SMTP id d9443c01a7336-2beb031ad32mr196688965ad.8.1779792917667;
        Tue, 26 May 2026 03:55:17 -0700 (PDT)
X-Received: by 2002:a17:902:ccca:b0:2bd:a413:6b07 with SMTP id d9443c01a7336-2beb031ad32mr196688695ad.8.1779792917218;
        Tue, 26 May 2026 03:55:17 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f3dsm120890025ad.1.2026.05.26.03.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 03:55:16 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 26 May 2026 16:24:40 +0530
Subject: [PATCH v2 4/8] irqchip/qcom-pdc: Differentiate between direct SPI
 and GPIO as SPI
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-hamoa_pdc-v2-4-f6857af1ce91@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779792895; l=4359;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=6EQ6AEy/sFGbv0oRWgjY13Wwv75cbd1+f0Br4cSZjD0=;
 b=qXa0KsONgyIBH+VtaOzo+t9vZZzWxuMoVowWIB7JnogTd/zYJDqXfoiY6ZF0pLN5AsxMh/AVd
 mNRaoCvPDtlDhmCNmH1E9AQf9jV89ji3oSmMCJzr8MXdW3Lxd5rLy5d
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: SiFSZ2M0-xv1LvHfoQEqqa_s447JA0SG
X-Proofpoint-GUID: SiFSZ2M0-xv1LvHfoQEqqa_s447JA0SG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5NSBTYWx0ZWRfX44bC4JzK6Qv4
 FZJ9Z+H4eeEvr3otPw7mCmmi/lN42Jb8w175hXxQvtjjVU7MZJ0aSAXZOonezAAVPSnF2LpKGJv
 uz5zMCLd5jPcPIzdHzyc1CQ242+kQXuj3p3ziaqa7QLYH3ie3zqXcLGJQPDaRIW5N3fccMFpa1Q
 4nybHsa20AXuif6/N5JjsGKkp6wJGRuKzBSwQpVNWYYgK8vAhoz0V+B4T0M8kPDxQQErRYKajVC
 YE3q4d8EHel2karBi2WG3az0Ukm3HvimjRalo0kx3Dg+NBTF4xdoZXw8IOUYUACzujolA2qqby0
 7sF/K2jjKdg7p5h8D39hkKiIhgEI9vq4yWvAHuMPSzDJldjcNwdfs0HbI7uqM1U64fpGUe/uX/F
 5EHzpXae/97+XsL9qU84TJs4FKh1NfbUTrd7HtF0039lYTqWb9wGaXWNyzt7kihcK5GxPZYdEXh
 5WQr5EE1ze8flqPAOOg==
X-Authority-Analysis: v=2.4 cv=C9jZDwP+ c=1 sm=1 tr=0 ts=6a157c16 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Fdd6IbX9gU1Ld8MhPvkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1011 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260095
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-37524-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ECCBF5D48FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Before commit 4dc70713dc24 ("irqchip/qcom-pdc: Kill non-wakeup irqdomain")
there are separate domains for direct SPIs and GPIO used as SPIs. Separate
domains can be useful in case irqchip want to differentiate both of them.
Since commit unified both the domains there is no way to differentiate.

In preparation to add the second level interrupt controller support where
GPIO interrupts get lateched at PDC (but not direct SPIs) there is a need
to differentiate between SPIs and GPIOs as SPIs. Reverting above commit do
not seem a good option either which leads to waste of resources.

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
index db76737646e1..86379dddc5be 100644
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
@@ -92,6 +99,8 @@ struct pdc_cfg {
  * @base:           PDC base register for DRV2 / HLOS
  * @prev_base:      PDC DRV1 base, applicable only for x1e RTL bug.
  * @version:        PDC version
+ * @num_spis:       Total number of direct SPI interrupts
+ * @num_gpios:      Total number of GPIOs forwarded as SPI interrupts
  * @region:         PDC interrupt continuous range
  * @region_cnt:     Total PDC ranges
  * @x1e_quirk:      x1e H/W Bug handling
@@ -104,6 +113,8 @@ struct pdc_desc {
 	void __iomem *base;
 	void __iomem *prev_base;
 	u32 version;
+	u32 num_spis;
+	u32 num_gpios;
 
 	struct pdc_pin_region *region;
 	int region_cnt;
@@ -120,6 +131,7 @@ struct pdc_desc {
 
 static const struct pdc_regs pdc_v3_2 = {
 	.irq_cfg_reg = 0x110,
+	.irq_param_reg = 0x100c,
 };
 
 static const struct pdc_cfg pdc_cfg_v3_2 = {
@@ -130,6 +142,7 @@ static const struct pdc_cfg pdc_cfg_v3_2 = {
 static const struct pdc_regs pdc_v3_0 = {
 	.irq_en_reg = 0x10,
 	.irq_cfg_reg = 0x110,
+	.irq_param_reg = 0x100c,
 };
 
 static const struct pdc_cfg pdc_cfg_v3_0 = {
@@ -139,6 +152,7 @@ static const struct pdc_cfg pdc_cfg_v3_0 = {
 static const struct pdc_regs pdc_v2_7 = {
 	.irq_en_reg = 0x10,
 	.irq_cfg_reg = 0x110,
+	.irq_param_reg = 0x100c,
 };
 
 static const struct pdc_cfg pdc_cfg_v2_7 = {
@@ -457,6 +471,7 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 	struct device_node *node = pdev->dev.of_node;
 	resource_size_t res_size;
 	struct resource res;
+	u32 irq_param;
 	int ret;
 
 	/* compat with old sm8150 DT which had very small region for PDC */
@@ -515,6 +530,10 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
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


