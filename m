Return-Path: <linux-gpio+bounces-37387-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBFBLcG9EGomdAYAu9opvQ
	(envelope-from <linux-gpio+bounces-37387-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 22:34:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9BE5BA199
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 22:34:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0260301F5D4
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 20:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 703F8384CED;
	Fri, 22 May 2026 20:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DrDCouVL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VfR1LkFi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8F83812C4
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 20:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779482012; cv=none; b=F4pWWDEora6R5VblohgPiI44OGsyjOg7uEgRrggsQ4pufE9jXTmtEpl8PJ65p1TwbLZ9m6Aetqprimo9wG8v40R18DBga+NDa2ir32MfowuYF2JBjfy/nlUJ5HcgL4q9ATbwTUMxzNikS6x2cfdVaaB52fZVM0JKJ/N2iMmH5Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779482012; c=relaxed/simple;
	bh=zw5R6m3M1dCTX7To//JP8E/7ll4enY2Rw+uZa3j95iQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tcUaX1hTYp59O7R09mEZ8rY7m8BV5uGRwVwnLGbaqnDMJieVzPWlPvDV9WapUWwCKvtkDOsRXE1pxnw/eDSzcy06lNCGidG/++8ifi1x768IttgTmejMgvRYGFoP0v3S+wAi3eqGF/jS0WgXb71z2aArLje3RxN9ryaqW4/BIC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DrDCouVL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VfR1LkFi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MIOh0n4007127
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 20:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5FiIOIUfN1k
	cJqWXQMagb5vvpYV/X2uCsLwWpe6IZ/E=; b=DrDCouVLgaIbMf0bF3Lk7HUN73n
	8BbcRGoZJ3QZDs9/NyWtOqbwy6azxh9Vn0hhAqQCCYggtdCTpqSYEBoI7L2VmqLq
	S66jwzDgeDDwK3AIuke1kXOrg/4xPkiDrlNif412QoYtR9pmOcA9EMWmCnxRHOaS
	k28hKtLDY7rrHH8ZEaoI0wfRnC3bcpjL3ElS7BoTdKJQxsG8uDmUYWDDNCuKV6+c
	TqzfsZks7f6T5D6rew6gNxHdHAA66DXvNutJWiAaosnGcBnsnZWj/AazVNeIZ2Jh
	pAkFCizUGjDQo/sJj7msDVpNuFYCdYmB5loJycrFHbgaGV6yCoC9fchSlwg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eavd98ckm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 20:33:29 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa366fb79so10005537b3a.2
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 13:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779482009; x=1780086809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FiIOIUfN1kcJqWXQMagb5vvpYV/X2uCsLwWpe6IZ/E=;
        b=VfR1LkFiDIZsKM7AaoP/dJpod3SMIIKhU9pFmGhMtxXN2TYNJNAfr2iUum4LRiYiMj
         /cxm/i9XoBh+hbJY6UYT60ZrIDqtL9cN7Ib9o6COONmcNWNm8B8ThVi20MfAo4r8Wq9c
         ZOGgN3bPV1m+dxDOUTFusfS0Me79cHrpD8c/8jkjuWOO/K9SOJiajgtbofVnLSFNaG1K
         UvQSWL3n3b9qbTfJukRZUHRzUfnqoncK4zqfZ7xJB1AXCtxGgbXEtPijpYInjorL2taI
         TlehGkovNqCWPwzBZbrZw5ZEMptgfZPLi+5Yv1Jyvjq7FOiUi+gr+aZ1ZlWQETvj1zK/
         3XRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779482009; x=1780086809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5FiIOIUfN1kcJqWXQMagb5vvpYV/X2uCsLwWpe6IZ/E=;
        b=VX7/2FwdpOofw8Fx4/YiEh77tP+Vmpz0+ZsqIgym2cn62C63UG1yMp71P6nEq3sFAs
         CX5f6HBpztQ/sSB4h3YYlAvrARNfin8lKXWlemzY552YCVOdsnB41i1/PkhxEfFiZLk4
         1ymtSgb+n3QV4fB91LgZQrPLbUBv2TcJecfRMIOV54npa36WqJpuHWO+dqh3l7APyjfl
         zkxCDRL1qVQ5xGvM+SVbHxE7szWbWdO7SB2ktarS88dg9juColMMWJk7Aoujh5RdtGSq
         ImX2L/LesByZgRxtq0A0E6r16fKwZu/W4fIG6CCw/yPBmXb/LikfrHE125ysMUi/mEcU
         Tgyg==
X-Forwarded-Encrypted: i=1; AFNElJ99YTL6ME7djusuLPkMyrlOQQh/NBB7Dy6FuzEVAtzrxTC5vKPPqsPwQLQLkgBmTYk9wXc2Suc7p8+m@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5V3e5XBnKuFQT0PkUMJ+qH2RksTgUHdngFypKEp6LhKU3zYou
	pRx0q8L7OUN3h27bIQ7dA1eOtQUOe7112vQKKLUsQS+BTt86aIPOmkTn27HH0fjbSg8VF6NtIIW
	Rb/2InFv6M11vfrSBLH3cvRHKEolSX1oXfiELmu8QU4O3DVWpDVyLunK0aZjfC0JR
X-Gm-Gg: Acq92OFxAxHbD3NBUKXv83EaN6cxxtqm3l25b6PwfsrdB4SB8a0NPCG0AZcAxc0Od+B
	NYXzvg2dCTsT9zHkhlPdSTY09e4Lq//PUG9+yI7UcPdT9H4jVJ8eYC0a5pUmOnGYk3+V80UVESJ
	oftFPTu8TW9oNj/9JIYEuxBuwfcCFHKPmT63ddG930jHR3Z2uwdMwTysduszT/iDf3Hy4vea+i7
	RpJHLJC7qWo2Tzx8gh5r5Kymu6Z5z5Uo5vJ4BVa9+rZi7eDl59ovNK8ekJLgvwLJiJWKwrKap7d
	uHd4gNciumMHYkjc4N6wjhejrLChzas7tIk5TAaqnY9xAQCFd7BNWh1s6ZKJThr5GyTFQKETm3A
	NOp4Z+J4YSM4+wGac1FUMvJ74kyKeN0oJB8CKusZLMdq1RX01+Q==
X-Received: by 2002:a05:6a00:1255:b0:82f:3a1e:5618 with SMTP id d2e1a72fcca58-8415f1a6201mr5358996b3a.22.1779482008994;
        Fri, 22 May 2026 13:33:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:1255:b0:82f:3a1e:5618 with SMTP id d2e1a72fcca58-8415f1a6201mr5358955b3a.22.1779482008436;
        Fri, 22 May 2026 13:33:28 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ac9c77sm3062251b3a.2.2026.05.22.13.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 13:33:28 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v6 2/2] pinctrl: qcom: lpass-lpi: Switch to PM clock framework for runtime PM
Date: Sat, 23 May 2026 02:03:04 +0530
Message-Id: <20260522203304.4065305-3-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260522203304.4065305-1-ajay.nandam@oss.qualcomm.com>
References: <20260513140009.3841770-1-ajay.nandam@oss.qualcomm.com>
 <20260522203304.4065305-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDIwMyBTYWx0ZWRfX70D18on1RPM0
 JzneEK2j72SwarOu2ngIsKXQVXvR35IjKtFo4P2XE2QGhLRaJ82Xld6DRtPPMwtV2+RUtUdqkwT
 5DiWytMS8iT7qoZciVNNTRWO0mayTD8FGJh2HLmHXyTNRnAanBRb64wriHTc0fq2GV9GIfvkcl0
 a0kv2GzMhfkiT/0hBF5F4Dg6RlkRIyn77SrKWN/Me+ejrZrz5V3DX8s0j0tzJOleWFOyoor+zDO
 +H28MXKpI3ang/AnrJ0FhQ+nPAITeO5g3CyXHDlZwJKCC2kSRveU5ceaEyShRmtt4Oz64jmFt/i
 G/l90bOyP/10DAEz8LXqnmNugMbAqVipD+XkzWbBBBXbv76JuOZ1xxIBrEIY12kue6+8z9OTHCf
 ARFyFPQkquLEa/W60+eDSLPd5z1BBd3KgHvahBId2SqbX7GAQB23YJ39WmSGG03ebLOc8g39jtd
 nQatpr4fJdStczhZIJg==
X-Proofpoint-GUID: fs8GavfF3E7W7lErhcBfG_VH9dv4MIEB
X-Proofpoint-ORIG-GUID: fs8GavfF3E7W7lErhcBfG_VH9dv4MIEB
X-Authority-Analysis: v=2.4 cv=F+dnsKhN c=1 sm=1 tr=0 ts=6a10bd99 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=gi8XeulvwEclXWRguk8A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220203
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
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37387-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1E9BE5BA199
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert the LPASS LPI pinctrl driver to use the PM clock framework for
runtime power management.

This allows the LPASS LPI pinctrl driver to drop clock votes when idle,
improves power efficiency on platforms using LPASS LPI island mode, and
aligns the driver with common runtime PM patterns used across Qualcomm
LPASS subsystems.

Guard GPIO register read/write helpers and slew-rate register programming
with synchronous runtime PM calls so the device is active during MMIO
operations whenever autosuspend is enabled.

Make PINCTRL_LPASS_LPI depend on PM_CLK, since this patch introduces
direct PM clock API use in the shared core.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/Kconfig             |   1 +
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 144 +++++++++++++++--------
 2 files changed, 99 insertions(+), 46 deletions(-)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index a09e840a01c6..18db350222b9 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -55,6 +55,7 @@ config PINCTRL_LPASS_LPI
 	select PINCONF
 	select GENERIC_PINCONF
 	select GENERIC_PINCTRL_GROUPS
+	depends on PM_CLK
 	depends on GPIOLIB
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 15ced5027579..4d758fd117c4 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -11,10 +11,13 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
+#include <linux/cleanup.h>
 
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinmux.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "../pinctrl-utils.h"
 
@@ -22,7 +25,6 @@
 
 #define MAX_NR_GPIO		32
 #define GPIO_FUNC		0
-#define MAX_LPI_NUM_CLKS	2
 
 struct lpi_pinctrl {
 	struct device *dev;
@@ -31,15 +33,14 @@ struct lpi_pinctrl {
 	struct pinctrl_desc desc;
 	char __iomem *tlmm_base;
 	char __iomem *slew_base;
-	struct clk_bulk_data clks[MAX_LPI_NUM_CLKS];
 	/* Protects from concurrent register updates */
 	struct mutex lock;
 	DECLARE_BITMAP(ever_gpio, MAX_NR_GPIO);
 	const struct lpi_pinctrl_variant_data *data;
 };
 
-static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
-			 unsigned int addr)
+static void __iomem *lpi_gpio_reg(struct lpi_pinctrl *state,
+				  unsigned int pin, unsigned int addr)
 {
 	u32 pin_offset;
 
@@ -48,22 +49,48 @@ static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
 	else
 		pin_offset = LPI_TLMM_REG_OFFSET * pin;
 
-	return ioread32(state->tlmm_base + pin_offset + addr);
+	return state->tlmm_base + pin_offset + addr;
+}
+
+static void __lpi_gpio_read(struct lpi_pinctrl *state,
+			    unsigned int pin, unsigned int addr, u32 *val)
+{
+	*val = ioread32(lpi_gpio_reg(state, pin, addr));
+}
+
+static void __lpi_gpio_write(struct lpi_pinctrl *state,
+			     unsigned int pin, unsigned int addr,
+			     unsigned int val)
+{
+	iowrite32(val, lpi_gpio_reg(state, pin, addr));
+}
+
+static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
+			 unsigned int addr, u32 *val)
+{
+	int ret;
+
+	ret = pm_runtime_resume_and_get(state->dev);
+	if (ret < 0)
+		return ret;
+
+	__lpi_gpio_read(state, pin, addr, val);
+
+	return pm_runtime_put_autosuspend(state->dev);
 }
 
 static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
 			  unsigned int addr, unsigned int val)
 {
-	u32 pin_offset;
+	int ret;
 
-	if (state->data->flags & LPI_FLAG_USE_PREDEFINED_PIN_OFFSET)
-		pin_offset = state->data->groups[pin].pin_offset;
-	else
-		pin_offset = LPI_TLMM_REG_OFFSET * pin;
+	ret = pm_runtime_resume_and_get(state->dev);
+	if (ret < 0)
+		return ret;
 
-	iowrite32(val, state->tlmm_base + pin_offset + addr);
+	__lpi_gpio_write(state, pin, addr, val);
 
-	return 0;
+	return pm_runtime_put_autosuspend(state->dev);
 }
 
 static const struct pinctrl_ops lpi_gpio_pinctrl_ops = {
@@ -107,8 +134,8 @@ static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 {
 	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	const struct lpi_pingroup *g = &pctrl->data->groups[group];
-	u32 val;
-	int i, pin = g->pin;
+	u32 io_val, val;
+	int i, pin = g->pin, ret;
 
 	for (i = 0; i < g->nfuncs; i++) {
 		if (g->funcs[i] == function)
@@ -118,8 +145,12 @@ static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 	if (WARN_ON(i == g->nfuncs))
 		return -EINVAL;
 
-	mutex_lock(&pctrl->lock);
-	val = lpi_gpio_read(pctrl, pin, LPI_GPIO_CFG_REG);
+	ret = pm_runtime_resume_and_get(pctrl->dev);
+	if (ret < 0)
+		return ret;
+
+	guard(mutex)(&pctrl->lock);
+	__lpi_gpio_read(pctrl, pin, LPI_GPIO_CFG_REG, &val);
 
 	/*
 	 * If this is the first time muxing to GPIO and the direction is
@@ -129,24 +160,25 @@ static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 	 */
 	if (i == GPIO_FUNC && (val & LPI_GPIO_OE_MASK) &&
 	    !test_and_set_bit(group, pctrl->ever_gpio)) {
-		u32 io_val = lpi_gpio_read(pctrl, group, LPI_GPIO_VALUE_REG);
+		__lpi_gpio_read(pctrl, group, LPI_GPIO_VALUE_REG, &io_val);
 
 		if (io_val & LPI_GPIO_VALUE_IN_MASK) {
 			if (!(io_val & LPI_GPIO_VALUE_OUT_MASK))
-				lpi_gpio_write(pctrl, group, LPI_GPIO_VALUE_REG,
-					       io_val | LPI_GPIO_VALUE_OUT_MASK);
+				__lpi_gpio_write(pctrl, group,
+						 LPI_GPIO_VALUE_REG,
+						 io_val | LPI_GPIO_VALUE_OUT_MASK);
 		} else {
 			if (io_val & LPI_GPIO_VALUE_OUT_MASK)
-				lpi_gpio_write(pctrl, group, LPI_GPIO_VALUE_REG,
-					       io_val & ~LPI_GPIO_VALUE_OUT_MASK);
+				__lpi_gpio_write(pctrl, group,
+						 LPI_GPIO_VALUE_REG,
+						 io_val & ~LPI_GPIO_VALUE_OUT_MASK);
 		}
 	}
 
 	u32p_replace_bits(&val, i, LPI_GPIO_FUNCTION_MASK);
-	lpi_gpio_write(pctrl, pin, LPI_GPIO_CFG_REG, val);
-	mutex_unlock(&pctrl->lock);
+	__lpi_gpio_write(pctrl, pin, LPI_GPIO_CFG_REG, val);
 
-	return 0;
+	return pm_runtime_put_autosuspend(pctrl->dev);
 }
 
 static const struct pinmux_ops lpi_gpio_pinmux_ops = {
@@ -162,11 +194,15 @@ static int lpi_config_get(struct pinctrl_dev *pctldev,
 	unsigned int param = pinconf_to_config_param(*config);
 	struct lpi_pinctrl *state = dev_get_drvdata(pctldev->dev);
 	unsigned int arg = 0;
+	u32 ctl_reg;
 	int is_out;
 	int pull;
-	u32 ctl_reg;
+	int ret;
+
+	ret = lpi_gpio_read(state, pin, LPI_GPIO_CFG_REG, &ctl_reg);
+	if (ret)
+		return ret;
 
-	ctl_reg = lpi_gpio_read(state, pin, LPI_GPIO_CFG_REG);
 	is_out = ctl_reg & LPI_GPIO_OE_MASK;
 	pull = FIELD_GET(LPI_GPIO_PULL_MASK, ctl_reg);
 
@@ -197,6 +233,7 @@ static int lpi_config_get(struct pinctrl_dev *pctldev,
 	}
 
 	*config = pinconf_to_config_packed(param, arg);
+
 	return 0;
 }
 
@@ -206,7 +243,7 @@ static int lpi_config_set_slew_rate(struct lpi_pinctrl *pctrl,
 {
 	unsigned long sval;
 	void __iomem *reg;
-	int slew_offset;
+	int slew_offset, ret;
 
 	if (slew > LPI_SLEW_RATE_MAX) {
 		dev_err(pctrl->dev, "invalid slew rate %u for pin: %d\n",
@@ -225,6 +262,10 @@ static int lpi_config_set_slew_rate(struct lpi_pinctrl *pctrl,
 	else
 		reg = pctrl->slew_base + LPI_SLEW_RATE_CTL_REG;
 
+	ret = pm_runtime_resume_and_get(pctrl->dev);
+	if (ret < 0)
+		return ret;
+
 	mutex_lock(&pctrl->lock);
 
 	sval = ioread32(reg);
@@ -234,7 +275,7 @@ static int lpi_config_set_slew_rate(struct lpi_pinctrl *pctrl,
 
 	mutex_unlock(&pctrl->lock);
 
-	return 0;
+	return pm_runtime_put_autosuspend(pctrl->dev);
 }
 
 static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
@@ -244,8 +285,8 @@ static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
 	unsigned int param, arg, pullup = LPI_GPIO_BIAS_DISABLE, strength = 2;
 	bool value, output_enabled = false;
 	const struct lpi_pingroup *g;
-	int i, ret;
 	u32 val;
+	int i, ret;
 
 	g = &pctrl->data->groups[group];
 	for (i = 0; i < nconfs; i++) {
@@ -289,23 +330,26 @@ static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
 	 * As per Hardware Programming Guide, when configuring pin as output,
 	 * set the pin value before setting output-enable (OE).
 	 */
+	ret = pm_runtime_resume_and_get(pctrl->dev);
+	if (ret < 0)
+		return ret;
+
+	guard(mutex)(&pctrl->lock);
 	if (output_enabled) {
 		val = u32_encode_bits(value ? 1 : 0, LPI_GPIO_VALUE_OUT_MASK);
-		lpi_gpio_write(pctrl, group, LPI_GPIO_VALUE_REG, val);
+		__lpi_gpio_write(pctrl, group, LPI_GPIO_VALUE_REG, val);
 	}
 
-	mutex_lock(&pctrl->lock);
-	val = lpi_gpio_read(pctrl, group, LPI_GPIO_CFG_REG);
+	__lpi_gpio_read(pctrl, group, LPI_GPIO_CFG_REG, &val);
 
 	u32p_replace_bits(&val, pullup, LPI_GPIO_PULL_MASK);
 	u32p_replace_bits(&val, LPI_GPIO_DS_TO_VAL(strength),
 			  LPI_GPIO_OUT_STRENGTH_MASK);
 	u32p_replace_bits(&val, output_enabled, LPI_GPIO_OE_MASK);
 
-	lpi_gpio_write(pctrl, group, LPI_GPIO_CFG_REG, val);
-	mutex_unlock(&pctrl->lock);
+	__lpi_gpio_write(pctrl, group, LPI_GPIO_CFG_REG, val);
 
-	return 0;
+	return pm_runtime_put_autosuspend(pctrl->dev);
 }
 
 static const struct pinconf_ops lpi_gpio_pinconf_ops = {
@@ -354,9 +398,14 @@ static int lpi_gpio_direction_output(struct gpio_chip *chip,
 static int lpi_gpio_get(struct gpio_chip *chip, unsigned int pin)
 {
 	struct lpi_pinctrl *state = gpiochip_get_data(chip);
+	u32 val;
+	int ret;
+
+	ret = lpi_gpio_read(state, pin, LPI_GPIO_VALUE_REG, &val);
+	if (ret)
+		return ret;
 
-	return lpi_gpio_read(state, pin, LPI_GPIO_VALUE_REG) &
-		LPI_GPIO_VALUE_IN_MASK;
+	return val & LPI_GPIO_VALUE_IN_MASK;
 }
 
 static int lpi_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
@@ -399,7 +448,9 @@ static void lpi_gpio_dbg_show_one(struct seq_file *s,
 
 	pctldev = pctldev ? : state->ctrl;
 	pindesc = pctldev->desc->pins[offset];
-	ctl_reg = lpi_gpio_read(state, offset, LPI_GPIO_CFG_REG);
+	if (lpi_gpio_read(state, offset, LPI_GPIO_CFG_REG, &ctl_reg))
+		return;
+
 	is_out = ctl_reg & LPI_GPIO_OE_MASK;
 
 	func = FIELD_GET(LPI_GPIO_FUNCTION_MASK, ctl_reg);
@@ -482,9 +533,6 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 	pctrl->data = data;
 	pctrl->dev = &pdev->dev;
 
-	pctrl->clks[0].id = "core";
-	pctrl->clks[1].id = "audio";
-
 	pctrl->tlmm_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pctrl->tlmm_base))
 		return dev_err_probe(dev, PTR_ERR(pctrl->tlmm_base),
@@ -497,13 +545,19 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
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
@@ -542,7 +596,6 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 
 err_pinctrl:
 	mutex_destroy(&pctrl->lock);
-	clk_bulk_disable_unprepare(MAX_LPI_NUM_CLKS, pctrl->clks);
 
 	return ret;
 }
@@ -554,7 +607,6 @@ void lpi_pinctrl_remove(struct platform_device *pdev)
 	int i;
 
 	mutex_destroy(&pctrl->lock);
-	clk_bulk_disable_unprepare(MAX_LPI_NUM_CLKS, pctrl->clks);
 
 	for (i = 0; i < pctrl->data->npins; i++)
 		pinctrl_generic_remove_group(pctrl->ctrl, i);
-- 
2.34.1


