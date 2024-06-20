Return-Path: <linux-gpio+bounces-7583-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A508910210
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2024 13:03:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 842D5282D2C
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2024 11:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D49E1AB36B;
	Thu, 20 Jun 2024 11:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="pKZ8MYaO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D970A1AAE33
	for <linux-gpio@vger.kernel.org>; Thu, 20 Jun 2024 11:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718881377; cv=none; b=tYnwoBxO1iscDkX41LGNJzpNVdPvZ2L/P6UkUdbWMKZAXR1RHU/9GT3XOmWXGnAlaX5PDYQJ2/LnhxWXFBljAgK8bGz7DBR8uG0VgGsGT0xDXiMfLeRX0B6qVURmhH6oqUIxI3uBaWAOHn+MSEK9iJLHGV0gdmzfEiqVDa+3tqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718881377; c=relaxed/simple;
	bh=Rf6/z8+NZYtEexYsTbeo8XAwkMuFDOP0e+7M1U38HEo=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:References; b=pe32zjua6/KClWYG2puBVIOwwQp5ua4+jLcE43ROV/dOZt9lzjhCx3IZeTZzDCpaPlYBYHuBFyvaT6wmdyWoO//W/4crYy3YsSXCtPj2YeE0HgfKIdaed8+Oo3qzBDiiP5x48N89CBltRTTFL64hx7PMefBNaod1mGrxGmALuZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=pKZ8MYaO; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240620110246epoutp038f19fb8dcf9e45997f93236e149b6e52~asX7W5BCr1236112361epoutp03Q
	for <linux-gpio@vger.kernel.org>; Thu, 20 Jun 2024 11:02:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240620110246epoutp038f19fb8dcf9e45997f93236e149b6e52~asX7W5BCr1236112361epoutp03Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1718881366;
	bh=4waPKmlDVvfwHEu03i05Nc/0VcDtSEWLACuXgVrz5Fw=;
	h=From:To:Cc:Subject:Date:References:From;
	b=pKZ8MYaO4AAlsuS3Ic2kvG9qUx3Ksgl8hNtStSmd+DWBIHSWOhMN7Tu/NMno22i6m
	 MrgZr2/dTUhK5Bpr/VYB5bxTQ0U1EuRyBXRaxXdM+/voUHURjh0edLixMWxnjkv/kT
	 Y+j4pIu8cCh56IwARIcNu1TNP6beB2zdqANRCiD0=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20240620110245epcas5p466a5a420cfeb41a00dcbeb94e01ecd68~asX7FDAUW3046730467epcas5p4S;
	Thu, 20 Jun 2024 11:02:45 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.174]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4W4cyr0bG9z4x9Pw; Thu, 20 Jun
	2024 11:02:44 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	FB.2C.10047.35C04766; Thu, 20 Jun 2024 20:02:43 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20240620103950epcas5p10514d4a19bdfd505d7d92ceb1fe10cc7~asD6WZEpM1259712597epcas5p17;
	Thu, 20 Jun 2024 10:39:50 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240620103950epsmtrp1f7455fa48db4efb72c96332a5e9440f5~asD6VliIz2404424044epsmtrp1L;
	Thu, 20 Jun 2024 10:39:50 +0000 (GMT)
X-AuditID: b6c32a49-f75ff7000000273f-c9-66740c532437
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	EE.14.29940.6F604766; Thu, 20 Jun 2024 19:39:50 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
	[107.109.115.53]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240620103948epsmtip1eb9d447dbf01c5e1db8ddea28d59aa96~asD4xlpm21821018210epsmtip1e;
	Thu, 20 Jun 2024 10:39:48 +0000 (GMT)
From: Vishnu Reddy <vishnu.reddy@samsung.com>
To: krzysztof.kozlowski@linaro.org, s.nawrocki@samsung.com,
	alim.akhtar@samsung.com, linus.walleij@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	pankaj.dubey@samsung.com, ravi.patel@samsung.com, gost.dev@samsung.com
Subject: [PATCH v2] pinctrl: samsung: Add support for pull-up and pull-down
Date: Thu, 20 Jun 2024 16:04:10 +0530
Message-Id: <20240620103410.35786-1-vishnu.reddy@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPKsWRmVeSWpSXmKPExsWy7bCmpm4wT0mawaPHlhYP5m1js7h5YCeT
	xd7XW9ktpvxZzmSx6fE1VovN8/8wWlzeNYfNYsb5fUwWi7Z+Ybd4+GEPu8XhN+2sDtwed67t
	YfPYvKTeo2/LKkaPz5vkAliism0yUhNTUosUUvOS81My89JtlbyD453jTc0MDHUNLS3MlRTy
	EnNTbZVcfAJ03TJzgI5SUihLzCkFCgUkFhcr6dvZFOWXlqQqZOQXl9gqpRak5BSYFOgVJ+YW
	l+al6+WlllgZGhgYmQIVJmRn/H11lqXgn1zFtAefGRsYG6W6GDk4JARMJHZf5O1i5OIQEtjN
	KHHr5CRWCOcTo8TdrvlQzjdGiW8T7zHBdHQ1eUHE9zJKrNw5gw3CaWWS2HZ9LVARJwebgK7E
	5yVnWUBsEYF8iZUX/jGBFDELXGSU+LdlPytIQljAW2Lhj0Ywm0VAVWJDbzfYBl4BW4mJ3yVB
	whIC8hKrNxxgBumVEDjGLtHS9pURIuEiselhDxuELSzx6vgWdghbSuJlfxuUnSyx/vcpdoir
	cyR6pilAhO0lDlyZwwISZhbQlFi/Sx8iLCsx9dQ6sPOZBfgken8/YYKI80rsmAdjq0kcmzSd
	FcKWkehccQPqGg+Jxp2fwWwhgViJhpvPWScwys5C2LCAkXEVo2RqQXFuemqxaYFhXmo5PJqS
	83M3MYJTmpbnDsa7Dz7oHWJk4mA8xCjBwawkwvu8qyhNiDclsbIqtSg/vqg0J7X4EKMpMMQm
	MkuJJucDk2peSbyhiaWBiZmZmYmlsZmhkjjv69a5KUIC6YklqdmpqQWpRTB9TBycUg1M4XvP
	5lT+KV3P1yWVr/hg8/RvDNL9v5vn/qng17rCeezFrfWKfzj3WD73nuKRmxqUYbSo6PjVjUW+
	HPpnebla/64MPV634LNqtoXBqhs6j6a80wwIaD8z67Hu0aN7t07Pvhu/rmBKC0fG9pVtKdX+
	ygGCt73Y3wjdXro54KdGzZuZ0p81+mdo3HB84pVdfu/gxAP1+79/CAld5q0doGWSG58hejC9
	cPtjwXKL71yrl/8/9+PkafHGzRd3Tnv+TqxB7u13YDJefsx/78uVk8RmScfYRHEc1nqhfvhO
	omawNM//s0HvXhZ+eCsskv6uZtr6ngdzPh/0Mwlft/ud6gXxg+KT1Q9yV5VF9PyPyC98osRS
	nJFoqMVcVJwIABSuFEPyAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmluLIzCtJLcpLzFFi42LZdlhJTvcbW0mawcLnChYP5m1js7h5YCeT
	xd7XW9ktpvxZzmSx6fE1VovN8/8wWlzeNYfNYsb5fUwWi7Z+Ybd4+GEPu8XhN+2sDtwed67t
	YfPYvKTeo2/LKkaPz5vkAliiuGxSUnMyy1KL9O0SuDL+vjrLUvBPrmLag8+MDYyNUl2MHBwS
	AiYSXU1eXYxcHEICuxklWvc/Ye9i5ASKy0h8uLOFGcIWllj57zlYXEigmUliz7MUEJtNQFfi
	85KzLCC2iECxxJXX+5hABjEL3GSU6Nv6BSwhLOAtsfBHIyuIzSKgKrGht5sJZDGvgK3ExO+S
	EPPlJVZvOMA8gZFnASPDKkbJ1ILi3PTcYsMCw7zUcr3ixNzi0rx0veT83E2M4PDS0tzBuH3V
	B71DjEwcjIcYJTiYlUR4n3cVpQnxpiRWVqUW5ccXleakFh9ilOZgURLnFX/RmyIkkJ5Ykpqd
	mlqQWgSTZeLglGpgMndesfrGhZj0YKNYA6krackREfbawXXKGz8+4cx41CSso+W1UPidPceB
	f3rPDSeUhV4tStO+HfXv3SdxNvnyIOsdBy+lptXUhXqIVDic+DZrl779a4Nj95PufdyjfiSe
	5xLD5G86iSoJMo0bdnPmdxQusJtQ5fF9/oFPVlJ8id/8002C2UKseFZ9/W0xV/X5WYOkbz4q
	oi83Nf+qvKb1Qb0s4sv+67w57DMPXHu98sv57gtJWu0uN9b8FzGew2RtYDA133+9nvb87P62
	lwmh3XLieuqnxFJPB016Zh8r2rvZK5XhYGPSpTTdsu0F7ZwJRTqC6RNMPc5PXxMZuTDyYx5D
	zTOv3oa0T5KTTiuxFGckGmoxFxUnAgC8XpbVngIAAA==
X-CMS-MailID: 20240620103950epcas5p10514d4a19bdfd505d7d92ceb1fe10cc7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240620103950epcas5p10514d4a19bdfd505d7d92ceb1fe10cc7
References: <CGME20240620103950epcas5p10514d4a19bdfd505d7d92ceb1fe10cc7@epcas5p1.samsung.com>
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
Verified the offset from the user manual of following Exynos SoC series
and found the current code is taking care of correct offset for pull-up
and pull-down

Exynos-3250
Exynos-3470
Exynos-4412
Exynos-4415
Exynos-5250
Exynos-5260
Exynos-5410
Exynos-5420
Exynos-5422
Exynos-7420
Exynos-7580
Exynos-7880
Exynos-9820
Exynos-9830
Exynos-4210
Exynos-S5PC210
Exynos-S5PV310

This patch is tested on FSD platform

 drivers/pinctrl/samsung/pinctrl-samsung.c | 53 +++++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.h |  7 +++
 2 files changed, 60 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 623df65a5d6f..13e8109d002a 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -997,6 +997,58 @@ static int samsung_pinctrl_unregister(struct platform_device *pdev,
 	return 0;
 }
 
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
+	unsigned long flags;
+	unsigned int value = 0;
+
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_BIAS_DISABLE:
+		value = PIN_PUD_PULL_UP_DOWN_DISABLE;
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		value = PIN_PUD_PULL_DOWN_ENABLE;
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		value = PIN_PUD_PULL_UP_ENABLE;
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	raw_spin_lock_irqsave(&bank->slock, flags);
+	samsung_gpio_set_pud(gc, offset, value);
+	raw_spin_unlock_irqrestore(&bank->slock, flags);
+
+	return 0;
+}
+
 static const struct gpio_chip samsung_gpiolib_chip = {
 	.request = gpiochip_generic_request,
 	.free = gpiochip_generic_free,
@@ -1006,6 +1058,7 @@ static const struct gpio_chip samsung_gpiolib_chip = {
 	.direction_output = samsung_gpio_direction_output,
 	.to_irq = samsung_gpio_to_irq,
 	.add_pin_ranges = samsung_add_pin_ranges,
+	.set_config = samsung_gpio_set_config,
 	.owner = THIS_MODULE,
 };
 
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index d50ba6f07d5d..758b623a4bea 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -61,6 +61,13 @@ enum pincfg_type {
 #define PIN_CON_FUNC_INPUT		0x0
 #define PIN_CON_FUNC_OUTPUT		0x1
 
+/*
+ * Values for the pin PUD register.
+ */
+#define PIN_PUD_PULL_UP_DOWN_DISABLE	0x0
+#define PIN_PUD_PULL_DOWN_ENABLE	0x1
+#define PIN_PUD_PULL_UP_ENABLE		0x3
+
 /**
  * enum eint_type - possible external interrupt types.
  * @EINT_TYPE_NONE: bank does not support external interrupts
-- 
2.17.1


