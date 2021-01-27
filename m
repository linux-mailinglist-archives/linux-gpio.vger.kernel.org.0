Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6686305A5B
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 12:52:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbhA0Lvy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 06:51:54 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:12690 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237341AbhA0Ltx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2021 06:49:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1611748192; x=1643284192;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=TH2lZcib2rBCPzpNm8umKIrysEnQDunpypdTtnjjP4o=;
  b=ukbZe7soDahgDEf0zto8kZRqxLMUFzLP2y/xRsYGwjQch4b25lOdORG0
   MlFVfVG7UN8Qv7v32BREgW5JBuyYJRqVUwYydJ2CxgFGGkxOUuVKKeT1v
   SqzYbrI+339FQgYcOWkgr+5WCOBdxbfrmnuXNcDadiYiyfa0UZtIr8nLG
   BI1LBfRdjaRY6JCxhT/Yqna+4z6wJvY9oEjhkU8+lfzoHZ/ual5Feni+A
   3nHET1n0rLiybOMQ1SGT8bkR2mPsUs+RYNWLOSGkY7cKpVKaZbgFEDzhu
   3r+pbwxM3Fwh9NalNDG3lMkat2L1qv3KRBPeA/d+Bx6orbnNB/SFuPQuR
   A==;
IronPort-SDR: e+s57JvSdJdO6msD8tUzWI8A9LP+1WKZv1lSql/0z7i8zSQ87tXdd0MH7C5+Y8Pq/8NDzmIWtb
 TqT+8Cvs5olAiXNPyRTFE6iuKpbr9dOo9ncka6V0fwKonEwxY/c1AVP+dnxQ6f3/KnoJXvOzA7
 HNuu48FFksBwyUzD2ilB4ZhWg0OJWyDqsVsje0jMXg7nErlZhBbAxM8bQ98n2rdVYwxoVFEvlj
 aavUobVsFp2UnWpNnfH1CBpnGrzMmyr5K98BTNMsxWc6nkmiq8EMzT65II0N/HFCgo7+bV18DX
 I9U=
X-IronPort-AV: E=Sophos;i="5.79,379,1602572400"; 
   d="scan'208";a="104411901"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jan 2021 04:46:10 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 27 Jan 2021 04:46:10 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Wed, 27 Jan 2021 04:46:04 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>
CC:     <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v2 3/3] pinctrl: at91-pio4: fix "Prefer 'unsigned int' to bare use of 'unsigned'"
Date:   Wed, 27 Jan 2021 13:45:45 +0200
Message-ID: <1611747945-29960-4-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611747945-29960-1-git-send-email-claudiu.beznea@microchip.com>
References: <1611747945-29960-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix "Prefer 'unsigned int' to bare use of 'unsigned'" checkpatch.pl
warning.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>
---
 drivers/pinctrl/pinctrl-at91-pio4.c | 110 +++++++++++++++++++-----------------
 1 file changed, 57 insertions(+), 53 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
index f202cdb6dc3c..a5d328808e4c 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -80,8 +80,8 @@
  * @slew_rate_support: slew rate support
  */
 struct atmel_pioctrl_data {
-	unsigned nbanks;
-	unsigned last_bank_count;
+	unsigned int nbanks;
+	unsigned int last_bank_count;
 	unsigned int slew_rate_support;
 };
 
@@ -91,11 +91,11 @@ struct atmel_group {
 };
 
 struct atmel_pin {
-	unsigned pin_id;
-	unsigned mux;
-	unsigned ioset;
-	unsigned bank;
-	unsigned line;
+	unsigned int pin_id;
+	unsigned int mux;
+	unsigned int ioset;
+	unsigned int bank;
+	unsigned int line;
 	const char *device;
 };
 
@@ -125,16 +125,16 @@ struct atmel_pin {
 struct atmel_pioctrl {
 	void __iomem		*reg_base;
 	struct clk		*clk;
-	unsigned		nbanks;
+	unsigned int		nbanks;
 	struct pinctrl_dev	*pinctrl_dev;
 	struct atmel_group	*groups;
 	const char * const	*group_names;
 	struct atmel_pin	**pins;
-	unsigned		npins;
+	unsigned int		npins;
 	struct gpio_chip	*gpio_chip;
 	struct irq_domain	*irq_domain;
 	int			*irqs;
-	unsigned		*pm_wakeup_sources;
+	unsigned int		*pm_wakeup_sources;
 	struct {
 		u32		imr;
 		u32		odsr;
@@ -177,11 +177,11 @@ static void atmel_gpio_irq_ack(struct irq_data *d)
 	 */
 }
 
-static int atmel_gpio_irq_set_type(struct irq_data *d, unsigned type)
+static int atmel_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct atmel_pioctrl *atmel_pioctrl = irq_data_get_irq_chip_data(d);
 	struct atmel_pin *pin = atmel_pioctrl->pins[d->hwirq];
-	unsigned reg;
+	unsigned int reg;
 
 	atmel_gpio_write(atmel_pioctrl, pin->bank, ATMEL_PIO_MSKR,
 			 BIT(pin->line));
@@ -268,7 +268,7 @@ static struct irq_chip atmel_gpio_irq_chip = {
 	.irq_set_wake	= atmel_gpio_irq_set_wake,
 };
 
-static int atmel_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
+static int atmel_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 {
 	struct atmel_pioctrl *atmel_pioctrl = gpiochip_get_data(chip);
 
@@ -316,11 +316,12 @@ static void atmel_gpio_irq_handler(struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
-static int atmel_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+static int atmel_gpio_direction_input(struct gpio_chip *chip,
+				      unsigned int offset)
 {
 	struct atmel_pioctrl *atmel_pioctrl = gpiochip_get_data(chip);
 	struct atmel_pin *pin = atmel_pioctrl->pins[offset];
-	unsigned reg;
+	unsigned int reg;
 
 	atmel_gpio_write(atmel_pioctrl, pin->bank, ATMEL_PIO_MSKR,
 			 BIT(pin->line));
@@ -331,11 +332,11 @@ static int atmel_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
-static int atmel_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int atmel_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct atmel_pioctrl *atmel_pioctrl = gpiochip_get_data(chip);
 	struct atmel_pin *pin = atmel_pioctrl->pins[offset];
-	unsigned reg;
+	unsigned int reg;
 
 	reg = atmel_gpio_read(atmel_pioctrl, pin->bank, ATMEL_PIO_PDSR);
 
@@ -369,12 +370,13 @@ static int atmel_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask,
 	return 0;
 }
 
-static int atmel_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
+static int atmel_gpio_direction_output(struct gpio_chip *chip,
+				       unsigned int offset,
 				       int value)
 {
 	struct atmel_pioctrl *atmel_pioctrl = gpiochip_get_data(chip);
 	struct atmel_pin *pin = atmel_pioctrl->pins[offset];
-	unsigned reg;
+	unsigned int reg;
 
 	atmel_gpio_write(atmel_pioctrl, pin->bank,
 			 value ? ATMEL_PIO_SODR : ATMEL_PIO_CODR,
@@ -389,7 +391,7 @@ static int atmel_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 	return 0;
 }
 
-static void atmel_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
+static void atmel_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
 {
 	struct atmel_pioctrl *atmel_pioctrl = gpiochip_get_data(chip);
 	struct atmel_pin *pin = atmel_pioctrl->pins[offset];
@@ -445,11 +447,11 @@ static struct gpio_chip atmel_gpio_chip = {
 
 /* --- PINCTRL --- */
 static unsigned int atmel_pin_config_read(struct pinctrl_dev *pctldev,
-					  unsigned pin_id)
+					  unsigned int pin_id)
 {
 	struct atmel_pioctrl *atmel_pioctrl = pinctrl_dev_get_drvdata(pctldev);
-	unsigned bank = atmel_pioctrl->pins[pin_id]->bank;
-	unsigned line = atmel_pioctrl->pins[pin_id]->line;
+	unsigned int bank = atmel_pioctrl->pins[pin_id]->bank;
+	unsigned int line = atmel_pioctrl->pins[pin_id]->line;
 	void __iomem *addr = atmel_pioctrl->reg_base
 			     + bank * ATMEL_PIO_BANK_OFFSET;
 
@@ -461,11 +463,11 @@ static unsigned int atmel_pin_config_read(struct pinctrl_dev *pctldev,
 }
 
 static void atmel_pin_config_write(struct pinctrl_dev *pctldev,
-				   unsigned pin_id, u32 conf)
+				   unsigned int pin_id, u32 conf)
 {
 	struct atmel_pioctrl *atmel_pioctrl = pinctrl_dev_get_drvdata(pctldev);
-	unsigned bank = atmel_pioctrl->pins[pin_id]->bank;
-	unsigned line = atmel_pioctrl->pins[pin_id]->line;
+	unsigned int bank = atmel_pioctrl->pins[pin_id]->bank;
+	unsigned int line = atmel_pioctrl->pins[pin_id]->line;
 	void __iomem *addr = atmel_pioctrl->reg_base
 			     + bank * ATMEL_PIO_BANK_OFFSET;
 
@@ -483,7 +485,7 @@ static int atmel_pctl_get_groups_count(struct pinctrl_dev *pctldev)
 }
 
 static const char *atmel_pctl_get_group_name(struct pinctrl_dev *pctldev,
-					     unsigned selector)
+					     unsigned int selector)
 {
 	struct atmel_pioctrl *atmel_pioctrl = pinctrl_dev_get_drvdata(pctldev);
 
@@ -491,19 +493,20 @@ static const char *atmel_pctl_get_group_name(struct pinctrl_dev *pctldev,
 }
 
 static int atmel_pctl_get_group_pins(struct pinctrl_dev *pctldev,
-				     unsigned selector, const unsigned **pins,
-				     unsigned *num_pins)
+				     unsigned int selector,
+				     const unsigned int **pins,
+				     unsigned int *num_pins)
 {
 	struct atmel_pioctrl *atmel_pioctrl = pinctrl_dev_get_drvdata(pctldev);
 
-	*pins = (unsigned *)&atmel_pioctrl->groups[selector].pin;
+	*pins = (unsigned int *)&atmel_pioctrl->groups[selector].pin;
 	*num_pins = 1;
 
 	return 0;
 }
 
 static struct atmel_group *
-atmel_pctl_find_group_by_pin(struct pinctrl_dev *pctldev, unsigned pin)
+atmel_pctl_find_group_by_pin(struct pinctrl_dev *pctldev, unsigned int pin)
 {
 	struct atmel_pioctrl *atmel_pioctrl = pinctrl_dev_get_drvdata(pctldev);
 	int i;
@@ -524,7 +527,7 @@ static int atmel_pctl_xlate_pinfunc(struct pinctrl_dev *pctldev,
 				    const char **func_name)
 {
 	struct atmel_pioctrl *atmel_pioctrl = pinctrl_dev_get_drvdata(pctldev);
-	unsigned pin_id, func_id;
+	unsigned int pin_id, func_id;
 	struct atmel_group *grp;
 
 	pin_id = ATMEL_GET_PIN_NO(pinfunc);
@@ -554,10 +557,10 @@ static int atmel_pctl_xlate_pinfunc(struct pinctrl_dev *pctldev,
 static int atmel_pctl_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 					struct device_node *np,
 					struct pinctrl_map **map,
-					unsigned *reserved_maps,
-					unsigned *num_maps)
+					unsigned int *reserved_maps,
+					unsigned int *num_maps)
 {
-	unsigned num_pins, num_configs, reserve;
+	unsigned int num_pins, num_configs, reserve;
 	unsigned long *configs;
 	struct property	*pins;
 	u32 pinfunc;
@@ -628,10 +631,10 @@ static int atmel_pctl_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 static int atmel_pctl_dt_node_to_map(struct pinctrl_dev *pctldev,
 				     struct device_node *np_config,
 				     struct pinctrl_map **map,
-				     unsigned *num_maps)
+				     unsigned int *num_maps)
 {
 	struct device_node *np;
-	unsigned reserved_maps;
+	unsigned int reserved_maps;
 	int ret;
 
 	*map = NULL;
@@ -679,13 +682,13 @@ static int atmel_pmx_get_functions_count(struct pinctrl_dev *pctldev)
 }
 
 static const char *atmel_pmx_get_function_name(struct pinctrl_dev *pctldev,
-					       unsigned selector)
+					       unsigned int selector)
 {
 	return atmel_functions[selector];
 }
 
 static int atmel_pmx_get_function_groups(struct pinctrl_dev *pctldev,
-					 unsigned selector,
+					 unsigned int selector,
 					 const char * const **groups,
 					 unsigned * const num_groups)
 {
@@ -698,11 +701,11 @@ static int atmel_pmx_get_function_groups(struct pinctrl_dev *pctldev,
 }
 
 static int atmel_pmx_set_mux(struct pinctrl_dev *pctldev,
-			     unsigned function,
-			     unsigned group)
+			     unsigned int function,
+			     unsigned int group)
 {
 	struct atmel_pioctrl *atmel_pioctrl = pinctrl_dev_get_drvdata(pctldev);
-	unsigned pin;
+	unsigned int pin;
 	u32 conf;
 
 	dev_dbg(pctldev->dev, "enable function %s group %s\n",
@@ -726,13 +729,13 @@ static const struct pinmux_ops atmel_pmxops = {
 };
 
 static int atmel_conf_pin_config_group_get(struct pinctrl_dev *pctldev,
-					   unsigned group,
+					   unsigned int group,
 					   unsigned long *config)
 {
 	struct atmel_pioctrl *atmel_pioctrl = pinctrl_dev_get_drvdata(pctldev);
-	unsigned param = pinconf_to_config_param(*config), arg = 0;
+	unsigned int param = pinconf_to_config_param(*config), arg = 0;
 	struct atmel_group *grp = atmel_pioctrl->groups + group;
-	unsigned pin_id = grp->pin;
+	unsigned int pin_id = grp->pin;
 	u32 res;
 
 	res = atmel_pin_config_read(pctldev, pin_id);
@@ -786,21 +789,21 @@ static int atmel_conf_pin_config_group_get(struct pinctrl_dev *pctldev,
 }
 
 static int atmel_conf_pin_config_group_set(struct pinctrl_dev *pctldev,
-					   unsigned group,
+					   unsigned int group,
 					   unsigned long *configs,
-					   unsigned num_configs)
+					   unsigned int num_configs)
 {
 	struct atmel_pioctrl *atmel_pioctrl = pinctrl_dev_get_drvdata(pctldev);
 	struct atmel_group *grp = atmel_pioctrl->groups + group;
-	unsigned bank, pin, pin_id = grp->pin;
+	unsigned int bank, pin, pin_id = grp->pin;
 	u32 mask, conf = 0;
 	int i;
 
 	conf = atmel_pin_config_read(pctldev, pin_id);
 
 	for (i = 0; i < num_configs; i++) {
-		unsigned param = pinconf_to_config_param(configs[i]);
-		unsigned arg = pinconf_to_config_argument(configs[i]);
+		unsigned int param = pinconf_to_config_param(configs[i]);
+		unsigned int arg = pinconf_to_config_argument(configs[i]);
 
 		dev_dbg(pctldev->dev, "%s: pin=%u, config=0x%lx\n",
 			__func__, pin_id, configs[i]);
@@ -900,7 +903,8 @@ static int atmel_conf_pin_config_group_set(struct pinctrl_dev *pctldev,
 }
 
 static void atmel_conf_pin_config_dbg_show(struct pinctrl_dev *pctldev,
-					   struct seq_file *s, unsigned pin_id)
+					   struct seq_file *s,
+					   unsigned int pin_id)
 {
 	struct atmel_pioctrl *atmel_pioctrl = pinctrl_dev_get_drvdata(pctldev);
 	u32 conf;
@@ -1108,8 +1112,8 @@ static int atmel_pinctrl_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	for (i = 0 ; i < atmel_pioctrl->npins; i++) {
 		struct atmel_group *group = atmel_pioctrl->groups + i;
-		unsigned bank = ATMEL_PIO_BANK(i);
-		unsigned line = ATMEL_PIO_LINE(i);
+		unsigned int bank = ATMEL_PIO_BANK(i);
+		unsigned int line = ATMEL_PIO_LINE(i);
 
 		atmel_pioctrl->pins[i] = devm_kzalloc(dev,
 				sizeof(**atmel_pioctrl->pins), GFP_KERNEL);
-- 
2.7.4

