Return-Path: <linux-gpio+bounces-35258-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4K2yBbwd5mkMsAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35258-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 14:36:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 190E042ACF1
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 14:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3C7BD302085C
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 12:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967BD39FCD6;
	Mon, 20 Apr 2026 12:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O8Ciu6DX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MA7LdkXD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD2E39FCAB
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 12:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776688317; cv=none; b=GF6Bhv62bFwpCOF+KL0+cFU05FVc4F+1FhYinhLw/qkhNZO+vHAWbX3YTHIvxlGmPaEyx7ykYfgHHbjGhfPDF/da21Ib5swGt6bfhtDKpxRf6lZ/mBpezYs5+CV8qgswxou9n+Juf4efmkmUHrDVU5ddOzWfcLAmdAMaXU8fwOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776688317; c=relaxed/simple;
	bh=D33RLHcnu03tDPMHvddUZq9xsNyemrdy+2wpzgXVACI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XBQoduwCRKu0lZqcNEgIwAZLkKtzLF64rpA2TnRp/MHaHuegLl7YaX1kDR9K5TIvXyFI2p7zJ5XFV+GPR2Ooss9SIABVzpxM51O5ipqlmuq08C+hxMSxQuhfYMbje8taSV+vEqtSrwtDj+V+FtScvrVVU1ECbw0Q41lS2q9mnBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O8Ciu6DX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MA7LdkXD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K9J7E0785636
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 12:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BuyqIDl4EgS
	9NX7o0yRwJQQxQlytyU2BJsEt6TVPCdg=; b=O8Ciu6DX1kcaRiRMge4fBMKzE49
	Auile1H9cCt7FB3BwaA+pcMKYKqIrJiiF4KB0p1VYSYN4RwwKc9irressz5XaNhf
	EssPWOHqHTHuHZRrJyhoUAAbX5ak+7/qIDm0K9RrrdScRwuOd35KLIPNXnABKReX
	/9AG04doQeZ+mEGxuXCpGjM3ZplKg9Nf4KoirxhXo1dskDHyBGmMVjG/D8m96Qog
	G/7ucVraYAKZwQlsddfV94veIMlBYP/xoko8v8MAlTFTJUwJlkPiyH1cal4Bp/Fn
	dZF+V3ZBPsobBJS30gOxLESMdAZVti8XoIokvJq/kd07k+mjjzAMfy3fy9g==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnhdhgmf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 12:31:54 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-79895ffb315so58468457b3.2
        for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 05:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776688314; x=1777293114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BuyqIDl4EgS9NX7o0yRwJQQxQlytyU2BJsEt6TVPCdg=;
        b=MA7LdkXDOqkmOP71GrPx4HIf7AYPAk2S1TQGImO6WavUBIUmAp5r1Hf5P9FyoaFi4T
         aaBnS01eVyEB4yB+VoDsPyFqwGGexbL9QucdvOkDMBtM/wEDUy2LNCftXiT8+LevRK/J
         WSzlHo8VVaAr1IviE3CfZHqUDNU/jpjyczjKaulC0P8fTNFdbPO8DuAV02o7L3JdeqnL
         lpQBm4OcEzI45L7OUTKsMElRfPKfOuQeXtgRRLDwZK6Mz3StTYQQEBSfKKE39ttJyFgB
         7YEUiP46B0vpWYJckP0nk7ovTSckRgVQ4ZgVpgkB4y7zsghPjnheSPlkkwWcyJIigkuU
         jfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776688314; x=1777293114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BuyqIDl4EgS9NX7o0yRwJQQxQlytyU2BJsEt6TVPCdg=;
        b=S4+oXlEpabDEgbYvCiP2cR58aZTkGVm2GyY3P3nxtzDi1hFRWcDKpMk195Ro9TvVBz
         xTMQOeQjlyP7r+NHOsyiPYnBIjxJjkMJKnMjkgzSYqJqcYmi8xLpbRhs3WihJqNvFLjf
         jvzn2Us8ViDzxPL8YSCnuFBSuT+oEFo6+WahF/aM8NSlOziA/PpCd/Io170DWmpz8S1n
         Le9VGJv2tSpimAhViX6fm9wyTyM2/By0eTv4geW8AZSSeAZlfJZKqfVWm75JZT+xwEVS
         AR6KeYQZaIntRCWJj85OP4esALdoqeNsqL0Jt2HcL71mGi2FjOw6AkDikJVnK44bw7H/
         L0Hg==
X-Forwarded-Encrypted: i=1; AFNElJ+jYSSHHm2x77+uIBUMiwsFcZ+3CCx7lkSHYyV+qoT2vbQFFQNoSSk3sRsS/6Wm7dOW+w3pobnwDzZr@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1XyLVe+37k27kH0NswETu+Lcn+5imSl4EwdcEWx84RLoJwA/x
	Gt/yjsTpLOnnGgdpl9FAiv4YqEo0FtWYFGs5KCQvN+p/gl7x/6stY6wbA/gozXshJhhps6WbvCe
	CBNYolI5rS0L0tYiZ+6PL6oVtnCHIcyqucfw0Mmx48DGf8Wo6MMFVCFONGH62l5k3
X-Gm-Gg: AeBDietXc4BYB5f8QEFmFozRzCCm15xsPRWlrEco2vJvMwnI2+UHbaiuTyzzN8f9QBB
	/sAPZeTUDaufRxchLi2KyqZYJv/yCZGpSxZkxGAlCQuSmcgSS4S4jzNtW5dQSO1Ymv5ZboB1anp
	pOXZF+EAT9aulNaysYBKx5oACysmYC6XyF/j+4NQiAUi44n3fEf/bZl4XmTJsSFdNk4De/gCKBi
	uNgrUO+b+krrROD6r1JZJ0NNHTg3So4kspkqVSnZAet48R6Rn9yDMsyKukp1QSG/mbSPsbRsztT
	F08QTHZW6X05ZYb1NbKrNfmzML23YykR+8+OY8oAk5B15T020Q//GyzZEPqhBa5cBEI1c1b2GRV
	NouEmkKUHUn1zRumqMXbCPeVYitriC/KUBUwK+nu3afs6Bc0gtw7+AvbMhPml
X-Received: by 2002:a05:690c:498f:b0:7b8:f152:7538 with SMTP id 00721157ae682-7b9ece761fdmr145060217b3.1.1776688313994;
        Mon, 20 Apr 2026 05:31:53 -0700 (PDT)
X-Received: by 2002:a05:690c:498f:b0:7b8:f152:7538 with SMTP id 00721157ae682-7b9ece761fdmr145059797b3.1.1776688313525;
        Mon, 20 Apr 2026 05:31:53 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee8be8e4sm44014267b3.14.2026.04.20.05.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 05:31:53 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2 1/3] pinctrl: qcom: lpass-lpi: Switch to PM clock framework for runtime PM
Date: Mon, 20 Apr 2026 18:01:33 +0530
Message-Id: <20260420123135.350446-2-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420123135.350446-1-ajay.nandam@oss.qualcomm.com>
References: <20260420123135.350446-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lv4HPqbEht-5Fw3mhflNnYTyR1hxfG4J
X-Authority-Analysis: v=2.4 cv=IMgyzAvG c=1 sm=1 tr=0 ts=69e61cba cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=6_wSKh-cYxHhlBVotpgA:9 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: lv4HPqbEht-5Fw3mhflNnYTyR1hxfG4J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEyMyBTYWx0ZWRfX7pWlWQfp+FDF
 fU1uCxJIP+M2iv4JU3pmrusqPYmH7kwu5SMql4kNx1bm7KRyGsHQqd2IOn8wPyjkykgMsypBY4o
 Pyrmr6Ab6j8MqM0etNUSZjAFhsRYN/KzXp5vclFPlBAeVGQw2cBMno+eOyRC5+M6dsvGStSzPNh
 MwcnHi217I5OAJTHN4l3gJad/7zmsslGMA2RHVdJuID6aiuakCvgU6pmQh9IMJL8TwnDI3Iw/CI
 5k9GRqzOKLVN92f6b+VvyCmm8kVMbO/23Hs915RNfW056Uqj79niDQsavVpEpm6wWfAAe/YPmsa
 33k7fssKIsLYLby6va49HiZwMw4ydQE2gHhb6yS4yZPN2yfJChtTv3KHjApdzOHNR97zjRg5utH
 4lQKSYMyjfbGLC5tJZGzyW2l08q+Vr0r3oNvMTf7ZWlWH9q9xL1mfhD6/vjWnlmg4mp11YuiAjj
 8GqhhkP+FjQJ3fq/HLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200123
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35258-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 190E042ACF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert the LPASS LPI pinctrl driver to use the PM clock framework for
runtime power management.

This allows the LPASS LPI pinctrl driver to drop clock votes when idle,
improves power efficiency on platforms using LPASS LPI island mode, and
aligns the driver with common runtime PM patterns used across Qualcomm
LPASS subsystems.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c      | 22 +++++++++----------
 .../pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   |  7 ++++++
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 76aed3296279..2b0956ff2ae0 100644
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
@@ -480,9 +480,6 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 	pctrl->data = data;
 	pctrl->dev = &pdev->dev;
 
-	pctrl->clks[0].id = "core";
-	pctrl->clks[1].id = "audio";
-
 	pctrl->tlmm_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pctrl->tlmm_base))
 		return dev_err_probe(dev, PTR_ERR(pctrl->tlmm_base),
@@ -495,13 +492,17 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
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
+	if (ret < 0)
+		return ret;
+
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
+	devm_pm_runtime_enable(dev);
 
 	pctrl->desc.pctlops = &lpi_gpio_pinctrl_ops;
 	pctrl->desc.pmxops = &lpi_gpio_pinmux_ops;
@@ -539,8 +540,8 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 	return 0;
 
 err_pinctrl:
+	pm_runtime_disable(dev);
 	mutex_destroy(&pctrl->lock);
-	clk_bulk_disable_unprepare(MAX_LPI_NUM_CLKS, pctrl->clks);
 
 	return ret;
 }
@@ -552,7 +553,6 @@ void lpi_pinctrl_remove(struct platform_device *pdev)
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


