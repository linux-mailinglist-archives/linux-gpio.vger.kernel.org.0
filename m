Return-Path: <linux-gpio+bounces-39578-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MT5YH/rGTGpqpgEAu9opvQ
	(envelope-from <linux-gpio+bounces-39578-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 11:29:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CA4719C77
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 11:29:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Eaw0Xrkr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=V6Ag0dal;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39578-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39578-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5EF830A0D7D
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 09:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CDE839A4B9;
	Tue,  7 Jul 2026 09:22:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D9D3998B1
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 09:22:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416139; cv=none; b=cym/qPQKUQ9RwPiMRVnDycsczYvqjfWySsYSmrgWmWmutJtxazvJ9LVR1S4k8UB14hX684TEF4DIDtRFztAKFSWKC7GRSR6xsz03j54oTJivBk6IpR5bk2vhZktw7c1ifAB9WWO6swT2hresFkNU5aKY+7yjtdRZn5JUrvUW99k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416139; c=relaxed/simple;
	bh=D0sOlcjYWpVb4KW1woV12cTMyxTCQuYuBDIGFgr0z8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rM/gKh6EgmiZgAlxe+D7/9q27nJUX62A6S4zDhRQyFMEycJZ0wcoMCsV4hE/in9ipeShp87gwidj2ScANAD0hOilG5V+hZJgED2Ln4IMGKUnzDdQxqY7pGiOT8jCa+vWnv8QLfofHB9jezgCbVMDLwYYwVWt34AS3e5UUo7iyPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eaw0Xrkr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V6Ag0dal; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678EFnJ3203499
	for <linux-gpio@vger.kernel.org>; Tue, 7 Jul 2026 09:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2InzJMBKoHl7JVhFO+rX+aFvUpIrUtHbvFpQlkWzNFk=; b=Eaw0XrkrHQM1IAz7
	pTYq7uvQ0D+ytlDUJz3ndv+Pau+PujnS6wZWjkQ+T1ZU1EbzzYAhhIb9f1mqK3le
	oRNzAvPOAG6XrV/AzRZUxQ0Mudjx1B58wINdCfj/XYETN/K4gAHId4EIscc1bXP3
	OX7VyGNkQQDR/g9Qj/QP11q6TrGJkR31H3fC3grgWJL+imgUTAT89BdjRZLrk5Q3
	yg8ZonPk+zM8tLhxgUFvUmfYqoN8K/nphVdSQuh8VzMd8K/mRdxOtKzSAGbDpDFy
	7LilAdO4GFrAb4DFcyB4WGhQtb8/YacVBaWk1G+QHl8wmUMgZvhxY4W51VnPKc6n
	BpxThw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9a8q7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 09:22:13 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so6691685a12.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 02:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783416133; x=1784020933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2InzJMBKoHl7JVhFO+rX+aFvUpIrUtHbvFpQlkWzNFk=;
        b=V6Ag0dal0jtOskiiSUlLiTGgMeouQiNhFmL+t0U/5qstFPjchvO775N5VbrFPslqOS
         jhGc9OeYDu4tKkJ03ZQPTKfMtJdigCt9Qz7eQo1MckKVvPOEryfvRuDl0ujl1AEpTKSY
         58U4Bf/jy0wFE9jtyTqUckoJ1wvR30lW4A+QNP3vbHBd0SGnnvsraHZPL79Sp9ZL5LS6
         a6qbmAINxV1MBTepALX6biKCJ5SlYZXiCiBq7bH8v9K1M2mJbVsyS/306+oIcWMo59rS
         aX1bJevgLixNlJYrb+r4nhiBcNvzLapPQ3+KfNFEtIm4jsr0cJOv3PfWQgpmSoOnYrHL
         K7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783416133; x=1784020933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2InzJMBKoHl7JVhFO+rX+aFvUpIrUtHbvFpQlkWzNFk=;
        b=OzWOi1D0EY6m6pSsFh+Dt+IpNTEa6hDB4W7RgwqIJaRt2QvHATaIKPDT7t1D5Oc0sX
         0PXbonU0qolqJxTPNZadXq0rRLzNsr2+HUXjZ/cNdNjcQ4kGehpl6rsG80gliaDamwpK
         jIQPpTcn0R1TVVQ4pR9ZYhXKvUhUMjXWMsiKvr7bQ9A4kxrrg+CbaZvzPrl8jEHMui84
         vWA6OespDSYaLUgoc4SBOA2SZXXCLEmFi7fitZkFU2uR+46RkhL6TPstuaBDIUX3jd5s
         0BVvnpU7XSOLliguoHyUVo1lbQw8XzN0o3YVOwrvqspeLXo6Hl7KoEYN/QsiFEudr+op
         6LRg==
X-Forwarded-Encrypted: i=1; AHgh+RqdYTY3fG2ZCf/DrUEyD9+wGbFrG1Qh0HDlngtDIhioqMuVp1w4JQ0DfP4x0zympMp9p3u6pPgzwXBa@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5937LnDFyiyyhz4+nWAVaYPFySm2sBwzGAzZL9l6t7eH6+v9b
	AsMfMZ8XY96Azt61y5NWkz8DpTCn36SDi73JLDihTnAOqmrEQgXmgP0+6xLV3slWLxC9NLksFK+
	JIJMZQ18D4C991wl863IGfnLYCNxfMjRqzPAJlmpvg0k25bY9hW7pIzQBamBF9vJx
X-Gm-Gg: AfdE7cn9ezL2OfGjBODVwRzD4+goRTqUt680Fq2nYxS75DvL0lbfWiB6aC8xsJ9kYly
	2oFjKCjbiDA3j2dH3SimcOeks0GqN5ckczXGcBF0nKPjzYORb1nrOynVViKUN+OZo2Xq1SEF7oq
	PK1ZHDBBy/Uhlf4gRpJF/bqovddl3VaVkZan2Tf2S7W56WcfJmM2THdgY0+4Q/xvA7b4rtafhkl
	taDVde+hAxuZreWHNZOM0bqAay30+wWOVRp7vpt7KWuXOwNS0TPrQgA3/h0pvG2f+myvfzf31RM
	su2BawsZScvkw6ck9F7VGSnxCwjWFV3pVsnw/ssdqujBAJGI+Dp+bORC6+vm2/2dNl8G4rjipUH
	7mNbkDkQiD3H5iMJbDzTLW8kJ9EzV14PBstjEJJo=
X-Received: by 2002:a05:6a21:1b85:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3c08ef051a0mr5861197637.35.1783416132724;
        Tue, 07 Jul 2026 02:22:12 -0700 (PDT)
X-Received: by 2002:a05:6a21:1b85:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3c08ef051a0mr5861153637.35.1783416132179;
        Tue, 07 Jul 2026 02:22:12 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afdb7534sm658864a12.12.2026.07.07.02.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:22:11 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 14:51:35 +0530
Subject: [PATCH v4 3/7] irqchip/qcom-pdc: Differentiate between direct SPI
 and GPIO as SPI
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-hamoa_pdc_v3-v4-3-dfd1f4a3ae89@oss.qualcomm.com>
References: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
In-Reply-To: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783416112; l=4238;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=D0sOlcjYWpVb4KW1woV12cTMyxTCQuYuBDIGFgr0z8Q=;
 b=1pX9sNDj1Pci8+qfn41oZdkQXZRGfcZizRvaXxJLxdF+NyAL7KnT9upuPoV1wdOnWugMNhjlC
 7SUuYKr16nMAnatdA8xm4avp5jkcwU14z6qcfSqQXA5nWw/lqlw7WFo
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: IxEpMOTknj0CR27KcHaHAkGv6W1z6faO
X-Proofpoint-ORIG-GUID: IxEpMOTknj0CR27KcHaHAkGv6W1z6faO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX9vNvRiaxhm9X
 5b1k5MrtDfP04tnOaW1ear+ETolpTDUEe0LdNECjbIVkPIG/D7h7MEwxuV5azXL4afLtPp0vU4S
 c0J/c+zaxLHwLVdpHCQcqd6dhg7YNrs=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4cc545 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=l_4bIUA77Uey-hlc_bsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX5ifJ/afyKpjM
 ANmXLbcsx8IS0UPDAso/fMKorlrBtamzPpZ213qtS118AhcxQ+gCOjfezhyv7bw6NiuXNCa0lvW
 qKaQjyiTO6+yLsm0kKFIjMA/sba4DALUcIsfBwiN1GdQrzPU6r/f1DeeccJ6tqwjKbLhbZ+gnsk
 wIn8dK5d0eN09gL5gFM7+klV61vDfFOCy3CXmy3f9c16cd0vTpzp/7aBlAifzwjid1uogSQB0XU
 w/8ltZv+2OWC0Ib6on4QvaFTSky/tzlw8fraqkDYptH9i8N98DMtcx1FtTPzZxpayK29qwTRtk9
 KG++T+9j5y4BCt+e9ey5Iqaxow9/PR/XkEdX+pdByIV/1PkI/4Xc+Otiks511BXD+S0ZCjE+M01
 Fqz0IYUvcD3+h7ydY+4Rv22jieWhY74Dh0vb0mdeMijQbr2DcMCSe/+K+h0eZmwZB6+STasFKwO
 3oYKOK691TUCErye2hQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39578-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E8CA4719C77

Before commit 4dc70713dc24 ("irqchip/qcom-pdc: Kill non-wakeup irqdomain")
there were separate domains for direct SPIs and GPIOs used as SPIs.
Separate domains can be useful in case the irqchip wants to differentiate
both of them. Since the commit unified both the domains there is no way to
differentiate.

In preparation to add the second level interrupt controller support where
GPIO interrupts get latched at PDC (but not direct SPIs) there is a need to
differentiate between SPIs and GPIOs as SPIs. Reverting above commit does
not seem a good option which leads to waste of resources.

PDC HW have the IRQ_PARAM register telling number of direct SPIs and number
of GPIOs as SPIs. Further PDC allocates direct SPIs at the beginning and
all GPIOs as SPIs are allocated at the end. This information can be used in
driver to differentiate them.

Add the support to read this register and keep this information in
struct pdc_desc. Later change utilizes same.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 764f7965cfb8..53a477aa9765 100644
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
@@ -92,6 +99,7 @@ struct pdc_irq_cfg {
  * @base:           PDC base register for DRV2 / HLOS
  * @prev_base:      PDC DRV1 base, applicable only for x1e RTL bug.
  * @version:        PDC version
+ * @num_spis:       Total number of direct SPI interrupts
  * @region:         PDC interrupt continuous range
  * @region_cnt:     Total PDC ranges
  * @x1e_quirk:      x1e H/W Bug handling
@@ -104,6 +112,7 @@ struct pdc_desc {
 	void __iomem			*base;
 	void __iomem			*prev_base;
 	u32				version;
+	u32				num_spis;
 
 	struct pdc_pin_region		*region;
 	int				region_cnt;
@@ -120,6 +129,7 @@ struct pdc_desc {
 
 static const struct pdc_regs pdc_v3_2 = {
 	.irq_cfg_reg	= 0x110,
+	.irq_param_reg	= 0x100c,
 };
 
 static const struct pdc_irq_cfg pdc_cfg_v3_2 = {
@@ -130,6 +140,7 @@ static const struct pdc_irq_cfg pdc_cfg_v3_2 = {
 static const struct pdc_regs pdc_v3_0 = {
 	.irq_en_reg	= 0x10,
 	.irq_cfg_reg	= 0x110,
+	.irq_param_reg	= 0x100c,
 };
 
 static const struct pdc_irq_cfg pdc_cfg_v3_0 = {
@@ -139,6 +150,7 @@ static const struct pdc_irq_cfg pdc_cfg_v3_0 = {
 static const struct pdc_regs pdc_v2_7 = {
 	.irq_en_reg	= 0x10,
 	.irq_cfg_reg	= 0x110,
+	.irq_param_reg	= 0x100c,
 };
 
 static const struct pdc_irq_cfg pdc_cfg_v2_7 = {
@@ -445,6 +457,7 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 	struct device *dev = &pdev->dev;
 	resource_size_t res_size;
 	struct resource res;
+	u32 irq_param;
 	int ret;
 
 	/* compat with old sm8150 DT which had very small region for PDC */
@@ -501,6 +514,9 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 		pdc->x1e_quirk = true;
 	}
 
+	irq_param = pdc_reg_read(pdc->regs->irq_param_reg, 0);
+	pdc->num_spis = FIELD_GET(GENMASK(7, 0), irq_param);
+
 	parent_domain = irq_find_host(parent);
 	if (!parent_domain) {
 		pr_err("%pOF: unable to find PDC's parent domain\n", node);

-- 
2.43.0


