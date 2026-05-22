Return-Path: <linux-gpio+bounces-37390-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAjqAj7BEGoSdQYAu9opvQ
	(envelope-from <linux-gpio+bounces-37390-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 22:49:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 734665BA357
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 22:49:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 469C63027718
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 20:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503711A6825;
	Fri, 22 May 2026 20:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dv+664DC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZCTi7pSB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D32346FCA
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 20:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779482831; cv=none; b=Hf++8jRFxZvMEo0awzPfsgIjK5E5QyTb4kpoJIuyD5KnEywaqcK50Rbfd/mzOOXmXjPJ4hVbTxXYFYIePsI1hNEcxAKJ3aedXg8JSqL2XFlLXsBBHuZEKbs6W4EmOraz08+/2Plt3oD75bqYChg6bdOofwtwIPOYqYzJ7Phpav8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779482831; c=relaxed/simple;
	bh=zw5R6m3M1dCTX7To//JP8E/7ll4enY2Rw+uZa3j95iQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LeBzQA+FtxOm9/HDwkhXia37BiKjhgRHo13S47nR4bwHtV7ZLceo953Y0xzbmO2C27gTqKu3gGaSjR1RF5UHQ6qhUd0gnoF79oP8P53ufEPmQt9ew18A29uzfnKZPzwlUatcfPai8u+ia0M6xBncdfHSRW7fcuJgedkK0DVEMvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dv+664DC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZCTi7pSB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MHQqhB3947382
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 20:47:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5FiIOIUfN1k
	cJqWXQMagb5vvpYV/X2uCsLwWpe6IZ/E=; b=Dv+664DCcIDZ+qDqu2yG3e5Uect
	vK2E/VKIdvvJvGcnxH0Hv8qnhU2DId48ozYwiTHMfGwYkHHZLsrmL/rEMME+5PGh
	U023S7Cg6kfWcJx2YkT63Ht1fj7fIQM0Gndxz7a3GMfGV7vZvj6i/B3nmqbLRbP4
	BImvnCBZiQBZ78F2q5WxfCw2HPGv3I6BXUq+MDsfU0qHh5t5b/FfBdMyyanOzvat
	hkuGTyMDt34S9DoLxeZoD+MxnuRB1OqBVmb92acOFoJRe3PYFgxjbDwDfebqlFw7
	Z75pgxJ0Xe6043WyDVIA8k2dHGXTYIRcp9njkYFBO7pGrOlnM1wmCJ6N1hQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean2njcv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 20:47:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365faf6006dso7682133a91.1
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 13:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779482827; x=1780087627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FiIOIUfN1kcJqWXQMagb5vvpYV/X2uCsLwWpe6IZ/E=;
        b=ZCTi7pSBpMuqDtRKiuQ+ele8Xps0fP2CmhOVZiHdvIQH1mWVZPts4kuzZD4kx3U2ei
         mRWFZI9xfGTg/+fDKJJPHxrn+HUxZgXS83kSOo3/WLeC0qg7a9xpEAUvkbHjt03yFHF6
         W8wqazG30zWqo2b7M7wiFwTzfC2mohNz51yAVObALHsqQVsGa1q2DsLXr2vCP6TGS1BC
         vnEoGoM4DMgubsJOyhsRh+t5jmNwkO2cApgNg69+6XW0insUFJjm9/lx2EQJK5kUFprk
         Ftzkbrb3hGG8PzWho6RR8mY0Pxu/UIIiVfXRwSC+TcdG9zdgDa5yJR8eW9aCyjgSJaJn
         ZAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779482827; x=1780087627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5FiIOIUfN1kcJqWXQMagb5vvpYV/X2uCsLwWpe6IZ/E=;
        b=ZOhgI9dVmnEjGE18YWmJe4flydMWozjT5ZrwaSofOR0tHXJn6dKkckrmCmb7UJWtRW
         rU+BdP8/BHnDXOzyroDKeCXExziIiNdfpv96Tj/QuE52SazwmUzX4gCB1zPHyU755jBw
         tzf0qsKt+OpTo/Vhmg1Vz/XeQpoOYaG8E035Yii2G/Rl6iulXjy5nCh8mpksO7S8jCln
         ldXLsNeaigxUp/YafiZlacCwQuCAl5HX9QFH9ATszsx33BU5Y5urHOiKONuD2asRozhn
         T+vpVdKDWiukGgwH5NNcYtzK65jZ1l09UHsxe8GsIOMUPUztqrMilhEZUlxMA1Mz8pLm
         PWng==
X-Forwarded-Encrypted: i=1; AFNElJ9dWRdGIqw600Du4A5HA7S3N5XulQwaJDhzx/zge1b7S2Ibuowbf214X+L5zfH0cxxFut1wKCEmN0fA@vger.kernel.org
X-Gm-Message-State: AOJu0YzdQ5JDuYXRGCQ2OzR+csGj71jN5AFTU4EC+OpWo9QNlOSHLIar
	TVBE9SBrTrVIVhv858LiwQ+WYNXoEs6Kvo+WTc7pBhPKT/fVGELN9OrvMb0z4IKm97CMBHtZIuM
	+DD9Qh2zg7b9L6nKzpv0mtSbUviEdQ4IxsiJcAAta6ZMqbWQhMc73fc6j8ww5b8rz
X-Gm-Gg: Acq92OGOZMEZ8Xq79/il8yswT9QGhaMmiikmHfiQILK/RDBQ992jx/RBDiIcmwbAdL4
	VzqniXCLdMKIomTisCQ47Ex+yMKAJd9JgeDZfC8XDHNnwo4CN8oBtBMNEjDBS30AW5XNUImSlx6
	K1AOYMWXtAxUmEa9heBEJ3B2aTRySlGd9qeengcbGgebt4RrSH8BB127KA+9oM18eFK+upGsNRS
	JIPKqUtN8TzWfUGKIHWK+tElDMJZuwQ541hUOD1l9c58kO9bws6BKlRAPOqDDE1eKssrskAKlpt
	cpd4Clq/giRkKUxV8H814/IfvUA9af6mefqElrSKkKhbz+fmyqH6/lRetbg/PC3T0vWjC4r8r4/
	WC0BeY7BhljCX4wK9kSqLIcxnJ3iCm2pKU1j52tbLJZ8l2hHKUQ==
X-Received: by 2002:a17:90b:35cd:b0:36a:9d7:859b with SMTP id 98e67ed59e1d1-36a67831948mr5093994a91.13.1779482826627;
        Fri, 22 May 2026 13:47:06 -0700 (PDT)
X-Received: by 2002:a17:90b:35cd:b0:36a:9d7:859b with SMTP id 98e67ed59e1d1-36a67831948mr5093971a91.13.1779482826161;
        Fri, 22 May 2026 13:47:06 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a7263179bsm2720956a91.1.2026.05.22.13.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 13:47:05 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v6 2/2] pinctrl: qcom: lpass-lpi: Switch to PM clock framework for runtime PM
Date: Sat, 23 May 2026 02:16:44 +0530
Message-Id: <20260522204644.4101640-3-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260522204644.4101640-1-ajay.nandam@oss.qualcomm.com>
References: <20260522204644.4101640-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XvDK/1F9 c=1 sm=1 tr=0 ts=6a10c0cb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=gi8XeulvwEclXWRguk8A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: gtiYGlWOeK9n7TqOP6hqxTELgsb3U_jG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDIwNyBTYWx0ZWRfX0PNbPiI5KRkg
 gtJMx86Pa7aJLEI5iWFCshhiz2q6m8hsXhVjun/EUGkXqixnMNi3A0oxdZHx6XOOlPYYtw1HJ/i
 5BKUU/rtnaYFKEPkf94TiGV5fmieI7zidpuRT08fJuoBOBvz/pxPOd8YMPnv2trNRIBuVEHG/9x
 RkioV8P6Tp16/TIP8BcqWA+SUSYPR2XAjKXpVka15Sl2KLcnbJuMLTFcQOSp9oi85+Lhy2LsNR0
 em9maakyF0QstCwyTcmRbG16sXLeQ4R4vtiTXZY18Qz1NCtUIkRyZQI7cGEqfeKe1rroPp0Vthh
 nk67FRFLpUzJEniVdBs40weRelmsJBoBaAr2ZZjSPNbvvPyTG3RiODPISrtkqa256R7ZMlSasqt
 iFDrf+6NqYgA75E+OBk0s9QBxGSUBwLxwpf1dBevYSj23t8gEdQ1Ze2HvCfhj+iWdKDS+SWne9w
 bzAeJd813JeermyMN2A==
X-Proofpoint-ORIG-GUID: gtiYGlWOeK9n7TqOP6hqxTELgsb3U_jG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220207
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37390-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 734665BA357
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


