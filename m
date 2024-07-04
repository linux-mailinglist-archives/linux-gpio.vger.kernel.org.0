Return-Path: <linux-gpio+bounces-8028-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C418B926E86
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 06:42:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FD3B28AA7D
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 04:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3CB9225D6;
	Thu,  4 Jul 2024 04:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="YtO98JWi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97041C28E
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jul 2024 04:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720067694; cv=none; b=l0hcAArAja+XJyM2BCAD2wh5RrkU21b6vQPMCizOHBSw2kLBNDlwyqCKaK773bE5ea5YcrthUVLoDS4ts4m8NZYm8XWVOxxNnwqCuYMPdCBCZ6+AD3mMY00hagfNZGSe6Ufx203BpA08//+NMMN34d5w5RmdHfm6/UImRYWPpzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720067694; c=relaxed/simple;
	bh=sLU0HGXpQVIjIcKm2LtpYq8wU5K+GUMCiD2DC7XAPq8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:References; b=CABoau4ySmSb1weCTieq741cOB2ZmyqyETha7wwPJ+l50GZ0k39gJZ5ImsvjweIvDUv7dUpCXdU+L5QwP0+bDhxteADNsT8atteuVlIpYg6lsphUoF/HeY3sZLonwjxXmhxTR5MIXGr0nThv0noR8toM8dE16CUdVqX6bqIsnH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=YtO98JWi; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240704043448epoutp02aa2fd5e1ca6fe65fb1c03563ba93786b~e6HMf9YNA1660216602epoutp02B
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jul 2024 04:34:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240704043448epoutp02aa2fd5e1ca6fe65fb1c03563ba93786b~e6HMf9YNA1660216602epoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720067688;
	bh=GxkhhqZtQSwEd6USk9LeX5xb31fX0CQaVQqgdQPIH3M=;
	h=From:To:Cc:Subject:Date:References:From;
	b=YtO98JWio8xbE+tixeOEM7fSE2/8bWnkkhLCq5Go4mt++Xx5EPf13JjrQmPXG+OH5
	 bNMKTImt1JpQvpYRSrLFuC3hMafTgG37Z0gbfCz/RlqfYHsMshcj2v4SB/Ohm9nqs7
	 2+/rU6xI6pfSiXSgmuJTd1I9jI2d2j1VHM4Pexk4=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTP id
	20240704043448epcas5p32892e7123a50310cff1ab6c61edb0dbd~e6HMLVFCC1534215342epcas5p38;
	Thu,  4 Jul 2024 04:34:48 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.183]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4WF3hk1YV0z4x9QK; Thu,  4 Jul
	2024 04:34:46 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	7C.66.09989.66626866; Thu,  4 Jul 2024 13:34:46 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20240704043358epcas5p282acd174113c7baf3f7a3472ba4c39ff~e6GeAgdRy1008710087epcas5p25;
	Thu,  4 Jul 2024 04:33:58 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240704043358epsmtrp223643ba3041a76e8350bd942bd3de7db~e6Gd_piuf1646316463epsmtrp2G;
	Thu,  4 Jul 2024 04:33:58 +0000 (GMT)
X-AuditID: b6c32a4a-bffff70000002705-17-668626666d91
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	1B.A3.29940.63626866; Thu,  4 Jul 2024 13:33:58 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
	[107.109.115.53]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240704043357epsmtip295fdbc756b1b96dc7c4e35db83668dc5~e6GcRq2yG1541315413epsmtip2d;
	Thu,  4 Jul 2024 04:33:56 +0000 (GMT)
From: Vishnu Reddy <vishnu.reddy@samsung.com>
To: krzysztof.kozlowski@linaro.org, s.nawrocki@samsung.com,
	alim.akhtar@samsung.com, linus.walleij@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	pankaj.dubey@samsung.com, ravi.patel@samsung.com, gost.dev@samsung.com
Subject: [PATCH v3] pinctrl: samsung: Add support for pull-up and pull-down
Date: Thu,  4 Jul 2024 09:56:29 +0530
Message-Id: <20240704042629.26151-1-vishnu.reddy@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIKsWRmVeSWpSXmKPExsWy7bCmhm6aWluawZpVLBYP5m1js7h5YCeT
	xd7XW9ktpvxZzmSx6fE1VovN8/8wWlzeNYfNYsb5fUwWi7Z+Ybd4+GEPu8XhN+2sDtwed67t
	YfPYvKTeo2/LKkaPz5vkAliism0yUhNTUosUUvOS81My89JtlbyD453jTc0MDHUNLS3MlRTy
	EnNTbZVcfAJ03TJzgI5SUihLzCkFCgUkFhcr6dvZFOWXlqQqZOQXl9gqpRak5BSYFOgVJ+YW
	l+al6+WlllgZGhgYmQIVJmRnfJ+/gr2g0aHiXU9CA+M70y5GTg4JAROJnScXsHQxcnEICexm
	lPh05zMbhPOJUWL9xntMEM43Rok7D78xwrS83bwaqmovo8Sri3MZIZxWJol1M5aBVbEJ6Ep8
	XnKWBcQWEciXWHnhH9goZoGLjBL/tuxnBUkIC3hL7J95ng3EZhFQlfi0+A4TiM0rYCsx/doW
	Voh18hKrNxxgBmmWEDjELrH6xgt2iISLxK7ur1A3CUu8Or4FKi4l8fndXjYIO1li/e9TQHEO
	IDtHomeaAkTYXuLAlTksIGFmAU2J9bv0IcKyElNPrQM7gVmAT6L39xMmiDivxI55MLaaxLFJ
	06FOk5HoXHED6gIPiX2bNoJdICQQK7Fqzx72CYyysxA2LGBkXMUomVpQnJueWmxaYJSXWg6P
	qOT83E2M4LSm5bWD8eGDD3qHGJk4GA8xSnAwK4nwSr1vThPiTUmsrEotyo8vKs1JLT7EaAoM
	sonMUqLJ+cDEmlcSb2hiaWBiZmZmYmlsZqgkzvu6dW6KkEB6YklqdmpqQWoRTB8TB6dUA5PO
	4kWXf15lC/tQ18IgsPmp/knnvvucBvc/XONkXFsnuTx2Qa3n3ZbOvtVpta/P7FK+ZuWqX/FT
	z/3ey+1tmTu0Vx/8/7s38Gn9zLhdLOGdr56kXnywcO8RT2HdtcfUI05HdYS0Xpr5b9oGs3n1
	fQu4y1OZOxb/lxDLnyAbuGLPwZ1/VwioFeR1VmzYc+O8S1rYzPLva7y4xWcuknxrL9bZz/Sr
	8FtF9XpPrh/cLkXTmxmusu6siDx1ZOrhbRF6rVyHp2w+ksekcodlpvKSYpdbzIsteC2nbOAs
	3H6C8V3C/dq1K0O3RHfeE2hVSv71n0G0UjDa24PpraxpvYupU8iqtiieLM3Q++rmxg2PhJRY
	ijMSDbWYi4oTATPue8D0AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplluLIzCtJLcpLzFFi42LZdlhJXtdMrS3N4OwzHYsH87axWdw8sJPJ
	Yu/rrewWU/4sZ7LY9Pgaq8Xm+X8YLS7vmsNmMeP8PiaLRVu/sFs8/LCH3eLwm3ZWB26PO9f2
	sHlsXlLv0bdlFaPH501yASxRXDYpqTmZZalF+nYJXBnf569gL2h0qHjXk9DA+M60i5GTQ0LA
	ROLt5tVsXYxcHEICuxklXlz6wAqRkJH4cGcLM4QtLLHy33N2iKJmJonrzycxgSTYBHQlPi85
	ywJiiwgUS1x5vY8JpIhZ4CajRN/WL2AJYQFvif0zz7OB2CwCqhKfFt8Ba+YVsJWYfm0L1DZ5
	idUbDjBPYORZwMiwilEytaA4Nz232LDAMC+1XK84Mbe4NC9dLzk/dxMjOMS0NHcwbl/1Qe8Q
	IxMH4yFGCQ5mJRFeqffNaUK8KYmVValF+fFFpTmpxYcYpTlYlMR5xV/0pggJpCeWpGanphak
	FsFkmTg4pRqY9Fz+BJedi9JnFjhoe6vu30tzCRum31x3bnLU/XpqLGk8N5Zn7eHnU3fo/w1q
	LK956Hvo5ZI7UyV6VxlEpAb+VZp7KOdSVZlC1JM5CxwTvj3e1Oe2senbuT/Fs8q+7tl8YE1q
	kNPKyJmiXkw5rxaxM5pf2vkmpml2SjzbOn+hH7n3dEwWmt1g9zT9/fzk2383W/06Ww0Xccz6
	8E/sYAUHi+2kiqsbdof/ajAxcCzKnXFn0eqYqgX638udztV5vbf13COXukowc9vSTi8/Nzbp
	l27GwRd2GvLFT5JKmbpws6eo2xzJDRfnv8yrSFu2eeasNev3SlfE525/Epnl+uZorixXV/aD
	1nMGH8o9/h6/q8RSnJFoqMVcVJwIAJ8gQzygAgAA
X-CMS-MailID: 20240704043358epcas5p282acd174113c7baf3f7a3472ba4c39ff
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240704043358epcas5p282acd174113c7baf3f7a3472ba4c39ff
References: <CGME20240704043358epcas5p282acd174113c7baf3f7a3472ba4c39ff@epcas5p2.samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

gpiolib framework has the implementation of setting up the
PUD configuration for GPIO pins but there is no driver support.

Add support to handle the PUD configuration request from the
userspace in samsung pinctrl driver.

Signed-off-by: Vishnu Reddy <vishnu.reddy@samsung.com>
---
 drivers/pinctrl/samsung/pinctrl-exynos-arm.c | 15 ++++
 drivers/pinctrl/samsung/pinctrl-s3c64xx.c    | 15 ++++
 drivers/pinctrl/samsung/pinctrl-samsung.c    | 80 ++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.h    | 24 ++++++
 4 files changed, 134 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
index 85ddf49a5188..426d1daacef2 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
@@ -40,6 +40,20 @@ static const struct samsung_pin_bank_type bank_type_alive = {
 #define S5P_OTHERS_RET_MMC		(1 << 29)
 #define S5P_OTHERS_RET_UART		(1 << 28)
 
+/*
+ * s5pv210_pud_value_init: initialize the drvdata pud_val with s5pv210 pud values
+ * s5pv210_pull_disable:	0
+ * s5pv210_pull_down_enable:	1
+ * s5pv210_pull_up_enable:	2
+ */
+static void s5pv210_pud_value_init(struct samsung_pinctrl_drv_data *drvdata)
+{
+	unsigned int i, *pud_val = drvdata->pud_val;
+
+	for (i = 0; i < PUD_MAX; i++)
+		pud_val[i] = i;
+}
+
 static void s5pv210_retention_disable(struct samsung_pinctrl_drv_data *drvdata)
 {
 	void __iomem *clk_base = (void __iomem *)drvdata->retention_ctrl->priv;
@@ -133,6 +147,7 @@ static const struct samsung_pin_ctrl s5pv210_pin_ctrl[] __initconst = {
 		.nr_banks	= ARRAY_SIZE(s5pv210_pin_bank),
 		.eint_gpio_init = exynos_eint_gpio_init,
 		.eint_wkup_init = exynos_eint_wkup_init,
+		.pud_value_init	= s5pv210_pud_value_init,
 		.suspend	= exynos_pinctrl_suspend,
 		.resume		= exynos_pinctrl_resume,
 		.retention_data	= &s5pv210_retention_data,
diff --git a/drivers/pinctrl/samsung/pinctrl-s3c64xx.c b/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
index c5d92db4fdb1..cf57b0f16999 100644
--- a/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
+++ b/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
@@ -255,6 +255,20 @@ static int s3c64xx_irq_get_trigger(unsigned int type)
 	return trigger;
 }
 
+/*
+ * s3c64xx_pud_value_init: initialize the drvdata pud_val with s3c64xx pud values
+ * s3c64xx_pull_disable:	0
+ * s3c64xx_pull_down_enable:	1
+ * s3c64xx_pull_up_enable:	2
+ */
+static void s3c64xx_pud_value_init(struct samsung_pinctrl_drv_data *drvdata)
+{
+	unsigned int i, *pud_val = drvdata->pud_val;
+
+	for (i = 0; i < PUD_MAX; i++)
+		pud_val[i] = i;
+}
+
 static void s3c64xx_irq_set_handler(struct irq_data *d, unsigned int type)
 {
 	/* Edge- and level-triggered interrupts need different handlers */
@@ -797,6 +811,7 @@ static const struct samsung_pin_ctrl s3c64xx_pin_ctrl[] __initconst = {
 		.nr_banks	= ARRAY_SIZE(s3c64xx_pin_banks0),
 		.eint_gpio_init = s3c64xx_eint_gpio_init,
 		.eint_wkup_init = s3c64xx_eint_eint0_init,
+		.pud_value_init	= s3c64xx_pud_value_init,
 	},
 };
 
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 623df65a5d6f..7d7e924c1fdb 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -997,6 +997,80 @@ static int samsung_pinctrl_unregister(struct platform_device *pdev,
 	return 0;
 }
 
+/*
+ * samsung_pud_value_init: initialize the drvdata pud_val
+ */
+static void samsung_pud_value_init(struct samsung_pinctrl_drv_data *drvdata)
+{
+	unsigned int  *pud_val = drvdata->pud_val;
+
+	pud_val[PUD_PULL_DISABLE] = PIN_PUD_PULL_UP_DOWN_DISABLE;
+	pud_val[PUD_PULL_DOWN] = PIN_PUD_PULL_DOWN_ENABLE;
+	pud_val[PUD_PULL_UP] = PIN_PUD_PULL_UP_ENABLE;
+}
+
+/*
+ * samsung_gpio_set_pud will enable or disable the pull-down and
+ * pull-up for the gpio pins in the PUD register.
+ */
+static void samsung_gpio_set_pud(struct gpio_chip *gc, unsigned int offset,
+				 unsigned int value)
+{
+	struct samsung_pin_bank *bank = gpiochip_get_data(gc);
+	const struct samsung_pin_bank_type *type = bank->type;
+	void __iomem *reg;
+	unsigned int data, mask;
+
+	reg = bank->pctl_base + bank->pctl_offset;
+	data = readl(reg + type->reg_offset[PINCFG_TYPE_PUD]);
+	mask = (1 << type->fld_width[PINCFG_TYPE_PUD]) - 1;
+	data &= ~(mask << (offset * type->fld_width[PINCFG_TYPE_PUD]));
+	data |= value << (offset * type->fld_width[PINCFG_TYPE_PUD]);
+	writel(data, reg + type->reg_offset[PINCFG_TYPE_PUD]);
+}
+
+/*
+ * samsung_gpio_set_config will identify the type of PUD config based
+ * on the gpiolib request to enable or disable the PUD configuration.
+ */
+static int samsung_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
+				   unsigned long config)
+{
+	struct samsung_pin_bank *bank = gpiochip_get_data(gc);
+	struct samsung_pinctrl_drv_data *drvdata = bank->drvdata;
+	unsigned int value;
+	int ret = 0;
+	unsigned long flags;
+
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_BIAS_DISABLE:
+		value = drvdata->pud_val[PUD_PULL_DISABLE];
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		value = drvdata->pud_val[PUD_PULL_DOWN];
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		value = drvdata->pud_val[PUD_PULL_UP];
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	ret = clk_enable(drvdata->pclk);
+	if (ret) {
+		dev_err(drvdata->dev, "failed to enable clock\n");
+		return ret;
+	}
+
+	raw_spin_lock_irqsave(&bank->slock, flags);
+	samsung_gpio_set_pud(gc, offset, value);
+	raw_spin_unlock_irqrestore(&bank->slock, flags);
+
+	clk_disable(drvdata->pclk);
+
+	return ret;
+}
+
 static const struct gpio_chip samsung_gpiolib_chip = {
 	.request = gpiochip_generic_request,
 	.free = gpiochip_generic_free,
@@ -1006,6 +1080,7 @@ static const struct gpio_chip samsung_gpiolib_chip = {
 	.direction_output = samsung_gpio_direction_output,
 	.to_irq = samsung_gpio_to_irq,
 	.add_pin_ranges = samsung_add_pin_ranges,
+	.set_config = samsung_gpio_set_config,
 	.owner = THIS_MODULE,
 };
 
@@ -1237,6 +1312,11 @@ static int samsung_pinctrl_probe(struct platform_device *pdev)
 	if (ctrl->eint_wkup_init)
 		ctrl->eint_wkup_init(drvdata);
 
+	if (ctrl->pud_value_init)
+		ctrl->pud_value_init(drvdata);
+	else
+		samsung_pud_value_init(drvdata);
+
 	ret = samsung_gpiolib_register(pdev, drvdata);
 	if (ret)
 		goto err_unregister;
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index d50ba6f07d5d..61384096b6d7 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -61,6 +61,28 @@ enum pincfg_type {
 #define PIN_CON_FUNC_INPUT		0x0
 #define PIN_CON_FUNC_OUTPUT		0x1
 
+/*
+ * Values for the pin PUD register.
+ */
+#define PIN_PUD_PULL_UP_DOWN_DISABLE	0x0
+#define PIN_PUD_PULL_DOWN_ENABLE	0x1
+#define PIN_PUD_PULL_UP_ENABLE		0x3
+
+/*
+ * enum pud_index: Index values to access the pud_val array in
+ *	struct samsung_pinctrl_drv_data.
+ * @PUD_PULL_DISABLE: Index for value of pud disable
+ * @PUD_PULL_DOWN: Index for the value of pull down enable
+ * @PUD_PULL_UP: Index for the value of pull up enable
+ * @PUD_MAX: Maximun value of the index
+ */
+enum pud_index {
+	PUD_PULL_DISABLE,
+	PUD_PULL_DOWN,
+	PUD_PULL_UP,
+	PUD_MAX,
+};
+
 /**
  * enum eint_type - possible external interrupt types.
  * @EINT_TYPE_NONE: bank does not support external interrupts
@@ -261,6 +283,7 @@ struct samsung_pin_ctrl {
 
 	int		(*eint_gpio_init)(struct samsung_pinctrl_drv_data *);
 	int		(*eint_wkup_init)(struct samsung_pinctrl_drv_data *);
+	void		(*pud_value_init)(struct samsung_pinctrl_drv_data *drvdata);
 	void		(*suspend)(struct samsung_pinctrl_drv_data *);
 	void		(*resume)(struct samsung_pinctrl_drv_data *);
 };
@@ -307,6 +330,7 @@ struct samsung_pinctrl_drv_data {
 	struct samsung_pin_bank		*pin_banks;
 	unsigned int			nr_banks;
 	unsigned int			nr_pins;
+	unsigned int			pud_val[PUD_MAX];
 
 	struct samsung_retention_ctrl	*retention_ctrl;
 
-- 
2.17.1


