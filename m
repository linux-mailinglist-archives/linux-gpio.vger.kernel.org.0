Return-Path: <linux-gpio+bounces-16544-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75963A4383A
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 09:53:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8083189CC2E
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 08:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778D7263F26;
	Tue, 25 Feb 2025 08:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="acZoLLaf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0122826138E;
	Tue, 25 Feb 2025 08:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740473539; cv=none; b=DbZ1w7ZjS6m/qrmv3UjpW5+7iL+x6yRF09zba4bx4SNdydhZym+7Q1RFgMrwnd+z9/zbwbkKHFsr7J5ijyMUBW2yqv1oBmO0LRQr6KkvEhM4kKgaTPC44ydV6V2bsIVPRSJMHPef7V/0hQHnp9DpQNrJFZkc29S9LGvIjizp9N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740473539; c=relaxed/simple;
	bh=K/ZNmYDQ1nyYLq+lA0MZmo48sBjGXKuYSMhcHqWMKVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=IPC+SxnNd3F1XsoZhjnMfGUwy7SkNjpUMs04kFHgUnmTrQdzGEKOLR6aaPWQIwGC/iUTmiNu9sREaw5PhrzGpY5/PGEqoN6hIvu2WlnxPhYGibVcCm/rMZd//f6oj+JMEBeahVkVMtuCMzg6Ct4A28qGJ38wg/DzHweiR1KBtm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=acZoLLaf; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P7lqXC000766;
	Tue, 25 Feb 2025 09:52:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	cVklkX4ls4DmGaHeHtD1Mqmy/EB9lIthesFAI0y01ZA=; b=acZoLLaf3zttcjr0
	qrbM4xCG8yDoqlOAsqNWCOlRHtcfHrQbt+1iTbkZ+gkMjyszYCw5kjQa3b7Mq7Hx
	XJ6QPp7ZEncO9iSFiucnbl+8oH1pZkxkUgyb1DLLhjY5l0SL3yvG0dlX0XtjYMpP
	P6Xwap0C0oC7Z3cxL72Lnp+Gs4OICJ0ZhPL7U8phx1OMm4wReUQUb1jcKcIy1M6+
	4NdONW+GSTKHEKdLC+iSvOeAOFA7TcSQEruRgoKQybUDWO5BOb/CxcaPw5K1PGxB
	x5Ji++mQ3z1LxREJf14dLBYwRRT6tASqqaGPmQJIw84xg1OKi/SIhzKUfhFfK8+h
	yZUF+Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4512sp1t4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 09:52:01 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1B9CA40055;
	Tue, 25 Feb 2025 09:50:51 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 386AF47A7A8;
	Tue, 25 Feb 2025 09:48:08 +0100 (CET)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 09:48:07 +0100
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Tue, 25 Feb 2025 09:48:02 +0100
Subject: [PATCH 3/9] pinctrl: stm32: Introduce HDP driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250225-hdp-upstream-v1-3-9d049c65330a@foss.st.com>
References: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
In-Reply-To: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-42535
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_03,2025-02-24_02,2024-11-22_01

This patch introduce the driver for the Hardware Debug Port available on
STM32MP platforms. The HDP allows the observation of internal SoC
signals by using multiplexers. Each HDP port can provide up to 16
internal signals (one of them can be software controlled as a GPO)

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 drivers/pinctrl/stm32/Kconfig             |  14 ++
 drivers/pinctrl/stm32/Makefile            |   1 +
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c | 301 ++++++++++++++++++++++++++++++
 3 files changed, 316 insertions(+)

diff --git a/drivers/pinctrl/stm32/Kconfig b/drivers/pinctrl/stm32/Kconfig
index 2656d3d3ae40..4b474cfd1f2c 100644
--- a/drivers/pinctrl/stm32/Kconfig
+++ b/drivers/pinctrl/stm32/Kconfig
@@ -57,4 +57,18 @@ config PINCTRL_STM32MP257
 	depends on OF && HAS_IOMEM
 	default MACH_STM32MP25
 	select PINCTRL_STM32
+
+config PINCTRL_STM32_HDP
+	tristate "STMicroelectronics STM32 Hardware Debug Port (HDP) pin control"
+	depends on OF && HAS_IOMEM
+	default ARM64 || (ARM && CPU_V7)
+	select PINMUX
+	select GENERIC_PINCONF
+	select GPIOLIB
+	help
+	  The Hardware Debug Port allows the observation of internal signals.
+	  It uses configurable multiplexer to route signals in a dedicated observation register.
+	  This driver also permits the observation of signals on external SoC pins.
+	  It permits the observation of up to 16 signals per HDP line.
+
 endif
diff --git a/drivers/pinctrl/stm32/Makefile b/drivers/pinctrl/stm32/Makefile
index 7b17464d8de1..98a1bbc7e16c 100644
--- a/drivers/pinctrl/stm32/Makefile
+++ b/drivers/pinctrl/stm32/Makefile
@@ -11,3 +11,4 @@ obj-$(CONFIG_PINCTRL_STM32H743)	+= pinctrl-stm32h743.o
 obj-$(CONFIG_PINCTRL_STM32MP135) += pinctrl-stm32mp135.o
 obj-$(CONFIG_PINCTRL_STM32MP157) += pinctrl-stm32mp157.o
 obj-$(CONFIG_PINCTRL_STM32MP257) += pinctrl-stm32mp257.o
+obj-$(CONFIG_PINCTRL_STM32_HDP) += pinctrl-stm32-hdp.o
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
new file mode 100644
index 000000000000..e937d9b9f77a
--- /dev/null
+++ b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
@@ -0,0 +1,301 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
+ * Author: Clément Le Goffic <clement.legoffic@foss.st.com> for STMicroelectronics.
+ */
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/gpio/driver.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+
+#include "../core.h"
+
+#define DRIVER_NAME		"stm32_hdp"
+#define HDP_CTRL_ENABLE		1
+#define HDP_CTRL_DISABLE	0
+#define NB_FUNCTIONS		16
+
+#define HDP_CTRL		0x000
+#define HDP_MUX			0x004
+#define HDP_VAL			0x010
+#define HDP_GPOSET		0x014
+#define HDP_GPOCLR		0x018
+#define HDP_GPOVAL		0x01c
+#define HDP_VERR		0x3f4
+#define HDP_IPIDR		0x3f8
+#define HDP_SIDR		0x3fc
+
+#define HDP_MUX_SHIFT(n)	((n) * 4)
+#define HDP_MUX_MASK(n)		(GENMASK(3, 0) << HDP_MUX_SHIFT(n))
+#define HDP_MUX_GPOVAL(n)	(0xf << HDP_MUX_SHIFT(n))
+
+struct stm32_hdp {
+	struct device *dev;
+	void __iomem *base;
+	struct clk *clk;
+	struct pinctrl_dev *pctl_dev;
+	struct gpio_chip gpio_chip;
+	u32 mux_conf;
+	u32 gposet_conf;
+};
+
+static const struct pinctrl_pin_desc stm32_hdp_pins[] = {
+	PINCTRL_PIN(0, "hdp0"),
+	PINCTRL_PIN(1, "hdp1"),
+	PINCTRL_PIN(2, "hdp2"),
+	PINCTRL_PIN(3, "hdp3"),
+	PINCTRL_PIN(4, "hdp4"),
+	PINCTRL_PIN(5, "hdp5"),
+	PINCTRL_PIN(6, "hdp6"),
+	PINCTRL_PIN(7, "hdp7"),
+};
+
+static const char * const func_name[] = {
+	"0", "1", "2", "3",
+	"4", "5", "6", "7",
+	"8", "9", "10", "11",
+	"12", "13", "14", "15",
+};
+
+static const char * const stm32_hdp_pins_group[] = {
+	"hdp0",
+	"hdp1",
+	"hdp2",
+	"hdp3",
+	"hdp4",
+	"hdp5",
+	"hdp6",
+	"hdp7"
+};
+
+static int stm32_hdp_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	return GPIO_LINE_DIRECTION_OUT;
+}
+
+static int stm32_hdp_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct stm32_hdp *hdp = gpiochip_get_data(gc);
+
+	if (((hdp->mux_conf & HDP_MUX_MASK(offset))) == HDP_MUX_GPOVAL(offset))
+		return !!(readl_relaxed(hdp->base + HDP_GPOVAL) & BIT(offset));
+	else
+		return !!(readl_relaxed(hdp->base + HDP_VAL) & BIT(offset));
+}
+
+static void stm32_hdp_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	struct stm32_hdp *hdp = gpiochip_get_data(gc);
+
+	if (value)
+		writel_relaxed(BIT(offset), hdp->base + HDP_GPOSET);
+	else
+		writel_relaxed(BIT(offset), hdp->base + HDP_GPOCLR);
+}
+
+static int stm32_hdp_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(stm32_hdp_pins);
+}
+
+static const char *stm32_hdp_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
+						    unsigned int selector)
+{
+	return stm32_hdp_pins[selector].name;
+}
+
+static int stm32_hdp_pinctrl_get_group_pins(struct pinctrl_dev *pctldev, unsigned int selector,
+					    const unsigned int **pins, unsigned int *num_pins)
+{
+	*pins = &stm32_hdp_pins[selector].number;
+	*num_pins = 1;
+
+	return 0;
+}
+
+static const struct pinctrl_ops stm32_hdp_pinctrl_ops = {
+	.get_groups_count = stm32_hdp_pinctrl_get_groups_count,
+	.get_group_name	  = stm32_hdp_pinctrl_get_group_name,
+	.get_group_pins	  = stm32_hdp_pinctrl_get_group_pins,
+	.dt_node_to_map	  = pinconf_generic_dt_node_to_map_all,
+	.dt_free_map	  = pinconf_generic_dt_free_map,
+};
+
+static int stm32_hdp_pinmux_get_functions_count(struct pinctrl_dev *pctldev)
+{
+	return NB_FUNCTIONS;
+}
+
+static const char *stm32_hdp_pinmux_get_function_name(struct pinctrl_dev *pctldev,
+						      unsigned int selector)
+{
+	return func_name[selector];
+}
+
+static int stm32_hdp_pinmux_get_function_groups(struct pinctrl_dev *pctldev, unsigned int selector,
+						const char *const **groups,
+						unsigned int *num_groups)
+{
+	*groups = stm32_hdp_pins_group;
+	*num_groups = ARRAY_SIZE(stm32_hdp_pins_group);
+
+	return 0;
+}
+
+static int stm32_hdp_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int func_selector,
+				    unsigned int group_selector)
+{
+	struct stm32_hdp *hdp = pinctrl_dev_get_drvdata(pctldev);
+	unsigned int pin = stm32_hdp_pins[group_selector].number;
+	u32 mux;
+
+	mux = readl_relaxed(hdp->base + HDP_MUX);
+	mux &= ~HDP_MUX_MASK(pin);
+	mux |= func_selector << HDP_MUX_SHIFT(pin);
+
+	writel_relaxed(mux, hdp->base + HDP_MUX);
+	hdp->mux_conf = mux;
+
+	return 0;
+}
+
+static const struct pinmux_ops stm32_hdp_pinmux_ops = {
+	.get_functions_count = stm32_hdp_pinmux_get_functions_count,
+	.get_function_name   = stm32_hdp_pinmux_get_function_name,
+	.get_function_groups = stm32_hdp_pinmux_get_function_groups,
+	.set_mux	     = stm32_hdp_pinmux_set_mux,
+	.gpio_set_direction  = NULL,
+};
+
+static struct pinctrl_desc stm32_hdp_pdesc = {
+	.name	 = DRIVER_NAME,
+	.pins	 = stm32_hdp_pins,
+	.npins	 = ARRAY_SIZE(stm32_hdp_pins),
+	.pctlops = &stm32_hdp_pinctrl_ops,
+	.pmxops	 = &stm32_hdp_pinmux_ops,
+	.owner	 = THIS_MODULE,
+};
+
+static const struct of_device_id stm32_hdp_of_match[] = {
+	{
+		.compatible = "st,stm32mp-hdp"
+	},
+	{}
+};
+
+static int stm32_hdp_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct stm32_hdp *hdp;
+	u8 version;
+	int err;
+
+	hdp = devm_kzalloc(dev, sizeof(*hdp), GFP_KERNEL);
+	if (!hdp)
+		return -ENOMEM;
+	hdp->dev = dev;
+
+	platform_set_drvdata(pdev, hdp);
+
+	hdp->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(hdp->base))
+		return PTR_ERR(hdp->base);
+
+	hdp->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(hdp->clk))
+		return dev_err_probe(dev, PTR_ERR(hdp->clk), "No HDP clock provided\n");
+
+	err = devm_pinctrl_register_and_init(dev, &stm32_hdp_pdesc, hdp, &hdp->pctl_dev);
+	if (err)
+		return dev_err_probe(dev, err, "Failed to register pinctrl\n");
+
+	err = pinctrl_enable(hdp->pctl_dev);
+	if (err)
+		return dev_err_probe(dev, err, "Failed to enable pinctrl\n");
+
+	hdp->gpio_chip.label	     = "stm32-hdp";
+	hdp->gpio_chip.parent	     = dev;
+	hdp->gpio_chip.get_direction = stm32_hdp_gpio_get_direction;
+	hdp->gpio_chip.get	     = stm32_hdp_gpio_get;
+	hdp->gpio_chip.set	     = stm32_hdp_gpio_set;
+	hdp->gpio_chip.base	     = -1;
+	hdp->gpio_chip.ngpio	     = ARRAY_SIZE(stm32_hdp_pins);
+	hdp->gpio_chip.can_sleep     = true;
+	hdp->gpio_chip.names	     = stm32_hdp_pins_group;
+
+	err = devm_gpiochip_add_data(dev, &hdp->gpio_chip, hdp);
+	if (err)
+		return dev_err_probe(dev, err, "Failed to add gpiochip\n");
+
+	writel_relaxed(HDP_CTRL_ENABLE, hdp->base + HDP_CTRL);
+
+	version = readl_relaxed(hdp->base + HDP_VERR);
+	dev_dbg(dev, "STM32 HDP version %u.%u initialized\n", version >> 4, version & 0x0f);
+
+	return 0;
+}
+
+static void stm32_hdp_remove(struct platform_device *pdev)
+{
+	struct stm32_hdp *hdp = platform_get_drvdata(pdev);
+
+	writel_relaxed(HDP_CTRL_DISABLE, hdp->base + HDP_CTRL);
+}
+
+static int stm32_hdp_suspend(struct device *dev)
+{
+	struct stm32_hdp *hdp = dev_get_drvdata(dev);
+
+	hdp->gposet_conf = readl_relaxed(hdp->base + HDP_GPOSET);
+
+	pinctrl_pm_select_sleep_state(dev);
+
+	clk_disable_unprepare(hdp->clk);
+
+	return 0;
+}
+
+static int stm32_hdp_resume(struct device *dev)
+{
+	struct stm32_hdp *hdp = dev_get_drvdata(dev);
+	int err;
+
+	err = clk_prepare_enable(hdp->clk);
+	if (err)
+		return dev_err_probe(hdp->dev, err, "Failed to prepare_enable clk");
+
+	writel_relaxed(HDP_CTRL_ENABLE, hdp->base + HDP_CTRL);
+	writel_relaxed(hdp->gposet_conf, hdp->base + HDP_GPOSET);
+	writel_relaxed(hdp->mux_conf, hdp->base + HDP_MUX);
+
+	pinctrl_pm_select_default_state(dev);
+
+	return 0;
+}
+
+DEFINE_SIMPLE_DEV_PM_OPS(stm32_hdp_pm_ops, stm32_hdp_suspend, stm32_hdp_resume);
+
+static struct platform_driver stm32_hdp_driver = {
+	.probe = stm32_hdp_probe,
+	.remove = stm32_hdp_remove,
+	.driver = {
+		.name = DRIVER_NAME,
+		.pm = pm_sleep_ptr(&stm32_hdp_pm_ops),
+		.of_match_table = stm32_hdp_of_match,
+	}
+};
+
+module_platform_driver(stm32_hdp_driver);
+
+MODULE_ALIAS("platform:" DRIVER_NAME);
+MODULE_AUTHOR("Clément Le Goffic");
+MODULE_DESCRIPTION("STMicroelectronics STM32 Hardware Debug Port driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0


