Return-Path: <linux-gpio+bounces-39576-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JNTLFgHGTGogpgEAu9opvQ
	(envelope-from <linux-gpio+bounces-39576-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 11:25:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30547719B9B
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 11:25:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=H87F2zM7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WmKddVJ0;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39576-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39576-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B0EF63046F53
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 09:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00BE357D0E;
	Tue,  7 Jul 2026 09:22:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D5438D40E
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 09:22:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416127; cv=none; b=ViPZqUR/G7A5LL2Q5WPaX7hPMVU4jlDJUAhoT/Vs/GD73lo9H++R9pHwPUbcJo9PfcemrKLbbhG5TAvMyyReLO9jFfcveTLpPZ7ZrYR7W3mnbgvkFrPlRhPYdusjSzwq2PFr4Kn1zyL+L1z4WtdmxNllvc2oE2JkyhtcKf28Hkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416127; c=relaxed/simple;
	bh=1wdDuiOWSsyC+Yh7RVGPVkMlL63FxOQyYfkp519mzRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hCiWuFxrwHKfSWAvU/1w29NYgz1mLmcORp/5hjurPBVwRWDC/0RryhLTKrm0BDtTrkG7L5opAbdBaMUGSTWuAUiKaDi+4wQk7WvS/Sv+LZQYNXwsm0cqjrcxYA49PLk04VcFYm9Syqt6Ot1BUn0OfRXv/nHfOdzl40w88/7PgF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H87F2zM7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WmKddVJ0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678Dm4A3138670
	for <linux-gpio@vger.kernel.org>; Tue, 7 Jul 2026 09:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2NQIBhW3ues7G4OCel2E1+5LLcPG5WZ7/T8iDuVeOgA=; b=H87F2zM75nOpSj5j
	mPATdOK2d5XxCqy587sEVe3+W9/CczrYFniohPBvJLtr65+faRqcw8bNBdkH9e0V
	wRXNqeqHEV72iJ4aunNimbrtOTRrSIa2ScOLOgayufnIlZKvwWrzEhrxv7k6kCgv
	7iEN9pAsX9nsCLu34mscq9FZWiJ3hlpLazJReLn4GkmjiZ+A1NL0RhQv8HHsDALa
	zv73EmyCW0cwA51uQj4qTEaKd574/e0sXs34uMzL1H+06TsfSOVc/TeHRd5ZHX3d
	HINVR6GT3QwMeAKsljCLaYxPPkeRfXusdxBiJ2/bp0sL+9y/V1IQqoG7eHVt4+Tp
	ROGjxw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8t1597ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 09:22:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84240683a82so541666b3a.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 02:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783416123; x=1784020923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2NQIBhW3ues7G4OCel2E1+5LLcPG5WZ7/T8iDuVeOgA=;
        b=WmKddVJ0q4ztIDwZA8wDB5shp8xFK1B0XWof9kmt3xT2THOF9T6nBgoHjp2AeRrJGi
         3oB2OT/UDyZc4tX/73IbKMBRr4z4pyvusWuH+mNADgZZi+K+7EDUZu2FZtuxkMsH/SgO
         AcFbMgC46JrYWbTdAZlEke6b8H975c5UH+Dpi/jxTyqEG5A2en8eFAjPYe8L6Elbur45
         PKsdcIihQHYl7DNEIXEeZfCeff7Qh/vXjlR9wdpGK8tnVU9t7o7BgGWr2aZf4SKdvODs
         IWlajVzGGw+MGZiPwnQ9HKdtjK2lvR9wrGo9/ccZzzlVm14FiCNioLAKCLOpRl2YqDdm
         Ht4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783416123; x=1784020923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2NQIBhW3ues7G4OCel2E1+5LLcPG5WZ7/T8iDuVeOgA=;
        b=HfqHs2lNaXy6YEsHNowayameE6c5lSv4NUCN26Q2W4YTZeEMdBO1mBWe0cCo1dXxbA
         TJpvnadnoPbM3Xe1vQ0Vq/l4ZigAb6KhDIwTe1qR1nxqHhrcj6ybO6h5XsRb1RW0vm+D
         s+aPjD0MR81ok39eczbNLPl6fH29tatcXTHEG3m7J7EjPhiEtfjCx87NLoeXjNQxukV7
         QyWyYGpvIMiHCP86s0PbHaij+EIPVfbP1oidssHDR6D0+7P0pbwIozAVQfKPaf6+/HN+
         r4rzf16/nk1auln8ROICOiN8KWQ8ZIs+NsFk0JBl3RovZwc5CpRnW+yA9MDRdOu27kON
         ObUA==
X-Forwarded-Encrypted: i=1; AHgh+Rq7TNSGbcESVmxaWQrn8+Okem/DLiApqw8lFIB4rncaEfut1O+kUPm0QSHmx2st4DyxjYLW8AzNqPT3@vger.kernel.org
X-Gm-Message-State: AOJu0YzExELlZTi1/AhlmVOuBpbX0TQ7enWNwoxKNZxmRPN1ePWUSssF
	5U7UTQpShqK5sAl8hgnROj2rHd7/4+WR7WFKt85fAEWh5E1Hpf2oJiFzRX8Urmvc4q74C7JQ+2Z
	qLzXTXEw8i9AEAHd9W7JmRAC72LZ5kVLq5WCkLjHadcM46Mv6MJjVwOME9KtWPKqFXzLgT3H8
X-Gm-Gg: AfdE7clkTS+W3J6xMY5bMdgZJQMnZw0soWL5fmROq5MYBqpInJ9i8Vtz0kql9YvXec/
	qf8rJXxjevd1quIpw0DeBf6bsg0frcoHIkZM+NlQocxuVkkmqi0i9mg+9R7qxg6B0N/8X0QHcVg
	XotJHvAzfwJxWodK9QYxnHsjILtj5oKYkF5zmmSIr9yKxsCtR8WebbUsco8rkS+2stMMSoZtKVN
	GUOBsdxAm2Gbq7yuKH8ie5Vt+9w9eqSSvAbltkj57kdlkItA0Cl0fxDsQYfoepSN4QlaLeKUNpG
	8Xp3ME+f+xi82SqvhruQySbmg5k/0qyMLyaJdEw9vSe+0fljF4mU75FuaXcuGJ1S05zg1gV61cL
	Ry0QalgHg6JH7NO1yEVoBSzxYtzgFE6AmCcSz4Bo=
X-Received: by 2002:a05:6a00:1816:b0:845:3033:6cbb with SMTP id d2e1a72fcca58-8482f1f0eecmr1959146b3a.11.1783416123176;
        Tue, 07 Jul 2026 02:22:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:1816:b0:845:3033:6cbb with SMTP id d2e1a72fcca58-8482f1f0eecmr1959115b3a.11.1783416122591;
        Tue, 07 Jul 2026 02:22:02 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afdb7534sm658864a12.12.2026.07.07.02.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:22:02 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 14:51:33 +0530
Subject: [PATCH v4 1/7] irqchip/qcom-pdc: restructure version support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-hamoa_pdc_v3-v4-1-dfd1f4a3ae89@oss.qualcomm.com>
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
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783416112; l=14951;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=1wdDuiOWSsyC+Yh7RVGPVkMlL63FxOQyYfkp519mzRM=;
 b=OZ5q0DlWigqvnbcfJGfMIaIV8U8CH2TIE3dotoTW5NK/szfc9/EsRIhxIW5cRUmeAvMlYhPf9
 ZOLL2yzGIKOCbn7sJCM2+pwOdniW5BOY9eki7sGE0qfcyGSAaefn9Kb
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: 5FAS1ZUVTP4pH1hHlNPoW2UzpF4AYtpg
X-Authority-Analysis: v=2.4 cv=HstG3UTS c=1 sm=1 tr=0 ts=6a4cc53c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Rgno9txJ6PzSw_OMnlYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 5FAS1ZUVTP4pH1hHlNPoW2UzpF4AYtpg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfXwuwS2BszZka9
 qrb7/ig1xcM7Uv8qBNiHpzeE2lqPkJorGUvR0qoy6nVOn2o3S1nQIiLBxu8iJNVmQ9W5591lp3j
 2yV/qKgLrszoAvk00JcBed9MdcdJGt8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX1oi5SlHpNRFz
 y2SJL1MGVD31gF1QDSLCO34BjuCz5/pqaUf9sI+4C5cGWOyMLeg/+IHNID2TGekLDPAwBXE/QIU
 eHm2K77cvLbtbaPQm7thAYjZCOqttRkioo6QS0bY3tQEOwER516lCjKfsPvcOKsiz4Mu+eWJ1IH
 z0sEiYdVPSXaRWRqvGDAw2A5MvruF33m6vkGGaTFLMWh/CHHvVoad7PpIcYh+jCwjKSPyVlGWon
 er2itDzoBIr50GlDWeHrmilG3MkPGjbXmHELOIRF0kKPxTHhGszOYG8fpqRrrliueEbuHBeHQ3Z
 nCnPn52kJS2d/KV9N4oJ22NTAZky72ld305X8nLWNjUo9Mt4DMJEoSxpOyqsLfh03dig75RwJkN
 W90f+Zht7j96YPzOQcbR8EDbRNdDyrsOMSrfP4mPUFxHxwwOo+I8UImc2d6E5r0A2mWnwd9t+hJ
 jkRDg5ntSfRt4WjoZrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39576-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 30547719B9B

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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 219 +++++++++++++++++++++++++++++++--------------
 1 file changed, 152 insertions(+), 67 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 2014dbb0bc43..a77d1d334062 100644
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
@@ -317,8 +399,7 @@ static int qcom_pdc_alloc(struct irq_domain *domain, unsigned int virq,
 	parent_fwspec.param[1]    = pin_to_hwirq(region, hwirq);
 	parent_fwspec.param[2]    = type;
 
-	return irq_domain_alloc_irqs_parent(domain, virq, nr_irqs,
-					    &parent_fwspec);
+	return irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, &parent_fwspec);
 }
 
 static const struct irq_domain_ops qcom_pdc_ops = {
@@ -327,8 +408,9 @@ static const struct irq_domain_ops qcom_pdc_ops = {
 	.free		= irq_domain_free_irqs_common,
 };
 
-static int pdc_setup_pin_mapping(struct device_node *np)
+static int pdc_setup_pin_mapping(struct device *dev)
 {
+	struct device_node *np = dev->of_node;
 	int ret, n, i;
 
 	n = of_property_count_elems_of_size(np, "qcom,pdc-ranges", sizeof(u32));
@@ -336,25 +418,22 @@ static int pdc_setup_pin_mapping(struct device_node *np)
 		return -EINVAL;
 
 	pdc_region_cnt = n / 3;
-	pdc_region = kzalloc_objs(*pdc_region, pdc_region_cnt);
+	pdc_region = devm_kcalloc(dev, pdc_region_cnt, sizeof(*pdc_region), GFP_KERNEL);
 	if (!pdc_region) {
 		pdc_region_cnt = 0;
 		return -ENOMEM;
 	}
 
 	for (n = 0; n < pdc_region_cnt; n++) {
-		ret = of_property_read_u32_index(np, "qcom,pdc-ranges",
-						 n * 3 + 0,
+		ret = of_property_read_u32_index(np, "qcom,pdc-ranges", n * 3 + 0,
 						 &pdc_region[n].pin_base);
 		if (ret)
 			return ret;
-		ret = of_property_read_u32_index(np, "qcom,pdc-ranges",
-						 n * 3 + 1,
+		ret = of_property_read_u32_index(np, "qcom,pdc-ranges", n * 3 + 1,
 						 &pdc_region[n].parent_base);
 		if (ret)
 			return ret;
-		ret = of_property_read_u32_index(np, "qcom,pdc-ranges",
-						 n * 3 + 2,
+		ret = of_property_read_u32_index(np, "qcom,pdc-ranges", n * 3 + 2,
 						 &pdc_region[n].cnt);
 		if (ret)
 			return ret;
@@ -366,11 +445,11 @@ static int pdc_setup_pin_mapping(struct device_node *np)
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
@@ -383,6 +462,30 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
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
@@ -392,8 +495,9 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
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
@@ -401,48 +505,29 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
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
+	ret = pdc_setup_pin_mapping(dev);
 	if (ret) {
 		pr_err("%pOF: failed to init PDC pin-hwirq mapping\n", node);
-		goto fail;
+		return ret;
 	}
 
-	pdc_domain = irq_domain_create_hierarchy(parent_domain,
-					IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP,
-					PDC_MAX_GPIO_IRQS,
-					of_fwnode_handle(node),
-					&qcom_pdc_ops, NULL);
+	pdc_domain = irq_domain_create_hierarchy(parent_domain, IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP,
+						 PDC_MAX_IRQS, of_fwnode_handle(node),
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


