Return-Path: <linux-gpio+bounces-15911-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E2BA34013
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 14:17:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 889FA1889310
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 13:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE7D23A992;
	Thu, 13 Feb 2025 13:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="vQDU2zwZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A362C22172B;
	Thu, 13 Feb 2025 13:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739452645; cv=none; b=rhjLTGe/mxcd4AFQ/NUFPDHcECyKY0977Avsy0C0/pJMOxzCx+Le4mwmwpe8BNUtY+EPg6wQhlpN8R7A1pjYLLfzwCZAlgc2RRZtiMlC/OV5jxGAFuyYmMCVgbhaVPEloJ/9KcAuI+VEzFj0XncBc7nnV/0HKK3nChMNyzGqrvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739452645; c=relaxed/simple;
	bh=6QnN24qRA4Whf1Tc+8n4IyOHwZa7k7cG4Vmls9KQEJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=pk3CknZQ25e9QNJ7u7+S66rN/woWFCyuo26Kn0i5ZFsgOEdBjaaPVxB2OpRrGmRiwciQCMtHcpIqkbMXKNBw3ugIZakIKJufROh9w6JUG0U6/lVnKxWsGPIkGRlB4rOkbewbILwBS4NMaVSwKIur7j+eD0YG6KA+KeA5Ja8tVcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=vQDU2zwZ; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DC9Z4J024116;
	Thu, 13 Feb 2025 08:17:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=vGNne
	TsOioa5qsq0iJi2msUvo3ScmTl2EWJ0iu5/eVo=; b=vQDU2zwZd6YhJZBBUis9g
	LxNBZAysTyDnXIDOnS5QryyDHzopEGgJ9SzXWixs2TovTkLwUwQ560Z7aIufTcX4
	MxkNCqU8msE1EXGlhbrnK6BArFfflEr60HlFTDRefr5/30YNjtHfp5PAU9pTOVAy
	gIha2fqyxbx1nz/rqJM0nEP9fVZ/+ZXD1PK58kSRja9OpkQFkDyfWY8M9nkuSqt+
	6fYomlqqjktZah7G8MN88e191uf5GwlewaQaByKektWffMXslNmD02mR/WiG9Zqe
	ujZe4ScTH1SV8gQXvDhAyq34hSNBdIFMGEo9gnmq8SfEIEDeYFgmnrUMWrbLBg7n
	g==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 44sgg787kd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 08:17:12 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 51DDHBp6019732
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Feb 2025 08:17:11 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Thu, 13 Feb
 2025 08:17:11 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Thu, 13 Feb 2025 08:17:11 -0500
Received: from [127.0.1.1] (KPALLER2-L03.ad.analog.com [10.116.18.50])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 51DDGm8Y026310;
	Thu, 13 Feb 2025 08:17:03 -0500
From: Kim Seer Paller <kimseer.paller@analog.com>
Date: Thu, 13 Feb 2025 21:15:10 +0800
Subject: [PATCH v2 2/2] gpio: gpio-adg1414: New driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250213-for_upstream-v2-2-ec4eff3b3cd5@analog.com>
References: <20250213-for_upstream-v2-0-ec4eff3b3cd5@analog.com>
In-Reply-To: <20250213-for_upstream-v2-0-ec4eff3b3cd5@analog.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski
	<brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Kim Seer Paller <kimseer.paller@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739452608; l=6627;
 i=kimseer.paller@analog.com; s=20250213; h=from:subject:message-id;
 bh=6QnN24qRA4Whf1Tc+8n4IyOHwZa7k7cG4Vmls9KQEJc=;
 b=cxc478a5PfTbEEmpo3t8aE3t8wHmIF8yFLnHFxdAqiwXvjiTzflhpOY3WDb7Ph/f4N46K/1gO
 6SZgKSg8LPjBd6blJYaNFlcNVn8vhffK69OLsb2S+KzkfO8zDDSVHle
X-Developer-Key: i=kimseer.paller@analog.com; a=ed25519;
 pk=SPXIwGLg4GFKUNfuAavY+YhSDsx+Q+NwGLceiKwm8Ac=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=OPjd3TaB c=1 sm=1 tr=0 ts=67adf0d8 cx=c_pps a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=gAnH3GRIAAAA:8 a=iox4zFpeAAAA:8 a=_2lLKsjRZ7spyGeoM6IA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=oVHKYsEdi7-vN-J5QA_j:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-GUID: RiZq5CLGrN2KOi0uICVL15kveW2wDBx2
X-Proofpoint-ORIG-GUID: RiZq5CLGrN2KOi0uICVL15kveW2wDBx2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_06,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1011 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130102

The ADG1414 is a 9.5 Ω RON ±15 V/+12 V/±5 V iCMOS Serially-Controlled
Octal SPST Switches

Signed-off-by: Kim Seer Paller <kimseer.paller@analog.com>
---
 MAINTAINERS                 |   1 +
 drivers/gpio/Kconfig        |  10 +++
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-adg1414.c | 162 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 174 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 66d92be0f57daa9eabb48d7e53b6b2bea0c40863..65877ca70b7e929353798c5639bf38593241d83e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -503,6 +503,7 @@ M:	Kim Seer Paller <kimseer.paller@analog.com>
 S:	Supported
 W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/gpio/gpio-adg1414.yaml
+F:	drivers/gpio/gpio-adg1414.c
 
 ADM1025 HARDWARE MONITOR DRIVER
 M:	Jean Delvare <jdelvare@suse.com>
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 98b4d1633b258b93d05ba66d53f647e7ec6ac364..4b797ddebd21bc879524f8504b343add2730c793 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1797,6 +1797,16 @@ config GPIO_74X164
 	  shift registers. This driver can be used to provide access
 	  to more GPIO outputs.
 
+config GPIO_ADG1414
+	tristate "ADG1414 Serially-Controlled Octal SPST Switches"
+	depends on SPI
+	help
+	  Say yes here to build support for Analog Devices ADG1414
+	  Serially-Controlled Octal SPST Switches
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called gpio-adg1414.
+
 config GPIO_MAX3191X
 	tristate "Maxim MAX3191x industrial serializer"
 	select CRC8
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index af3ba4d81b583842893ea69e677fbe2abf31bc7b..58d723cb32feebd35db13ae9cae5d232feba3f5b 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_GPIO_104_IDI_48)		+= gpio-104-idi-48.o
 obj-$(CONFIG_GPIO_104_IDIO_16)		+= gpio-104-idio-16.o
 obj-$(CONFIG_GPIO_74X164)		+= gpio-74x164.o
 obj-$(CONFIG_GPIO_74XX_MMIO)		+= gpio-74xx-mmio.o
+obj-$(CONFIG_GPIO_ADG1414)		+= gpio-adg1414.o
 obj-$(CONFIG_GPIO_ADNP)			+= gpio-adnp.o
 obj-$(CONFIG_GPIO_ADP5520)		+= gpio-adp5520.o
 obj-$(CONFIG_GPIO_ADP5585)		+= gpio-adp5585.o
diff --git a/drivers/gpio/gpio-adg1414.c b/drivers/gpio/gpio-adg1414.c
new file mode 100644
index 0000000000000000000000000000000000000000..91e07c38fb1c86162afd9cfcdf1d7cfcccb03234
--- /dev/null
+++ b/drivers/gpio/gpio-adg1414.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ADG1414 Serially-Controlled Octal SPST Switches
+ *
+ * Copyright 2025 Analog Devices Inc.
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/spi/spi.h>
+
+#define ADG1414_MAX_DEVICES		4
+
+struct adg1414_state {
+	struct spi_device *spi;
+	struct gpio_chip chip;
+	struct regmap *regmap;
+	struct mutex lock; /* protect sensor state */
+	u32 buf;
+
+	__be32 tx __aligned(ARCH_DMA_MINALIGN);
+};
+
+static int adg1414_spi_write(void *context, const void *data, size_t count)
+{
+	struct adg1414_state *st = context;
+
+	struct spi_transfer xfer = {
+		.tx_buf = &st->tx,
+		.len = count,
+	};
+
+	return spi_sync_transfer(st->spi, &xfer, 1);
+}
+
+static int adg1414_spi_read(void *context, const void *reg, size_t reg_size,
+			    void *val, size_t val_size)
+{
+	return 0;
+}
+
+static int adg1414_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct adg1414_state *st = gpiochip_get_data(chip);
+
+	guard(mutex)(&st->lock);
+
+	return st->buf & BIT(offset);
+}
+
+static void adg1414_set(struct gpio_chip *chip, unsigned int offset, int value)
+{
+	struct adg1414_state *st = gpiochip_get_data(chip);
+
+	guard(mutex)(&st->lock);
+
+	if (value)
+		st->buf |= BIT(offset);
+	else
+		st->buf &= ~BIT(offset);
+
+	st->tx = cpu_to_be32(st->buf << (32 - st->chip.ngpio));
+
+	adg1414_spi_write(st, 0, st->chip.ngpio / 8);
+}
+
+static const struct regmap_bus adg1414_regmap_bus = {
+	.write = adg1414_spi_write,
+	.read =	adg1414_spi_read,
+	.reg_format_endian_default = REGMAP_ENDIAN_BIG,
+	.val_format_endian_default = REGMAP_ENDIAN_BIG,
+};
+
+static const struct regmap_config adg1414_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static int adg1414_get_direction(struct gpio_chip *chip,
+				 unsigned int offset)
+{
+	return GPIO_LINE_DIRECTION_OUT;
+}
+
+static int adg1414_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	struct adg1414_state *st;
+	struct gpio_desc *reset;
+	u32 num_devices;
+	int ret;
+
+	st = devm_kzalloc(dev, sizeof(*st), GFP_KERNEL);
+	if (!st)
+		return -ENOMEM;
+
+	st->spi = spi;
+
+	st->regmap = devm_regmap_init(dev, &adg1414_regmap_bus, st,
+				      &adg1414_regmap_config);
+	if (IS_ERR(st->regmap))
+		return dev_err_probe(dev, PTR_ERR(st->regmap),
+				     "Failed to initialize regmap");
+
+	/* Use reset pin to reset the device */
+	reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(reset))
+		return dev_err_probe(dev, PTR_ERR(reset),
+				     "Failed to get reset gpio");
+
+	if (reset) {
+		fsleep(1);
+		gpiod_set_value_cansleep(reset, 0);
+	}
+
+	num_devices = 1;
+	ret = device_property_read_u32(dev, "#daisy-chained-devices",
+				       &num_devices);
+	if (!ret) {
+		if (!num_devices || num_devices > ADG1414_MAX_DEVICES)
+			return dev_err_probe(dev, ret,
+			       "Failed to get daisy-chained-devices property\n");
+	}
+
+	st->chip.label = "adg1414";
+	st->chip.parent = dev;
+	st->chip.get_direction = adg1414_get_direction;
+	st->chip.set = adg1414_set;
+	st->chip.get = adg1414_get;
+	st->chip.base = -1;
+	st->chip.ngpio =  num_devices * 8;
+	st->chip.can_sleep = true;
+
+	ret = devm_mutex_init(dev, &st->lock);
+	if (ret)
+		return ret;
+
+	return devm_gpiochip_add_data(dev, &st->chip, st);
+}
+
+static const struct of_device_id adg1414_of_match[] = {
+	{ .compatible = "adi,adg1414-gpio" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, adg1414_of_match);
+
+static struct spi_driver adg1414_driver = {
+	.driver = {
+		.name = "adg1414-gpio",
+		.of_match_table = adg1414_of_match,
+	},
+	.probe = adg1414_probe,
+};
+module_spi_driver(adg1414_driver);
+
+MODULE_AUTHOR("Kim Seer Paller <kimseer.paller@analog.com>");
+MODULE_DESCRIPTION("ADG1414 Serially-Controlled Octal SPST Switches");
+MODULE_LICENSE("GPL");

-- 
2.34.1


