Return-Path: <linux-gpio+bounces-39581-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QQX3Em3GTGo+pgEAu9opvQ
	(envelope-from <linux-gpio+bounces-39581-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 11:27:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD460719BF3
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 11:27:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="ixyW/EiS";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ANORwev+;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39581-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39581-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 028633082CE2
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 09:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DCC83ACA59;
	Tue,  7 Jul 2026 09:22:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5A63AC0C1
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 09:22:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416151; cv=none; b=sUAft6SgJCTbOzhXhzoQb0IM3+C4ho6tLz+w3tSQWav1641IgcYL26xzMgrZSfFvyuI0Ui1CKzJVQvHeQL7oi5ViNnZ3Q1NQxEAhqq4uDhnPGIVsxTkzqq1BPMJ+Gjzk6jDrP1hdCpnKnIOMp2o87ufIic6F6bm/vF63P6A8iLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416151; c=relaxed/simple;
	bh=zb4Ff0vj0Rip79kK/H2K8PJcwVDoHRmqjopw2ShHmHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CXpaDLV6tScAieTg8tc1Eh+KekTl3F2w3FDEgU4PiHU2xV34UocuoHu3bUx261MRmD9Zm6urvr9r73eycXoy1cyyFnVec4XhxI9ReSVdkjDAgbXYQzBjexzKwL6avOee8RLNTHmmpiTRNPQXTUu8ERxh8EQpoDoCfKa0S/OmUpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ixyW/EiS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ANORwev+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678E3SD3051379
	for <linux-gpio@vger.kernel.org>; Tue, 7 Jul 2026 09:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rUr+qjvZHcFisrq6G6teTMwSeaERn+YfgHumNM1mZ18=; b=ixyW/EiSRuMCSA6q
	+cn67X0vU3wGCVUGjYpZYAIFuIvxDoVEuCM1qW8118j6h5eUQapVTCxRRP2wAzHO
	94mwq4FjHQYNwWRe6zjEGjw9pnKCeHZ5ZgMPp01n99UYoQLG6TFrvCLGmbjsSWuK
	A/gJP8ay8Jk/q2t8orxlfj5Q8wACcMRwLK1K9Y4Mvv4JMAUNTCA/b+KbfF93qaZp
	2p6ICnP7cr6CLYBMtMiG7BWO8L/cxtrYSPZd/8xIqgn8YI5wjj0EIKE8iXTVVxen
	/asc5GRrkYtP3aqlsOwas/KznugeR4jYH+lq66IGNo58+bFOqGqnrWgwS0PPiuRo
	vDFfzw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w2u8f27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 09:22:28 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so6691916a12.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 02:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783416148; x=1784020948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUr+qjvZHcFisrq6G6teTMwSeaERn+YfgHumNM1mZ18=;
        b=ANORwev+sxuviHg66vSl24Oq33xtR+QUIO2KXPmN+Fx6kEHmDxQOuArpiYd895b1rI
         mcPXtk2yhuDtzdEVLZrsN8dBXlEzP7is/SxQY5+PN2HPbcTtdpPCGSGqGaTuij5dmIrx
         MAUwqKPr6QDlQidDe1w3A/TlF/r8mBVa/+WjDlH/HyV9fC45nDJdFVFjdCa9T2nTT6ux
         jEJOdUsHZX/kE1ieLIqfI51o5Zlsopbfu6HRcldtnomQo+tzIr8tOQ9D3lZGwZBtHq1h
         slHR1B/w50RJbtSDoqrBKN+aipeqRgiPNheyqkCTuyfm8FCoGg64VrgcCVoWz1tccXRA
         zV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783416148; x=1784020948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rUr+qjvZHcFisrq6G6teTMwSeaERn+YfgHumNM1mZ18=;
        b=ApSC7so3aoLoDkTdcekov2L0l5hDg0UnPAr4GgGTZ+Gb10q545A+fRRHC+mLvqgvSu
         phhRLmjbxDbBsJHZGAjPbXARE6i5+6mFLG24ITKSjOzQXOOGaKU5AHmDi/i3o9aR7/a2
         rfkACBPSFLUCKIKIWuxBFQSFDpH4GBKKEnNj0/gi9Ez3uK2IjBHylYtIFn02aZlZAQT+
         digR3kfAwtv/j1ArYOUD3lqgs76wDCV6LyVZ5OjqCyba551BOsqFJOybAOdaD0bT4pzF
         LbSARmSvyQHKGv+3FYhsN718tEF9j7avr0lqogVHSYK1faX0Gb6lSDHjY6CJiYbx6GX1
         9IiQ==
X-Forwarded-Encrypted: i=1; AHgh+RqEFY8hYE+9T8T8e7EH733lrMsBffyJPQmhjHh7LkJb8m5tTIUJM43JWyu+nY50HipHJ7HfvZHDv818@vger.kernel.org
X-Gm-Message-State: AOJu0YzBPEpk40Jkf/4mEmMNjyFX+3qk/e4hS9539D+tL8ZMAV+0Xxeq
	fNLm/gdXfy3CBJj3V1o/BOQAusTAEZ6IvT4V6PZeAEzQonrzY0vOgdipWuxyS85SFfqBrndUop9
	2pjkUrBTheu4M6/rvcp2CRbfZtn0Fi5SZKtm13TeqgSGF24L9Z2WNZtE08JOxCoyO
X-Gm-Gg: AfdE7cmjh9cYGQG+p6PAUNTdlaoK6ITQaPJqVrQrEXP8j9nBJ7WSXRtROR4YyTO2RAF
	GDR4Wphedr55OlghKfyXAEZwOFHMTn3ND9EPPT/b4R+Wke9TeWY6HvS+ucR+kfBJfN7qXn4XXa8
	EwEiBEswW4Bar0dwxZRL992lYMyA9wYhfL6OpxmQuUprB2QFJ9U0CKouhps7xULD2E38Y4H4TTN
	FuMIvUp5pwO/db+TbjF3F5iV1IWZbR58oVcj6E7AtPJX0hDN/GT8eKlOQ7Ept1/vGBjdz3hrxu7
	yfiownRtISFCSi96wg8/joWWDOO/AdPVBcqEDXiG3p74C5ymaH6NwMYd7Q9HQ2fRboOfkqaDrJR
	AMVREsXvmr9KTI3tlKsPhmVMXZBl/0myjl+b7iew=
X-Received: by 2002:a05:6a21:9d4c:b0:3bf:ba48:ca88 with SMTP id adf61e73a8af0-3c08edc8ef0mr5833459637.15.1783416147802;
        Tue, 07 Jul 2026 02:22:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:9d4c:b0:3bf:ba48:ca88 with SMTP id adf61e73a8af0-3c08edc8ef0mr5833401637.15.1783416147345;
        Tue, 07 Jul 2026 02:22:27 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afdb7534sm658864a12.12.2026.07.07.02.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:22:27 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 14:51:38 +0530
Subject: [PATCH v4 6/7] Revert "pinctrl: qcom: x1e80100: Bypass PDC wakeup
 parent for now"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-hamoa_pdc_v3-v4-6-dfd1f4a3ae89@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783416112; l=1077;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=zb4Ff0vj0Rip79kK/H2K8PJcwVDoHRmqjopw2ShHmHQ=;
 b=racUsM0LIceTFRNEm1u4GJmzYjWAZ2Sm9iJh/DltpBAnUwEWTWgPpq+geLk3bwaFxiPvT3FJl
 UTpnTfsXW1bD/bgSG2pw8vi08cP/G+f3Yl9e+LwcG+BBnTUnszr/b1P
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX6i1PugjI8ldJ
 mfW2cUYoutvDI6hIu2rcvQ2uUsin3y5YYN9N7iOaL8GWIuYMb3xKDZSAT7iSlSo1RwSvc1vmnzr
 13Zo1xiVZtd5NKiARKgvti4cl2/GslA=
X-Proofpoint-GUID: a-fSf2SMPU2CJT1IDeuKXy__oH7wbzkX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX1mrOqEy/LBhM
 qmAGVOGlQRvrsWdyIi+eTe3cRSYkCfLL1E9yRjWp0JQXzaWA359ND186KQqjBl1SXmvVRF7W5he
 eiNh7n3xufvWwgWUI5Fyd/y4k6FRbulFVO6SlKDLNsCUcVIbF17wLr1GslPNJDmGMAzyQBcxeML
 PYLkOsk1PL2so6ZKYMdVL3Y6LfumGECJtJBttTsj3Z8uPcXOpB8WaCJ51haFfzhcNymFDli/0/6
 9Kci6/1sBKKEagFV8G4dOqBvoV/yC3wckcWeT8QfHfKKTgvPZC6W3+7/clkC0QFkiCNFrQZB9PY
 4+ieo2JWrEEnQxGtiGfsxwO+E89DPoUwwBR3uyLfinas8MBkWQMsNPke5/IUqgYsKFwkj6dELhx
 VgYoVGmJlrW2+H3cwfJeDIIorb7lxzyxM1n9q6OSNa5YKPqfryRS6CjYtSeHCAvykq5aJI3S6ZP
 aJ3XrDY5sH3iA8TRgBg==
X-Proofpoint-ORIG-GUID: a-fSf2SMPU2CJT1IDeuKXy__oH7wbzkX
X-Authority-Analysis: v=2.4 cv=bPQm5v+Z c=1 sm=1 tr=0 ts=6a4cc554 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=TyWXDXqlpdzf1xDbr6AA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
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
	TAGGED_FROM(0.00)[bounces-39581-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: DD460719BF3

This reverts commit 602cb14e310a ("pinctrl: qcom: x1e80100: Bypass PDC
wakeup parent for now").

PDC interrupts no more break GPIOs PDC irqchip is updated to work for
pass through or secondary mode. Update nwakeirq_map to reflect the GPIO
to PDC irq map size.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-x1e80100.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-x1e80100.c b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
index 8d2b8246170b..e4c0abcd95b9 100644
--- a/drivers/pinctrl/qcom/pinctrl-x1e80100.c
+++ b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
@@ -1836,9 +1836,7 @@ static const struct msm_pinctrl_soc_data x1e80100_pinctrl = {
 	.ngroups = ARRAY_SIZE(x1e80100_groups),
 	.ngpios = 239,
 	.wakeirq_map = x1e80100_pdc_map,
-	/* TODO: Enabling PDC currently breaks GPIO interrupts */
-	.nwakeirq_map = 0,
-	/* .nwakeirq_map = ARRAY_SIZE(x1e80100_pdc_map), */
+	.nwakeirq_map = ARRAY_SIZE(x1e80100_pdc_map),
 	.egpio_func = 9,
 };
 

-- 
2.43.0


