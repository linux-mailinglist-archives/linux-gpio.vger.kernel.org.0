Return-Path: <linux-gpio+bounces-27910-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E4119C260C5
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 17:14:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 67AE2351AFC
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 16:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D4A2EC561;
	Fri, 31 Oct 2025 16:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="ezkLChih"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00292FFF89;
	Fri, 31 Oct 2025 16:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761926917; cv=none; b=oj9n6tNMLSpqOns/3bHgLMZEiIc1wte4mMqo3NIpyhEtggiFbfhWOq9sV9KBFFm8t5IWDg9DLtdG/k/gtFV2BPTTOf6Z0q1aSCakXGDwEE1p1OTr0n0RHXVL3W0+ON54HeDUvwXPbAWy6xkvLRmnAJtz7TPW+UrpesAfdaj9HvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761926917; c=relaxed/simple;
	bh=Qok/wPiWZzSZYqcep3zq/LFvIKS2cSUOaVyfUqS5XZY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AVvs1si4L7wXARS6TqPwTrtn5xFi8Qrc4DFcd4pqRbf4Kl19OUswYPSLeG67dSY755WZuUJGw7SBQg6XzdTDRwbVn+k4OGz+aFnS8eue9b+Ra0POBSDqeIbHZkW9wifBlvIKnvMjgjF1y7qprVXTF9YxD48Zq6lrIZmr7s/2GNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=ezkLChih; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59VFGBpp2390145;
	Fri, 31 Oct 2025 12:08:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=UojZ2
	Pu1hNoKPXkOr79we4N8rlctts8ZFwdLXJqf/ZE=; b=ezkLChihqw4Eogd285vcu
	IZZzqB9UtcTRlEWs+SGBpfPQZpy6HWhEmiAr0ULVQ2fYskLApziHeYHZu33QLGxq
	Hu5YaYOXXqcobMAor/LTRGBK356CykG1SSyK2QcaDV7zUqx+KIpabXSwQGtfA6fx
	cZGwIsYa9BLvJBZxYUR1PmQBPkTLSWhBaHziccxSTaGAnwXesySJ8E9VKg+9aUfd
	2ZKRSS+CfzBRpsK4lNsq3RnQ4LwFFYOAFkHqrISb2cnnJS52eAVA5baCTuBVC0Oq
	5NuEWBFBRgCU2STC1JJEVeWoIOm5ZBmcteiQYVgUdWEWDcMrQiVW7OuZV2ejInKQ
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4a4yktg9b7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Oct 2025 12:08:31 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 59VG8UmN064693
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 Oct 2025 12:08:30 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Fri, 31 Oct
 2025 12:08:30 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Fri, 31 Oct 2025 12:08:30 -0400
Received: from Ubuntu.ad.analog.com ([10.32.15.145])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 59VG89rb006955;
	Fri, 31 Oct 2025 12:08:23 -0400
From: Antoniu Miclaus <antoniu.miclaus@analog.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski
	<brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Antoniu Miclaus <antoniu.miclaus@analog.com>
Subject: [PATCH 2/2] gpio: adg1712: add driver support
Date: Fri, 31 Oct 2025 16:07:05 +0000
Message-ID: <20251031160710.13343-3-antoniu.miclaus@analog.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031160710.13343-1-antoniu.miclaus@analog.com>
References: <20251031160710.13343-1-antoniu.miclaus@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: aCf2hN8mXTMXoSA2EXwG6R8PLodt-p1S
X-Proofpoint-ORIG-GUID: aCf2hN8mXTMXoSA2EXwG6R8PLodt-p1S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDE0NSBTYWx0ZWRfX9yBeii03P3vZ
 PNP8ZsIN+Vf/9cDgMvME6G+4ymwizfJmDK8y4A3r8hScprSuXU/azOiyzqh8JcJN02e1gAmtCSj
 7sTZBrHLKF7+U5kWRKfk85Np0zIrF88iig+qfiOjEv1fxQxsjQhab8BU+qTz3HpbRtYJMacj2ge
 j5KZq1vZdWKgWeUgad7XvhgN0JYUdg/VqqUvYhQs+7kXAnJ/q14VM3LWGSRoLRpbG1dj5bneiMq
 OCkJ+MS+0CstZPH+IP08yHfBMKXBawatmRE4Y6SdO0gp8phazCxRbucwGOUbC5ApZCGvbu3g8xw
 2zbBAAK4rE6xpCQpJweYi5DyMSc20WsXTZ08zcc3/83Ns0ld3CwoZ/s97TXkPhYWJ8G+xl2XGHy
 VDwM/+1o7EVOA8A7tQrdtOCMGpbyGg==
X-Authority-Analysis: v=2.4 cv=Uq1u9uwB c=1 sm=1 tr=0 ts=6904deff cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gAnH3GRIAAAA:8 a=v3irjB-aNStsiBGt8dMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_05,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310145

Add driver support for the ADG1712, which contains four independent
single-pole/single-throw (SPST) switches and operates with a
low-voltage single supply range from +1.08V to +5.5V or a low-voltage
dual supply range from ±1.08V to ±2.75V.

Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
---
 drivers/gpio/Kconfig        |   9 +++
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-adg1712.c | 146 ++++++++++++++++++++++++++++++++++++
 3 files changed, 156 insertions(+)
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
index 000000000000..f8d3481ac9d0
--- /dev/null
+++ b/drivers/gpio/gpio-adg1712.c
@@ -0,0 +1,146 @@
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
+	struct gpio_desc *switch_gpios[ADG1712_NUM_GPIOS];
+};
+
+static int adg1712_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	return GPIO_LINE_DIRECTION_OUT;
+}
+
+static int adg1712_direction_input(struct gpio_chip *chip, unsigned int offset)
+{
+	return -EINVAL;
+}
+
+static int adg1712_direction_output(struct gpio_chip *chip, unsigned int offset,
+				    int value)
+{
+	struct adg1712 *adg1712 = gpiochip_get_data(chip);
+
+	if (offset >= ADG1712_NUM_GPIOS)
+		return -EINVAL;
+
+	gpiod_set_value_cansleep(adg1712->switch_gpios[offset], value);
+	return 0;
+}
+
+static int adg1712_set(struct gpio_chip *chip, unsigned int offset, int value)
+{
+	struct adg1712 *adg1712 = gpiochip_get_data(chip);
+
+	if (offset >= ADG1712_NUM_GPIOS)
+		return -EINVAL;
+
+	gpiod_set_value_cansleep(adg1712->switch_gpios[offset], value);
+	return 0;
+}
+
+static int adg1712_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct adg1712 *adg1712 = gpiochip_get_data(chip);
+
+	if (offset >= ADG1712_NUM_GPIOS)
+		return -EINVAL;
+
+	return gpiod_get_value_cansleep(adg1712->switch_gpios[offset]);
+}
+
+static int adg1712_set_multiple(struct gpio_chip *chip, unsigned long *mask,
+				 unsigned long *bits)
+{
+	struct adg1712 *adg1712 = gpiochip_get_data(chip);
+	int i;
+
+	for_each_set_bit(i, mask, ADG1712_NUM_GPIOS) {
+		gpiod_set_value_cansleep(adg1712->switch_gpios[i],
+					 test_bit(i, bits));
+	}
+
+	return 0;
+}
+
+static const struct gpio_chip adg1712_gpio_chip = {
+	.label			= "adg1712",
+	.owner			= THIS_MODULE,
+	.get_direction		= adg1712_get_direction,
+	.direction_input	= adg1712_direction_input,
+	.direction_output	= adg1712_direction_output,
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
+	int ret, i;
+	char gpio_name[16];
+
+	adg1712 = devm_kzalloc(dev, sizeof(*adg1712), GFP_KERNEL);
+	if (!adg1712)
+		return -ENOMEM;
+
+	adg1712->chip = adg1712_gpio_chip;
+	adg1712->chip.parent = dev;
+
+	for (i = 0; i < ADG1712_NUM_GPIOS; i++) {
+		snprintf(gpio_name, sizeof(gpio_name), "switch%d", i + 1);
+		adg1712->switch_gpios[i] = devm_gpiod_get(dev, gpio_name,
+							  GPIOD_OUT_LOW);
+		if (IS_ERR(adg1712->switch_gpios[i]))
+			return dev_err_probe(dev, PTR_ERR(adg1712->switch_gpios[i]),
+					     "failed to get %s gpio\n", gpio_name);
+	}
+
+	ret = devm_gpiochip_add_data(dev, &adg1712->chip, adg1712);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add gpio chip\n");
+
+	dev_info(dev, "ADG1712 %u-GPIO expander registered\n",
+		 adg1712->chip.ngpio);
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


