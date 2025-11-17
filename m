Return-Path: <linux-gpio+bounces-28573-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1B6C631B2
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 10:16:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 631253A72BF
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 09:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04711326956;
	Mon, 17 Nov 2025 09:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="DhJ0r+eo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277B732693F;
	Mon, 17 Nov 2025 09:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763370953; cv=none; b=F3zWDKVPQKbcVvqr+RSE87ZQUY88+a1l8YSENDILxaeIRILn13xfvTFKGoLWNFZiJ7FcFCYdT+e3uRaLt9L2Nd6nbkO1rwsRMYYKXI4yJjGdVfkHDNV6Atz0TBP2YucFdaUzpwJcUsD9L9udKY4y6AoYhJ4i0//G5My95xk7Lh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763370953; c=relaxed/simple;
	bh=D5+H7f4uBte+hiuEhbTEUv5x+AR2ARk/b2f644vJkss=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ToW1oQqmJmyf+dhXPhUDvab6YQ39l7hNAVJEsgnf08MVk+UDnwhWmT2/nFCGpiyv421aibAGOrc6AEOGfpyct0je8ZxAqxND9CpTfNg/SQxEJNByYv8b3A+hPiRzu6Irw/blNIC1zpXfaM4C8O8D4Neg46vWuHYeQ2cjzpacmIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=DhJ0r+eo; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH87mdN2052307;
	Mon, 17 Nov 2025 04:15:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=IuYns
	lDuYkzWlpe48q57o2TLUosAJYFqqBgwehB93Os=; b=DhJ0r+eopCIwz/p/Llr5G
	yPrNHriECB5jRuKQGxIa6/1dQTOErHoRuEAJTXqXhrMqF6P37d38F6WjusqOofpa
	yGWistKyIO91xm8V4k0hrXyTAKccxxPbP1eF/m9c9vM8zn6QWkicNDKSqSkI+HjQ
	l66uvSSpDumBco/SQjkieZ8Xc7NE4swaOsrCQ16MePC9de8YnqHTuxG+kHjD7Gt1
	fuji4RowPSXl9x6jH1K4p088crAwPPEV0SOc09WB4bOub8QYimQrdvY2tFqzTCRX
	atXEihMvQBHn3IDMl7HEPHYZ7WBgVqvx3eCEb1AT/dHOqUq1FAvQUkd+ToVrcEzq
	Q==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4afehdkgrs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 04:15:48 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 5AH9Flut034273
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Nov 2025 04:15:47 -0500
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 17 Nov 2025 04:15:47 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 17 Nov 2025 04:15:46 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 17 Nov 2025 04:15:46 -0500
Received: from Ubuntu.ad.analog.com ([10.66.6.193])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 5AH9FE4F003532;
	Mon, 17 Nov 2025 04:15:42 -0500
From: Antoniu Miclaus <antoniu.miclaus@analog.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Antoniu Miclaus
	<antoniu.miclaus@analog.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>
Subject: [PATCH v3 2/2] gpio: adg1712: add driver support
Date: Mon, 17 Nov 2025 09:13:23 +0000
Message-ID: <20251117091427.3624-3-antoniu.miclaus@analog.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117091427.3624-1-antoniu.miclaus@analog.com>
References: <20251117091427.3624-1-antoniu.miclaus@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: Ya8jVkzTGbejgvTWivOYcZx5maYVhh9N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA3NyBTYWx0ZWRfX+jTaPdobFUyO
 yhSv29la9/9U7YrwXXk4g/IjxkZ05Pp7DPCko/v8GjP9bB1HTkqPSkrWKZBAx/COW3+nOxFrFoC
 24t5tTKqQTJejr01KwZl5PE7Mi5FVWwt+JCXpgX1bQjeuXQ39OnyVcO69rBH+u3NODUbKlrbBpH
 BJ8vd4wjBeTu0wA1LsrvnJGK+SdMUY/+uzUo726aMLFixpC6uzanb6hCh9D9GuDkbDt2LdJPzLT
 5cCO4L1JChXjWmVPZiwgoBjk8HOCDHb7HVE0n4Tcb5hNB/z8JAftXXozHu2UoqfYXYWOxTe+JQl
 RPoP/6Rsxy4d/mnvIAebOiXN7hujqDwzSFadnTbLuSbC16gNPXIrNyF7Y3YtK6/JymxVFBGIKOn
 H1XyFkpXozFwKi5NgdJtLXKnRkertQ==
X-Authority-Analysis: v=2.4 cv=LJ9rgZW9 c=1 sm=1 tr=0 ts=691ae7c4 cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gAnH3GRIAAAA:8 a=1zQR8qqtwd6sJicix08A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: Ya8jVkzTGbejgvTWivOYcZx5maYVhh9N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170077

Add driver support for the ADG1712, which contains four independent
single-pole/single-throw (SPST) switches and operates with a
low-voltage single supply range from +1.08V to +5.5V or a low-voltage
dual supply range from ±1.08V to ±2.75V.

The driver configures switches once at probe time based on device tree
properties and does not expose any userspace interface for runtime control.

Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
---
Changes in v3:
- Remove GPIO controller interface
- Configure switches from device tree at probe time only
- Add 'switch-states' property parsing
- Change from GPIOD_ASIS to GPIOD_OUT_LOW
---
 drivers/gpio/Kconfig        |  9 ++++
 drivers/gpio/Makefile       |  1 +
 drivers/gpio/gpio-adg1712.c | 87 +++++++++++++++++++++++++++++++++++++
 3 files changed, 97 insertions(+)
 create mode 100644 drivers/gpio/gpio-adg1712.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 7ee3afbc2b05..3fac05823eae 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -157,6 +157,15 @@ config GPIO_74XX_MMIO
 	    8 bits:	74244 (Input), 74273 (Output)
 	    16 bits:	741624 (Input), 7416374 (Output)
 
+config GPIO_ADG1712
+	tristate "Analog Devices ADG1712 quad SPST switch GPIO driver"
+	depends on GPIOLIB
+	help
+	  GPIO driver for Analog Devices ADG1712 quad single-pole,
+	  single-throw (SPST) switch. The driver provides a GPIO controller
+	  interface where each GPIO line controls one of the four independent
+	  analog switches on the ADG1712.
+
 config GPIO_ALTERA
 	tristate "Altera GPIO"
 	select GPIOLIB_IRQCHIP
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index ec296fa14bfd..9043d2d07a15 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_GPIO_104_IDI_48)		+= gpio-104-idi-48.o
 obj-$(CONFIG_GPIO_104_IDIO_16)		+= gpio-104-idio-16.o
 obj-$(CONFIG_GPIO_74X164)		+= gpio-74x164.o
 obj-$(CONFIG_GPIO_74XX_MMIO)		+= gpio-74xx-mmio.o
+obj-$(CONFIG_GPIO_ADG1712)		+= gpio-adg1712.o
 obj-$(CONFIG_GPIO_ADNP)			+= gpio-adnp.o
 obj-$(CONFIG_GPIO_ADP5520)		+= gpio-adp5520.o
 obj-$(CONFIG_GPIO_ADP5585)		+= gpio-adp5585.o
diff --git a/drivers/gpio/gpio-adg1712.c b/drivers/gpio/gpio-adg1712.c
new file mode 100644
index 000000000000..86f8645cf2ad
--- /dev/null
+++ b/drivers/gpio/gpio-adg1712.c
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Analog Devices ADG1712 quad SPST switch driver
+ *
+ * Copyright 2025 Analog Devices Inc.
+ *
+ * Author: Antoniu Miclaus <antoniu.miclaus@analog.com>
+ */
+
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+
+#define ADG1712_NUM_SWITCHES	4
+
+struct adg1712 {
+	struct gpio_descs *switch_gpios;
+};
+
+static int adg1712_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct adg1712 *adg1712;
+	u32 switch_states[ADG1712_NUM_SWITCHES] = {0}; /* Default all switches off */
+	int ret, i;
+
+	adg1712 = devm_kzalloc(dev, sizeof(*adg1712), GFP_KERNEL);
+	if (!adg1712)
+		return -ENOMEM;
+
+	adg1712->switch_gpios = devm_gpiod_get_array(dev, "switch", GPIOD_OUT_LOW);
+	if (IS_ERR(adg1712->switch_gpios))
+		return dev_err_probe(dev, PTR_ERR(adg1712->switch_gpios),
+				     "failed to get switch gpios\n");
+
+	if (adg1712->switch_gpios->ndescs != ADG1712_NUM_SWITCHES)
+		return dev_err_probe(dev, -EINVAL,
+				     "expected %d gpios, got %d\n",
+				     ADG1712_NUM_SWITCHES,
+				     adg1712->switch_gpios->ndescs);
+
+	ret = device_property_read_u32_array(dev, "switch-states", switch_states,
+					     ADG1712_NUM_SWITCHES);
+	if (ret && ret != -EINVAL)
+		return dev_err_probe(dev, ret, "failed to read switch-states\n");
+
+	for (i = 0; i < ADG1712_NUM_SWITCHES; i++) {
+		if (switch_states[i] > 1) {
+			dev_warn(dev, "invalid switch state %u for switch %d, using 0\n",
+				 switch_states[i], i);
+			switch_states[i] = 0;
+		}
+
+		ret = gpiod_set_value_cansleep(adg1712->switch_gpios->desc[i],
+					       switch_states[i]);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to set switch %d\n", i);
+	}
+
+	platform_set_drvdata(pdev, adg1712);
+
+	dev_info(dev, "ADG1712 switch controller configured\n");
+
+	return 0;
+}
+
+static const struct of_device_id adg1712_dt_ids[] = {
+	{ .compatible = "adi,adg1712", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, adg1712_dt_ids);
+
+static struct platform_driver adg1712_driver = {
+	.driver = {
+		.name = "adg1712",
+		.of_match_table = adg1712_dt_ids,
+	},
+	.probe = adg1712_probe,
+};
+module_platform_driver(adg1712_driver);
+
+MODULE_DESCRIPTION("Analog Devices ADG1712 quad SPST switch driver");
+MODULE_AUTHOR("Antoniu Miclaus <antoniu.miclaus@analog.com>");
+MODULE_LICENSE("GPL");
-- 
2.43.0


