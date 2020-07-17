Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8F782230E2
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 03:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgGQB4F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 21:56:05 -0400
Received: from lucky1.263xmail.com ([211.157.147.132]:37750 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbgGQB4F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 21:56:05 -0400
Received: from localhost (unknown [192.168.167.13])
        by lucky1.263xmail.com (Postfix) with ESMTP id 0E216EC17D;
        Fri, 17 Jul 2020 09:49:13 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P17843T139819799787264S1594950550837667_;
        Fri, 17 Jul 2020 09:49:13 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <062f2b5b04c8ad80b024e0c8c0ac27d2>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: heiko@sntech.de
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     heiko@sntech.de, linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, kever.yang@rock-chips.com,
        david.wu@rock-chips.com, Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH 02/13] pinctrl: rockchip: modify rockchip_pin_ctrl to const struct
Date:   Fri, 17 Jul 2020 09:48:57 +0800
Message-Id: <20200717014908.13914-3-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200717014908.13914-1-jay.xu@rock-chips.com>
References: <20200717014908.13914-1-jay.xu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The rockchip_pin_ctrl structure actually is soc data structure for
pinctrl on Rockchip SoCs.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 62 +++++++++++++++---------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index bc465da68f26..77c1e6744f6c 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -392,7 +392,7 @@ struct rockchip_pinctrl {
 	struct regmap			*regmap_pull;
 	struct regmap			*regmap_pmu;
 	struct device			*dev;
-	struct rockchip_pin_ctrl	*ctrl;
+	const struct rockchip_pin_ctrl	*ctrl;
 	struct pinctrl_desc		pctl;
 	struct pinctrl_dev		*pctl_dev;
 	struct rockchip_pin_group	*groups;
@@ -779,7 +779,7 @@ static void rockchip_get_recalced_mux(struct rockchip_pin_bank *bank, int pin,
 				      int *reg, u8 *bit, int *mask)
 {
 	struct rockchip_pinctrl *info = bank->drvdata;
-	struct rockchip_pin_ctrl *ctrl = info->ctrl;
+	const struct rockchip_pin_ctrl *ctrl = info->ctrl;
 	struct rockchip_mux_recalced_data *data;
 	int i;
 
@@ -1396,7 +1396,7 @@ static bool rockchip_get_mux_route(struct rockchip_pin_bank *bank, int pin,
 				   int mux, u32 *loc, u32 *reg, u32 *value)
 {
 	struct rockchip_pinctrl *info = bank->drvdata;
-	struct rockchip_pin_ctrl *ctrl = info->ctrl;
+	const struct rockchip_pin_ctrl *ctrl = info->ctrl;
 	struct rockchip_mux_route_data *data;
 	int i;
 
@@ -2112,7 +2112,7 @@ static int rockchip_get_drive_perpin(struct rockchip_pin_bank *bank,
 				     int pin_num)
 {
 	struct rockchip_pinctrl *info = bank->drvdata;
-	struct rockchip_pin_ctrl *ctrl = info->ctrl;
+	const struct rockchip_pin_ctrl *ctrl = info->ctrl;
 	struct regmap *regmap;
 	int reg, ret;
 	u32 data, temp, rmask_bits;
@@ -2189,7 +2189,7 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 				     int pin_num, int strength)
 {
 	struct rockchip_pinctrl *info = bank->drvdata;
-	struct rockchip_pin_ctrl *ctrl = info->ctrl;
+	const struct rockchip_pin_ctrl *ctrl = info->ctrl;
 	struct regmap *regmap;
 	int reg, ret, i;
 	u32 data, rmask, rmask_bits, temp;
@@ -2297,7 +2297,7 @@ static int rockchip_pull_list[PULL_TYPE_MAX][4] = {
 static int rockchip_get_pull(struct rockchip_pin_bank *bank, int pin_num)
 {
 	struct rockchip_pinctrl *info = bank->drvdata;
-	struct rockchip_pin_ctrl *ctrl = info->ctrl;
+	const struct rockchip_pin_ctrl *ctrl = info->ctrl;
 	struct regmap *regmap;
 	int reg, ret, pull_type;
 	u8 bit;
@@ -2341,7 +2341,7 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 					int pin_num, int pull)
 {
 	struct rockchip_pinctrl *info = bank->drvdata;
-	struct rockchip_pin_ctrl *ctrl = info->ctrl;
+	const struct rockchip_pin_ctrl *ctrl = info->ctrl;
 	struct regmap *regmap;
 	int reg, ret, i, pull_type;
 	u8 bit;
@@ -2427,7 +2427,7 @@ static int rk3328_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
 static int rockchip_get_schmitt(struct rockchip_pin_bank *bank, int pin_num)
 {
 	struct rockchip_pinctrl *info = bank->drvdata;
-	struct rockchip_pin_ctrl *ctrl = info->ctrl;
+	const struct rockchip_pin_ctrl *ctrl = info->ctrl;
 	struct regmap *regmap;
 	int reg, ret;
 	u8 bit;
@@ -2449,7 +2449,7 @@ static int rockchip_set_schmitt(struct rockchip_pin_bank *bank,
 				int pin_num, int enable)
 {
 	struct rockchip_pinctrl *info = bank->drvdata;
-	struct rockchip_pin_ctrl *ctrl = info->ctrl;
+	const struct rockchip_pin_ctrl *ctrl = info->ctrl;
 	struct regmap *regmap;
 	int reg, ret;
 	u8 bit;
@@ -2621,7 +2621,7 @@ static const struct pinmux_ops rockchip_pmx_ops = {
  * Pinconf_ops handling
  */
 
-static bool rockchip_pinconf_pull_valid(struct rockchip_pin_ctrl *ctrl,
+static bool rockchip_pinconf_pull_valid(const struct rockchip_pin_ctrl *ctrl,
 					enum pin_config_param pull)
 {
 	switch (ctrl->type) {
@@ -3366,7 +3366,7 @@ static void rockchip_irq_disable(struct irq_data *d)
 static int rockchip_interrupts_register(struct platform_device *pdev,
 						struct rockchip_pinctrl *info)
 {
-	struct rockchip_pin_ctrl *ctrl = info->ctrl;
+	const struct rockchip_pin_ctrl *ctrl = info->ctrl;
 	struct rockchip_pin_bank *bank = ctrl->pin_banks;
 	unsigned int clr = IRQ_NOREQUEST | IRQ_NOPROBE | IRQ_NOAUTOEN;
 	struct irq_chip_generic *gc;
@@ -3447,7 +3447,7 @@ static int rockchip_interrupts_register(struct platform_device *pdev,
 static int rockchip_gpiolib_register(struct platform_device *pdev,
 						struct rockchip_pinctrl *info)
 {
-	struct rockchip_pin_ctrl *ctrl = info->ctrl;
+	const struct rockchip_pin_ctrl *ctrl = info->ctrl;
 	struct rockchip_pin_bank *bank = ctrl->pin_banks;
 	struct gpio_chip *gc;
 	int ret;
@@ -3493,7 +3493,7 @@ static int rockchip_gpiolib_register(struct platform_device *pdev,
 static int rockchip_gpiolib_unregister(struct platform_device *pdev,
 						struct rockchip_pinctrl *info)
 {
-	struct rockchip_pin_ctrl *ctrl = info->ctrl;
+	const struct rockchip_pin_ctrl *ctrl = info->ctrl;
 	struct rockchip_pin_bank *bank = ctrl->pin_banks;
 	int i;
 
@@ -3563,20 +3563,20 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank,
 static const struct of_device_id rockchip_pinctrl_dt_match[];
 
 /* retrieve the soc specific data */
-static struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
+static const struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
 						struct rockchip_pinctrl *d,
 						struct platform_device *pdev)
 {
 	const struct of_device_id *match;
 	struct device_node *node = pdev->dev.of_node;
 	struct device_node *np;
-	struct rockchip_pin_ctrl *ctrl;
+	const const struct rockchip_pin_ctrl *ctrl;
 	struct rockchip_pin_bank *bank;
 	int grf_offs, pmu_offs, drv_grf_offs, drv_pmu_offs, i, j;
 	u32 nr_pins;
 
 	match = of_match_node(rockchip_pinctrl_dt_match, node);
-	ctrl = (struct rockchip_pin_ctrl *)match->data;
+	ctrl = (const struct rockchip_pin_ctrl *)match->data;
 
 	for_each_child_of_node(node, np) {
 		if (!of_find_property(np, "gpio-controller", NULL))
@@ -3748,7 +3748,7 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 {
 	struct rockchip_pinctrl *info;
 	struct device *dev = &pdev->dev;
-	struct rockchip_pin_ctrl *ctrl;
+	const const struct rockchip_pin_ctrl *ctrl;
 	struct device_node *np = pdev->dev.of_node, *node;
 	struct resource *res;
 	void __iomem *base;
@@ -3853,7 +3853,7 @@ static struct rockchip_pin_bank px30_pin_banks[] = {
 			    ),
 };
 
-static struct rockchip_pin_ctrl px30_pin_ctrl = {
+static const struct rockchip_pin_ctrl px30_pin_ctrl = {
 		.pin_banks		= px30_pin_banks,
 		.nr_banks		= ARRAY_SIZE(px30_pin_banks),
 		.nr_pins		= 128,
@@ -3878,7 +3878,7 @@ static struct rockchip_pin_bank rv1108_pin_banks[] = {
 	PIN_BANK_IOMUX_FLAGS(3, 32, "gpio3", 0, 0, 0, 0),
 };
 
-static struct rockchip_pin_ctrl rv1108_pin_ctrl = {
+static const struct rockchip_pin_ctrl rv1108_pin_ctrl = {
 	.pin_banks		= rv1108_pin_banks,
 	.nr_banks		= ARRAY_SIZE(rv1108_pin_banks),
 	.nr_pins		= 128,
@@ -3900,7 +3900,7 @@ static struct rockchip_pin_bank rk2928_pin_banks[] = {
 	PIN_BANK(3, 32, "gpio3"),
 };
 
-static struct rockchip_pin_ctrl rk2928_pin_ctrl = {
+static const struct rockchip_pin_ctrl rk2928_pin_ctrl = {
 		.pin_banks		= rk2928_pin_banks,
 		.nr_banks		= ARRAY_SIZE(rk2928_pin_banks),
 		.nr_pins		= 128,
@@ -3916,7 +3916,7 @@ static struct rockchip_pin_bank rk3036_pin_banks[] = {
 	PIN_BANK(2, 32, "gpio2"),
 };
 
-static struct rockchip_pin_ctrl rk3036_pin_ctrl = {
+static const struct rockchip_pin_ctrl rk3036_pin_ctrl = {
 		.pin_banks		= rk3036_pin_banks,
 		.nr_banks		= ARRAY_SIZE(rk3036_pin_banks),
 		.nr_pins		= 96,
@@ -3935,7 +3935,7 @@ static struct rockchip_pin_bank rk3066a_pin_banks[] = {
 	PIN_BANK(6, 16, "gpio6"),
 };
 
-static struct rockchip_pin_ctrl rk3066a_pin_ctrl = {
+static const struct rockchip_pin_ctrl rk3066a_pin_ctrl = {
 		.pin_banks		= rk3066a_pin_banks,
 		.nr_banks		= ARRAY_SIZE(rk3066a_pin_banks),
 		.nr_pins		= 176,
@@ -3952,7 +3952,7 @@ static struct rockchip_pin_bank rk3066b_pin_banks[] = {
 	PIN_BANK(3, 32, "gpio3"),
 };
 
-static struct rockchip_pin_ctrl rk3066b_pin_ctrl = {
+static const struct rockchip_pin_ctrl rk3066b_pin_ctrl = {
 		.pin_banks	= rk3066b_pin_banks,
 		.nr_banks	= ARRAY_SIZE(rk3066b_pin_banks),
 		.nr_pins	= 128,
@@ -3968,7 +3968,7 @@ static struct rockchip_pin_bank rk3128_pin_banks[] = {
 	PIN_BANK(3, 32, "gpio3"),
 };
 
-static struct rockchip_pin_ctrl rk3128_pin_ctrl = {
+static const struct rockchip_pin_ctrl rk3128_pin_ctrl = {
 		.pin_banks		= rk3128_pin_banks,
 		.nr_banks		= ARRAY_SIZE(rk3128_pin_banks),
 		.nr_pins		= 128,
@@ -3989,7 +3989,7 @@ static struct rockchip_pin_bank rk3188_pin_banks[] = {
 	PIN_BANK(3, 32, "gpio3"),
 };
 
-static struct rockchip_pin_ctrl rk3188_pin_ctrl = {
+static const struct rockchip_pin_ctrl rk3188_pin_ctrl = {
 		.pin_banks		= rk3188_pin_banks,
 		.nr_banks		= ARRAY_SIZE(rk3188_pin_banks),
 		.nr_pins		= 128,
@@ -4008,7 +4008,7 @@ static struct rockchip_pin_bank rk3228_pin_banks[] = {
 	PIN_BANK(3, 32, "gpio3"),
 };
 
-static struct rockchip_pin_ctrl rk3228_pin_ctrl = {
+static const struct rockchip_pin_ctrl rk3228_pin_ctrl = {
 		.pin_banks		= rk3228_pin_banks,
 		.nr_banks		= ARRAY_SIZE(rk3228_pin_banks),
 		.nr_pins		= 128,
@@ -4053,7 +4053,7 @@ static struct rockchip_pin_bank rk3288_pin_banks[] = {
 	PIN_BANK(8, 16, "gpio8"),
 };
 
-static struct rockchip_pin_ctrl rk3288_pin_ctrl = {
+static const struct rockchip_pin_ctrl rk3288_pin_ctrl = {
 		.pin_banks		= rk3288_pin_banks,
 		.nr_banks		= ARRAY_SIZE(rk3288_pin_banks),
 		.nr_pins		= 264,
@@ -4090,7 +4090,7 @@ static struct rockchip_pin_bank rk3308_pin_banks[] = {
 					     IOMUX_WIDTH_2BIT),
 };
 
-static struct rockchip_pin_ctrl rk3308_pin_ctrl = {
+static const struct rockchip_pin_ctrl rk3308_pin_ctrl = {
 		.pin_banks		= rk3308_pin_banks,
 		.nr_banks		= ARRAY_SIZE(rk3308_pin_banks),
 		.nr_pins		= 160,
@@ -4120,7 +4120,7 @@ static struct rockchip_pin_bank rk3328_pin_banks[] = {
 			     0),
 };
 
-static struct rockchip_pin_ctrl rk3328_pin_ctrl = {
+static const struct rockchip_pin_ctrl rk3328_pin_ctrl = {
 		.pin_banks		= rk3328_pin_banks,
 		.nr_banks		= ARRAY_SIZE(rk3328_pin_banks),
 		.nr_pins		= 128,
@@ -4147,7 +4147,7 @@ static struct rockchip_pin_bank rk3368_pin_banks[] = {
 	PIN_BANK(3, 32, "gpio3"),
 };
 
-static struct rockchip_pin_ctrl rk3368_pin_ctrl = {
+static const struct rockchip_pin_ctrl rk3368_pin_ctrl = {
 		.pin_banks		= rk3368_pin_banks,
 		.nr_banks		= ARRAY_SIZE(rk3368_pin_banks),
 		.nr_pins		= 128,
@@ -4212,7 +4212,7 @@ static struct rockchip_pin_bank rk3399_pin_banks[] = {
 			   ),
 };
 
-static struct rockchip_pin_ctrl rk3399_pin_ctrl = {
+static const struct rockchip_pin_ctrl rk3399_pin_ctrl = {
 		.pin_banks		= rk3399_pin_banks,
 		.nr_banks		= ARRAY_SIZE(rk3399_pin_banks),
 		.nr_pins		= 160,
-- 
2.17.1



