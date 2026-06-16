Return-Path: <linux-gpio+bounces-38584-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dW8MAAs6MWrTeQUAu9opvQ
	(envelope-from <linux-gpio+bounces-38584-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 13:56:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A11FA68F02D
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 13:56:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=N7N5Lq1O;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RZBShAU1;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38584-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38584-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 109F9303EE0A
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 11:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FCD344A718;
	Tue, 16 Jun 2026 11:55:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572F043CEC1
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 11:55:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781610909; cv=none; b=bhtyO/LMJtTDApdmUAwvfdXaYDfQBEDzLYRhMuyOPwaVEbCGCG3lFIxwfZo5vSfrMIU/tzTdvFlLIVfkovkbPb1mkD42m+1m2p1WcWP1VeYdgKtnzomlJ28LZUSyfLECa0mKwLzaAAzmMSw4CkDFNUV6iAQX7cef8/mZIPvryx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781610909; c=relaxed/simple;
	bh=IkcWGshUEa4u7dhMzEQVwaerWwxFO++zUBrXJW6rS0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DZzPgtEQ8y6pi8pEE9+JCTEBSVb2KcxP/3/7HVUaOtm0sywnK4xuz2P85yg1IheM+RHBajKynCOFxJ6v6OYpeyaa3p4rBG8DasiK2f6OpgYk5a66TTJUnmXw2NudDZw0/J3XIgjLKsKoLUBpPbArz9oUQfFk6uMCGOfW5BY8GJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N7N5Lq1O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RZBShAU1; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GACCUn3455455
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 11:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BqZE6aH27VWQfilGircM46
	jMc+11CYdxAMP4Jw18oyE=; b=N7N5Lq1OFoJ0CYokMHJIfzVUE42feUuuPAlMCW
	bSyiqjlXwezZCSZI9F/oa97kHLKqVxOj7anvgIpmJUy0Gxcr8X80b6d2mKK3mSn2
	1U2R9rHDuJcJXsRYunJvEbT5L35aJLI0zy4x7fEbScFp1SNvoCHbIWYY7kA5objE
	WMtOQBIPMw0+QeK+Tvz4KMYjYmiKpN/0u/ra9Kuuw6j6zQOs57R85nKxxmT3+fAL
	3rxTeiwjkZO6An/VLpzWfV+21F05CMl+8PUmOcjhQ6iRVK/jbNGfYtFxWx1mYb10
	QQayrxpiLJJa9gLx3kpqT/kPxUhVicgjtgjIlJtHqj7o8jnA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu4dkgfb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 11:55:05 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85a298cd62so3086886a12.0
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 04:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781610904; x=1782215704; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BqZE6aH27VWQfilGircM46jMc+11CYdxAMP4Jw18oyE=;
        b=RZBShAU1r4mVUAEY6NAVlS6cabAgs/elnO92K6A54fnkm3Qtnq7+2EMTXi7FoBWO02
         wqsbtL3Ypzy60y8GGVNkWTxBC5JFpjAa7OyanarbCo+jd0J9U5y0023QKaV0CfBViDmj
         W8H9ieZdx9lOuyASQW34gZXOoDJjjz7Zy0jQ8y6z6/r3u3Esb7mlXxezRejjwlOsIA0x
         +Jn93K3XRiW0fK6UUqtkW3gCqtFfk+RbwFtN4hIscjSqDMnbQM+9VefBdkv//bgnYddW
         +796gLj/2W8F4E+vVF8GZziY4h6kF4wyko0ciyPRyRrttxkOWCKWpGLX2Q82MqfZM3fD
         c/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781610904; x=1782215704;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqZE6aH27VWQfilGircM46jMc+11CYdxAMP4Jw18oyE=;
        b=mafriCaImVKnPZJXcIxwfdSwBlTCj/PJxj1Xtr2vgxWQOCo3z/tBnIQ9gCRmdR6dYw
         ik/8TTX69N8AXGeS2SI9Qkp15xV6/GIcQ/oMYRhDvy8aR9Gn2rCX6c9YvBsmD35AX8Ih
         UWZutrWKbDjW2E+qYmHHxxH7E5PNAhv6Z9vvaZcEmUdRXb8+MmUeypVO6MUrdmrOMM3K
         ExAVwTqpR9ktPNfVV+EAqXjz+Z/QRiHXLWN9h4gPwJjkN1U8qtOF5gRo790V7GZfYgqY
         eA4goj2RnligBRzcIZGyEyQQsYLPb4ZRs30xbDzCBc/rJmHexLji+pfgh+vllqP82IJ0
         tj6w==
X-Forwarded-Encrypted: i=1; AFNElJ8p/lPeuYh3qsd5wK+t3L+G6jBh8EkajaUztgWB5ZM0Yeas7LY9+WAdQoA1lfUjmxCD0VsYcSCRGEJ6@vger.kernel.org
X-Gm-Message-State: AOJu0YxXrR9TBQWiNg4RaD+fsz6Mig0eYgkH1+UKFmJwvY2AgdmmBB2K
	3GuZjGc8/6RRptSTrXzIJgWHHBp5jPsjfWg3eLzzocjsLWRGlhVWi9/LYru7uwjfoOqinFJk2I1
	SVBbvyiLpdghkomp4XGhDA1Gf+g8e1udFo3Hi2fJFt03oVt5f3shEoTxenLi1iJfR
X-Gm-Gg: Acq92OEWLqH0UmUvVxU/6YMUfdzrqs4b4COlmmeu/n2MvePagpToIpha8AGf6LjDml5
	tBvECAgOV3yvq5wbq0WOjha9XBCn2qxVl3TiKHsNhH0MuAD9zHIlypkZ/WoVJQ0mPIrWlV86re2
	iiMjpN1Mb8A2wE1OxjSZUm8bOhWfepH2qSgqWan6NC4DrNBaAyR5bX78WuwYXShITOwqbDGb8BM
	t6KdmqOAjSpMdjKeYrnI8B3PNUxtS2uP3qs1nBNg7JKfUkU8RqPYyj0dv91KgZbmTgYFlVuiV17
	fYcIGyn/oWD5QoccwQKCoIHM1EfA03ClBUe6ZtQXDJWPPzyfHq8N9U4ZJQZb90NPV0rb4biSLfv
	kLST7UKvs/si/qdoFptROodR917EmPrvrc9gIIQZ6/mjlQNDbujk=
X-Received: by 2002:a05:6a00:1907:b0:842:2ddb:e305 with SMTP id d2e1a72fcca58-844e1ab9f5amr15874132b3a.43.1781610904060;
        Tue, 16 Jun 2026 04:55:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:1907:b0:842:2ddb:e305 with SMTP id d2e1a72fcca58-844e1ab9f5amr15874098b3a.43.1781610903559;
        Tue, 16 Jun 2026 04:55:03 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434acf4b5csm16050549b3a.23.2026.06.16.04.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 04:55:02 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 17:24:53 +0530
Subject: [PATCH v3] pinctrl: qcom: Unconditionally mark gpio as wakeup
 enable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-enable_wakeup_capable_gpios-v3-1-fb59647d89cb@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIw5MWoC/5XNSw6CMBSF4a2Yji3pg1cduQ9jSCkXaARaW6kaw
 t4tjB3o5Cb/HXxnQR6cBo9OhwU5CNprM8XgxwNSvZw6wLqJjRhhOUk5wTDJeoDqKW8w20pJu2d
 ntfFY1SLlQkJZFAxFwTpo9WvXL9fYvfYP4977WKDb9zc3UExx1gAXdUtyItKz8T65z3JQZhyTe
 NDGB/YHySJZKpZLVYiM0/ILua7rB21wq4IgAQAA
X-Change-ID: 20260430-enable_wakeup_capable_gpios-cb9439ae8772
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781610899; l=3105;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=IkcWGshUEa4u7dhMzEQVwaerWwxFO++zUBrXJW6rS0I=;
 b=63/ySxmq4UtHp74zjtRfXCIVzdA1nKbfE7WhjCV7hFsTX1yJph99Hoiu7jCnjvdAcpGXY05M0
 dZta5VjWstWAVVUwVYWl8QdLDmgBclpumiWMGiMuBcfMIu4tufXwvQj
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-GUID: QmOrkWX1pXJUKviFUfksPvSnlC1pQ_3F
X-Proofpoint-ORIG-GUID: QmOrkWX1pXJUKviFUfksPvSnlC1pQ_3F
X-Authority-Analysis: v=2.4 cv=Ibi3n2qa c=1 sm=1 tr=0 ts=6a313999 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SnbX5S4nitk782EHpS4A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyMCBTYWx0ZWRfX1XkUaJFIPYrl
 r9hFS2RD9QtTeG6K5VaoSBxOcNbjAdBr+uFGKaBdFNzNjZEDoqeYOF5ehxGuvrO8hEafeAZ7NZJ
 9pXRd3vT4QCrFyePYzEnQ6+H/mo8TRcO8zC5LBkEdkbQMdoWheoP1AtIhwOBxc5lX9zbGIyV1hD
 DBC3F4fdWYj5ZgF6ISgIi+Nq4byhxYa8kN5AFQESLfWn+jPFWOTbDgeuHXxaUYKpiw+KGof+5iK
 95GdAj354HTkqUbYjZxoYvY0N9XvL6Xmc2WqPSmnNLlA3V12eX63kEys28UPSbqrDqHTP7jvzTo
 rm3vz49zplftV6Gojwg/vdNPG1V7tLsBF7SzDwSlCHq/lDEvR9cpkTIv8PsDWXmJlTkIzzwfvsl
 v6mSDm0DFl5hXwJf2QWgjTmCqt9e2yTeba2NSXLU2EjSpmE8BGoejHuovPHf/rdtfOwaVpJlH73
 e8MvrVkuIz5JHvDPkWA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyMCBTYWx0ZWRfXybDmATMI6e9b
 GL3HTETnQZTCwqUJEY4NWmiLm1/IKEeIv16XvjB2Xrqh6M4SVFLnZnCNVwC+PjaM9bBwOjXnYyH
 d4wBcMDBmk5gkYCd7jTtqB0KGuJvG4o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38584-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:neil.armstrong@linaro.org,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A11FA68F02D

GPIO interrupts that are wakeup capable need to be forwarded to wakeup
capable parent irqchip. This is done via writing to it's wakeup_enable bit.

Currently the bit is set only for PDC irqchip by checking skip_wake_irqs.
skip_wake_irqs is set to differentiate between parent irqchips MPM and
PDC. It is set when the parent irqchip is PDC to inform pinctrl about
skipping the IRQ setting up at TLMM.

However, the functionality to forward GPIO interrupts during SoC low
power mode is needed regardless of which parent irqchip it is.
Without the functionality it is impossible for MPM irqchip to detect the
GPIO interrupt during SoC low power mode since for MPM irqchip the
skip_wake_irqs is always false.

Remove skip_wake_irqs condition when setting wakeup enable bit to allow
forwarding GPIO interrupts for SoCs using MPM irqchip too.

Fixes: 76b446f5b86e ("pinctrl: qcom: handle intr_target_reg wakeup_present/enable bits")
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Reviewed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
Changes in v3:
- Added explanation about skip_wake_irqs in commit message.
- Link to v2: https://lore.kernel.org/r/20260430-enable_wakeup_capable_gpios-v2-1-8c26ac795318@oss.qualcomm.com

Changes in v2:
- Modified comment to specify MPM HW as well.
- Spelling correction.
- Link to v1: https://lore.kernel.org/r/20260430-enable_wakeup_capable_gpios-v1-1-5de39bf06094@oss.qualcomm.com
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 45b3a2763eb85405fecdd4770ba3d4ab684563f0..6a24f9b5e4a979528ba6b5b87fd297c2783ec765 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1242,12 +1242,12 @@ static int msm_gpio_irq_reqres(struct irq_data *d)
 	/*
 	 * If the wakeup_enable bit is present and marked as available for the
 	 * requested GPIO, it should be enabled when the GPIO is marked as
-	 * wake irq in order to allow the interrupt event to be transfered to
-	 * the PDC HW.
+	 * wake irq in order to allow the interrupt event to be transferred to
+	 * the PDC/MPM HW.
 	 * While the name implies only the wakeup event, it's also required for
 	 * the interrupt event.
 	 */
-	if (test_bit(d->hwirq, pctrl->skip_wake_irqs) && g->intr_wakeup_present_bit) {
+	if (g->intr_wakeup_present_bit) {
 		u32 intr_cfg;
 
 		raw_spin_lock_irqsave(&pctrl->lock, flags);
@@ -1275,7 +1275,7 @@ static void msm_gpio_irq_relres(struct irq_data *d)
 	unsigned long flags;
 
 	/* Disable the wakeup_enable bit if it has been set in msm_gpio_irq_reqres() */
-	if (test_bit(d->hwirq, pctrl->skip_wake_irqs) && g->intr_wakeup_present_bit) {
+	if (g->intr_wakeup_present_bit) {
 		u32 intr_cfg;
 
 		raw_spin_lock_irqsave(&pctrl->lock, flags);

---
base-commit: b4e07588e743c989499ca24d49e752c074924a9a
change-id: 20260430-enable_wakeup_capable_gpios-cb9439ae8772

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>


