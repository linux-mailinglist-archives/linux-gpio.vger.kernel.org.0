Return-Path: <linux-gpio+bounces-38563-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xIiMD5MXMWoJbgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38563-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 11:29:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F4B68D8B7
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 11:29:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QEI90KEe;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FGiVdXwf;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38563-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38563-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27C80315B6CC
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 09:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFDD9421F07;
	Tue, 16 Jun 2026 09:26:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3572A4218B5
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 09:26:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781601977; cv=none; b=F6gfjrDUVHGHsGSwDGRsynSY+z+SxJrIIwSxjPtZqdDM4BUI/KPnHKep977PwCkqUYALZF+EUfRmWNg1/nGTsc/T29XPrsaYsa7+1JTsm2IfzV5v5W+tTA0MkDGe+/d7qXyaW5WJ5o7EtjmQQNR+OkHPqgROVfER3Tzqxjib4/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781601977; c=relaxed/simple;
	bh=kqIjqDYR4ke6VuM8t26dTGAPRkmEzhtuCJtfJvMpbAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lRUBWnxfRXakgeA44NZO9nK+YgR/L7sU1EOh0LLEpJ7UqXewl5j1EqzZiE3spHOEaS25T5oUrXlLp46pmLwf/zYY/URbZQ51KVqlC4+YNHWyKGB9aOJT7q6IdSmjIX2XRZ6Ae0Or5t5WvXTWqpm5ze7oOboeaYip/gUBWEck24Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QEI90KEe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FGiVdXwf; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G8OU5G006652
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 09:26:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T0DDR+QZuJDNk0u0Q5tKxNS4tYvcWqOcWxrTnyTHglY=; b=QEI90KEeeHeqkTYg
	1UprCGDMyGhpqpJoC9/SY32NuW9fhaAZpvCEdUe3wEnTeLD3bbVMzEOtjezCVg6q
	wa0Q9Uu/gY2EHYv02B4EoEzaCMtoKCblMeS1nu45FittL7qTFvHRIsOJRgLWkJs0
	X4JaSZ2JOiQw+TlXhoq5QDk5IQ7UFgfNCXFEw9PxZr2c4lMw/kqwJymcY81ghoFU
	+OrKKKbpTiCMuBelfW5Ry+GapMou7xwSU9krO7usuocMRAHMiQ+hBDtef9yC6xuz
	iSmfqwJCCgDxIDI6ew4AoUvusO48K2mOvyCEqmxZxXomBMqzLbB62y+GGkqWB/hB
	YbOIew==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu2xs88ex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 09:26:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c32f4b1bso43405485ad.2
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 02:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781601974; x=1782206774; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T0DDR+QZuJDNk0u0Q5tKxNS4tYvcWqOcWxrTnyTHglY=;
        b=FGiVdXwfh0bybLSJvNwleo7LvU8h8ixjWGpqbXmYe+6XDGOXlGHNM/UbRlpDy8Mli1
         2A9mazXsGnScbSwRBuPY3bXFVd4YjWKATo81KKMd81hki8WyXhJm7IA01SjyCUEPho8x
         8EN3a2vU0gGN4F81SvYT/KHNcejU9JadcDnIaLhca5UzO3Ndia850EX34Xk8x2uf2Fhv
         OIvh0naIYuRLyjLTt9MFyGmsC+/CkHte+r//KGnTo+QKAIDZ69kXTCz+VyceBGLz938o
         aFWJUMNY1kXNgtqLTAbijq86ounSNSotv1VDjpDQTRkSOwn2gbHa32DLW886JkrclqZS
         DUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781601974; x=1782206774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T0DDR+QZuJDNk0u0Q5tKxNS4tYvcWqOcWxrTnyTHglY=;
        b=kvojcR46EmQHXmK8Z9GkllH8Cxo9upGll7wBCRB0a50Efh6bcAeS6oPUZDjSl5N0wb
         n07jy5iyzPu7r71JUtJ4AFzF5IC/uGqEe6DwUNcTpWOUBUo20uMYpbO92Z+1Td/IKhtV
         j12sU8CMMChodmA1+3zArAKPQRtH0wTHlswu0yZjrDhokIJNwpeMjt1JMJwByY7U6wpt
         pZiZ+ZUkjDiEgdnKIkI7Cu0j9i0Yno2VvyLW6iW/PoTxzH3HDihUxDMVD8J3f7WTAC04
         FP4ZBg8cUCq0Emlv6IsW0CglHEWgNIUBwnOL1ptsvRoD/px4df+SQ3fpKrCP5ncU1Q8l
         dfDg==
X-Forwarded-Encrypted: i=1; AFNElJ/sAqP6FgSpbdPzz//3GQ+xWPzBts7/TJgAmr9aTwS1Cw1oe7nhPhCZ3GazKgm2dKqDrXlyzhzgi5bK@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx9tMieyY6/rH9cOOLrjBopqeu5yyMM3JVLu93KFh9KBw54EPu
	MvhrbrpkX9yi2SH2cGbdCvu2fEN569rwSsneXcg0Kl9Hk+KuL1oByP0q8NmL/wxpKAkUkLHhyUL
	B+nd7qn8vYZXq591V+JXhO/jT0kduV5jjSqgoRFyTubHTKjusyK+WQgGW1gx3YtS+
X-Gm-Gg: Acq92OGN8kFElczOvhvBXAXPSVEyZcm3FYAzduz5Am263OW+kXrSA5ucc2JJDCJ0oP7
	sRumkAzOeC2S0ydYRq6d7sk+78ye1mSm5HomyGgRzib43V1YS0xDPFeFZ+pOh6Vk9aI2qT33G9h
	gmUQMuxtTtvp9Q8mSjyv8bvhzWI15TaOeejuGbTQ1muKCrPR3GseNJe3Dh9pDN2g7OVoyKi5JfN
	elQNC8SvV/j6YsJVlPyjMHcbXsPUlLJGT0diG7dn8nw/45czUaAO4dEqhi7qagP0kJH+8BS3hC4
	vMhWP4PRY0KPljmpwh2VZw8fPvUwgzMe5JrbZQkIDUN4wEMYVCJ6aQWF552dE+rGM3Bn8Pm9x2D
	bh6DHGi1obfeYhL0PIJs6mUjY3oBcDb8MgXzGcKP3XgvbZhZysQ==
X-Received: by 2002:a17:903:ac5:b0:2bf:3309:ecce with SMTP id d9443c01a7336-2c664209915mr156532765ad.28.1781601973760;
        Tue, 16 Jun 2026 02:26:13 -0700 (PDT)
X-Received: by 2002:a17:903:ac5:b0:2bf:3309:ecce with SMTP id d9443c01a7336-2c664209915mr156532485ad.28.1781601973324;
        Tue, 16 Jun 2026 02:26:13 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e586bsm130042025ad.12.2026.06.16.02.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 02:26:12 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:55:52 +0530
Subject: [PATCH v3 2/8] irqchip/qcom-pdc: Move all statics to struct
 pdc_desc
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-hamoa_pdc_v3-v3-2-4d8e1504ea75@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781601959; l=6082;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=kqIjqDYR4ke6VuM8t26dTGAPRkmEzhtuCJtfJvMpbAM=;
 b=srgoGzib3Dd23L6qnJC0+D8d/o6zJLLFH/yitBVBPHtaAun7m9j05SM9Ifkp+q3/Sz5a6CdZs
 FoThiwev4fQCDvM6oUPtBgPxtCoXVhcAHeKLfG+moree7TpziOgd3F7
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: vbVmaXCuXnQAKj8raZUkgtKZDfqJ0BhY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA5NCBTYWx0ZWRfX2NnkmI61d+jO
 up/EVy2EulZL73M5tryIu7A5T01m397CI3Z6k6e9OHV1HoG+LjjZp+3D7JtMC2RyYfx1x5S3uF4
 AeJ+dPFruOasqnAR8gxmQqoAVzLdPU7yuet/ZsakAs4qYLWbzvGD6xyhC91pqeEt+1A+VjoUeOM
 9s5KwDg83p/9HhDrMX4ywyAiUhkvYd5dNLQb+T1LUeFJyr7ss5I9Tp3jXCES3IHdUEh0D7UYJ1x
 i13iIwdH+RSgZzqpgVHXp5W19G2BYc+1hrP9xqXGNBvBxmpU6AYvsMQCaGC+Y9WhWFjERv/dFVD
 8me+Q3MF5+OtN7L9FA1zNXspVoez+MXwjysicIf+VwORxAY96/pu77knk0qpeRets4SlYBJFTXv
 OyfYoHxtua0e7XRJSCozT/tHddEy0b+0p46Bn7tgn4EdSXEsujC6D9lzyEZ5kXywc9vIxG1dpd0
 Wt9mxL1oeV3RHPH0oTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA5NCBTYWx0ZWRfX6XaRaUlzrtcD
 xFFXrsU3ryNpFW1tN403kE4DFpURRuv6MMR48Y3FaYZtDNcM1Xe2aVycwkj4Pm0dm9o/6gIO9vn
 dN0xOGBhsjp09FQe9M49wRoK9Fg8TQw=
X-Authority-Analysis: v=2.4 cv=MdJcfZ/f c=1 sm=1 tr=0 ts=6a3116b6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=BaKF0RVnka9X5CLJVdQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: vbVmaXCuXnQAKj8raZUkgtKZDfqJ0BhY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38563-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 88F4B68D8B7

There are multiple statics used. Move all to struct pdc_desc to better
align with versioning support. Document them.

No functional impact.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 77 ++++++++++++++++++++++++----------------------
 1 file changed, 40 insertions(+), 37 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 23276325211d..b9acb0f25c9c 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -92,15 +92,30 @@ struct pdc_irq_cfg {
  * @base:           PDC base register for DRV2 / HLOS
  * @prev_base:      PDC DRV1 base, applicable only for x1e RTL bug.
  * @version:        PDC version
+ * @region:         PDC interrupt continuous range
+ * @region_cnt:     Total PDC ranges
+ * @x1e_quirk:      x1e H/W Bug handling
+ * @lock:           lock for IRQ_ENABLE_BANK protection
  * @regs:           PDC regs (IRQ_ENABLE_BANK and IRQ_CFG)
  * @cfg_fields:     Fields of IRQ_CFG reg
+ * @enable_intr:    pointer to enable function based on PDC version
  */
 struct pdc_desc {
 	void __iomem			*base;
 	void __iomem			*prev_base;
 	u32				version;
+
+	struct pdc_pin_region		*region;
+	int				region_cnt;
+
+	bool				x1e_quirk;
+
+	raw_spinlock_t			lock;
+
 	const struct pdc_regs		*regs;
 	const struct pdc_irq_cfg	*cfg_fields;
+
+	void (*enable_intr)(int pin_out, bool on);
 };
 
 static const struct pdc_regs pdc_v3_2 = {
@@ -138,11 +153,6 @@ struct pdc_pin_region {
 
 #define pin_to_hwirq(r, p)	((r)->parent_base + (p) - (r)->pin_base)
 
-static DEFINE_RAW_SPINLOCK(pdc_lock);
-static struct pdc_pin_region *pdc_region;
-static int pdc_region_cnt;
-static unsigned int pdc_version;
-static bool pdc_x1e_quirk;
 static struct pdc_desc *pdc;
 
 static void pdc_base_reg_write(void __iomem *base, int reg, u32 i, u32 val)
@@ -199,7 +209,7 @@ static void pdc_enable_intr_bank(int pin_out, bool on)
 	enable = pdc_reg_read(pdc->regs->irq_en_reg, index);
 	__assign_bit(mask, &enable, on);
 
-	if (pdc_x1e_quirk)
+	if (pdc->x1e_quirk)
 		pdc_x1e_irq_enable_write(index, enable);
 	else
 		pdc_reg_write(pdc->regs->irq_en_reg, index, enable);
@@ -213,21 +223,11 @@ static void pdc_enable_intr_cfg(int pin_out, bool on)
 	pdc_reg_write(pdc->regs->irq_cfg_reg, pin_out, enable);
 }
 
-static void __pdc_enable_intr(int pin_out, bool on)
-{
-	if (pdc_version < PDC_VERSION_3_2)
-		pdc_enable_intr_bank(pin_out, on);
-	else
-		pdc_enable_intr_cfg(pin_out, on);
-}
-
 static void pdc_enable_intr(struct irq_data *d, bool on)
 {
-	unsigned long flags;
+	guard(raw_spinlock)(&pdc->lock);
 
-	raw_spin_lock_irqsave(&pdc_lock, flags);
-	__pdc_enable_intr(d->hwirq, on);
-	raw_spin_unlock_irqrestore(&pdc_lock, flags);
+	pdc->enable_intr(d->hwirq, on);
 }
 
 static void qcom_pdc_gic_disable(struct irq_data *d)
@@ -350,12 +350,10 @@ static struct irq_chip qcom_pdc_gic_chip = {
 
 static struct pdc_pin_region *get_pin_region(int pin)
 {
-	int i;
-
-	for (i = 0; i < pdc_region_cnt; i++) {
-		if (pin >= pdc_region[i].pin_base &&
-		    pin < pdc_region[i].pin_base + pdc_region[i].cnt)
-			return &pdc_region[i];
+	for (int i = 0; i < pdc->region_cnt; i++) {
+		if (pin >= pdc->region[i].pin_base &&
+		    pin < pdc->region[i].pin_base + pdc->region[i].cnt)
+			return &pdc->region[i];
 	}
 
 	return NULL;
@@ -411,39 +409,39 @@ static const struct irq_domain_ops qcom_pdc_ops = {
 
 static int pdc_setup_pin_mapping(struct device *dev, struct device_node *np)
 {
-	int ret, n, i;
+	int ret, n;
 
 	n = of_property_count_elems_of_size(np, "qcom,pdc-ranges", sizeof(u32));
 	if (n <= 0 || n % 3)
 		return -EINVAL;
 
-	pdc_region_cnt = n / 3;
-	pdc_region = devm_kcalloc(dev, pdc_region_cnt, sizeof(*pdc_region),
-				  GFP_KERNEL);
-	if (!pdc_region) {
-		pdc_region_cnt = 0;
+	pdc->region_cnt = n / 3;
+	pdc->region = devm_kcalloc(dev, pdc->region_cnt, sizeof(*pdc->region),
+				   GFP_KERNEL);
+	if (!pdc->region) {
+		pdc->region_cnt = 0;
 		return -ENOMEM;
 	}
 
-	for (n = 0; n < pdc_region_cnt; n++) {
+	for (n = 0; n < pdc->region_cnt; n++) {
 		ret = of_property_read_u32_index(np, "qcom,pdc-ranges",
 						 n * 3 + 0,
-						 &pdc_region[n].pin_base);
+						 &pdc->region[n].pin_base);
 		if (ret)
 			return ret;
 		ret = of_property_read_u32_index(np, "qcom,pdc-ranges",
 						 n * 3 + 1,
-						 &pdc_region[n].parent_base);
+						 &pdc->region[n].parent_base);
 		if (ret)
 			return ret;
 		ret = of_property_read_u32_index(np, "qcom,pdc-ranges",
 						 n * 3 + 2,
-						 &pdc_region[n].cnt);
+						 &pdc->region[n].cnt);
 		if (ret)
 			return ret;
 
-		for (i = 0; i < pdc_region[n].cnt; i++)
-			__pdc_enable_intr(i + pdc_region[n].pin_base, 0);
+		for (int i = 0; i < pdc->region[n].cnt; i++)
+			pdc->enable_intr(i + pdc->region[n].pin_base, 0);
 	}
 
 	return 0;
@@ -481,13 +479,16 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 	if (pdc->version >= PDC_VERSION_3_2) {
 		pdc->cfg_fields = &pdc_cfg_v3_2;
 		pdc->regs = &pdc_v3_2;
+		pdc->enable_intr = pdc_enable_intr_cfg;
 	} else if (pdc->version < PDC_VERSION_3_2 &&
 		   pdc->version >= PDC_VERSION_3_0) {
 		pdc->cfg_fields = &pdc_cfg_v3_0;
 		pdc->regs = &pdc_v3_0;
+		pdc->enable_intr = pdc_enable_intr_bank;
 	} else {
 		pdc->cfg_fields = &pdc_cfg_v2_7;
 		pdc->regs = &pdc_v2_7;
+		pdc->enable_intr = pdc_enable_intr_bank;
 	}
 
 	/*
@@ -506,7 +507,7 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 			return -ENXIO;
 		}
 
-		pdc_x1e_quirk = true;
+		pdc->x1e_quirk = true;
 	}
 
 	parent_domain = irq_find_host(parent);
@@ -521,6 +522,8 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 		return ret;
 	}
 
+	raw_spin_lock_init(&pdc->lock);
+
 	pdc_domain = irq_domain_create_hierarchy(parent_domain,
 						 IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP,
 						 PDC_MAX_IRQS,

-- 
2.43.0


