Return-Path: <linux-gpio+bounces-28262-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 500C3C43238
	for <lists+linux-gpio@lfdr.de>; Sat, 08 Nov 2025 18:43:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7702F3B250D
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Nov 2025 17:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43490267AF2;
	Sat,  8 Nov 2025 17:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="BK1PINpI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E8526FA50;
	Sat,  8 Nov 2025 17:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762623790; cv=none; b=OFwFzTJ/HsqCLn1eD2S78KmLYEtVFg8UNC7vUg5fBj/4N8NEuPnlWGPRTa+AAS81HRel6l+0NPcLKEF2ueSRkWslh1va7+Vc9mJNsovDuUIZAsS9sGlGbheKPqHFd5BWHr0PRsc2PdLH8jksmveMJ9aGWp1u7eO0ORgSiZd5Jxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762623790; c=relaxed/simple;
	bh=Tqpc5XgGFqAfOFPRrsluBKADnLY+vkRvKs0Xjy8uFVM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LOCIi5q8WXqpHa7lJNOyNwSFIy2onEvwLrieC2RiJ/2cNWm5N8U0WWdxVaiTG4+upzmKv73hFxH9CGzHfp3YVaYQT9IwKCaH5BaQRo50SPsb9mC3knci3eIG259q/lBCGymsP61udKshSN/0wapYedt+GMYoQCfgFx+T3jcJTtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=BK1PINpI; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A8CMdLS3114133;
	Sat, 8 Nov 2025 12:42:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=+KHoz
	H+zJ0Nm0iFxbjFkojVj+WNwaC9WeICF9XXdhtk=; b=BK1PINpIh44/qBSONllNW
	hom1tC4wGruG/qt7L6eOyHUaNYoZoL6mgBC9zKh44Tqi9UGgzIVyVgnoFV/5ojyb
	xvQMQSXexgFlqt//yhAOFvHx4VyGlGj+7a4M0GL4DVGC6JsoNko2Kf78JmNKDZGx
	td1XL7lY4P4T3qcg6XofDBLqLl2WaFDUp1GgnTcqmn6vDKxzxzhsejqD1A6pDptQ
	e8R+1NKSSlla9Cp1OIA843KdvbRdCYbHAPGwOoIj+Zfm1bPMQrmdtHa+uDL8awli
	238HMmopp1SZih0g1hwY9x4GswT0lAVOnu5jJju5H9kwWLluaawRZBM8DxZ3d8T0
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4a9xtx29kh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Nov 2025 12:42:58 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 5A8HgvrI030783
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 8 Nov 2025 12:42:57 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Sat, 8 Nov 2025 12:42:57 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Sat, 8 Nov 2025 12:42:57 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Sat, 8 Nov 2025 12:42:57 -0500
Received: from Ubuntu.ad.analog.com ([10.32.15.145])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 5A8HgarF028532;
	Sat, 8 Nov 2025 12:42:51 -0500
From: Antoniu Miclaus <antoniu.miclaus@analog.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski
	<brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Antoniu Miclaus <antoniu.miclaus@analog.com>
Subject: [PATCH v2 2/2] gpio: adg1712: add driver support
Date: Sat, 8 Nov 2025 17:40:29 +0000
Message-ID: <20251108174055.3665-3-antoniu.miclaus@analog.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251108174055.3665-1-antoniu.miclaus@analog.com>
References: <20251108174055.3665-1-antoniu.miclaus@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: hJdjqkGEFtp5aM3_-u5ww2PtQmGFUiBD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDE0MyBTYWx0ZWRfXzO7QQs82cjlv
 OWMQiQ4jIr9pgCC9rQ4O0tQl1ijFrUp29hqnVC8Vd5iIrOW+DObDKN7BOqhQzFCyc181qFeEBkI
 RV9at4fWcIV8u2ArPoailjq2YbY4xWFPCpPA5Ufhi9dW9IJJ3Px1BCa5q8/gt8q78nZqG2MDSCu
 7fw0swN/C8VAUYFy3y45rOwDpYOTa6LsBfG7BCUlY16j3sBX+QEhywa2LxfR6KuCSW1Q9CVInMV
 zhG0CCinUYpfCCRFFRYYLuZBOG/29W1MgmRu8MAuYNKSDXNHeCiCN1ljFiurAPueBCW7wqeZXfR
 tiFRDU3Q1vlcdDBpIFWYoOknByrJ0x6iIY4mDcQI3Rn7xY/Qtz5UH8pUb319R5hFueDNfVTPS9U
 71Bmi3Rxy/sNoVJYj7ehXyJvBH4IsA==
X-Authority-Analysis: v=2.4 cv=Ao/jHe9P c=1 sm=1 tr=0 ts=690f8122 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gAnH3GRIAAAA:8 a=v3irjB-aNStsiBGt8dMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: hJdjqkGEFtp5aM3_-u5ww2PtQmGFUiBD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511080143

Add driver support for the ADG1712, which contains four independent
single-pole/single-throw (SPST) switches and operates with a
low-voltage single supply range from +1.08V to +5.5V or a low-voltage
dual supply range from ±1.08V to ±2.75V.

Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
---
Changes in v2:
- Replace individual GPIO descriptors array with gpio_descs structure
- Use devm_gpiod_get_array() instead of individual devm_gpiod_get() calls
- Use GPIOD_ASIS flag to preserve current GPIO states instead of GPIOD_OUT_LOW
- Remove unnecessary direction_input and direction_output callbacks for output-only device
- Remove unnecessary offset bounds checking (handled by GPIO core)
- Return result from gpiod_set_value_cansleep() instead of always returning 0
- Optimize set_multiple() to use gpiod_set_array_value_cansleep() for bulk operations
- Change dev_info() to dev_dbg() for registration message
- Simplify probe function by eliminating the GPIO setup loop
---
 drivers/gpio/Kconfig        |   9 +++
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-adg1712.c | 119 ++++++++++++++++++++++++++++++++++++
 3 files changed, 129 insertions(+)
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
index 000000000000..092dc459c7e8
--- /dev/null
+++ b/drivers/gpio/gpio-adg1712.c
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Analog Devices ADG1712 quad SPST switch GPIO driver
+ *
+ * Copyright 2025 Analog Devices Inc.
+ *
+ * Author: Antoniu Miclaus <antoniu.miclaus@analog.com>
+ */
+
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+
+#define ADG1712_NUM_GPIOS	4
+
+struct adg1712 {
+	struct gpio_chip chip;
+	struct gpio_descs *switch_gpios;
+};
+
+static int adg1712_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	return GPIO_LINE_DIRECTION_OUT;
+}
+
+static int adg1712_set(struct gpio_chip *chip, unsigned int offset, int value)
+{
+	struct adg1712 *adg1712 = gpiochip_get_data(chip);
+
+	return gpiod_set_value_cansleep(adg1712->switch_gpios->desc[offset],
+					value);
+}
+
+static int adg1712_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct adg1712 *adg1712 = gpiochip_get_data(chip);
+
+	return gpiod_get_value_cansleep(adg1712->switch_gpios->desc[offset]);
+}
+
+static int adg1712_set_multiple(struct gpio_chip *chip, unsigned long *mask,
+				unsigned long *bits)
+{
+	struct adg1712 *adg1712 = gpiochip_get_data(chip);
+
+	return gpiod_set_array_value_cansleep(adg1712->switch_gpios->ndescs,
+					      adg1712->switch_gpios->desc,
+					      adg1712->switch_gpios->info,
+					      bits);
+}
+
+static const struct gpio_chip adg1712_gpio_chip = {
+	.label			= "adg1712",
+	.owner			= THIS_MODULE,
+	.get_direction		= adg1712_get_direction,
+	.get			= adg1712_get,
+	.set			= adg1712_set,
+	.set_multiple		= adg1712_set_multiple,
+	.base			= -1,
+	.ngpio			= ADG1712_NUM_GPIOS,
+	.can_sleep		= true,
+};
+
+static int adg1712_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct adg1712 *adg1712;
+	int ret;
+
+	adg1712 = devm_kzalloc(dev, sizeof(*adg1712), GFP_KERNEL);
+	if (!adg1712)
+		return -ENOMEM;
+
+	adg1712->chip = adg1712_gpio_chip;
+	adg1712->chip.parent = dev;
+
+	adg1712->switch_gpios = devm_gpiod_get_array(dev, "switch", GPIOD_ASIS);
+	if (IS_ERR(adg1712->switch_gpios))
+		return dev_err_probe(dev, PTR_ERR(adg1712->switch_gpios),
+				     "failed to get switch gpios\n");
+
+	if (adg1712->switch_gpios->ndescs != ADG1712_NUM_GPIOS)
+		return dev_err_probe(dev, -EINVAL,
+				     "expected %d gpios, got %d\n",
+				     ADG1712_NUM_GPIOS,
+				     adg1712->switch_gpios->ndescs);
+
+	ret = devm_gpiochip_add_data(dev, &adg1712->chip, adg1712);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add gpio chip\n");
+
+	dev_dbg(dev, "ADG1712 %u-GPIO expander registered\n",
+		adg1712->chip.ngpio);
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
+MODULE_DESCRIPTION("Analog Devices ADG1712 quad SPST switch GPIO driver");
+MODULE_AUTHOR("Antoniu Miclaus <antoniu.miclaus@analog.com>");
+MODULE_LICENSE("GPL");
-- 
2.43.0


