Return-Path: <linux-gpio+bounces-38564-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uv7pB7AXMWoMbgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38564-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 11:30:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D94168D8C6
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 11:30:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OLbs50JT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LYBVEFTN;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38564-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38564-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFD61316FC46
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 09:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2016397699;
	Tue, 16 Jun 2026 09:26:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A4640BCCE
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 09:26:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781601980; cv=none; b=SLWLWiv3YuixnedqZE9OLkQrOGgwRWZAtkWbYi0fhMwzm93P5mFcgeO1mlHMr9u7oFAhNz4Njn3aQT8xs+7v2OdF7UjgE/nY0qjYNZnx6omOw0buLK39wDDtdyYOlIDDlcihEzXNnm4m5oBTo6a3tEQVmW5by+uYRRqypI6dSp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781601980; c=relaxed/simple;
	bh=CSw3MXB3MdnZcW76whpqiX6ywOX1cQiyugQbEEpTRCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i3RJIWV8kU9OULA9NslxXhxycBpdfShLP1HRIOR7OoksQy5SRw9stcKxIvGvx0u4WsrDCJZkiBjgsCcL096ZtEMIlqVwEGe1SyqmvCgmBNDxN0RTkdJAXNY0PgrfEtWDKmes8UlR+jmfDQbFFkD/FRKPz++J5KLMpP1Vzkpraag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OLbs50JT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYBVEFTN; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G8s4Wf1239686
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 09:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WWYZBKYLsWJGMOldqyhsKHNnWOcJD8luOJTZdj5u1p4=; b=OLbs50JT3ko6lv0G
	cNWDEl/ewwvkTEts+t8LFu4H4SQKNckloOWZ2Ggw6rvXqPAXZWRmIlDaKVm+iwNE
	wi//gTfufWY/GfHGKreKaBiS3FJuGaZkutalFw362DFL1Ock8kZRJnxgV2yICd2s
	U0bOpM3+cnf+DUZq1hHv9cbvBw+bRSJ7pP2PO4Fmap7H4maY7gxZo5Zr3gfrbnDn
	PuzGslEgAgWhJ2uf6kBTvsnMaie16JPBFdz+noPx8Nyb//l+W3OpqpY9bGtczhtd
	6iebrH5vL2gpdS/BWMfmUP4YhRruDsmWRDyXsiSL0Q/fEEcuGKLR9Z0PwOH0jdh3
	UTGIbw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu3ct04dk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 09:26:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso111467065ad.3
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 02:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781601978; x=1782206778; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WWYZBKYLsWJGMOldqyhsKHNnWOcJD8luOJTZdj5u1p4=;
        b=LYBVEFTNokK3dKXl8gb0eF+tvFj7HmjVT3hQo7JgS/F31eUrSPwxZVQ4hVooN1QkhS
         i254t4vCPgUEq4sjeGiiqKnklWsd9Lh/ZJBiCfWgvsyz/Rgih4TBrFBHMuhOTS/TmP8P
         m9NLyYq0x7MEPze8tRv21yldFX0awqT6sjKN2wGsCXc6sRFUqh7FxOas8OBv5YgSVLjb
         afH7uuCbnjDId7Ls2whwy7l53/Eajl4lRQVya74fpzGC1szhwuUpRoycnGSs4+KrHpMu
         U3MGkkSe6UvcyEFtsXfcUcU19qFJUzMDf3lWoz9gTetnuARMfhnx+auEhw5k6JWMwHa8
         MIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781601978; x=1782206778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WWYZBKYLsWJGMOldqyhsKHNnWOcJD8luOJTZdj5u1p4=;
        b=Yv733Rr1F8208disLtFY97C+micY1dgFtiNDC4VEc2l4sKkKTjEVNVM9hKvCXZlTUa
         JPueyf/34jvIBc+wG3c0Ds+NDbwNnwst+90s4c3p6Qdahm5kw792NtIxcI18vNCHbvi/
         rAMaEzC72qZqeeeOyiHs5FXNHY0yDuOXFh1DuaC/ls7ApKxgeGQIBXR2IhJ0a7TYiXvw
         yGaEWwjpBBjlMxwCQt1Zgb+Fenlh810yBtTU/twCc92yh65Ch0xXndlAZbqVjLPimU2t
         ENgvb5zZVhR16/Ag2ALno08RCWmSgunvMiSI1HlHL2NsuTeua2B41mL2UkpmHSpJ/vcp
         aLxg==
X-Forwarded-Encrypted: i=1; AFNElJ+pXBpyghjAHefjgeu9msc/mDNinV04R/H4zNZP4F7HxnbsvURoy6t7xehZqjUx3NmgWDY/y+EaP6+a@vger.kernel.org
X-Gm-Message-State: AOJu0YyVsM0OKcWfIR88AktDiIOEE6FQ7SWPrucXJr7sEcTM4rE2213I
	mZzBdP/1OC261UeSOjHv/7rpVPXuqRONC7wZi8h8rPTuWSvP7ElcTh49ctFdQG0M1nlSTFVF+4G
	srVbpgzqM3jDtquaeGqgorJMMedaFz6QQJN2HLtUULVnFeNCaInNazcjG07/2zsRa
X-Gm-Gg: Acq92OEJHWdpUfTAf3HnUrOktfLB+q6Wc3O+6AjKOf+mW9eq5lCPrRw+gKmYPuiLiHE
	1sZlEf2Cv/FLobzgHDmatMuNu4VaDp3rnPJsfEa7m9q3wBc+BraGIk159MiRDuIpVwqg5e29fma
	SrEMoo+llrCakZCOrVHmB/4NMhjdTluX6Kj9m2CLs2fSnQN1oBTk8FKdIgEgXVQcbWYyLIKblnl
	iRZlQaPlHYR8iYH2eJEXlyhOHHFLYZG6OO2/4v47vAcMxw9sHHaqwMbGpNYeWoSXIqZxkIsqOOp
	jq9WDnI9yPlhRQhv9l4jzn4wDVG8UvANfvZe0gt+T5AzMQxXZyZpzknioQOVjl/eJmSQSUJjB16
	di8UqrOt0vTM2y5Kb/fIwPjSGLq0tkvfOEjMZWZAPFFZwIU9rjg==
X-Received: by 2002:a17:903:3b86:b0:2bf:114b:924 with SMTP id d9443c01a7336-2c69a1c83ddmr25910345ad.34.1781601978182;
        Tue, 16 Jun 2026 02:26:18 -0700 (PDT)
X-Received: by 2002:a17:903:3b86:b0:2bf:114b:924 with SMTP id d9443c01a7336-2c69a1c83ddmr25910045ad.34.1781601977753;
        Tue, 16 Jun 2026 02:26:17 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e586bsm130042025ad.12.2026.06.16.02.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 02:26:17 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:55:53 +0530
Subject: [PATCH v3 3/8] irqchip/qcom-pdc: Remove pdc_enable_intr() wrapper
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-hamoa_pdc_v3-v3-3-4d8e1504ea75@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781601959; l=1793;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=CSw3MXB3MdnZcW76whpqiX6ywOX1cQiyugQbEEpTRCs=;
 b=cbX7XyT/u8DvjLrvqyg2PFWay5po2rFtAxTJAE4ImX9XjlYmS/pMdjkJGSYdIFFDkJZ4Wu9YD
 uq1tZIvOopCBnZQU8wPq/tuEBMFk3+ZhorAC7VmLEDFwGAkcuJFRUwh
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a3116ba cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=X0Te3_zP_kP_59l6vBQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: gqdC1DwTfEibJZMU5oXvhUy3n96CMXfG
X-Proofpoint-ORIG-GUID: gqdC1DwTfEibJZMU5oXvhUy3n96CMXfG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA5NCBTYWx0ZWRfX3nsN/45v+KMb
 36sreXKbplxIT2Bxyb66E55EAtvV0Qrxa03x3nLdw7da/CBL5/4URttQZTtAOFUbWyKTFdnKe0T
 FJyHzNIdkVIQdDM4xUSQFQrQSWCOuPniXiBNrwxE9MqCfaCe2VubFEknNVU22WnqQzew1d/rWRF
 U5yzM4oXNZLybIFphuDnHUz0aT7GbpH/ftCZMSWHaMV7wZVnbtyNglWjT5CU0zXxU398/OJC/3w
 H74F0CVKee8Ixr09c7851q+8Yj+zAeNpp0Bo94AJXiGPm/nkE50iKgxZBZEPodusds9P8FEjWF2
 Gmhu773yHM1pFCE0baVTNAdqyQgyOmWEOYvr8zynMXpd+Vp8SgtQBhT4WaiA80BRrYzyKdeMvpt
 vcG6nRGnSoPM5qCpEFL7z6eEt7Sg3KnQ7YTBA5rsWNRfKQwczz7XlJdGzdL+16Iw2sCrRPbQMqt
 eQfnjg4ZSF6VqwWYYVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA5NCBTYWx0ZWRfX6t2CHIR/ycvU
 RCClkSL351Ea7auN0lvd5gj6TsRooEoKP855x3V2MzSrCWVovHyClZ9k8/QRTT72Y4ZTItpM3dx
 EHGQRLQrKKau2TpOo3DnlPnZgUbsRQE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38564-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 6D94168D8C6

pdc->enable_intr() function already points to respective version
specific enable function. pdc_enable_intr() now only kept as wrapper.
Remove the wrapper and invoke pdc->enable_intr() from caller.

Locking in pdc_enable_intr() applies lock to all pdc->enable_intr()
however its only required for pdc_enable_intr_bank() which uses
a shared bank across all interrupts. pdc_enable_intr_cfg() do not
required locking as IRQ_CFG registers are one per interrupt. Move
locking accordingly.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index b9acb0f25c9c..6c556464d37c 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -206,6 +206,8 @@ static void pdc_enable_intr_bank(int pin_out, bool on)
 	index = FIELD_GET(IRQ_ENABLE_BANK_INDEX_MASK, pin_out);
 	mask = FIELD_GET(IRQ_ENABLE_BANK_BIT_MASK, pin_out);
 
+	guard(raw_spinlock)(&pdc->lock);
+
 	enable = pdc_reg_read(pdc->regs->irq_en_reg, index);
 	__assign_bit(mask, &enable, on);
 
@@ -223,22 +225,15 @@ static void pdc_enable_intr_cfg(int pin_out, bool on)
 	pdc_reg_write(pdc->regs->irq_cfg_reg, pin_out, enable);
 }
 
-static void pdc_enable_intr(struct irq_data *d, bool on)
-{
-	guard(raw_spinlock)(&pdc->lock);
-
-	pdc->enable_intr(d->hwirq, on);
-}
-
 static void qcom_pdc_gic_disable(struct irq_data *d)
 {
-	pdc_enable_intr(d, false);
+	pdc->enable_intr(d->hwirq, false);
 	irq_chip_disable_parent(d);
 }
 
 static void qcom_pdc_gic_enable(struct irq_data *d)
 {
-	pdc_enable_intr(d, true);
+	pdc->enable_intr(d->hwirq, true);
 	irq_chip_enable_parent(d);
 }
 

-- 
2.43.0


