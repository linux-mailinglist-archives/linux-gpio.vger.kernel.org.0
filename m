Return-Path: <linux-gpio+bounces-38562-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BotjGSAXMWrxbQUAu9opvQ
	(envelope-from <linux-gpio+bounces-38562-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 11:28:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DAC68D879
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 11:27:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mTbPVpt6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="A2/3OdH+";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38562-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38562-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 909673118BC3
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 09:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F37B4219EA;
	Tue, 16 Jun 2026 09:26:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F173397699
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 09:26:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781601972; cv=none; b=p8NDQyk+6e6E/s5jR1fess3ctX19ANRaa8nnt4WaPeTDQ7FQv48VSckOF0SVsLGpTY4gzzcRnI/QEAF9z8O9mlOvFpV50uku4/hxXP2A5HMz6TtfAQW1N5r7VanD3+sueLi+aJgVeT7H6sgtxR+bM6uZ3GxrrKOXWktCP3s3MzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781601972; c=relaxed/simple;
	bh=itbCX+K13JF6uUB7SNxRN4m64XA2MR8iGs/BblPnjA8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cUxWORkNngHvCqeUu+X5BI+xgtvPi1AWZeGX1rclt2ZVHNn9vGC0ogj9Wco53/i5PAMyepcccW6ST/WtcRHMQluBs0CKtJ0wMI2o09RVprKJFuIzDjAhIh+HwjBWCPx+pS0XxOXEp5p2j4ih0XQQM+u0trdBa8mQ89bK3i+kC0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mTbPVpt6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A2/3OdH+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G8n7t42663496
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 09:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O1fxxQckMesfjpPmPTUR+YdqKgcA3suaRxhIluX0dhA=; b=mTbPVpt6J7ZAgTAZ
	bTwYOD7Ma67YgwA45QSUtJXgl11n1DcdlSH1qGeQ10dOBqSz+9JsmsXQlkNYDLBc
	oQT2RoPpNGC8iyEFx+HWjH/yMi7nbxaSPViub3BeRzZTpUrlWQkLmL5izwqxvbUK
	DIio4luES1Hxtl7LRp4TyYZQn+KXJnVim1Vw4+NatNncrNYVw4RId/fjQs58uQjO
	N3S35K8RiHWO66VIEHwcwfalIZME3u2QomxUWVFAnJGhhRuIKQW6GcAYSwCB1dbW
	9DOjyBiXqY1l4zT9ei+QzUWjdywfhHkV0UbW8hkxPdijcR/g+mQr7Fy5kS19OZjE
	8TmfVw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etx8k9jp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 09:26:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d992fa39eso5087818a91.3
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 02:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781601969; x=1782206769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O1fxxQckMesfjpPmPTUR+YdqKgcA3suaRxhIluX0dhA=;
        b=A2/3OdH+6Gh1YMmrLW35c9taZpvhwYz16uDKHobDlFe3YSMfpSmK082Mq0YLIAZeKW
         3VPK8+R6z28fU/7a84riF8EsxQNPTA4tMadVMBUvwbJmoSX8zVfOuKanGxO+28I/fsWQ
         +Rf0TvGFF5bDr38kramc0qH4TZ8nbsiiMMhL6ESElHPJW4PHGBTC0R9qFvpo5Zsiv2wi
         8vxVmpSQqvD7KaT1I2lw0D5ewb0DQTLpqn41cgJqbaV8fTh4RLeDZrLkwdd09nwKw3Lt
         oDW8mPgU7vAkz5nUKU28lfviU4lFrUpI/AN5jJQ/sowVY9ohIUkO5ZPxZHUhzxjJRtgv
         SQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781601969; x=1782206769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O1fxxQckMesfjpPmPTUR+YdqKgcA3suaRxhIluX0dhA=;
        b=PfLWb2hEKnWWPO3s8+O4Erzi7vwUyjVMy7NWzc9H2vquynNyudS8foEUM63KBfu+fA
         86PCUcLz3X/KsjjpKA34P0pxK/6U3GKaeF0RUbp7klBcU4LzaWUHY/VyIkB7BmdcyZjw
         D0qbsoj72r2+kqfpFEGVK/MO5ERK03+I95stdJHBXfG+Tb/VocNk50txYSFq1E+HfWj0
         DH3mH0L3vKMCtt2jp6z16FFvkl4ShxDQIMfTrFsXKNaLFWRYz7Qa2rK2kyOjC1M84OF7
         WnWQgGY/qPE66M+UjiVG/wgE3cN590ekpLPDomAewNb4lXaQ9Cecg+E67I48eYvb5m5q
         IJyg==
X-Forwarded-Encrypted: i=1; AFNElJ/vSfqx1Flqe14R82B/amdCAXZXsUNEQJXDx8iZPQw5s9y6lK4qv4yQRCrwRhQeIbFZJjm37u1uOhH/@vger.kernel.org
X-Gm-Message-State: AOJu0YwXAcPvoRp/hMcH5529P7hVwrms4ae17FBTSqwiMSDUCCdZPPSG
	om+8gxoJ414kzxRQjZ3f1NbDgrWNOh+KBga3tiXBrc64RrjbUW9ND3adQZEvGu2qB/1z31KdJ0M
	Ggalwc9RapsYH559ZEbUq43GZwh8Gdx7XHMiTdAws7oV2SmbX52DDXQTXOklnKxjJ
X-Gm-Gg: Acq92OHBVGOY/wqAqG3GXv3z6WayJK0lcZ0DRvcUQGjs+pXqX4z5dqxbulTAczxbJ99
	dasiAs/mgyxejQXr9u+xX9OduVw7u7tn7DMCZMSqvT4q5zFXmBuhxY8+oUjE09wis8GI3peRbCg
	eVEZiIEKPGF9wrZDPSOjQvBIkW5Nyp7UJd2Iw/NbYLl96LD3zLIHSViZLAKlh3Dr90Njy8yqldq
	z1uyUTrSkNeMskxOLPlV+RkMPKiC1lxG9VhDpmnACeo44XO+dq/Z1UIzcU7Ljsb9oxIJ1GRy9sg
	TvkaSuYCwGkOhWYA0Sq5QFMQUlXSzr+adzoTEhlgtUVp7ztIJdU2QLF+k8/4xwkJjDVD7gCqBad
	FCAKCW7B4XJkE2wZkHMikfXQ3qui6fi+laiCCiFR91ndDgGRJoA==
X-Received: by 2002:a17:903:2304:b0:2c0:eee2:fc40 with SMTP id d9443c01a7336-2c41050b417mr195047065ad.3.1781601969193;
        Tue, 16 Jun 2026 02:26:09 -0700 (PDT)
X-Received: by 2002:a17:903:2304:b0:2c0:eee2:fc40 with SMTP id d9443c01a7336-2c41050b417mr195046815ad.3.1781601968701;
        Tue, 16 Jun 2026 02:26:08 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e586bsm130042025ad.12.2026.06.16.02.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 02:26:08 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:55:51 +0530
Subject: [PATCH v3 1/8] irqchip/qcom-pdc: restructure version support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-hamoa_pdc_v3-v3-1-4d8e1504ea75@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781601959; l=13648;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=itbCX+K13JF6uUB7SNxRN4m64XA2MR8iGs/BblPnjA8=;
 b=KqKSABi8iCI00DEJLgxDcNHuSfh+jOw0osabAo04jVZD5aNMxhIA6HMCZuzXxQzNQi8pnXuCz
 srsE6xjE5IzC+eDJrFINY3jMfDSADHtrmuNDM6lWwe/y7cyDzoATKQN
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA5NCBTYWx0ZWRfX4QS1Xu2mDl3Y
 C7AfzmE6lth5V9ON7j+1nmIsphK3eU+V10ET6Y+9+cFlZPpofDNkNuIUR7xRvtCL9gMKVlEqix+
 +mUjnwVoluGOHjNllIviwcWrUyiuVu5HJFOdDrSVc79/B0ydtewYHSXyADSN/hKQbN9jFJpqxvH
 k+VpYLKEzPXxeBV7SZyNLBaRgHqwW2xtyeS3QPquTLIHc7J2BtqNxvIa6rE3d+xpYJJf90Q/ag1
 YywtH7nt1tYCBY+JB8bGwsLyOeGVMXXzKgR+Xcqy0RKINcBm5NanzKSlDxvz0Sy4i9//jdGng/l
 FyhzoXJ0Fb+jWFTaTbb4yN6iUqDfNhAxqA0Lc30xf/I6HIcxSoqVIUeYxs8JoACyAZ6zUjb3vHd
 aje9e87FsiiVHfg92AhrABDRACUrsVUHjx5Vj6wenCLfqGtP9C+s+u358zmIa6aH385S3BmdzlE
 7sAxDVygo+WG8nD/fGA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA5NCBTYWx0ZWRfX3kpo5bNdaWOz
 rvfXrONcrIOxLmgVcQflVGJMUt0H2lNwGMkV9Y/oRXXlDtPkLXbSMXj2VJX0cSr0kW2NIuB5Ij/
 QO1jnhxCsv9yBlFDMpoY1BwMttUwTec=
X-Proofpoint-ORIG-GUID: 6-2Z0LrbpPNzA1fLgS-XPDAOsI4T5Eyl
X-Authority-Analysis: v=2.4 cv=dZawG3Xe c=1 sm=1 tr=0 ts=6a3116b1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=xNiqBINRuVKY77TANa4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 6-2Z0LrbpPNzA1fLgS-XPDAOsI4T5Eyl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
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
	TAGGED_FROM(0.00)[bounces-38562-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: B4DAC68D879

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
 drivers/irqchip/qcom-pdc.c | 207 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 149 insertions(+), 58 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 2014dbb0bc43..23276325211d 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -21,21 +21,12 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
-#define PDC_MAX_GPIO_IRQS	256
-#define PDC_DRV_SIZE		0x10000
-
-/* Valid only on HW version < 3.2 */
-#define IRQ_ENABLE_BANK		0x10
-#define IRQ_ENABLE_BANK_MAX	(IRQ_ENABLE_BANK + BITS_TO_BYTES(PDC_MAX_GPIO_IRQS))
+#define PDC_MAX_IRQS			256
+#define IRQ_ENABLE_BANK_MAX		BITS_TO_BYTES(PDC_MAX_IRQS)
 #define IRQ_ENABLE_BANK_INDEX_MASK	GENMASK(31, 5)
 #define IRQ_ENABLE_BANK_BIT_MASK	GENMASK(4, 0)
-#define IRQ_i_CFG		0x110
-
-/* Valid only on HW version >= 3.2 */
-#define IRQ_i_CFG_IRQ_ENABLE	3
-
-#define IRQ_i_CFG_TYPE_MASK		GENMASK(2, 0)
 
+#define PDC_DRV_SIZE			0x10000
 #define PDC_VERSION_REG			0x1000
 #define PDC_VERSION_MAJOR		GENMASK(23, 16)
 #define PDC_VERSION_MINOR		GENMASK(15, 8)
@@ -46,6 +37,98 @@
 
 /* Notable PDC versions */
 #define PDC_VERSION_3_2			PDC_VERSION(3, 2, 0)
+#define PDC_VERSION_3_0			PDC_VERSION(3, 0, 0)
+#define PDC_VERSION_2_7			PDC_VERSION(2, 7, 0)
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
+ * struct pdc_irq_cfg: bit fields for PDC IRQ_CFG register
+ *
+ * @irq_enable:     bit number for IRQ_ENABLE field
+ * @irq_type:       GENMASK for IRQ_TYPE field
+ */
+struct pdc_irq_cfg {
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
+ * @cfg_fields:     Fields of IRQ_CFG reg
+ */
+struct pdc_desc {
+	void __iomem			*base;
+	void __iomem			*prev_base;
+	u32				version;
+	const struct pdc_regs		*regs;
+	const struct pdc_irq_cfg	*cfg_fields;
+};
+
+static const struct pdc_regs pdc_v3_2 = {
+	.irq_cfg_reg	= 0x110,
+};
+
+static const struct pdc_irq_cfg pdc_cfg_v3_2 = {
+	.irq_enable	= 3,
+	.irq_type	= GENMASK(2, 0),
+};
+
+static const struct pdc_regs pdc_v3_0 = {
+	.irq_en_reg	= 0x10,
+	.irq_cfg_reg	= 0x110,
+};
+
+static const struct pdc_irq_cfg pdc_cfg_v3_0 = {
+	.irq_type	= GENMASK(2, 0),
+};
+
+static const struct pdc_regs pdc_v2_7 = {
+	.irq_en_reg	= 0x10,
+	.irq_cfg_reg	= 0x110,
+};
+
+static const struct pdc_irq_cfg pdc_cfg_v2_7 = {
+	.irq_type	= GENMASK(2, 0),
+};
 
 struct pdc_pin_region {
 	u32 pin_base;
@@ -56,12 +139,11 @@ struct pdc_pin_region {
 #define pin_to_hwirq(r, p)	((r)->parent_base + (p) - (r)->pin_base)
 
 static DEFINE_RAW_SPINLOCK(pdc_lock);
-static void __iomem *pdc_base;
-static void __iomem *pdc_prev_base;
 static struct pdc_pin_region *pdc_region;
 static int pdc_region_cnt;
 static unsigned int pdc_version;
 static bool pdc_x1e_quirk;
+static struct pdc_desc *pdc;
 
 static void pdc_base_reg_write(void __iomem *base, int reg, u32 i, u32 val)
 {
@@ -70,12 +152,12 @@ static void pdc_base_reg_write(void __iomem *base, int reg, u32 i, u32 val)
 
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
@@ -86,24 +168,24 @@ static void pdc_x1e_irq_enable_write(u32 bank, u32 enable)
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
@@ -114,21 +196,21 @@ static void pdc_enable_intr_bank(int pin_out, bool on)
 	index = FIELD_GET(IRQ_ENABLE_BANK_INDEX_MASK, pin_out);
 	mask = FIELD_GET(IRQ_ENABLE_BANK_BIT_MASK, pin_out);
 
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
-	unsigned long enable = pdc_reg_read(IRQ_i_CFG, pin_out);
+	unsigned long enable = pdc_reg_read(pdc->regs->irq_cfg_reg, pin_out);
 
-	__assign_bit(IRQ_i_CFG_IRQ_ENABLE, &enable, on);
-	pdc_reg_write(IRQ_i_CFG, pin_out, enable);
+	__assign_bit(pdc->cfg_fields->irq_enable, &enable, on);
+	pdc_reg_write(pdc->regs->irq_cfg_reg, pin_out, enable);
 }
 
 static void __pdc_enable_intr(int pin_out, bool on)
@@ -224,9 +306,9 @@ static int qcom_pdc_gic_set_type(struct irq_data *d, unsigned int type)
 		return -EINVAL;
 	}
 
-	old_pdc_type = pdc_reg_read(IRQ_i_CFG, d->hwirq);
-	pdc_type |= (old_pdc_type & ~IRQ_i_CFG_TYPE_MASK);
-	pdc_reg_write(IRQ_i_CFG, d->hwirq, pdc_type);
+	old_pdc_type = pdc_reg_read(pdc->regs->irq_cfg_reg, d->hwirq);
+	pdc_type |= (old_pdc_type & ~pdc->cfg_fields->irq_type);
+	pdc_reg_write(pdc->regs->irq_cfg_reg, d->hwirq, pdc_type);
 
 	ret = irq_chip_set_type_parent(d, type);
 	if (ret)
@@ -327,7 +409,7 @@ static const struct irq_domain_ops qcom_pdc_ops = {
 	.free		= irq_domain_free_irqs_common,
 };
 
-static int pdc_setup_pin_mapping(struct device_node *np)
+static int pdc_setup_pin_mapping(struct device *dev, struct device_node *np)
 {
 	int ret, n, i;
 
@@ -336,7 +418,8 @@ static int pdc_setup_pin_mapping(struct device_node *np)
 		return -EINVAL;
 
 	pdc_region_cnt = n / 3;
-	pdc_region = kzalloc_objs(*pdc_region, pdc_region_cnt);
+	pdc_region = devm_kcalloc(dev, pdc_region_cnt, sizeof(*pdc_region),
+				  GFP_KERNEL);
 	if (!pdc_region) {
 		pdc_region_cnt = 0;
 		return -ENOMEM;
@@ -366,11 +449,11 @@ static int pdc_setup_pin_mapping(struct device_node *np)
 	return 0;
 }
 
-
 static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *parent)
 {
 	struct irq_domain *parent_domain, *pdc_domain;
 	struct device_node *node = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
 	resource_size_t res_size;
 	struct resource res;
 	int ret;
@@ -383,6 +466,30 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 	if (res_size > resource_size(&res))
 		pr_warn("%pOF: invalid reg size, please fix DT\n", node);
 
+	pdc = devm_kzalloc(dev, sizeof(*pdc), GFP_KERNEL);
+	if (!pdc)
+		return -ENOMEM;
+
+	pdc->base = devm_ioremap(dev, res.start, res_size);
+	if (!pdc->base) {
+		pr_err("%pOF: unable to map PDC registers\n", node);
+		return -ENXIO;
+	}
+
+	pdc->version = pdc_reg_read(PDC_VERSION_REG, 0);
+
+	if (pdc->version >= PDC_VERSION_3_2) {
+		pdc->cfg_fields = &pdc_cfg_v3_2;
+		pdc->regs = &pdc_v3_2;
+	} else if (pdc->version < PDC_VERSION_3_2 &&
+		   pdc->version >= PDC_VERSION_3_0) {
+		pdc->cfg_fields = &pdc_cfg_v3_0;
+		pdc->regs = &pdc_v3_0;
+	} else {
+		pdc->cfg_fields = &pdc_cfg_v2_7;
+		pdc->regs = &pdc_v2_7;
+	}
+
 	/*
 	 * PDC has multiple DRV regions, each one provides the same set of
 	 * registers for a particular client in the system. Due to a hardware
@@ -392,8 +499,9 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 	 * region with the expected offset to preserve support for old DTs.
 	 */
 	if (of_device_is_compatible(node, "qcom,x1e80100-pdc")) {
-		pdc_prev_base = ioremap(res.start - PDC_DRV_SIZE, IRQ_ENABLE_BANK_MAX);
-		if (!pdc_prev_base) {
+		pdc->prev_base = devm_ioremap(dev, res.start - PDC_DRV_SIZE,
+					      pdc->regs->irq_en_reg + IRQ_ENABLE_BANK_MAX);
+		if (!pdc->prev_base) {
 			pr_err("%pOF: unable to map previous PDC DRV region\n", node);
 			return -ENXIO;
 		}
@@ -401,48 +509,31 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 		pdc_x1e_quirk = true;
 	}
 
-	pdc_base = ioremap(res.start, res_size);
-	if (!pdc_base) {
-		pr_err("%pOF: unable to map PDC registers\n", node);
-		ret = -ENXIO;
-		goto fail;
-	}
-
-	pdc_version = pdc_reg_read(PDC_VERSION_REG, 0);
-
 	parent_domain = irq_find_host(parent);
 	if (!parent_domain) {
 		pr_err("%pOF: unable to find PDC's parent domain\n", node);
-		ret = -ENXIO;
-		goto fail;
+		return -ENXIO;
 	}
 
-	ret = pdc_setup_pin_mapping(node);
+	ret = pdc_setup_pin_mapping(dev, node);
 	if (ret) {
 		pr_err("%pOF: failed to init PDC pin-hwirq mapping\n", node);
-		goto fail;
+		return ret;
 	}
 
 	pdc_domain = irq_domain_create_hierarchy(parent_domain,
-					IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP,
-					PDC_MAX_GPIO_IRQS,
-					of_fwnode_handle(node),
-					&qcom_pdc_ops, NULL);
+						 IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP,
+						 PDC_MAX_IRQS,
+						 of_fwnode_handle(node),
+						 &qcom_pdc_ops, NULL);
 	if (!pdc_domain) {
 		pr_err("%pOF: PDC domain add failed\n", node);
-		ret = -ENOMEM;
-		goto fail;
+		return -ENOMEM;
 	}
 
 	irq_domain_update_bus_token(pdc_domain, DOMAIN_BUS_WAKEUP);
 
 	return 0;
-
-fail:
-	kfree(pdc_region);
-	iounmap(pdc_base);
-	iounmap(pdc_prev_base);
-	return ret;
 }
 
 IRQCHIP_PLATFORM_DRIVER_BEGIN(qcom_pdc)

-- 
2.43.0


