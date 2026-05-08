Return-Path: <linux-gpio+bounces-36459-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLH3GHnL/Wn/jAAAu9opvQ
	(envelope-from <linux-gpio+bounces-36459-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 13:39:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B63EC4F5DC8
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 13:39:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95002304463C
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 11:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC363D6CDD;
	Fri,  8 May 2026 11:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8kUXULl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z3ilH58+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83143D5671
	for <linux-gpio@vger.kernel.org>; Fri,  8 May 2026 11:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240218; cv=none; b=Sth3E7In6zsXbeHyKZKBX9Y0Y1YrOZLbhMsA2NeJKpglnFSfgQ2bPyADovxJFc+eEQ03bO8XYMpZD66e+/vM3uPQq5u91+lyZmzpKOTRL/3SY/3K/HFiPaR8cm7HPPHOphTtds40JcvxlF2APzSgQ6KbzAmF0H3RQJmrkU7rDAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240218; c=relaxed/simple;
	bh=tHQrW9mh8+7g72Y/vw7hRMGweCsOAGsdssCtzmaYYuo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pEzEiQ4WVL5jFoSjxgbeiz4lk9UaX5KJ+XRq3qkPLvOdtBLUJ4t9dIEbegBAzMmks1GgruETCrcCBn53JTvElkiYqn2rpsGkSjwvxt7ca10pdIsh2vXIQIZtVZpkjEMGxzw0eXmeOFmheDwF+Lkj6x/UIhpXhV5I9zHIh/1D/f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N8kUXULl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z3ilH58+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6487Kgq0318082
	for <linux-gpio@vger.kernel.org>; Fri, 8 May 2026 11:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hsOIavlPFzl
	uwv5CpKxCmDgZRoBsbBQWS45W+MeWQSc=; b=N8kUXULlwykJDphuqsHFFVEnbME
	aAUptGDeGk1EWanKpj4iCDlwC093GngBykuSsI4i9plqO1DMvvx7C8Q20NYqXjCw
	lGFsTcDW4fOm7RyAjIps9pOVloNXfA/qupWgudMUrUBeobDmzlibsTa6Ed+ACEyY
	ydzrcMEVHOoBbAoRTXvUcd65t0Cb4IJQOv1XjmsWkDBdKDjD45/n/P76CxqtXikf
	CMiP6lBERPZEI69Rykzd6CZ3jh22uBuaShNs5l3ygRyGlS76AUGOyMvHH51QX0dQ
	0WvN0mV2ju3Xwje7ZuN49y20sh4TmYNJKcehb9PrwbzcULO8/j1ojN7gb4g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1bc010af-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 08 May 2026 11:36:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365d4d2fa04so1920475a91.3
        for <linux-gpio@vger.kernel.org>; Fri, 08 May 2026 04:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240212; x=1778845012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hsOIavlPFzluwv5CpKxCmDgZRoBsbBQWS45W+MeWQSc=;
        b=Z3ilH58+S3MwDsYvusHiS5nRDUvJDsKREvj+2iEHisZTzoi2RupauQGl5dR3aD7B5T
         b3rXlo9jYyCm20ndlo80a+pqi7usRiPmCzr2wFko8TtIDLjXMTn6GCDVlNl/dDEzBbf3
         u70JtfT4GqF+CFlAPNST+iigHWVNmIabsneWTIYxNKIHb3+Ze7fDXNHkdp04dMR5FqX/
         Odcgt4jtEw0ZWFfHMHCZSfPlKjkbVHCzbfvGnf3nmCsho4KjXYdq8bnDUYLiZvqfFvr6
         lfRAbHkBQc9asEHQEHCxxA2zfkj3nemnXU6NJltTlwodOV7i6FMLMzFIwPFVA46ZJLzI
         DE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240212; x=1778845012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hsOIavlPFzluwv5CpKxCmDgZRoBsbBQWS45W+MeWQSc=;
        b=AYAlsUr+Jnz/9h8Ytprrw5rGhezSZoSG1jQOYXzZHbtbekuOpL/VvXN+KnluseVfo2
         U21Io6yDWCrfD8YIoz3658C/sXDbUW3djAbinhLJ3v5UaOlgZo3B7EU729dIIF/KNNZV
         fuVvxPc4LwFSnElqzFU0OWE5HsDo25lMDHBdAcHaxDBP+bdBV3xHxKlkF4HMT4IGeeT9
         sch9L8T7tUeP7GWuLIE+ApJj6cpHw/jCnkgRkMW5EAmQeelgWo5+LbtXVcOUK6RgBCM6
         HHS83BVRw7TmMZmLW2L4roY6yeGmUH4C5HgB8G2bsK26UtCasddwDe2Otrz4To+1aZCg
         VvMw==
X-Forwarded-Encrypted: i=1; AFNElJ9w44D8SFT3Qzq7NbukMmwTsfkg3d1he+ny85CO8ec/o8qXRmg0gO5MNZzk0AEaThaRzHLEiZxEJH7T@vger.kernel.org
X-Gm-Message-State: AOJu0YxjRgZCxPzR+NWhDWyEVKGbMtmNUXcOfUDeZBHMERImCUMP7cP0
	5QTjQwb3BmpLea3l3t1qICvg0hR5eSFVWpkLbgWiQKHupMHq4nwElGWWa+bQZ052YPmqGRlI5Lh
	Cc4WA+l0uvY0DQfetxMAb0L5xdnOBxA86E+GLgkr+Cj+3Sdmf5Jb21svAfK6jQUSR
X-Gm-Gg: Acq92OF0lye0x6OUjypxloW/Lco8CUNmylb+MMmq6gOuZSQM5dfOygWAQfl34tGGBEa
	wy6Xq7zuqYH5y9kvoJ79MthvD/j98d42qkAlznXgCkCEqmz7aNsvw59bYRwMoyi8sjrYEPoRLob
	bMeVTq45gJEfDS4oRoRetMADkiGk4mnfWhefBGAeNWzHJQoAmqunIFxhKrrrq2B/3vBUlO0ggJO
	GPmYSQIF0HSDmLnZ/imvttLVSwxJJFZGLIBW7TtOcAuzGFU1LHODWsjGrrsqhrgnVsrlUhKb3b5
	K5RzPg8XrH2jmzHc5EO3BNK+J2vT8YAMCH56MbDwDr0VgKZ7usTblmup9TUnBgZtFqAI8Gg2ZRU
	hY8HgpLYD8Hc/cQLXDDSnWdBJVRfEjOL0wDdAWBE9GHmzr3k38w==
X-Received: by 2002:a17:90b:2248:b0:35d:a3b4:2f0d with SMTP id 98e67ed59e1d1-365ab9b8c6cmr12117252a91.6.1778240211862;
        Fri, 08 May 2026 04:36:51 -0700 (PDT)
X-Received: by 2002:a17:90b:2248:b0:35d:a3b4:2f0d with SMTP id 98e67ed59e1d1-365ab9b8c6cmr12117216a91.6.1778240211311;
        Fri, 08 May 2026 04:36:51 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36645bdac03sm1256373a91.2.2026.05.08.04.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:36:51 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] pinctrl: qcom: lpass-lpi: Switch to PM clock framework for runtime PM
Date: Fri,  8 May 2026 17:06:36 +0530
Message-Id: <20260508113636.3561383-3-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com>
References: <20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMCBTYWx0ZWRfXx4zfOTT4VLKF
 jLlnfgdZw+MbRIFv5WRfD2M4BtJ2hsbTRondwZMT+qcoA3gSNF/LcxF9FVVYREicl1bFHO7Lt+w
 wswC2ho+SIRWB2tpuTzZxZnPilP6n1x1L/+4Tz5fxPLDKDRc4xyAfvKZuDqtyoGeyLSqHCICjw9
 JH2YGDTBiTT6m9y2zFAwzHuYKgKX1W/TNzgLmlPPABD722pYNLIpERDqWJ4/4wnTVOJ90KDNR3V
 MzQ2NN8bEzIVFxGfSO2FE7Fas0V7Bve4OmW0j5ih6TLyv4vhRQN1JdaEMq7T0ZYZnitvTNLS6g+
 9bgl1x9SQmdoYQW8CT/wSiW2m+ge5gKugHYSL5Epu50SThAUtTCLQ+nSK+vJpL8/2k6LRD+x16B
 ikJMdtqEAec5E/q49vel3J+Z9+9QmJGRTcFpBP8HxVizpumy42IhuYpwa3NdKARmm8YjlnjL/Od
 OwZYzx6JkHnM0i74/bg==
X-Proofpoint-GUID: bQDLxlJp9cUlifd5b-RKaHzsRfH4WWkK
X-Authority-Analysis: v=2.4 cv=JJQLdcKb c=1 sm=1 tr=0 ts=69fdcad4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=pmTXJCWftoUlG_UUdvAA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: bQDLxlJp9cUlifd5b-RKaHzsRfH4WWkK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080120
X-Rspamd-Queue-Id: B63EC4F5DC8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36459-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Convert the LPASS LPI pinctrl driver to use the PM clock framework for
runtime power management.

This allows the LPASS LPI pinctrl driver to drop clock votes when idle,
improves power efficiency on platforms using LPASS LPI island mode, and
aligns the driver with common runtime PM patterns used across Qualcomm
LPASS subsystems.

Guard GPIO register read/write helpers and slew-rate register programming
with synchronous runtime PM calls so the device is active during MMIO
operations whenever autosuspend is enabled.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c      | 109 +++++++++++++-----
 .../pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   |   7 ++
 2 files changed, 84 insertions(+), 32 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 15ced5027579..cd5dd18fd149 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -15,6 +15,8 @@
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinmux.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "../pinctrl-utils.h"
 
@@ -22,7 +24,6 @@
 
 #define MAX_NR_GPIO		32
 #define GPIO_FUNC		0
-#define MAX_LPI_NUM_CLKS	2
 
 struct lpi_pinctrl {
 	struct device *dev;
@@ -31,7 +32,6 @@ struct lpi_pinctrl {
 	struct pinctrl_desc desc;
 	char __iomem *tlmm_base;
 	char __iomem *slew_base;
-	struct clk_bulk_data clks[MAX_LPI_NUM_CLKS];
 	/* Protects from concurrent register updates */
 	struct mutex lock;
 	DECLARE_BITMAP(ever_gpio, MAX_NR_GPIO);
@@ -39,29 +39,43 @@ struct lpi_pinctrl {
 };
 
 static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
-			 unsigned int addr)
+			 unsigned int addr, u32 *val)
 {
 	u32 pin_offset;
+	int ret;
 
 	if (state->data->flags & LPI_FLAG_USE_PREDEFINED_PIN_OFFSET)
 		pin_offset = state->data->groups[pin].pin_offset;
 	else
 		pin_offset = LPI_TLMM_REG_OFFSET * pin;
 
-	return ioread32(state->tlmm_base + pin_offset + addr);
+	ret = pm_runtime_resume_and_get(state->dev);
+	if (ret < 0)
+		return ret;
+
+	*val = ioread32(state->tlmm_base + pin_offset + addr);
+	pm_runtime_put_autosuspend(state->dev);
+
+	return 0;
 }
 
 static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
 			  unsigned int addr, unsigned int val)
 {
 	u32 pin_offset;
+	int ret;
 
 	if (state->data->flags & LPI_FLAG_USE_PREDEFINED_PIN_OFFSET)
 		pin_offset = state->data->groups[pin].pin_offset;
 	else
 		pin_offset = LPI_TLMM_REG_OFFSET * pin;
 
+	ret = pm_runtime_resume_and_get(state->dev);
+	if (ret < 0)
+		return ret;
+
 	iowrite32(val, state->tlmm_base + pin_offset + addr);
+	pm_runtime_put_autosuspend(state->dev);
 
 	return 0;
 }
@@ -107,8 +121,8 @@ static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 {
 	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	const struct lpi_pingroup *g = &pctrl->data->groups[group];
-	u32 val;
-	int i, pin = g->pin;
+	u32 val, io_val;
+	int i, pin = g->pin, ret;
 
 	for (i = 0; i < g->nfuncs; i++) {
 		if (g->funcs[i] == function)
@@ -119,7 +133,9 @@ static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 		return -EINVAL;
 
 	mutex_lock(&pctrl->lock);
-	val = lpi_gpio_read(pctrl, pin, LPI_GPIO_CFG_REG);
+	ret = lpi_gpio_read(pctrl, pin, LPI_GPIO_CFG_REG, &val);
+	if (ret)
+		goto unlock;
 
 	/*
 	 * If this is the first time muxing to GPIO and the direction is
@@ -129,24 +145,32 @@ static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 	 */
 	if (i == GPIO_FUNC && (val & LPI_GPIO_OE_MASK) &&
 	    !test_and_set_bit(group, pctrl->ever_gpio)) {
-		u32 io_val = lpi_gpio_read(pctrl, group, LPI_GPIO_VALUE_REG);
+		ret = lpi_gpio_read(pctrl, group, LPI_GPIO_VALUE_REG, &io_val);
+		if (ret)
+			goto unlock;
 
 		if (io_val & LPI_GPIO_VALUE_IN_MASK) {
 			if (!(io_val & LPI_GPIO_VALUE_OUT_MASK))
-				lpi_gpio_write(pctrl, group, LPI_GPIO_VALUE_REG,
-					       io_val | LPI_GPIO_VALUE_OUT_MASK);
+				ret = lpi_gpio_write(pctrl, group,
+						     LPI_GPIO_VALUE_REG,
+						     io_val | LPI_GPIO_VALUE_OUT_MASK);
 		} else {
 			if (io_val & LPI_GPIO_VALUE_OUT_MASK)
-				lpi_gpio_write(pctrl, group, LPI_GPIO_VALUE_REG,
-					       io_val & ~LPI_GPIO_VALUE_OUT_MASK);
+				ret = lpi_gpio_write(pctrl, group,
+						     LPI_GPIO_VALUE_REG,
+						     io_val & ~LPI_GPIO_VALUE_OUT_MASK);
 		}
+		if (ret)
+			goto unlock;
 	}
 
 	u32p_replace_bits(&val, i, LPI_GPIO_FUNCTION_MASK);
-	lpi_gpio_write(pctrl, pin, LPI_GPIO_CFG_REG, val);
+	ret = lpi_gpio_write(pctrl, pin, LPI_GPIO_CFG_REG, val);
+
+unlock:
 	mutex_unlock(&pctrl->lock);
 
-	return 0;
+	return ret;
 }
 
 static const struct pinmux_ops lpi_gpio_pinmux_ops = {
@@ -162,11 +186,15 @@ static int lpi_config_get(struct pinctrl_dev *pctldev,
 	unsigned int param = pinconf_to_config_param(*config);
 	struct lpi_pinctrl *state = dev_get_drvdata(pctldev->dev);
 	unsigned int arg = 0;
+	int ret;
 	int is_out;
 	int pull;
 	u32 ctl_reg;
 
-	ctl_reg = lpi_gpio_read(state, pin, LPI_GPIO_CFG_REG);
+	ret = lpi_gpio_read(state, pin, LPI_GPIO_CFG_REG, &ctl_reg);
+	if (ret)
+		return ret;
+
 	is_out = ctl_reg & LPI_GPIO_OE_MASK;
 	pull = FIELD_GET(LPI_GPIO_PULL_MASK, ctl_reg);
 
@@ -206,7 +234,7 @@ static int lpi_config_set_slew_rate(struct lpi_pinctrl *pctrl,
 {
 	unsigned long sval;
 	void __iomem *reg;
-	int slew_offset;
+	int slew_offset, ret;
 
 	if (slew > LPI_SLEW_RATE_MAX) {
 		dev_err(pctrl->dev, "invalid slew rate %u for pin: %d\n",
@@ -225,6 +253,10 @@ static int lpi_config_set_slew_rate(struct lpi_pinctrl *pctrl,
 	else
 		reg = pctrl->slew_base + LPI_SLEW_RATE_CTL_REG;
 
+	ret = pm_runtime_resume_and_get(pctrl->dev);
+	if (ret < 0)
+		return ret;
+
 	mutex_lock(&pctrl->lock);
 
 	sval = ioread32(reg);
@@ -233,6 +265,7 @@ static int lpi_config_set_slew_rate(struct lpi_pinctrl *pctrl,
 	iowrite32(sval, reg);
 
 	mutex_unlock(&pctrl->lock);
+	pm_runtime_put_autosuspend(pctrl->dev);
 
 	return 0;
 }
@@ -291,21 +324,27 @@ static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
 	 */
 	if (output_enabled) {
 		val = u32_encode_bits(value ? 1 : 0, LPI_GPIO_VALUE_OUT_MASK);
-		lpi_gpio_write(pctrl, group, LPI_GPIO_VALUE_REG, val);
+		ret = lpi_gpio_write(pctrl, group, LPI_GPIO_VALUE_REG, val);
+		if (ret)
+			return ret;
 	}
 
 	mutex_lock(&pctrl->lock);
-	val = lpi_gpio_read(pctrl, group, LPI_GPIO_CFG_REG);
+	ret = lpi_gpio_read(pctrl, group, LPI_GPIO_CFG_REG, &val);
+	if (ret)
+		goto unlock;
 
 	u32p_replace_bits(&val, pullup, LPI_GPIO_PULL_MASK);
 	u32p_replace_bits(&val, LPI_GPIO_DS_TO_VAL(strength),
 			  LPI_GPIO_OUT_STRENGTH_MASK);
 	u32p_replace_bits(&val, output_enabled, LPI_GPIO_OE_MASK);
 
-	lpi_gpio_write(pctrl, group, LPI_GPIO_CFG_REG, val);
+	ret = lpi_gpio_write(pctrl, group, LPI_GPIO_CFG_REG, val);
+
+unlock:
 	mutex_unlock(&pctrl->lock);
 
-	return 0;
+	return ret;
 }
 
 static const struct pinconf_ops lpi_gpio_pinconf_ops = {
@@ -354,9 +393,14 @@ static int lpi_gpio_direction_output(struct gpio_chip *chip,
 static int lpi_gpio_get(struct gpio_chip *chip, unsigned int pin)
 {
 	struct lpi_pinctrl *state = gpiochip_get_data(chip);
+	u32 val;
+	int ret;
 
-	return lpi_gpio_read(state, pin, LPI_GPIO_VALUE_REG) &
-		LPI_GPIO_VALUE_IN_MASK;
+	ret = lpi_gpio_read(state, pin, LPI_GPIO_VALUE_REG, &val);
+	if (ret)
+		return ret;
+
+	return val & LPI_GPIO_VALUE_IN_MASK;
 }
 
 static int lpi_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
@@ -399,7 +443,9 @@ static void lpi_gpio_dbg_show_one(struct seq_file *s,
 
 	pctldev = pctldev ? : state->ctrl;
 	pindesc = pctldev->desc->pins[offset];
-	ctl_reg = lpi_gpio_read(state, offset, LPI_GPIO_CFG_REG);
+	if (lpi_gpio_read(state, offset, LPI_GPIO_CFG_REG, &ctl_reg))
+		return;
+
 	is_out = ctl_reg & LPI_GPIO_OE_MASK;
 
 	func = FIELD_GET(LPI_GPIO_FUNCTION_MASK, ctl_reg);
@@ -482,9 +528,6 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 	pctrl->data = data;
 	pctrl->dev = &pdev->dev;
 
-	pctrl->clks[0].id = "core";
-	pctrl->clks[1].id = "audio";
-
 	pctrl->tlmm_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pctrl->tlmm_base))
 		return dev_err_probe(dev, PTR_ERR(pctrl->tlmm_base),
@@ -497,13 +540,17 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 					     "Slew resource not provided\n");
 	}
 
-	ret = devm_clk_bulk_get_optional(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
+	ret = devm_pm_clk_create(dev);
 	if (ret)
 		return ret;
 
-	ret = clk_bulk_prepare_enable(MAX_LPI_NUM_CLKS, pctrl->clks);
-	if (ret)
-		return dev_err_probe(dev, ret, "Can't enable clocks\n");
+	ret = of_pm_clk_add_clks(dev);
+	if (ret < 0 && ret != -ENODEV)
+		return ret;
+
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
+	devm_pm_runtime_enable(dev);
 
 	pctrl->desc.pctlops = &lpi_gpio_pinctrl_ops;
 	pctrl->desc.pmxops = &lpi_gpio_pinmux_ops;
@@ -542,7 +589,6 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 
 err_pinctrl:
 	mutex_destroy(&pctrl->lock);
-	clk_bulk_disable_unprepare(MAX_LPI_NUM_CLKS, pctrl->clks);
 
 	return ret;
 }
@@ -554,7 +600,6 @@ void lpi_pinctrl_remove(struct platform_device *pdev)
 	int i;
 
 	mutex_destroy(&pctrl->lock);
-	clk_bulk_disable_unprepare(MAX_LPI_NUM_CLKS, pctrl->clks);
 
 	for (i = 0; i < pctrl->data->npins; i++)
 		pinctrl_generic_remove_group(pctrl->ctrl, i);
diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
index 750f410311a8..64a200dd8f41 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
@@ -7,6 +7,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -139,10 +141,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
 		   .name = "qcom-sc7280-lpass-lpi-pinctrl",
 		   .of_match_table = lpi_pinctrl_of_match,
+		   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
-- 
2.34.1


