Return-Path: <linux-gpio+bounces-37683-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGziBQ9vGWqEwggAu9opvQ
	(envelope-from <linux-gpio+bounces-37683-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 12:48:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3D9601109
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 12:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6353A301F7B5
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 10:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64D373C8184;
	Fri, 29 May 2026 10:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kmt8R8UU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gBUj1S4n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586013BD63B
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 10:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780051396; cv=none; b=brBEjSibgILKpgeWyeXtqJoRNTgty+C9QqGISgN8IfIzFSktFENS6gOtUrWDgiWug7niBIWvjjVBOM98gHj6e22wtU13yZGUYs4CAyNdXVCTyE5I66S1V8mU24sPFo86edo04piJt8zmi8E9h7aX99XRW39DF0De6yn9Zj0eeD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780051396; c=relaxed/simple;
	bh=ixSWaJbQ66wwRee4PmEbinpxL8L7YWuFKgWmhihBeB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LhSOQgcuYw63daQPi4NoMxnZZg8bzLZAD7ZFR3VVaBZ6orHmniIGqX7Jt1gW/eJ91lC2a6h0UFQaDn9mHBHgil/Wcw+a8FI2BFgykj/1M5F+n8jFKlqeH1GlBvX/UlSouLEfLPonTJukNz1VZBVql7KCkZ/NpllFw4P+eRpgS6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kmt8R8UU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gBUj1S4n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T85LN01495135
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 10:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=50ma9osI1PDj+Mi7bKcJ1U
	1sqm1Qr8+xGWCuYMysqp4=; b=kmt8R8UU6LszUGXLEFCIBrDp8hQALdjEXuVIsH
	MjQ0cbvCGkZMC24GehrdKhGofUhKDoErvDKbREZOaVbQg4lg5em4gDX2ApeVGIlp
	xIRhCwqFpNjRsst9sF0LtMwNJydL3f5qfO3+wa33UIxnIig/hPZsJWzT+gdkqTfg
	+qdsMgl8SGKCWU46l/gd624213elCzv2Nq7Q2OkzswoKCH37rHUgNDRbmAUXutPQ
	sxe75mbyddqO5tZkUsC0ip2CG14vs6vgPO4UzPgsJVv0rZFUM8mIndp1B+BhWcV/
	KDWf1hoLkAmHLQOcY09jjozuDbEoMOOvch9VRIltu0xZu/UQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef015a8bg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 10:43:13 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c82c4772950so7398780a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 03:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780051393; x=1780656193; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=50ma9osI1PDj+Mi7bKcJ1U1sqm1Qr8+xGWCuYMysqp4=;
        b=gBUj1S4nNbzuOVCVpLAjrS2hUfkDqE65G0vFOmsPjUYOGpXkY0JgiWFD9624r2ZCqg
         WicKTWJUPWAzcqSAiXUYLyUG0PcC5cxn3pZWChegycCPO7jTa4kPz8GgCrKkN5RcMjs+
         AMTxydb5TNCFBmn8c+QkZUWi403oc7NSHi4fciaJoIQKBg3UOb/XiuW5gFa2FqCxvoiZ
         CrGXZWYyzVJ60sSbtRvmkG+CHU3+/Qk5uIT0S+6qkny184mmntCNY0t4mtd2ZNTPDg2M
         igeEqLxEuFQBYP/aisTWsqTdEcFuTYYu6qrPkYujYi9xbD0GZBIb8i9++MuRN0ODf/ks
         lQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780051393; x=1780656193;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50ma9osI1PDj+Mi7bKcJ1U1sqm1Qr8+xGWCuYMysqp4=;
        b=KluGY9rTTOdbwcWW3DIC5QcWxWjswC4qGZ/dFBPpkK+KYZ0E4oy/QvOh7eEZsW5+Xx
         Y4DXxDDZu1CzqKj72x3zPzG2PAc1zZiqNu3Hfpn8+/eFpEYJTlEevzn/WASqmqWeWWlk
         Zp13/brf8Q5HwQ4JVQMjZ8M8CsQzXAKNuPoMJI+hK5OCBkWaFlLwxFG+NkgwHrkRSZDD
         +XZHR/z0zpJ/7J9qB0BfJ2U9zpLyeF3IcNgvuY+kdexWm0AzAuYKg1a/YIpa6swO3oml
         gFwokOT6VVV9hjb2tKRShU113ivAKVc5kWye1lufWkxCM7QZp5k6MRaEpIyp8xgnVd2D
         BqEg==
X-Forwarded-Encrypted: i=1; AFNElJ8y6d0UZqyjoTMtqfAH/nfmNlYj+HYMxdIAkzEu9VMvpSGBOqxTZhT0MIA09k6+930xPOwu8rXPDnf0@vger.kernel.org
X-Gm-Message-State: AOJu0YwuEJCPaAV3GzyKXQVUxb0t3GgcDATh3w+l0UjVpfPtOcVhcUjm
	J9v5TQOeVTpwR+VPXJz0/yXyLGXeQ+LeBLHbt0L9ZVoVVDl4JljY2RscXVLUwm6y64qZyA8PXGb
	SXdffyY/8cv+DAHWCClJVVMJLrqBL23v9jmtJyLu0ftiMSO0w/RVxM7yYSsveQHm4
X-Gm-Gg: Acq92OF/Dsm6qF71Pm1rDnwxDqIKt5ZNHfne8ecrb6DhOOVm8irUTAUS15K1VR0sMm2
	84oS5+e68fWNpNagWB0F+P3EP4TDhTleVJwATeK6KLXUgX4VTw2Laog/SMVubrFRFKza0mgcCA0
	OuOH7ZQDW7VudRtA7LT/DxJoXKN3JH6ceRky3sRb3znc/rwFbuiQ+HtsdsjwcBSa2jPh2U0i++o
	9j5Cg9S0vHTyTz+pgF8kc4Q4yxRlaX2eBIOHWlLtEba+DtktmfM32FrcwJECtIfsdeqvb6nt9EB
	7MEjWy8he/CKmRON3Ip4bTlnGIehNqooi2sLgeVxN18rxsz8/dtnLRRpmL7PwLfOoO71hayuilp
	9sLmTpKxjK71AdTjrbo+fk/R89VBh7u4PnX28B8ZKjk33Ei4gU/DV/BY7RUGsGR5VMZ/d
X-Received: by 2002:a05:6a00:2306:b0:842:994:939e with SMTP id d2e1a72fcca58-84210d4cbf4mr2159833b3a.35.1780051392888;
        Fri, 29 May 2026 03:43:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:2306:b0:842:994:939e with SMTP id d2e1a72fcca58-84210d4cbf4mr2159812b3a.35.1780051392427;
        Fri, 29 May 2026 03:43:12 -0700 (PDT)
Received: from hu-nmalempa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214cc094dsm1793802b3a.44.2026.05.29.03.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:43:11 -0700 (PDT)
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
Date: Fri, 29 May 2026 16:13:01 +0530
Subject: [PATCH] pinctrl: qcom: Remove unused macro definitions
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-macros_pinctrl-v1-1-3d5671efd18f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALRtGWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyMz3dzE5KL84viCzLzkkqIcXWMzA0sLE+NEI1NDSyWgpoKi1LTMCrC
 B0bEQfnFpUlZqcgnIFKXaWgD88cpTcgAAAA==
X-Change-ID: 20260526-macros_pinctrl-3609843a2519
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Navya Malempati <navya.malempati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780051389; l=2728;
 i=navya.malempati@oss.qualcomm.com; s=20260423; h=from:subject:message-id;
 bh=ixSWaJbQ66wwRee4PmEbinpxL8L7YWuFKgWmhihBeB0=;
 b=hcv0K5M8nBZL9UZKJebTzkv4PdJqJi/IctBSxq0YCFBUiEAhpasGqpv/lNARWm+Hp6ccbpU9q
 hbe+aH8D2L1CfVPGK0FYrUmB39UWDfBTt3HQGGwUHvkuK8XUnhce55b
X-Developer-Key: i=navya.malempati@oss.qualcomm.com; a=ed25519;
 pk=XWkaQ4rYqw3tflaJ4YH+9iUHSq1kn9eQh+CAbSvNrdI=
X-Proofpoint-ORIG-GUID: JJmK7_W4LgRoXQt11h6qWMCRRaec8k0D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEwNiBTYWx0ZWRfXy1PC8MpugdTu
 qLqMsIOBYKfYhQUVmhiZh4TbMLJ+1o8C0K5us8GMXQH06EhG8eCtkt6jFxOUqq3A+/YN57T6d8f
 puGrwJuAqsOAEik8yi7KCFeU3lxIqSCX84or6mm8OAV90w3S2axwvsJDsfidgamix/JXYTCyTj7
 MuOb58WslpglGFpyB8N39+NJRDg/YhwIJiLsIqgMmx/J/V0IemtbMd8laQ5bbPSf0jQHX8HLZIA
 DU8cJ9ogwaDZCeNrIpHmUnRtnydhTOI+4gE9DyGMNob3qO0gPBafd7GpQBmpn6OGcJi7+BbTYy/
 zPXMV+qsjPhMhcycY6ulUtgvz89XFnwr+e/6j+eY5eT44jNUk8vUkiTZWdNic/QNw8sfOyYY/LB
 2GxkFdkwAbYyVTv/aE9Bk52pk+7rGWyWQXjzxayvDdP9q+WWdkaT8JcNeDXHfBpYJbYIRDQ08Gk
 2homo3TMm7KTJdLjyxg==
X-Authority-Analysis: v=2.4 cv=DIG/JSNb c=1 sm=1 tr=0 ts=6a196dc1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=kh8tv3nup7AWy7AdkQ8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: JJmK7_W4LgRoXQt11h6qWMCRRaec8k0D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290106
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37683-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[navya.malempati@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8C3D9601109
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The macros QUP_I3C and UFS_RESET are defined in some platforms
and yet not used. Remove these macros as they are unnecessary.

Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-qcs8300.c |  6 ------
 drivers/pinctrl/qcom/pinctrl-qdu1000.c | 24 ------------------------
 drivers/pinctrl/qcom/pinctrl-sa8775p.c |  6 ------
 3 files changed, 36 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-qcs8300.c b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
index 852cd36df6d5..9a904d809e11 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs8300.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
@@ -100,12 +100,6 @@
 		.intr_detection_width = -1,		\
 	}
 
-#define QUP_I3C(qup_mode, qup_offset)			\
-	{						\
-		.mode = qup_mode,			\
-		.offset = qup_offset,			\
-	}
-
 #define QUP_I3C_6_MODE_OFFSET	0xaf000
 #define QUP_I3C_7_MODE_OFFSET	0xb0000
 #define QUP_I3C_13_MODE_OFFSET	0xb1000
diff --git a/drivers/pinctrl/qcom/pinctrl-qdu1000.c b/drivers/pinctrl/qcom/pinctrl-qdu1000.c
index 77da87aa72aa..1ef77f82820c 100644
--- a/drivers/pinctrl/qcom/pinctrl-qdu1000.c
+++ b/drivers/pinctrl/qcom/pinctrl-qdu1000.c
@@ -75,30 +75,6 @@
 		.intr_detection_width = -1,		\
 	}
 
-#define UFS_RESET(pg_name, offset)				\
-	{					        \
-		.grp = PINCTRL_PINGROUP(#pg_name, 	\
-			pg_name##_pins, 		\
-			ARRAY_SIZE(pg_name##_pins)),	\
-		.ctl_reg = offset,			\
-		.io_reg = offset + 0x4,			\
-		.intr_cfg_reg = 0,			\
-		.intr_status_reg = 0,			\
-		.mux_bit = -1,				\
-		.pull_bit = 3,				\
-		.drv_bit = 0,				\
-		.oe_bit = -1,				\
-		.in_bit = -1,				\
-		.out_bit = 0,				\
-		.intr_enable_bit = -1,			\
-		.intr_status_bit = -1,			\
-		.intr_target_bit = -1,			\
-		.intr_raw_status_bit = -1,		\
-		.intr_polarity_bit = -1,		\
-		.intr_detection_bit = -1,		\
-		.intr_detection_width = -1,		\
-	}
-
 static const struct pinctrl_pin_desc qdu1000_pins[] = {
 	PINCTRL_PIN(0, "GPIO_0"),
 	PINCTRL_PIN(1, "GPIO_1"),
diff --git a/drivers/pinctrl/qcom/pinctrl-sa8775p.c b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
index e9a510d3583f..5dbaa50cbff0 100644
--- a/drivers/pinctrl/qcom/pinctrl-sa8775p.c
+++ b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
@@ -101,12 +101,6 @@
 		.intr_detection_width = -1,		\
 	}
 
-#define QUP_I3C(qup_mode, qup_offset)			\
-	{						\
-		.mode = qup_mode,			\
-		.offset = qup_offset,			\
-	}
-
 #define QUP_I3C_6_MODE_OFFSET	0xAF000
 #define QUP_I3C_7_MODE_OFFSET	0xB0000
 #define QUP_I3C_13_MODE_OFFSET	0xB1000

---
base-commit: d387b06f7c15b4639244ad66b4b0900c6a02b430
change-id: 20260526-macros_pinctrl-3609843a2519

Best regards,
--  
Navya Malempati <navya.malempati@oss.qualcomm.com>


