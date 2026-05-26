Return-Path: <linux-gpio+bounces-37525-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JK/AJV8FWpEVwcAu9opvQ
	(envelope-from <linux-gpio+bounces-37525-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 12:57:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6375D47B7
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 12:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B1D7B3049235
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 10:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB7E3DFC9F;
	Tue, 26 May 2026 10:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ojgq0Hs5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jiBreGo9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E760B3DCDBE
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 10:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779792926; cv=none; b=FFQ2xPbZvOxHJfdfUz6camrFykyrYbIDx2cxwT16kuUcPvEhYdRx/sbExMKgrehLue/VjFjRZq/8Py0rriYTjBzjzh/jymTSyWLMXnisimx8gEjiOx8u8/uk+Igz+3SgnxN8EgKvVFyazjociOgyLp2Y/cJCzn50BbznD8SBFbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779792926; c=relaxed/simple;
	bh=8In8IGBtkQEcG7Cn8mCKk8jnnCXcLdvp9LUTygtve4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=adgTHLgQAy1Bt+dDJOhrJjIex5KLS9MFlzns/boh9ZLWNsBje5PjegRCOGoD6ualpeYewGvwIwdZcj1IhV85GMK+tKGjwtrYlYJCQgPEugo6ruRcfcv/k3zno79qrv/ayvQhwOD6pvAVzm192FtdXndU6Wi6CmPOrMpkY+qG+a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ojgq0Hs5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jiBreGo9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q5UbPg2145983
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 10:55:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GsUPoa0QmNgTYmXU3NmCr7LiYIC0Rpfgi2D4aZFzeTE=; b=Ojgq0Hs5FMSctqoe
	eL+h+vKGJkd0DdLQT/dZo7ZwUSP//P0JpQOdikZTWmuegoQJ0qqQwCIxu4SZesXR
	rlWSHq8iQedFD8Vk7UwJywtA1Rgckem0Skp+MaJVYms/YtLSIs+QGGsJ3jjRkBpX
	jJsC6oTVaflJZUV/HahoytsacJ4+qcJSoVQRl/Y14pmAfaz3+dpwg6sG1x50yNBc
	KYeVw72qtwjwPXLwUVmxuEuRp9Bc5cAL6lptsKyo2vCtACxbbAQAuXo3CNwJ+1Ni
	DrCh5XEAND+3lF1VFHHkSoXCINXHCZ9wyXkuqIzTkCsmHeHZav+dPBDuOqZfAWuG
	Qd0QEw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecmbv4afn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 10:55:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bd00a65673so80285505ad.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 03:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779792922; x=1780397722; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GsUPoa0QmNgTYmXU3NmCr7LiYIC0Rpfgi2D4aZFzeTE=;
        b=jiBreGo9M64GF374P8b+UDDzJgz6RnueM1bARgrCFwJYKpH4/QGWQKqDTDfRMmGE3F
         oL55svibca/Khb565mhbxq/F9k6lP7gBCQQutGd3E1mZIYk1u7JAO31IquQt0fLaVvqz
         92Ct6zoB14nwbttzEO5TKTkyCGzsv2s3fvIgHlkOo5ymlZ6ZIsCppGnbVjzDIDBbiBCK
         6UAa+tFK4WHd3WacpAYKE7WK+VIhZrMjvWPtZgreW/oyiJFlET2gl4z+nHZYHfkqKtgJ
         TC3EXJIi4LUXCep2/7VKekGAsJgWL8BP+R90xNwnOacPfcuJUOy9XYvcgCW4MRvy0xpH
         1Tag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779792922; x=1780397722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GsUPoa0QmNgTYmXU3NmCr7LiYIC0Rpfgi2D4aZFzeTE=;
        b=POOwFD0e1rtyVwcEJOTTcB1PVjuL2uvvLyRALoKJjw0E5vNQGLZowadTIV4xWBZOWa
         WMtwqkYY+nth8skKyJmeqh1Fpzpda29rHpGysRKvls/t/SGRzh0PDQb9uxvZaHjYp66Q
         +XuwbpEE5nQAn6NK5MnAqmRD1wb5rXCbhNzm2TEVSMmAWCJ6xpa3ujOF9Im830RUDVlK
         z9Sy3Z6yJe0x5hlk73n51YxHE7k5Sy/G6akJ732UzLr7DYXAU3ZQFlVf01UvtVwXVur2
         k7Y+rsjeow9N75riVTeRPELwS/RR9rxNjHgaJCE/9Wnm0q65aO06XVpk14VBPYvE7NV2
         pfxw==
X-Forwarded-Encrypted: i=1; AFNElJ8+c0EQuRN/IyNyzRNkpPthEK2LueHrZewNBfJzOzPGnDbEshWFaG9oiovINLPmMRH/MAPbzQKFT9pu@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd3rx9+1ZIfjsrUKjclIarZMPQ2LX69oOjRpr01O/zZCEslXMA
	OQ14uPMFu529ZaBeMTm4jD/CXAousbbUKITXEBR6t9cR84kz68WDljcXEdIzaB7aAuEJzt48Bru
	WnTktoLyeIe/0k1D3scIWU4PqFJ7XD+3+zXs4IsvP2PuKFeRxQseqCRNYuEkBq1u4
X-Gm-Gg: Acq92OHq9adcygWAzx6w8R280MWf6O8S82XVIEUCUymFxBQEyRr9N6jpyac8QVrrRzH
	A7RBBSl1qzgu40jn95mm8X7ozMz/P1H6a+2w5jg51DP1L2altSVkTwz9zMcT+w2dQLbiBL2KdnD
	kZd/3Q53il1CYkuiRIKY770A/UEwZN4yq1LBQgLwzuY+fzMRfpN3pHs5gyor2WPCJ/Z4kf2Dt8A
	k7JyArtHgUa+V7bUYOwRay2Gaag6MOfvane7698xKHgv1wWNLA5IkMQfeO1C7rzlYasjD+zBhqy
	2Px6N/eW3WoCUQlvrUhyBGGKg2stqDjyJoD6XKd+LPi+8LClR5MBaPpZ3my9yUOoqaOFCPdU/7H
	HcrAHhy4Rvp6u9S4A2HNl00A9UVvOLk2guu1ptuus0q/lvdYknrEhsKCQt+lE
X-Received: by 2002:a17:902:ea09:b0:2bd:d6f1:3388 with SMTP id d9443c01a7336-2bea240dd66mr203168065ad.28.1779792922089;
        Tue, 26 May 2026 03:55:22 -0700 (PDT)
X-Received: by 2002:a17:902:ea09:b0:2bd:d6f1:3388 with SMTP id d9443c01a7336-2bea240dd66mr203167845ad.28.1779792921596;
        Tue, 26 May 2026 03:55:21 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f3dsm120890025ad.1.2026.05.26.03.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 03:55:21 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 26 May 2026 16:24:41 +0530
Subject: [PATCH v2 5/8] irqchip/qcom-pdc: Configure PDC to pass through
 mode
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-hamoa_pdc-v2-5-f6857af1ce91@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779792895; l=9146;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=8In8IGBtkQEcG7Cn8mCKk8jnnCXcLdvp9LUTygtve4c=;
 b=SkXeb4VZC9IzcwTYDko+JnC/qeGoXqtWOxlnriYMF/qHCwzYasgtlRS74xtdMCLPm+P2j/Owp
 liej6rkXoUTBkctNvXgJN3PDrwqtHol9et+jy+1wjDZQbLa/x1WHVuU
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5NSBTYWx0ZWRfX5zxk7MNdUtHk
 tYBS8y36Mn6zRxE7AYp1MuExBBa8BLxWbR1b+CxgxI6G3+ZaBxdkjjZWltdGyffBwFlpFwx+Vz7
 tFCNSPr/HGnsxHtuVdNSmbgRkE6EnM5QgKCyI2HjwW/s+WXqXlc9jrLcQZqg8opRIpOeuPSDHt+
 s6iM7y58f2wWoEOx0pMFSjfARA/wvxnc3/3XTsP0zjyPbO0WdBas1r4bYp/zIG/wMAc3onY5G5N
 jBlm9PBGnJKIQa7zrzpwCCn9SLmXxxo/H0xf/faILxVV2Dr7Y+zYjK0fjZtYL3rFYBU4K3MBTo/
 p7jCknkTbcU4momPBZyoID8cCYQ3dihXsrGsEBypxFspOAzgOE7o41vgbb32tt13bvmrTs3GDeH
 CSdqXk+P9Yobexz9vUjDsKLOVHPcfyrI6YKEZmCzE1Ct6f3xG3lFgoDEoXYUfKyicN0ywB/nilp
 U0cp5CTEBdk7ZhFTI+A==
X-Proofpoint-GUID: cY_PHEKVr2nLdF2YcDaXKldZektZna3i
X-Proofpoint-ORIG-GUID: cY_PHEKVr2nLdF2YcDaXKldZektZna3i
X-Authority-Analysis: v=2.4 cv=XqTK/1F9 c=1 sm=1 tr=0 ts=6a157c1a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Q3n93Wx9duqw9lev3b0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260095
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
	TAGGED_FROM(0.00)[bounces-37525-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 6C6375D47B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

All PDC irqchip supports pass through mode in which both Direct SPIs and
GPIO IRQs (as SPIs) are sent to GIC without latching at PDC.

Newer PDCs (v3.0 onwards) also support additional secondary controller mode
where PDC latches GPIO IRQs and sends to GIC as level type IRQ. Direct SPIs
still works same as pass through mode without latching at PDC even in
secondary controller mode.

All the SoCs so far default uses pass through mode with the exception of
x1e. x1e PDC may be set to secondary controller mode for builds on CRD
boards whereas it may be set to pass through mode for IoT-EVK boards.
The mode configuration is done in firmware and initially shipped windows
firmware did not have SCM interface to read or modify the PDC mode.
Later only write access is opened up for non secure world.

Using the write access available add changes to modify the PDC mode to
pass through mode via SCM write. When the write fails (on older firmware)
assume to work in secondary mode.

Co-developed-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 109 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 106 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 86379dddc5be..69ddd7d89a83 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -20,12 +20,18 @@
 #include <linux/spinlock.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/firmware/qcom/qcom_scm.h>
 
 #define PDC_MAX_IRQS		256
 #define IRQ_ENABLE_BANK_MAX	BITS_TO_BYTES(PDC_MAX_IRQS)
 
 #define PDC_DRV_SIZE		0x10000
 
+/* Secure DRV register to configure the PDC mode via qcom_scm_io_writel() */
+#define PDC_GPIO_INT_CTL_ENABLE	0xb2045e8
+#define PDC_PASS_THROUGH_MODE	0x0
+#define PDC_SECONDARY_MODE	0x1
+
 #define PDC_VERSION_REG		0x1000
 #define PDC_VERSION_MAJOR	GENMASK(23, 16)
 #define PDC_VERSION_MINOR	GENMASK(15, 8)
@@ -85,10 +91,14 @@ struct pdc_regs {
 /**
  * struct pdc_cfg: bit fields for PDC IRQ_CFG register
  *
+ * @gpio_irq_sts:   bit mask for GPIO_STATUS
+ * @gpio_irq_mask:  bit mask for GPIO_MASK
  * @irq_enable:     bit mask for IRQ_ENABLE
  * @irq_type:       bit mask for IRQ_TYPE
  */
 struct pdc_cfg {
+	u32 gpio_irq_sts;
+	u32 gpio_irq_mask;
 	u32 irq_enable;
 	u32 irq_type;
 };
@@ -103,11 +113,14 @@ struct pdc_cfg {
  * @num_gpios:      Total number of GPIOs forwarded as SPI interrupts
  * @region:         PDC interrupt continuous range
  * @region_cnt:     Total PDC ranges
+ * @mode:           PDC_PASS_THROUGH_MODE or PDC_SECONDARY_MODE
  * @x1e_quirk:      x1e H/W Bug handling
  * @lock:           lock for IRQ_ENABLE_BANK protection
  * @regs:           PDC regs (IRQ_ENABLE_BANK and IRQ_CFG)
  * @cfg:            bit masks within for IRQ_CFG reg
  * @enable_intr:    pointer to enable function based on PDC version
+ * @unmask_gpio:    pointer to GPIO irq unmask function
+ * @clear_gpio:     pointer to GPIO irq clear function
  */
 struct pdc_desc {
 	void __iomem *base;
@@ -119,6 +132,7 @@ struct pdc_desc {
 	struct pdc_pin_region *region;
 	int region_cnt;
 
+	u8 mode;
 	bool x1e_quirk;
 
 	raw_spinlock_t lock;
@@ -127,6 +141,8 @@ struct pdc_desc {
 	const struct pdc_cfg *cfg;
 
 	void (*enable_intr)(int pin_out, bool on);
+	void (*unmask_gpio)(int pin_out, bool on);
+	void (*clear_gpio)(int pin_out);
 };
 
 static const struct pdc_regs pdc_v3_2 = {
@@ -135,6 +151,8 @@ static const struct pdc_regs pdc_v3_2 = {
 };
 
 static const struct pdc_cfg pdc_cfg_v3_2 = {
+	.gpio_irq_sts = GENMASK(5, 5),
+	.gpio_irq_mask = GENMASK(4, 4),
 	.irq_enable = GENMASK(3, 3),
 	.irq_type = GENMASK(2, 0),
 };
@@ -146,6 +164,8 @@ static const struct pdc_regs pdc_v3_0 = {
 };
 
 static const struct pdc_cfg pdc_cfg_v3_0 = {
+	.gpio_irq_sts = GENMASK(4, 4),
+	.gpio_irq_mask = GENMASK(3, 3),
 	.irq_type = GENMASK(2, 0),
 };
 
@@ -184,6 +204,14 @@ static u32 pdc_reg_read(int reg, u32 i)
 	return readl_relaxed(pdc->base + reg + i * sizeof(u32));
 }
 
+static inline bool pdc_pin_uses_seconary_mode(int pin_out)
+{
+	if (pdc->mode == PDC_SECONDARY_MODE && pin_out >= pdc->num_spis)
+		return true;
+
+	return false;
+}
+
 static void pdc_x1e_irq_enable_write(u32 bank, u32 enable)
 {
 	void __iomem *base;
@@ -232,6 +260,36 @@ static void pdc_enable_intr_bank(int pin_out, bool on)
 		pdc_reg_write(pdc->regs->irq_en_reg, index, enable);
 
 	raw_spin_unlock_irqrestore(&pdc->lock, flags);
+
+	if (pdc_pin_uses_seconary_mode(pin_out))
+		pdc->unmask_gpio(pin_out, on);
+}
+
+static void pdc_clear_gpio_cfg(int pin_out)
+{
+	unsigned long gpio_sts;
+
+	if (pdc->version < PDC_VERSION_3_0)
+		return;
+
+	gpio_sts = pdc_reg_read(pdc->regs->irq_cfg_reg, pin_out);
+	gpio_sts &= ~pdc->cfg->gpio_irq_sts;
+	pdc_reg_write(pdc->regs->irq_cfg_reg, pin_out, gpio_sts);
+}
+
+static void pdc_unmask_gpio_cfg(int pin_out, bool unmask)
+{
+	unsigned long gpio_mask;
+
+	if (pdc->version < PDC_VERSION_3_0)
+		return;
+
+	gpio_mask = pdc_reg_read(pdc->regs->irq_cfg_reg, pin_out);
+	if (unmask)
+		gpio_mask &= ~pdc->cfg->gpio_irq_mask;
+	else
+		gpio_mask |= pdc->cfg->gpio_irq_mask;
+	pdc_reg_write(pdc->regs->irq_cfg_reg, pin_out, gpio_mask);
 }
 
 static void pdc_enable_intr_cfg(int pin_out, bool on)
@@ -244,6 +302,9 @@ static void pdc_enable_intr_cfg(int pin_out, bool on)
 	else
 		enable &= ~pdc->cfg->irq_enable;
 	pdc_reg_write(pdc->regs->irq_cfg_reg, pin_out, enable);
+
+	if (pdc_pin_uses_seconary_mode(pin_out))
+		pdc->unmask_gpio(pin_out, on);
 }
 
 static void qcom_pdc_gic_disable(struct irq_data *d)
@@ -258,6 +319,20 @@ static void qcom_pdc_gic_enable(struct irq_data *d)
 	irq_chip_enable_parent(d);
 }
 
+static void qcom_pdc_ack(struct irq_data *d)
+{
+	if (pdc_pin_uses_seconary_mode(d->hwirq) && !irqd_is_level_type(d))
+		pdc->clear_gpio(d->hwirq);
+}
+
+static void qcom_pdc_gic_eoi(struct irq_data *d)
+{
+	if (pdc_pin_uses_seconary_mode(d->hwirq) && irqd_is_level_type(d))
+		pdc->clear_gpio(d->hwirq);
+
+	irq_chip_eoi_parent(d);
+}
+
 /*
  * GIC does not handle falling edge or active low. To allow falling edge and
  * active low interrupts to be handled at GIC, PDC has an inverter that inverts
@@ -291,6 +366,8 @@ enum pdc_irq_config_bits {
  * takes care of converting falling edge to rising edge signal
  * If @type is level, then forward that as level high as PDC
  * takes care of converting falling edge to rising edge signal
+ * If interrupt is GPIO and PDC is in secondary mode forward that
+ * as level high as PDC takes care of coverting all types to level high
  */
 static int qcom_pdc_gic_set_type(struct irq_data *d, unsigned int type)
 {
@@ -326,6 +403,16 @@ static int qcom_pdc_gic_set_type(struct irq_data *d, unsigned int type)
 	pdc_type |= (old_pdc_type & ~pdc->cfg->irq_type);
 	pdc_reg_write(pdc->regs->irq_cfg_reg, d->hwirq, pdc_type);
 
+	if (pdc_pin_uses_seconary_mode(d->hwirq)) {
+		/*
+		 * PDC forwards GPIOs as level high to GIC in secondary
+		 * mode. Update the type and clear any previously latched
+		 * phantom interrupt at PDC.
+		 */
+		type = IRQ_TYPE_LEVEL_HIGH;
+		pdc->clear_gpio(d->hwirq);
+	}
+
 	ret = irq_chip_set_type_parent(d, type);
 	if (ret)
 		return ret;
@@ -347,7 +434,8 @@ static int qcom_pdc_gic_set_type(struct irq_data *d, unsigned int type)
 
 static struct irq_chip qcom_pdc_gic_chip = {
 	.name			= "PDC",
-	.irq_eoi		= irq_chip_eoi_parent,
+	.irq_ack		= qcom_pdc_ack,
+	.irq_eoi		= qcom_pdc_gic_eoi,
 	.irq_mask		= irq_chip_mask_parent,
 	.irq_unmask		= irq_chip_unmask_parent,
 	.irq_disable		= qcom_pdc_gic_disable,
@@ -457,8 +545,10 @@ static int pdc_setup_pin_mapping(struct device_node *np)
 		if (ret)
 			return ret;
 
-		for (i = 0; i < pdc->region[n].cnt; i++)
-			pdc->enable_intr(i + pdc->region[n].pin_base, 0);
+		for (i = 0; i < pdc->region[n].cnt; i++) {
+			pdc->clear_gpio(i + pdc->region[n].pin_base);
+			pdc->enable_intr(i + pdc->region[n].pin_base, false);
+		}
 	}
 
 	return 0;
@@ -510,6 +600,10 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 		pdc->enable_intr = pdc_enable_intr_bank;
 	}
 
+	pdc->unmask_gpio = pdc_unmask_gpio_cfg;
+	pdc->clear_gpio = pdc_clear_gpio_cfg;
+	pdc->mode = PDC_PASS_THROUGH_MODE;
+
 	/*
 	 * PDC has multiple DRV regions, each one provides the same set of
 	 * registers for a particular client in the system. Due to a hardware
@@ -528,6 +622,15 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 		}
 
 		pdc->x1e_quirk = true;
+
+		if (!qcom_scm_is_available()) {
+			ret = -EPROBE_DEFER;
+			goto fail;
+		}
+
+		ret = qcom_scm_io_writel(PDC_GPIO_INT_CTL_ENABLE, PDC_PASS_THROUGH_MODE);
+		if (ret)
+			pdc->mode = PDC_SECONDARY_MODE;
 	}
 
 	irq_param = pdc_reg_read(pdc->regs->irq_param_reg, 0);

-- 
2.43.0


