Return-Path: <linux-gpio+bounces-36762-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNOOBNuSBGqrLgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36762-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 17:03:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F00F7535AD9
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 17:03:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10BBA34AED6A
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 14:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5808B30276A;
	Wed, 13 May 2026 14:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ku7GOyc4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jP2Vhzgc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515B62DEA86
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 14:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778680837; cv=none; b=sYwg0P+PJZz1gwO55ShFXyA3z0EpsVHhal1sk12DHM8IByRI5HjLuoTGMSKZid9o8x48EokWtPmZ3friSoII+YtyeWY5TQRFEVvkNeoWrTAzpGKriKiz0lUbCe2oNxEOeLXLvNeAbnEiMkUcolV5XZGMqg0jcE/L8bAkh+fpv8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778680837; c=relaxed/simple;
	bh=p8kH/gyJtTVICpeZrt3scOkbql6vobJ1HuFCfRRT5gI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AwLRtIozos+j9u2mTplwyeBRYTobF7YSFzuUzDo5JzcqixfFEugrR8MFLFr0eJ/NJQ7K4mA2CUy4pZbsfc9Haxfe1B3K+GqQOy9J9Cbxx9qeStOx1VOMZZ2axwXBcPbpFF3h51qeb5oDlDVySOwbTJlsYvJ+hxkI+Rb1heMlUkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ku7GOyc4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jP2Vhzgc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAGSh62321233
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 14:00:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3qcmfJw6E9v
	zEBeSLZROio3CSr/CKaectPJm5kJFU2c=; b=ku7GOyc4hXy1CFdbeIWoPWnWyiQ
	b0EfLzMAmtIR6Dk/xD51ErvjM/J7QyV3y5YpKdFEJrpkgQmbHRtDhj+8TT/95Ikc
	xnhuMxbo5NN6zOyD7s1lzqazTajS2MCzAOH2trBqmIwXAgQ1ASWGXkvYm7OfWa46
	cpR80hUI3I4KoAMhEYqJMgr3j6IJfLOMiLp5REMhwtX8qKsNkKegMCAaEtzZFhlc
	FhmMgxViIViPmxqWFjRkvVS1cLLLYJ/KTU8bpgVww8l+v0FdY3ySq4fMr7rulsXg
	/iAs1BLknj74Neexp1rHqLTqkrvFgCYicF0FzKfbCo3hqPAU+MCYfZos2wQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hgua9bc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 14:00:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bd00a65673so19799085ad.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 07:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778680833; x=1779285633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qcmfJw6E9vzEBeSLZROio3CSr/CKaectPJm5kJFU2c=;
        b=jP2VhzgcGJtHZ1kJnkGUmYH+V4eSyk4fyGiD6fQ1PYeQQ5oh8kZYiTtfDI3Ehppqu0
         PzOhoxZWlZWNmIq2hGZ0WZu0dLiPVt7w9qDJxGl9hhBm/sw693TQzDNwzp1FC7qXY60T
         l7z2Cfe/GiY+l4nTrzNHEi4buARnv7xEDZ/NdKr1ghB3uEHX0grY67qdZAaIRUeGc+fN
         YDDKuzMDtZIzzf29JmxQMPOk84dUDbm9e5ncTprzSmHw8q3p+Pk498+J52PyCg/aagUb
         haDw0wme3SWH5loUY6ttQUUtc7H4Y0zbUv1yXDjH9gbfNneU9JDDwBKd7HX/VKLGVCG4
         bv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778680833; x=1779285633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3qcmfJw6E9vzEBeSLZROio3CSr/CKaectPJm5kJFU2c=;
        b=slgGohzR0l5ObuGHqlKgXH2p2mS5jL0S7hRUM4rCMjRWewZOKlJfaHuOmd70E3AfjR
         BSGdbiNlim7+eFVdI2epcGIqP2lw5SUbrQ7MAqqu2Y9AfheyrBc93Z38AYYzTE9eT339
         KiUmD80oQhokIt2sQTjjLc6EsfYtE8hGnnOfQVmQHn5pBAazu6xiWK54TTojkeWUbQ1e
         vcth1/+FUZ7A+4wvCNp29awX51opYpP65bYnN+toHxXcgrVlIof9CpE24+4PGS9Kidqz
         pohq/sISedKmG3b8c2SPwbrVqhBO7av3uV1EzZzr3D3U56+2e7MkpF6fuQKx++Hpiz10
         7gHg==
X-Forwarded-Encrypted: i=1; AFNElJ/LGtc5svBSc863jVZwnbTiaeypZcLdS3/v4iUPqyLxDTPZRq7pfjWkpL1DMPeV71Vx0g01SErAhkt5@vger.kernel.org
X-Gm-Message-State: AOJu0YwNKg3TqMGzigZT0rWr6epLKF2cGqnLOlX08UAJxJLcLZVqnziw
	sA/qWwgM9Z9acYGjoR5VS7K03K1daSNU1/z3kJNcYmx5knhJRXESgNvT3dkcvFq2B+0od+YmSvf
	q3UxN2F7e22AO+gzUNWtraO0iD9j3rW6gXiXYcxqFi37nbMscz31FHxjginZvlaK4
X-Gm-Gg: Acq92OH5xeP0B0fJ2GmI9j8zQV75X+lz2rUhMZrxVGHqsPdd91CvkDJcuPsSd4srIq3
	V+Mi7aGZxog5xFj3U3PHendJggGPezKBB/9RtsJ+iI5+OGPrr12ognPN49vNJIUFbHdBE44aLOO
	6+I+HTJm/OSuj8IihBwEriI6+r+DPXZrRdh+AC0eCkJfk71EzcR4Iq3ghOlgG/WKNeJORSizTCx
	f1XHCtiPePp2b/vA7Th4SKix5n66vHmGqWRChjOhwqOQV43cYO3uju1I4mEnQVjjYAyq/EENfZL
	Mq7OKDrxzpqB59sWCj3wCr2t47BSR90fkRMAPkWQIsor5knRrioh3Yuzwb+0llQPaY5jRWdxrgu
	RfYc3vn9HLZZVUrXSbHscWl1VVXvMS53tbWZLA3WRTsg1OqH+Mw==
X-Received: by 2002:a17:902:9a08:b0:2ba:bab2:a867 with SMTP id d9443c01a7336-2bcfd0307fdmr60657955ad.12.1778680832112;
        Wed, 13 May 2026 07:00:32 -0700 (PDT)
X-Received: by 2002:a17:902:9a08:b0:2ba:bab2:a867 with SMTP id d9443c01a7336-2bcfd0307fdmr60654805ad.12.1778680827437;
        Wed, 13 May 2026 07:00:27 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ec232esm176189555ad.81.2026.05.13.07.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:00:27 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] pinctrl: qcom: lpass-lpi: Switch to PM clock framework for runtime PM
Date: Wed, 13 May 2026 19:30:09 +0530
Message-Id: <20260513140009.3841770-3-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260513140009.3841770-1-ajay.nandam@oss.qualcomm.com>
References: <20260513140009.3841770-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a048401 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=3QRHifK0ykk7E49SFh4A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: _-9tgQINCbktN3M9cTO7MVmHol1kn_M6
X-Proofpoint-ORIG-GUID: _-9tgQINCbktN3M9cTO7MVmHol1kn_M6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0MyBTYWx0ZWRfX5z3Cwx9KtNRr
 LiEsW06tbEzQhb1dO7vOqxjv/Vpb+qypOPICEZ3teNOo/NZ8xWUyhFA9vQl30dja6iSLlX6C4LM
 GBKbdTVdol98zytqRlDYHWnKr45JI/gzWJixWj5v+dg6SBwbXeVENzSKUhFsXAT6ZyLPEItno2h
 n+cvtOrmbe7Pa6RhSjGAU36ljjt0Q+bp71UtfLGwaChEVm4PK+FEGam6F1Jy5ytKy5Uctemn+NO
 FT6L0d6/hcg+WE7kjnU6QW0+ljHLjtnUrn8BYVL3dYTe8Q5tFbOX7OU1Zjt9SUSnjIFYSMZKLrz
 qw9jSmtEa59d5vL+s6UMnjZssQA5XVJ9ELm6ydFyLkLsA6imAk83tS/g3N3Tj1DIH1WqW1WC+Bo
 I5dFijBwujTH9uZG+fi6WRLLSZw5AGggPYmVOURKr8OrFHVlRjDwKNk3OVfkNxlFFBfS0iTjAFb
 6wrPkMyFeJ01x+Lxc9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130143
X-Rspamd-Queue-Id: F00F7535AD9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36762-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c      | 114 +++++++++++-------
 .../pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   |  19 ++-
 2 files changed, 86 insertions(+), 47 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 15ced5027579..c8c08f81191e 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -15,6 +15,9 @@
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinmux.h>
+#include <linux/cleanup.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "../pinctrl-utils.h"
 
@@ -22,7 +25,6 @@
 
 #define MAX_NR_GPIO		32
 #define GPIO_FUNC		0
-#define MAX_LPI_NUM_CLKS	2
 
 struct lpi_pinctrl {
 	struct device *dev;
@@ -31,7 +33,6 @@ struct lpi_pinctrl {
 	struct pinctrl_desc desc;
 	char __iomem *tlmm_base;
 	char __iomem *slew_base;
-	struct clk_bulk_data clks[MAX_LPI_NUM_CLKS];
 	/* Protects from concurrent register updates */
 	struct mutex lock;
 	DECLARE_BITMAP(ever_gpio, MAX_NR_GPIO);
@@ -39,31 +40,41 @@ struct lpi_pinctrl {
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
+	return pm_runtime_put_autosuspend(state->dev);
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
 
-	iowrite32(val, state->tlmm_base + pin_offset + addr);
+	ret = pm_runtime_resume_and_get(state->dev);
+	if (ret < 0)
+		return ret;
 
-	return 0;
+	iowrite32(val, state->tlmm_base + pin_offset + addr);
+	return pm_runtime_put_autosuspend(state->dev);
 }
 
 static const struct pinctrl_ops lpi_gpio_pinctrl_ops = {
@@ -107,8 +118,8 @@ static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 {
 	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	const struct lpi_pingroup *g = &pctrl->data->groups[group];
-	u32 val;
-	int i, pin = g->pin;
+	u32 val, io_val;
+	int i, pin = g->pin, ret;
 
 	for (i = 0; i < g->nfuncs; i++) {
 		if (g->funcs[i] == function)
@@ -118,8 +129,10 @@ static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 	if (WARN_ON(i == g->nfuncs))
 		return -EINVAL;
 
-	mutex_lock(&pctrl->lock);
-	val = lpi_gpio_read(pctrl, pin, LPI_GPIO_CFG_REG);
+	guard(mutex)(&pctrl->lock);
+	ret = lpi_gpio_read(pctrl, pin, LPI_GPIO_CFG_REG, &val);
+	if (ret)
+		return ret;
 
 	/*
 	 * If this is the first time muxing to GPIO and the direction is
@@ -129,24 +142,27 @@ static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 	 */
 	if (i == GPIO_FUNC && (val & LPI_GPIO_OE_MASK) &&
 	    !test_and_set_bit(group, pctrl->ever_gpio)) {
-		u32 io_val = lpi_gpio_read(pctrl, group, LPI_GPIO_VALUE_REG);
+		ret = lpi_gpio_read(pctrl, group, LPI_GPIO_VALUE_REG, &io_val);
+		if (ret)
+			return ret;
 
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
+			return ret;
 	}
 
 	u32p_replace_bits(&val, i, LPI_GPIO_FUNCTION_MASK);
-	lpi_gpio_write(pctrl, pin, LPI_GPIO_CFG_REG, val);
-	mutex_unlock(&pctrl->lock);
-
-	return 0;
+	return lpi_gpio_write(pctrl, pin, LPI_GPIO_CFG_REG, val);
 }
 
 static const struct pinmux_ops lpi_gpio_pinmux_ops = {
@@ -162,11 +178,15 @@ static int lpi_config_get(struct pinctrl_dev *pctldev,
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
 
@@ -206,7 +226,7 @@ static int lpi_config_set_slew_rate(struct lpi_pinctrl *pctrl,
 {
 	unsigned long sval;
 	void __iomem *reg;
-	int slew_offset;
+	int slew_offset, ret;
 
 	if (slew > LPI_SLEW_RATE_MAX) {
 		dev_err(pctrl->dev, "invalid slew rate %u for pin: %d\n",
@@ -225,6 +245,10 @@ static int lpi_config_set_slew_rate(struct lpi_pinctrl *pctrl,
 	else
 		reg = pctrl->slew_base + LPI_SLEW_RATE_CTL_REG;
 
+	ret = pm_runtime_resume_and_get(pctrl->dev);
+	if (ret < 0)
+		return ret;
+
 	mutex_lock(&pctrl->lock);
 
 	sval = ioread32(reg);
@@ -233,8 +257,7 @@ static int lpi_config_set_slew_rate(struct lpi_pinctrl *pctrl,
 	iowrite32(sval, reg);
 
 	mutex_unlock(&pctrl->lock);
-
-	return 0;
+	return pm_runtime_put_autosuspend(pctrl->dev);
 }
 
 static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
@@ -291,21 +314,22 @@ static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
 	 */
 	if (output_enabled) {
 		val = u32_encode_bits(value ? 1 : 0, LPI_GPIO_VALUE_OUT_MASK);
-		lpi_gpio_write(pctrl, group, LPI_GPIO_VALUE_REG, val);
+		ret = lpi_gpio_write(pctrl, group, LPI_GPIO_VALUE_REG, val);
+		if (ret)
+			return ret;
 	}
 
-	mutex_lock(&pctrl->lock);
-	val = lpi_gpio_read(pctrl, group, LPI_GPIO_CFG_REG);
+	guard(mutex)(&pctrl->lock);
+	ret = lpi_gpio_read(pctrl, group, LPI_GPIO_CFG_REG, &val);
+	if (ret)
+		return ret;
 
 	u32p_replace_bits(&val, pullup, LPI_GPIO_PULL_MASK);
 	u32p_replace_bits(&val, LPI_GPIO_DS_TO_VAL(strength),
 			  LPI_GPIO_OUT_STRENGTH_MASK);
 	u32p_replace_bits(&val, output_enabled, LPI_GPIO_OE_MASK);
 
-	lpi_gpio_write(pctrl, group, LPI_GPIO_CFG_REG, val);
-	mutex_unlock(&pctrl->lock);
-
-	return 0;
+	return lpi_gpio_write(pctrl, group, LPI_GPIO_CFG_REG, val);
 }
 
 static const struct pinconf_ops lpi_gpio_pinconf_ops = {
@@ -354,9 +378,14 @@ static int lpi_gpio_direction_output(struct gpio_chip *chip,
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
@@ -399,7 +428,9 @@ static void lpi_gpio_dbg_show_one(struct seq_file *s,
 
 	pctldev = pctldev ? : state->ctrl;
 	pindesc = pctldev->desc->pins[offset];
-	ctl_reg = lpi_gpio_read(state, offset, LPI_GPIO_CFG_REG);
+	if (lpi_gpio_read(state, offset, LPI_GPIO_CFG_REG, &ctl_reg))
+		return;
+
 	is_out = ctl_reg & LPI_GPIO_OE_MASK;
 
 	func = FIELD_GET(LPI_GPIO_FUNCTION_MASK, ctl_reg);
@@ -482,9 +513,6 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 	pctrl->data = data;
 	pctrl->dev = &pdev->dev;
 
-	pctrl->clks[0].id = "core";
-	pctrl->clks[1].id = "audio";
-
 	pctrl->tlmm_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pctrl->tlmm_base))
 		return dev_err_probe(dev, PTR_ERR(pctrl->tlmm_base),
@@ -497,13 +525,19 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 					     "Slew resource not provided\n");
 	}
 
-	ret = devm_clk_bulk_get_optional(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
+	ret = devm_pm_clk_create(dev);
 	if (ret)
 		return ret;
 
-	ret = clk_bulk_prepare_enable(MAX_LPI_NUM_CLKS, pctrl->clks);
+	ret = of_pm_clk_add_clks(dev);
+	if (ret < 0 && ret != -ENODEV)
+		return ret;
+
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret)
-		return dev_err_probe(dev, ret, "Can't enable clocks\n");
+		return ret;
 
 	pctrl->desc.pctlops = &lpi_gpio_pinctrl_ops;
 	pctrl->desc.pmxops = &lpi_gpio_pinmux_ops;
@@ -542,7 +576,6 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 
 err_pinctrl:
 	mutex_destroy(&pctrl->lock);
-	clk_bulk_disable_unprepare(MAX_LPI_NUM_CLKS, pctrl->clks);
 
 	return ret;
 }
@@ -554,7 +587,6 @@ void lpi_pinctrl_remove(struct platform_device *pdev)
 	int i;
 
 	mutex_destroy(&pctrl->lock);
-	clk_bulk_disable_unprepare(MAX_LPI_NUM_CLKS, pctrl->clks);
 
 	for (i = 0; i < pctrl->data->npins; i++)
 		pinctrl_generic_remove_group(pctrl->ctrl, i);
diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
index 750f410311a8..a61df10d46cb 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
@@ -7,6 +7,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -129,20 +131,25 @@ static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
 
 static const struct of_device_id lpi_pinctrl_of_match[] = {
 	{
-	       .compatible = "qcom,sc7280-lpass-lpi-pinctrl",
-	       .data = &sc7280_lpi_data,
+		.compatible = "qcom,sc7280-lpass-lpi-pinctrl",
+		.data = &sc7280_lpi_data,
 	}, {
-	       .compatible = "qcom,sm8350-lpass-lpi-pinctrl",
-	       .data = &sc7280_lpi_data,
+		.compatible = "qcom,sm8350-lpass-lpi-pinctrl",
+		.data = &sc7280_lpi_data,
 	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
-		   .name = "qcom-sc7280-lpass-lpi-pinctrl",
-		   .of_match_table = lpi_pinctrl_of_match,
+		.name = "qcom-sc7280-lpass-lpi-pinctrl",
+		.of_match_table = lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
-- 
2.34.1


