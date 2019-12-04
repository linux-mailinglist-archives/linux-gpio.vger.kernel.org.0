Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B819D112900
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 11:11:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727654AbfLDKLH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 05:11:07 -0500
Received: from zimbra2.kalray.eu ([92.103.151.219]:56806 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727601AbfLDKLG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 05:11:06 -0500
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 2483D27E1615;
        Wed,  4 Dec 2019 11:11:04 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id gvrRT0rHAEdz; Wed,  4 Dec 2019 11:11:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 5C27827E105F;
        Wed,  4 Dec 2019 11:11:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 5C27827E105F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1575454263;
        bh=kqlc+GicvRWTqiGeSKGpuPVSyUpC4IzwPGGUuISpl68=;
        h=From:To:Date:Message-Id;
        b=GXS6IijCHokzvT81WLifrL15YEhumVEqgNupy1qlzhwJU7414cOBS/g3xhjzQudLD
         vDGPUNl2Paf44yvFPtBEHfvK2OqbPeJp2Tfo5kZ1Uj17oLBnpLa/U6lEOt1xwtz3lE
         MXlucV8okAfuZ6YsarYdOBRraNyebMgiwVr+6vzw=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id G4zHnzc5Esd0; Wed,  4 Dec 2019 11:11:03 +0100 (CET)
Received: from triton.lin.mbt.kalray.eu (unknown [192.168.37.25])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id 45CE827E0E3A;
        Wed,  4 Dec 2019 11:11:03 +0100 (CET)
From:   Clement Leger <cleger@kalray.eu>
To:     linux-kernel@vger.kernel.org
Cc:     Clement Leger <cleger@kalray.eu>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        linux-gpio@vger.kernel.org
Subject: [PATCH 4/5] pinctrl: dw: add pinctrl support for dwapb gpio driver
Date:   Wed,  4 Dec 2019 11:10:38 +0100
Message-Id: <20191204101042.4275-5-cleger@kalray.eu>
X-Mailer: git-send-email 2.15.0.276.g89ea799
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Synopsys designware gpio controller also has pinmuxing functionnality.
Pinmuxing allows to choose between software and hardware mode. When
using hardware mode, an external signal controls the pin output.

This patch adds support for pinctrl framework in the gpio driver. This
support is conditionned by the snps,has-pinctrl device tree property.
Indeed, the functionnality can be detected only if the gpio IP has been
configured using paremeters encoding which is not always present. If
property is present, then the pinctrl will be registered and will
allow switching to the "hw" functionnality and hence enable the
alternate function.

Signed-off-by: Clement Leger <cleger@kalray.eu>
---
 drivers/pinctrl/dw/Kconfig               |   2 +
 drivers/pinctrl/dw/pinctrl-dwapb.c       | 263 ++++++++++++++++++++++++++++++-
 include/linux/platform_data/gpio-dwapb.h |   1 +
 3 files changed, 260 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/dw/Kconfig b/drivers/pinctrl/dw/Kconfig
index 8b57c27eab1f..2bcc51813d80 100644
--- a/drivers/pinctrl/dw/Kconfig
+++ b/drivers/pinctrl/dw/Kconfig
@@ -4,6 +4,8 @@ config GPIO_DWAPB
 	select GPIOLIB
 	select GPIOLIB_IRQCHIP
 	select GPIO_GENERIC
+	select PINMUX
+	select GENERIC_PINCONF
 	help
 	  Say Y or M here to build support for the Synopsys DesignWare APB
 	  GPIO block.
diff --git a/drivers/pinctrl/dw/pinctrl-dwapb.c b/drivers/pinctrl/dw/pinctrl-dwapb.c
index 3750205408e3..063bc36319d7 100644
--- a/drivers/pinctrl/dw/pinctrl-dwapb.c
+++ b/drivers/pinctrl/dw/pinctrl-dwapb.c
@@ -25,15 +25,22 @@
 #include <linux/spinlock.h>
 #include <linux/platform_data/gpio-dwapb.h>
 #include <linux/slab.h>
+#include <linux/pinctrl/pinmux.h>
+
+#include "../pinctrl-utils.h"
 
 #define GPIO_SWPORTA_DR		0x00
 #define GPIO_SWPORTA_DDR	0x04
+#define GPIO_SWPORTA_CTL	0x08
 #define GPIO_SWPORTB_DR		0x0c
 #define GPIO_SWPORTB_DDR	0x10
+#define GPIO_SWPORTB_CTL	0x14
 #define GPIO_SWPORTC_DR		0x18
 #define GPIO_SWPORTC_DDR	0x1c
+#define GPIO_SWPORTC_CTL	0x20
 #define GPIO_SWPORTD_DR		0x24
 #define GPIO_SWPORTD_DDR	0x28
+#define GPIO_SWPORTD_CTL	0x2c
 #define GPIO_INTEN		0x30
 #define GPIO_INTMASK		0x34
 #define GPIO_INTTYPE_LEVEL	0x38
@@ -45,11 +52,16 @@
 #define GPIO_EXT_PORTB		0x54
 #define GPIO_EXT_PORTC		0x58
 #define GPIO_EXT_PORTD		0x5c
+#define GPIO_CONFIG_REG1	0x74
+
+#define GPIO_CONFIG_REG1_HW_BIT		8
+#define GPIO_CONFIG_REG1_SINGLE_CTL_BIT	4
 
 #define DWAPB_MAX_PORTS		4
 #define GPIO_EXT_PORT_STRIDE	0x04 /* register stride 32 bits */
 #define GPIO_SWPORT_DR_STRIDE	0x0c /* register stride 3*32 bits */
 #define GPIO_SWPORT_DDR_STRIDE	0x0c /* register stride 3*32 bits */
+#define GPIO_SWPORT_CTL_STRIDE	0x0c /* register stride 3*32 bits */
 
 #define GPIO_REG_OFFSET_V2	1
 
@@ -77,13 +89,16 @@ struct dwapb_context {
 #endif
 
 struct dwapb_gpio_port {
-	struct gpio_chip	gc;
-	bool			is_registered;
-	struct dwapb_gpio	*gpio;
+	struct gpio_chip		gc;
+	bool				is_registered;
+	struct dwapb_gpio		*gpio;
 #ifdef CONFIG_PM_SLEEP
-	struct dwapb_context	*ctx;
+	struct dwapb_context		*ctx;
 #endif
-	unsigned int		idx;
+	unsigned int			idx;
+	struct pinctrl_dev		*pctl;
+	struct pinctrl_desc		pctldesc;
+	struct pinctrl_gpio_range	range;
 };
 
 struct dwapb_gpio {
@@ -97,6 +112,89 @@ struct dwapb_gpio {
 	struct clk		*clk;
 };
 
+enum dwapb_gpio_func {
+	DWAPB_GPIO_SW_FUNC = 0,
+	DWAPB_GPIO_HW_FUNC = 1,
+};
+
+#define DWAPB_PINCTRL_PIN(pin) PINCTRL_PIN(pin, "pin" #pin)
+
+static const struct pinctrl_pin_desc dwapb_pins[] = {
+	DWAPB_PINCTRL_PIN(0),
+	DWAPB_PINCTRL_PIN(1),
+	DWAPB_PINCTRL_PIN(2),
+	DWAPB_PINCTRL_PIN(3),
+	DWAPB_PINCTRL_PIN(4),
+	DWAPB_PINCTRL_PIN(5),
+	DWAPB_PINCTRL_PIN(6),
+	DWAPB_PINCTRL_PIN(7),
+	DWAPB_PINCTRL_PIN(8),
+	DWAPB_PINCTRL_PIN(9),
+	DWAPB_PINCTRL_PIN(10),
+	DWAPB_PINCTRL_PIN(11),
+	DWAPB_PINCTRL_PIN(12),
+	DWAPB_PINCTRL_PIN(13),
+	DWAPB_PINCTRL_PIN(14),
+	DWAPB_PINCTRL_PIN(15),
+	DWAPB_PINCTRL_PIN(16),
+	DWAPB_PINCTRL_PIN(17),
+	DWAPB_PINCTRL_PIN(18),
+	DWAPB_PINCTRL_PIN(19),
+	DWAPB_PINCTRL_PIN(20),
+	DWAPB_PINCTRL_PIN(21),
+	DWAPB_PINCTRL_PIN(22),
+	DWAPB_PINCTRL_PIN(23),
+	DWAPB_PINCTRL_PIN(24),
+	DWAPB_PINCTRL_PIN(25),
+	DWAPB_PINCTRL_PIN(26),
+	DWAPB_PINCTRL_PIN(27),
+	DWAPB_PINCTRL_PIN(28),
+	DWAPB_PINCTRL_PIN(29),
+	DWAPB_PINCTRL_PIN(30),
+	DWAPB_PINCTRL_PIN(31)
+};
+
+/* One pin per group */
+static const char * const dwapb_gpio_groups[] = {
+	"pin0",
+	"pin1",
+	"pin2",
+	"pin3",
+	"pin4",
+	"pin5",
+	"pin6",
+	"pin7",
+	"pin8",
+	"pin9",
+	"pin10",
+	"pin11",
+	"pin12",
+	"pin13",
+	"pin14",
+	"pin15",
+	"pin16",
+	"pin17",
+	"pin18",
+	"pin19",
+	"pin20",
+	"pin21",
+	"pin22",
+	"pin23",
+	"pin24",
+	"pin25",
+	"pin26",
+	"pin27",
+	"pin28",
+	"pin29",
+	"pin30",
+	"pin31"
+};
+
+static const char *const dwapb_gpio_functions[] = {
+	[DWAPB_GPIO_SW_FUNC] = "sw",
+	[DWAPB_GPIO_HW_FUNC] = "hw",
+};
+
 static inline u32 gpio_reg_v2_convert(unsigned int offset)
 {
 	switch (offset) {
@@ -484,6 +582,151 @@ static void dwapb_irq_teardown(struct dwapb_gpio *gpio)
 	gpio->domain = NULL;
 }
 
+static int dwapb_pctl_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	struct dwapb_gpio_port *port = pinctrl_dev_get_drvdata(pctldev);
+
+	return port->gc.ngpio;
+}
+
+static const char *dwapb_pctl_get_group_name(struct pinctrl_dev *pctldev,
+		unsigned selector)
+{
+	struct dwapb_gpio_port *port = pinctrl_dev_get_drvdata(pctldev);
+
+	/* Exactly one group per pin */
+	return port->pctldesc.pins[selector].name;
+}
+
+static int dwapb_pctl_get_group_pins(struct pinctrl_dev *pctldev,
+		unsigned selector,
+		const unsigned **pins,
+		unsigned *num_pins)
+{
+	struct dwapb_gpio_port *port = pinctrl_dev_get_drvdata(pctldev);
+
+	*pins = &port->pctldesc.pins[selector].number;
+	*num_pins = 1;
+
+	return 0;
+}
+
+static const struct pinctrl_ops dwapb_pctl_ops = {
+	.get_groups_count = dwapb_pctl_get_groups_count,
+	.get_group_name = dwapb_pctl_get_group_name,
+	.get_group_pins = dwapb_pctl_get_group_pins,
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_all,
+	.dt_free_map = pinctrl_utils_free_map,
+};
+
+static int dwapb_gpio_get_function_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(dwapb_gpio_functions);
+}
+
+static const char *dwapb_gpio_get_function_name(struct pinctrl_dev *pctldev,
+						unsigned selector)
+{
+	return dwapb_gpio_functions[selector];
+}
+
+static int dwapb_gpio_get_function_groups(struct pinctrl_dev *pctldev,
+					  unsigned selector,
+					  const char * const **groups,
+					  unsigned * const num_groups)
+{
+	struct dwapb_gpio_port *port = pinctrl_dev_get_drvdata(pctldev);
+
+	*groups = dwapb_gpio_groups;
+	*num_groups = port->gc.ngpio;
+
+	return 0;
+}
+
+static int dwapb_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned selector,
+		unsigned group)
+{
+	struct dwapb_gpio_port *port = pinctrl_dev_get_drvdata(pctldev);
+	struct dwapb_gpio *gpio = port->gpio;
+	struct gpio_chip *gc = &port->gc;
+	unsigned int reg_off;
+	unsigned long flags;
+	u32 val;
+
+	dev_info(gpio->dev, "Setting func %s on pin %d",
+		dwapb_gpio_functions[selector], group);
+
+	reg_off = GPIO_SWPORTA_CTL + (port->idx * GPIO_SWPORT_CTL_STRIDE);
+	spin_lock_irqsave(&gc->bgpio_lock, flags);
+	val = dwapb_read(gpio, reg_off);
+	if (selector == 0)
+		val &= ~BIT(group);
+	else
+		val |= BIT(group);
+	dwapb_write(gpio, reg_off, val);
+	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+
+	return 0;
+}
+
+static int dwapb_gpio_pmx_gpio_request(struct pinctrl_dev *pctldev,
+				    struct pinctrl_gpio_range *range,
+				    unsigned int pin)
+{
+	return dwapb_gpio_set_mux(pctldev, DWAPB_GPIO_SW_FUNC, pin);
+}
+
+struct pinmux_ops dwapb_pmux_ops = {
+	.get_functions_count = dwapb_gpio_get_function_count,
+	.get_function_name = dwapb_gpio_get_function_name,
+	.get_function_groups = dwapb_gpio_get_function_groups,
+	.set_mux = dwapb_gpio_set_mux,
+	.gpio_request_enable = dwapb_gpio_pmx_gpio_request,
+};
+
+static int dwapb_gpio_add_pinctrl(struct dwapb_gpio *gpio,
+				  struct dwapb_port_property *pp,
+				  struct dwapb_gpio_port *port)
+{
+	struct pinctrl_desc *desc;
+	struct pinctrl_gpio_range *range;
+	int ret;
+
+	desc = &port->pctldesc;
+
+	desc->pins = dwapb_pins;
+	desc->npins = pp->ngpio;
+	desc->name = dev_name(gpio->dev);
+	desc->owner = THIS_MODULE;
+	desc->pctlops = &dwapb_pctl_ops;
+	desc->pmxops = &dwapb_pmux_ops;
+
+	ret = devm_pinctrl_register_and_init(gpio->dev, &port->pctldesc, port,
+					     &port->pctl);
+	if (ret) {
+		dev_err(gpio->dev, "Failed to register pinctrl device\n");
+		return ret;
+	}
+
+	ret = pinctrl_enable(port->pctl);
+	if (ret) {
+		dev_err(gpio->dev, "pinctrl enable failed\n");
+		return ret;
+	}
+
+	range = &port->range;
+	range->name = dev_name(gpio->dev);
+	range->id = port->idx;
+	range->pin_base = 0;
+	range->base = port->gc.base;
+	range->npins = pp->ngpio;
+	range->gc = &port->gc;
+
+	pinctrl_add_gpio_range(port->pctl, range);
+
+	return 0;
+}
+
 static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
 			       struct dwapb_port_property *pp,
 			       unsigned int offs)
@@ -536,6 +779,12 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
 	else
 		port->is_registered = true;
 
+	if (!err && pp->has_pinctrl) {
+		err = dwapb_gpio_add_pinctrl(gpio, pp, port);
+		if (err)
+			return err;
+	}
+
 	/* Add GPIO-signaled ACPI event support */
 	if (pp->has_irq)
 		acpi_gpiochip_request_interrupts(&port->gc);
@@ -589,6 +838,8 @@ dwapb_gpio_get_pdata(struct device *dev)
 			pp->ngpio = 32;
 		}
 
+		pp->has_pinctrl = fwnode_property_read_bool(fwnode,
+						"snps,has-pinctrl");
 		pp->irq_shared	= false;
 		pp->gpio_base	= -1;
 
@@ -822,7 +1073,7 @@ static SIMPLE_DEV_PM_OPS(dwapb_gpio_pm_ops, dwapb_gpio_suspend,
 
 static struct platform_driver dwapb_gpio_driver = {
 	.driver		= {
-		.name	= "gpio-dwapb",
+		.name	= "pinctrl-dwapb",
 		.pm	= &dwapb_gpio_pm_ops,
 		.of_match_table = of_match_ptr(dwapb_of_match),
 		.acpi_match_table = ACPI_PTR(dwapb_acpi_match),
diff --git a/include/linux/platform_data/gpio-dwapb.h b/include/linux/platform_data/gpio-dwapb.h
index 3c606c450d05..2633bb745317 100644
--- a/include/linux/platform_data/gpio-dwapb.h
+++ b/include/linux/platform_data/gpio-dwapb.h
@@ -14,6 +14,7 @@ struct dwapb_port_property {
 	int		irq[32];
 	bool		has_irq;
 	bool		irq_shared;
+	bool		has_pinctrl;
 };
 
 struct dwapb_platform_data {
-- 
2.15.0.276.g89ea799

