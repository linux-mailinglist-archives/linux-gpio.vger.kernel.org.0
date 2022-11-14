Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 946A36274B6
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Nov 2022 03:49:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235476AbiKNCt5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Nov 2022 21:49:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235711AbiKNCt4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Nov 2022 21:49:56 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 155C0A189;
        Sun, 13 Nov 2022 18:49:52 -0800 (PST)
Received: from loongson.cn (unknown [10.180.13.64])
        by gateway (Coremail) with SMTP id _____8BxbbbPrHFjFcgGAA--.8789S3;
        Mon, 14 Nov 2022 10:49:51 +0800 (CST)
Received: from localhost.localdomain (unknown [10.180.13.64])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8CxJlfIrHFjcjkSAA--.31072S2;
        Mon, 14 Nov 2022 10:49:50 +0800 (CST)
From:   Yinbo Zhu <zhuyinbo@loongson.cn>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        zhanghongchen <zhanghongchen@loongson.cn>,
        Yinbo Zhu <zhuyinbo@loongson.cn>
Subject: [PATCH v10 1/2] pinctrl: pinctrl-loongson2: add pinctrl driver support
Date:   Mon, 14 Nov 2022 10:49:41 +0800
Message-Id: <20221114024942.8111-1-zhuyinbo@loongson.cn>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxJlfIrHFjcjkSAA--.31072S2
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvAXoW3Zr1xWw4fZFyxZw4xZryrZwb_yoW8Gw48Ao
        WS9Fn8Xr4fJr1xJFZ8Xrn8G3y7ZFs7Crn8Ar97Zrs8G3yavrnrKryDtr47GFy8tr4rtF17
        uasagFWrJF4Iqrn5n29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
        J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
        UU901xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFV
        AK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2
        z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr
        1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvY
        zxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4
        xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCa
        FVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz4
        8v1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s02
        6c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw
        0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvE
        c7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
        v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x
        07jOyCJUUUUU=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: zhanghongchen <zhanghongchen@loongson.cn>

The Loongson-2 SoC has a few pins that can be used as GPIOs or take
multiple other functions. Add a driver for the pinmuxing.

There is currently no support for GPIO pin pull-up and pull-down.

Signed-off-by: zhanghongchen <zhanghongchen@loongson.cn>
Co-developed-by: Yinbo Zhu <zhuyinbo@loongson.cn>
Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
---
Change in v10:
		1. Remove lio/uart2/uart1/carmera/dvo1/dvo0 pins resue configuration.
		2. Remove the castings about readl/writel/definition addr.
Change in v9:
		1. Add zhanghongchen as patch author and add Co-developed-by tag
		   for myself.
		2. Keep entry in order in Kconfig and Makefile.
		3. Keep it as a separate group after generic linux/* ones.
		4. Use linux/io.h replace asm-generic/io.h.
		5. Use PINCTRL_PINGROUP() and associated data structure.
		6. Remove Redundant blank line after loongson2_pmx_groups.
		7. Adjust gpio_groups.
		8. Remove message printk after devm_platform_ioremap_resource.
		9. Remove comma for the terminator line.
		10. Add MODULE_LICENSE("GPL") in driver ending.
Change in v8:
		1. Add #include <linux/pinctrl/pinctrl.h>.
		2. Add #include <linux/seq_file.h>. 
Change in v7:
		1. Add all history change log information.
Change in v6:
		1. Add #include <asm-generic/io.h>.
Change in v5:
		1. NO change, but other patch in this series of patches set has
		   change.
Change in v4:
		1. Replace Loongson2/loongson2 with Loongson-2/loongson-2/LOONGSON-2
		   but except c file.
		2. Add a helper combining two calls and that helper is
		   "devm_platform_ioremap_resource". 
Change in v3:
		1. NO change, but other patch in this series of patches set has
		   change.
Change in v2:
		1. Add "depends LOONGARCH || COMPILE_TEST" in Kconfig.
		2. Fixup the odd indentation in Kconfig.
		3. Make coma goes to previous line. in Kconfig.
		4. Add items in alphabetical order in Makefile. 
		5. Add const type for loongson2_pmx_functions.
		6. Add static for loongson2_pmx_ops.
		7. Replace sizeof(struct loongson2_pinctrl) with sizeof(*pctrl).
		8. Use dev_err_probe as helper to replace "dev_err" and 
		   "return PTR_ERR()".
		9. Replace raw spinlock with ordinary spinlock.

 MAINTAINERS                         |   7 +
 drivers/pinctrl/Kconfig             |  11 +
 drivers/pinctrl/Makefile            |   1 +
 drivers/pinctrl/pinctrl-loongson2.c | 311 ++++++++++++++++++++++++++++
 4 files changed, 330 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-loongson2.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b04e37a1bd2..0e493b4d6e39 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12036,6 +12036,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/timer/loongson,ls2k-hpet.yaml
 F:	drivers/clocksource/loongson2_hpet.c
 
+LOONGSON-2 SOC SERIES PINCTRL DRIVER
+M:	zhanghongchen <zhanghongchen@loongson.cn>
+M:	Yinbo Zhu <zhuyinbo@loongson.cn>
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	drivers/pinctrl/pinctrl-loongson2.c
+
 LSILOGIC MPT FUSION DRIVERS (FC/SAS/SPI)
 M:	Sathya Prakash <sathya.prakash@broadcom.com>
 M:	Sreekanth Reddy <sreekanth.reddy@broadcom.com>
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index f71fefff400f..35f167f70829 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -258,6 +258,17 @@ config PINCTRL_FALCON
 	depends on SOC_FALCON
 	depends on PINCTRL_LANTIQ
 
+config PINCTRL_LOONGSON2
+	tristate "Pinctrl driver for the Loongson-2 SoC"
+	depends on LOONGARCH || COMPILE_TEST
+	select PINMUX
+	select GENERIC_PINCONF
+	help
+	 This selects pin control driver for the Loongson-2 SoC. It
+	 provides pin config functions multiplexing.  GPIO pin pull-up,
+	 pull-down functions are not supported. Say yes to enable
+	 pinctrl for Loongson-2 SoC.
+
 config PINCTRL_XWAY
 	bool
 	depends on SOC_TYPE_XWAY
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 89bfa01b5231..d5939840bb2a 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_PINCTRL_K210)	+= pinctrl-k210.o
 obj-$(CONFIG_PINCTRL_KEEMBAY)	+= pinctrl-keembay.o
 obj-$(CONFIG_PINCTRL_LANTIQ)	+= pinctrl-lantiq.o
 obj-$(CONFIG_PINCTRL_FALCON)	+= pinctrl-falcon.o
+obj-$(CONFIG_PINCTRL_LOONGSON2) += pinctrl-loongson2.o
 obj-$(CONFIG_PINCTRL_XWAY)	+= pinctrl-xway.o
 obj-$(CONFIG_PINCTRL_LPC18XX)	+= pinctrl-lpc18xx.o
 obj-$(CONFIG_PINCTRL_MAX77620)	+= pinctrl-max77620.o
diff --git a/drivers/pinctrl/pinctrl-loongson2.c b/drivers/pinctrl/pinctrl-loongson2.c
new file mode 100644
index 000000000000..1e9ec87e6930
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-loongson2.c
@@ -0,0 +1,311 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Author: zhanghongchen <zhanghongchen@loongson.cn>
+ *         Yinbo Zhu <zhuyinbo@loongson.cn>
+ * Copyright (C) 2022-2023 Loongson Technology Corporation Limited
+ */
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/bitops.h>
+#include <linux/io.h>
+#include <linux/seq_file.h>
+
+#include "core.h"
+#include "pinctrl-utils.h"
+
+#define PMX_GROUP(name, offset, bitv)					\
+	{								\
+		.grp = PINCTRL_PINGROUP((#name), (name ## _pins),	\
+				ARRAY_SIZE((name ## _pins))),		\
+		.reg = offset,						\
+		.bit = bitv,						\
+	}
+
+#define SPECIFIC_GROUP(group)						\
+	static const char * const group##_groups[] = {			\
+		#group							\
+	}
+
+#define FUNCTION(fn)							\
+	{								\
+		.name = #fn,						\
+		.groups = fn ## _groups,				\
+		.num_groups = ARRAY_SIZE(fn ## _groups),		\
+	}
+
+struct loongson2_pinctrl {
+	struct device *dev;
+	struct pinctrl_dev *pcdev;
+	struct pinctrl_desc desc;
+	struct device_node *of_node;
+	spinlock_t lock;
+	void * __iomem reg_base;
+};
+
+struct loongson2_pmx_group {
+	struct pingroup grp;
+	unsigned int reg;
+	unsigned int bit;
+};
+
+struct loongson2_pmx_func {
+	const char *name;
+	const char * const *groups;
+	unsigned int num_groups;
+};
+
+#define LOONGSON2_PIN(x) PINCTRL_PIN(x, "gpio"#x)
+static const struct pinctrl_pin_desc loongson2_pctrl_pins[] = {
+	LOONGSON2_PIN(0),  LOONGSON2_PIN(1),  LOONGSON2_PIN(2),  LOONGSON2_PIN(3),
+	LOONGSON2_PIN(4),  LOONGSON2_PIN(5),  LOONGSON2_PIN(6),  LOONGSON2_PIN(7),
+	LOONGSON2_PIN(8),  LOONGSON2_PIN(9),  LOONGSON2_PIN(10), LOONGSON2_PIN(11),
+	LOONGSON2_PIN(12), LOONGSON2_PIN(13), LOONGSON2_PIN(14),
+	LOONGSON2_PIN(16), LOONGSON2_PIN(17), LOONGSON2_PIN(18), LOONGSON2_PIN(19),
+	LOONGSON2_PIN(20), LOONGSON2_PIN(21), LOONGSON2_PIN(22), LOONGSON2_PIN(23),
+	LOONGSON2_PIN(24), LOONGSON2_PIN(25), LOONGSON2_PIN(26), LOONGSON2_PIN(27),
+	LOONGSON2_PIN(28), LOONGSON2_PIN(29), LOONGSON2_PIN(30),
+	LOONGSON2_PIN(32), LOONGSON2_PIN(33), LOONGSON2_PIN(34), LOONGSON2_PIN(35),
+	LOONGSON2_PIN(36), LOONGSON2_PIN(37), LOONGSON2_PIN(38), LOONGSON2_PIN(39),
+	LOONGSON2_PIN(40), LOONGSON2_PIN(41),
+	LOONGSON2_PIN(44), LOONGSON2_PIN(45), LOONGSON2_PIN(46), LOONGSON2_PIN(47),
+	LOONGSON2_PIN(48), LOONGSON2_PIN(49), LOONGSON2_PIN(50), LOONGSON2_PIN(51),
+	LOONGSON2_PIN(52), LOONGSON2_PIN(53), LOONGSON2_PIN(54), LOONGSON2_PIN(55),
+	LOONGSON2_PIN(56), LOONGSON2_PIN(57), LOONGSON2_PIN(58), LOONGSON2_PIN(59),
+	LOONGSON2_PIN(60), LOONGSON2_PIN(61), LOONGSON2_PIN(62), LOONGSON2_PIN(63),
+};
+
+static const unsigned int gpio_pins[] = {0, 1, 2, 3, 4, 5, 6, 7,
+					 8, 9, 10, 11, 12, 13, 14,
+					 16, 17, 18, 19, 20, 21, 22, 23,
+					 24, 25, 26, 27, 28, 29, 30,
+					 32, 33, 34, 35, 36, 37, 38, 39,
+					 40,         43, 44, 45, 46, 47,
+					 48, 49, 50, 51, 52, 53, 46, 55,
+					 56, 57, 58, 59, 60, 61, 62, 63};
+static const unsigned int sdio_pins[] = {36, 37, 38, 39, 40, 41};
+static const unsigned int can1_pins[] = {34, 35};
+static const unsigned int can0_pins[] = {32, 33};
+static const unsigned int pwm3_pins[] = {23};
+static const unsigned int pwm2_pins[] = {22};
+static const unsigned int pwm1_pins[] = {21};
+static const unsigned int pwm0_pins[] = {20};
+static const unsigned int i2c1_pins[] = {18, 19};
+static const unsigned int i2c0_pins[] = {16, 17};
+static const unsigned int nand_pins[] = {44, 45, 46, 47, 48, 49, 50, 51,
+					 52, 53, 54, 55, 56, 57, 58, 59, 60,
+					 61, 62, 63};
+static const unsigned int sata_led_pins[] = {14};
+static const unsigned int i2s_pins[]    = {24, 25, 26, 27, 28};
+static const unsigned int hda_pins[]    = {24, 25, 26, 27, 28, 29, 30};
+
+static struct loongson2_pmx_group loongson2_pmx_groups[] = {
+	PMX_GROUP(gpio, 0x0, 64),
+	PMX_GROUP(sdio, 0x0, 20),
+	PMX_GROUP(can1, 0x0, 17),
+	PMX_GROUP(can0, 0x0, 16),
+	PMX_GROUP(pwm3, 0x0, 15),
+	PMX_GROUP(pwm2, 0x0, 14),
+	PMX_GROUP(pwm1, 0x0, 13),
+	PMX_GROUP(pwm0, 0x0, 12),
+	PMX_GROUP(i2c1, 0x0, 11),
+	PMX_GROUP(i2c0, 0x0, 10),
+	PMX_GROUP(nand, 0x0, 9),
+	PMX_GROUP(sata_led, 0x0, 8),
+	PMX_GROUP(i2s, 0x0, 6),
+	PMX_GROUP(hda, 0x0, 4),
+};
+
+SPECIFIC_GROUP(sdio);
+SPECIFIC_GROUP(can1);
+SPECIFIC_GROUP(can0);
+SPECIFIC_GROUP(pwm3);
+SPECIFIC_GROUP(pwm2);
+SPECIFIC_GROUP(pwm1);
+SPECIFIC_GROUP(pwm0);
+SPECIFIC_GROUP(i2c1);
+SPECIFIC_GROUP(i2c0);
+SPECIFIC_GROUP(nand);
+SPECIFIC_GROUP(sata_led);
+SPECIFIC_GROUP(i2s);
+SPECIFIC_GROUP(hda);
+
+static const char * const gpio_groups[] = {
+	"sdio",
+	"can1", "can0",
+	"pwm3", "pwm2", "pwm1", "pwm0",
+	"i2c1", "i2c0",
+	"nand",
+	"sata_led",
+	"i2s",
+	"hda",
+};
+
+static const struct loongson2_pmx_func loongson2_pmx_functions[] = {
+	FUNCTION(gpio),
+	FUNCTION(sdio),
+	FUNCTION(can1),
+	FUNCTION(can0),
+	FUNCTION(pwm3),
+	FUNCTION(pwm2),
+	FUNCTION(pwm1),
+	FUNCTION(pwm0),
+	FUNCTION(i2c1),
+	FUNCTION(i2c0),
+	FUNCTION(nand),
+	FUNCTION(sata_led),
+	FUNCTION(i2s),
+	FUNCTION(hda),
+};
+
+static int loongson2_get_groups_count(struct pinctrl_dev *pcdev)
+{
+	return ARRAY_SIZE(loongson2_pmx_groups);
+}
+
+static const char *loongson2_get_group_name(struct pinctrl_dev *pcdev,
+					unsigned int selector)
+{
+	return loongson2_pmx_groups[selector].grp.name;
+}
+
+static int loongson2_get_group_pins(struct pinctrl_dev *pcdev, unsigned int selector,
+			const unsigned int **pins, unsigned int *num_pins)
+{
+	*pins = loongson2_pmx_groups[selector].grp.pins;
+	*num_pins = loongson2_pmx_groups[selector].grp.npins;
+
+	return 0;
+}
+
+static void loongson2_pin_dbg_show(struct pinctrl_dev *pcdev, struct seq_file *s,
+			       unsigned int offset)
+{
+	seq_printf(s, " %s", dev_name(pcdev->dev));
+}
+
+static const struct pinctrl_ops loongson2_pctrl_ops = {
+	.get_groups_count	= loongson2_get_groups_count,
+	.get_group_name		= loongson2_get_group_name,
+	.get_group_pins		= loongson2_get_group_pins,
+	.dt_node_to_map		= pinconf_generic_dt_node_to_map_all,
+	.dt_free_map		= pinctrl_utils_free_map,
+	.pin_dbg_show		= loongson2_pin_dbg_show,
+};
+
+static int loongson2_pmx_set_mux(struct pinctrl_dev *pcdev, unsigned int func_num,
+			      unsigned int group_num)
+{
+	struct loongson2_pinctrl *pctrl = pinctrl_dev_get_drvdata(pcdev);
+	void * __iomem reg = pctrl->reg_base +
+				loongson2_pmx_groups[group_num].reg;
+	unsigned int mux_bit = loongson2_pmx_groups[group_num].bit;
+	unsigned int val;
+	unsigned long flags;
+
+	spin_lock_irqsave(&pctrl->lock, flags);
+	val = readl(reg);
+	if (func_num == 0)
+		val &= ~BIT(mux_bit);
+	else
+		val |= BIT(mux_bit);
+	writel(val, reg);
+	spin_unlock_irqrestore(&pctrl->lock, flags);
+
+	return 0;
+}
+
+static int loongson2_pmx_get_funcs_count(struct pinctrl_dev *pcdev)
+{
+	return ARRAY_SIZE(loongson2_pmx_functions);
+}
+
+static const char *loongson2_pmx_get_func_name(struct pinctrl_dev *pcdev,
+				    unsigned int selector)
+{
+	return loongson2_pmx_functions[selector].name;
+}
+
+static int loongson2_pmx_get_groups(struct pinctrl_dev *pcdev,
+			 unsigned int selector,
+			 const char * const **groups,
+			 unsigned int * const num_groups)
+{
+	*groups = loongson2_pmx_functions[selector].groups;
+	*num_groups = loongson2_pmx_functions[selector].num_groups;
+
+	return 0;
+}
+
+static const struct pinmux_ops loongson2_pmx_ops = {
+	.set_mux = loongson2_pmx_set_mux,
+	.get_functions_count = loongson2_pmx_get_funcs_count,
+	.get_function_name = loongson2_pmx_get_func_name,
+	.get_function_groups = loongson2_pmx_get_groups,
+};
+
+static int loongson2_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct loongson2_pinctrl *pctrl;
+
+	pctrl = devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
+	if (!pctrl)
+		return -ENOMEM;
+
+	pctrl->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pctrl->reg_base))
+		return PTR_ERR(pctrl->reg_base);
+
+	spin_lock_init(&pctrl->lock);
+
+	pctrl->dev = dev;
+	pctrl->desc.name	= "pinctrl-loongson2";
+	pctrl->desc.owner	= THIS_MODULE;
+	pctrl->desc.pctlops	= &loongson2_pctrl_ops;
+	pctrl->desc.pmxops	= &loongson2_pmx_ops;
+	pctrl->desc.pins	= loongson2_pctrl_pins;
+	pctrl->desc.npins	= ARRAY_SIZE(loongson2_pctrl_pins);
+
+	pctrl->pcdev = devm_pinctrl_register(pctrl->dev, &pctrl->desc, pctrl);
+	if (IS_ERR(pctrl->pcdev))
+		return dev_err_probe(pctrl->dev, PTR_ERR(pctrl->pcdev),
+				     "can't register pinctrl device");
+
+	return 0;
+}
+
+static const struct of_device_id loongson2_pinctrl_dt_match[] = {
+	{
+		.compatible = "loongson,ls2k-pinctrl",
+	},
+	{ }
+};
+
+static struct platform_driver loongson2_pinctrl_driver = {
+	.probe		= loongson2_pinctrl_probe,
+	.driver = {
+		.name	= "loongson2-pinctrl",
+		.of_match_table = loongson2_pinctrl_dt_match,
+	},
+};
+
+static int __init loongson2_pinctrl_init(void)
+{
+	return platform_driver_register(&loongson2_pinctrl_driver);
+}
+arch_initcall(loongson2_pinctrl_init);
+
+static void __exit loongson2_pinctrl_exit(void)
+{
+	platform_driver_unregister(&loongson2_pinctrl_driver);
+}
+module_exit(loongson2_pinctrl_exit);
+
+MODULE_DESCRIPTION("Loongson2 Pinctrl driver");
+MODULE_LICENSE("GPL");
-- 
2.31.1

