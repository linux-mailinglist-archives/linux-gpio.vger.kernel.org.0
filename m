Return-Path: <linux-gpio+bounces-33270-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SELmFivjsmnyQgAAu9opvQ
	(envelope-from <linux-gpio+bounces-33270-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 17:00:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECE0275151
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 17:00:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B6AA730162AC
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 15:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD583F7AB0;
	Thu, 12 Mar 2026 15:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hsHfjB/7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ATWFOOQJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210D83F7A8D
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 15:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773331020; cv=none; b=J2nwRf4nuTMcvTLqDul6WUysupLzgUTSoOYVIikSzUxWzkTQDdvUGYqyj+5d8W7DSqPWKgwQmTo02l2T2Lr87uvQBgcmSNKvZ2miQ9orpPfaY2Dvoy5rnyYCM0MzKVjWM/r0q3TDgNAMHoW7faDLbrvLWjjsNjXZJcfj5CaNKMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773331020; c=relaxed/simple;
	bh=bCu7aW8/QTWapF5ij+NKUvcd7TvrQElcFNdenTYTv3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dgTZSoPKE8AMExP1YMU5jM5Vr8qKY6NXmmDF10JH9TUuANF1P7Gk7pyZcMGpo2krS7XR/i1ftU1Uo5+UIr9O2vLW3rKVDw+ugSW1UOE/WOAX84v+xFfAfU5NeXcscfYL8CmC2zQIIiNspHLKEUX9/+LKuCfuJYaE8AP2G+hjKBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hsHfjB/7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ATWFOOQJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9Lb9T4132592
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 15:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RpOQxkqEm7pn/TWMDSYAKoFZhY03aCVnaB1ijpNgrGE=; b=hsHfjB/7SzZ7Q8eY
	PiQzBDPCLS01Ad/pwH6zlASAyqeU58y4q98El57R9AicTzMBmBgit6/6KXpfW2Fn
	+bNf+A3UdFd4E1mF8W7b7d7Q3YGyeLkNkeClCOoT/Pqj52FpEmk6ZRQ3vvvRTKM3
	Xm/hLWujsQjRvSnsBogLVNDlzvooukm7PiHg13XGzdwqEcxcVv4hZy21M2vqDV52
	nptejBx/2fOKOftRinh1hE9DFVpdJObCDSL0BB6ipjmJMYQBg2UARqnLE1MMi/NQ
	EGUl+5t4atqCLAd0I6lyUWkXAFnbnN+e7o/kz9tillZX/VnaP+xLiqHONLticw7W
	a9Ji7g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4w2nqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 15:56:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c739120475fso642169a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 08:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773331017; x=1773935817; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RpOQxkqEm7pn/TWMDSYAKoFZhY03aCVnaB1ijpNgrGE=;
        b=ATWFOOQJCl7d2NPX+osQuBISIgGs542rJm6MvgTSLTOvpWVRuOzXPdVUgwicVVLiMf
         OTXqgz3zikmfyhNCQMKOh5ETMP9lBkUZSBndgVW2S/aUiFxFUc0ByLZWeSaSsw40YMfe
         X4cL0u4PHeIABZEmUeLiAxZIoD4Q4Z76k6FyozsVkvTi/3gqcgmDA3GOxkGGM0+10gnP
         U2g0oNucvytRWK5jOhuNCD/KRIaomruJ/wgEyyHJ0Jf7y5Gkzzx80m+MgikA58Mz39QR
         O/H5V3BH8V9xXzsbohONsOWTAGqrozrEZarCehfMLfhXW7hINRJER2AMkmVdja2UCsxw
         xejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773331017; x=1773935817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RpOQxkqEm7pn/TWMDSYAKoFZhY03aCVnaB1ijpNgrGE=;
        b=DBdPD3s9BFCiAgYnCpm2jf6Vy68HBqdyQOS1hknYAkTAjsp2EMLEvgX4LyjmG3DuWL
         QQuLNidflEYSBSHhq/jZJKJc6AVNp8I9GpXIvVfcK2Lf/YYCgdRvgaHkEszqewIyYEIX
         V5K3kg7wwd8vZwm1iVJSWB8PJplBf9TuFY/Flezqf89OJhFouXGl29svsF4tvnrySxNh
         R/zgOTd04+0n+tQLCV0BoswBD8yz7MRx87FqvtPNaWgOommARM+vopQO6v12SlCxh9mo
         5v7FWYNY8JLUqNA1hrSMeVPDV4Ja/upqhK3T0F9T7lwKqAcNF6fIU6ZPd9fSg82NcVlw
         RBJA==
X-Forwarded-Encrypted: i=1; AJvYcCWu/j73Kk1vMnJcOTlLd2yoG8tgJbreDuLuGPFBJKWrqlFu1F/4KkDiAUyOL+bCbjGapmfAUXTORAAE@vger.kernel.org
X-Gm-Message-State: AOJu0YyP4HObkcTX7DEHUv07O+ywmfLMerTVAQ0o1CpvSUPoEeXHq+p+
	LqsqF1jWxxo6mjkSnWSUxH/apgKNg5GVhOg69IwRiRuM0kU2e3kJUQbyCv2jGpkKoN6FB7HTK5K
	qKdBBTy6YReRNtNduIqC+ablcSL4lAXHaK6+N626wQe9rGBv2RBCfRLfvBvzR4INv
X-Gm-Gg: ATEYQzzjNoQ9mrBG7GCaNEOMug8tIp+00+lC+kR9xyoWQrENNsfwpRiwmCDDn6NEhql
	7f1zHURIahqNkioPKLRHFdgXcni2KIFkvNGTJaOop2q5ppimgRDemILxtZvKbHjw96aRznfhdVb
	MOOIc7VJNF6aU6CRinINt8Eru6pIyyLhFAxoCrqbkc49yRJlHOJDWmj8xv29YjvsClOhu7vN25V
	LYScDzPR5I8xBPK+fcYJR/XNh7q9ITKQOgBiGdeQNbTEM34eeY+7kXmXCav75ypvbpVc5dlLkV6
	iOO08mLDkRnEb5MUdkckn7X9UzNueFJqKBG7x2jwmLILAktYmzrd4IATVN1xNGueFo2wlrCnQnz
	Wn1Hcq+MX3zuueZwZYTAqBTH2Sg7VxqEmohpo1zMV87JlJhLE+w==
X-Received: by 2002:a05:6300:4049:b0:398:9579:dff7 with SMTP id adf61e73a8af0-398c60dca0fmr6852801637.41.1773331017446;
        Thu, 12 Mar 2026 08:56:57 -0700 (PDT)
X-Received: by 2002:a05:6300:4049:b0:398:9579:dff7 with SMTP id adf61e73a8af0-398c60dca0fmr6852768637.41.1773331016857;
        Thu, 12 Mar 2026 08:56:56 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73cdf254acsm6067852a12.11.2026.03.12.08.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:56:56 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 21:26:37 +0530
Subject: [PATCH 3/5] irqchip/qcom-pdc: Configure PDC to pass through mode
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-hamoa_pdc-v1-3-760c8593ce50@oss.qualcomm.com>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
In-Reply-To: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773331000; l=8507;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=bCu7aW8/QTWapF5ij+NKUvcd7TvrQElcFNdenTYTv3U=;
 b=d+poMCmM7RMoa49Lxh9InyAofRhN+0qUsDLXbN7fU5x1rNBMAqqfFMT6NdsoTy+Qjn9ufm41u
 G3sNrdL45YqAzyKqCC8LzfSlg55RlPk28WfKHa+qh2/emobWP+/6Ihs
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: 2cjzOTSKjrankS1AnVCqHvkg936MCDFn
X-Authority-Analysis: v=2.4 cv=Cpays34D c=1 sm=1 tr=0 ts=69b2e24a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=aIvA2l6cyS3-6N-EsbsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 2cjzOTSKjrankS1AnVCqHvkg936MCDFn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEyOCBTYWx0ZWRfX0j8OLKw83A/k
 1H02W1q7T9f41S8uHZSNcOw1RqAFZOiGzNSehSmGeSmRWKkdI6ZIReDoSoX1TQF+WMKBH+guXhA
 5OX0HSFeLejTXHeQUlc0S+BcpTBK7Uuah9qRQuCXmobPYLZBevkrci7U4mhEgfI7w8iYbQjKxiH
 /PYFhi5uE0bPqwOBMvLUoxOx+Wb/YEcKGKnKOjYWr6meGShp+PZOQCv5kd6jiI8xXoUOvXW17O2
 xq2YnRT1hMGMEQkAotGy8vUeJfInS7CATtaDYB/oXQEZJqqgUhYeeMOiAy0Bsn9+JnIyjv0sUKh
 Jnrse/JNVHP33faQYQE5IRqD6zfyRGGFi9Vvb67XjiX7px8I1KsZGm2d+6NX+Yqk5aseziybXbh
 CrFIg2DTNleo7p2RS+x5nScj726Z/LN/HOSKVOyHwZ81+s/0LnBAmvfuv46na5Vll/ymIWNXUzU
 5NzJeoi9oEPS5kxSd4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120128
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-33270-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: 3ECE0275151
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There are two modes PDC irqchip supports pass through mode and secondary
controller mode.

All PDC irqchip supports pass through mode in which both Direct SPIs and
GPIO IRQs (as SPIs) are sent to GIC without latching at PDC.

Newer PDCs (v3.0 onwards) also support additional secondary controller mode
where PDC latches GPIO IRQs and sends to GIC as level type IRQ. Direct SPIs
still works same as pass through mode without latching at PDC even in
secondary controller mode.

All the SoCs so far default uses pass through mode with the exception of
x1e. x1e PDC may be set to secondary controller mode for builds on CRD
boards whereas it may be set to pass through mode for IoT-EVK.

There is no way to read which current mode it is set to and make PDC work
in respective mode as the read access is not opened up for non secure
world. There is though write access opened up via SCM write API to set the
mode.

Configure PDC mode to pass through mode for all x1e based boards via SCM
write.

Co-developed-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/irqchip/Kconfig    |   1 +
 drivers/irqchip/qcom-pdc.c | 119 +++++++++++++++++++++++++++++++++++++++++----
 2 files changed, 111 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 83d333f8bf63d78827800e0de724f81e6aa2f1df..89caddf6e5c569a0e867cda1838c870b967fb13d 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -505,6 +505,7 @@ config GOLDFISH_PIC
 config QCOM_PDC
 	tristate "QCOM PDC"
 	depends on ARCH_QCOM
+	depends on QCOM_AOSS_QMP
 	select IRQ_DOMAIN_HIERARCHY
 	help
 	  Power Domain Controller driver to manage and configure wakeup
diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 32b77fa93f730416edf120710bcdcdce33fa39a7..051700d672471c092e8cda4d7f5aa6d2032157f7 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -19,6 +19,8 @@
 #include <linux/spinlock.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/soc/qcom/qcom_aoss.h>
 
 #define PDC_MAX_GPIO_IRQS	256
 #define PDC_DRV_OFFSET		0x10000
@@ -26,9 +28,11 @@
 /* Valid only on HW version < 3.2 */
 #define IRQ_ENABLE_BANK		0x10
 #define IRQ_ENABLE_BANK_MAX	(IRQ_ENABLE_BANK + BITS_TO_BYTES(PDC_MAX_GPIO_IRQS))
+#define IRQ_i_CFG_IRQ_MASK_3_0	3
 #define IRQ_i_CFG		0x110
 
 /* Valid only on HW version >= 3.2 */
+#define IRQ_i_CFG_IRQ_MASK_3_2	4
 #define IRQ_i_CFG_IRQ_ENABLE	3
 
 #define IRQ_i_CFG_TYPE_MASK	GENMASK(2, 0)
@@ -36,8 +40,11 @@
 #define PDC_VERSION_REG		0x1000
 
 /* Notable PDC versions */
+#define PDC_VERSION_3_0		0x30000
 #define PDC_VERSION_3_2		0x30200
 
+#define PDC_PASS_THROUGH_MODE	0
+
 struct pdc_pin_region {
 	u32 pin_base;
 	u32 parent_base;
@@ -97,6 +104,33 @@ static void pdc_x1e_irq_enable_write(u32 bank, u32 enable)
 	pdc_base_reg_write(base, IRQ_ENABLE_BANK, bank, enable);
 }
 
+/*
+ * The new mask bit controls whether the interrupt is to be forwarded to the
+ * parent GIC in secondary controller mode. Writing the mask is do not care
+ * when the PDC is set to pass through mode.
+ *
+ * As linux only makes so far make use of pass through mode set all IRQs
+ * masked during probe.
+ */
+static void __pdc_mask_intr(int pin_out, bool mask)
+{
+	unsigned long irq_cfg;
+	int mask_bit;
+
+	/* Mask bit available from v3.0 */
+	if (pdc_version < PDC_VERSION_3_0)
+		return;
+
+	if (pdc_version < PDC_VERSION_3_2)
+		mask_bit = IRQ_i_CFG_IRQ_MASK_3_0;
+	else
+		mask_bit = IRQ_i_CFG_IRQ_MASK_3_2;
+
+	irq_cfg = pdc_reg_read(IRQ_i_CFG, pin_out);
+	__assign_bit(mask_bit, &irq_cfg, mask);
+	pdc_reg_write(IRQ_i_CFG, pin_out, irq_cfg);
+}
+
 static void __pdc_enable_intr(int pin_out, bool on)
 {
 	unsigned long enable;
@@ -312,7 +346,6 @@ static const struct irq_domain_ops qcom_pdc_ops = {
 static int pdc_setup_pin_mapping(struct device_node *np)
 {
 	int ret, n, i;
-
 	n = of_property_count_elems_of_size(np, "qcom,pdc-ranges", sizeof(u32));
 	if (n <= 0 || n % 3)
 		return -EINVAL;
@@ -341,8 +374,10 @@ static int pdc_setup_pin_mapping(struct device_node *np)
 		if (ret)
 			return ret;
 
-		for (i = 0; i < pdc_region[n].cnt; i++)
+		for (i = 0; i < pdc_region[n].cnt; i++) {
 			__pdc_enable_intr(i + pdc_region[n].pin_base, 0);
+			__pdc_mask_intr(i + pdc_region[n].pin_base, true);
+		}
 	}
 
 	return 0;
@@ -352,10 +387,13 @@ static int pdc_setup_pin_mapping(struct device_node *np)
 
 static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *parent)
 {
+	static const char buf[64] = "{class: cx_mol, res: cx, val: mol}";
+	unsigned int domain_flag = IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP;
 	struct irq_domain *parent_domain, *pdc_domain;
 	struct device_node *node = pdev->dev.of_node;
 	resource_size_t res_size;
 	struct resource res;
+	struct qmp *pdc_qmp;
 	int ret;
 
 	/* compat with old sm8150 DT which had very small region for PDC */
@@ -366,6 +404,13 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 	if (res_size > resource_size(&res))
 		pr_warn("%pOF: invalid reg size, please fix DT\n", node);
 
+	pdc_base = ioremap(res.start, res_size);
+	if (!pdc_base) {
+		pr_err("%pOF: unable to map PDC registers\n", node);
+		ret = -ENXIO;
+		goto fail;
+	}
+
 	/*
 	 * PDC has multiple DRV regions, each one provides the same set of
 	 * registers for a particular client in the system. Due to a hardware
@@ -382,15 +427,71 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 		}
 
 		pdc_x1e_quirk = true;
-	}
 
-	pdc_base = ioremap(res.start, res_size);
-	if (!pdc_base) {
-		pr_err("%pOF: unable to map PDC registers\n", node);
-		ret = -ENXIO;
-		goto fail;
+		/*
+		 * There are two modes PDC irqchip can work in
+		 *	- pass through mode
+		 *	- secondary controller mode
+		 *
+		 * All PDC irqchip supports pass through mode in which both
+		 * Direct SPIs and GPIO IRQs (as SPIs) are sent to GIC
+		 * without latching at PDC.
+		 *
+		 * Newer PDCs (v3.0 onwards) also support additional
+		 * secondary controller mode where PDC latches GPIO IRQs
+		 * and sends to GIC as level type IRQ. Direct SPIs still
+		 * works same as pass through mode without latching at PDC
+		 * even in secondary controller mode.
+		 *
+		 * All the SoCs so far default uses pass through mode with
+		 * the exception of x1e.
+		 *
+		 * x1e modes:
+		 *
+		 * x1e PDC may be set to secondary controller mode for
+		 * builds on CRD boards whereas it may be set to pass
+		 * through mode for IoT-EVK boards.
+		 *
+		 * There is no way to read which current mode it is set to
+		 * and make PDC work in respective mode as the read access
+		 * is not opened up for non secure world. There is though
+		 * write access opened up via SCM write API to set the mode.
+		 *
+		 * Configure PDC mode to pass through mode for all x1e based
+		 * boards.
+		 *
+		 * For successful write:
+		 *	- Nothing more to be done
+		 *
+		 * For unsuccessful write:
+		 *	- Inform TLMM to monitor GPIO IRQs (same as MPM)
+		 *	- Prevent SoC low power mode (CxPC) as PDC is not
+		 *	  monitoring GPIO IRQs which may be needed to wake
+		 *	  the SoC from low power mode.
+		 */
+		ret = of_address_to_resource(node, 2, &res);
+		if (ret) {
+			domain_flag = IRQ_DOMAIN_FLAG_QCOM_MPM_WAKEUP;
+			goto skip_scm_write;
+		}
+
+		ret = qcom_scm_io_writel(res.start, PDC_PASS_THROUGH_MODE);
+		if (ret) {
+			pdc_qmp = qmp_get(&pdev->dev);
+			if (IS_ERR(pdc_qmp)) {
+				ret = PTR_ERR(pdc_qmp);
+				goto fail;
+			} else {
+				ret = qmp_send(pdc_qmp, buf, sizeof(buf));
+				qmp_put(pdc_qmp);
+				if (ret)
+					goto fail;
+			}
+			domain_flag = IRQ_DOMAIN_FLAG_QCOM_MPM_WAKEUP;
+		}
 	}
 
+skip_scm_write:
 	pdc_version = pdc_reg_read(PDC_VERSION_REG, 0);
 
 	parent_domain = irq_find_host(parent);
@@ -407,7 +508,7 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 	}
 
 	pdc_domain = irq_domain_create_hierarchy(parent_domain,
-					IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP,
+					domain_flag,
 					PDC_MAX_GPIO_IRQS,
 					of_fwnode_handle(node),
 					&qcom_pdc_ops, NULL);

-- 
2.34.1


