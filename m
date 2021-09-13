Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20A1740A10E
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Sep 2021 00:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349923AbhIMWx3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Sep 2021 18:53:29 -0400
Received: from gloria.sntech.de ([185.11.138.130]:51182 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349677AbhIMWvB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 Sep 2021 18:51:01 -0400
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146] helo=localhost.localdomain)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1mPulW-0003SX-LR; Tue, 14 Sep 2021 00:49:30 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     heiko@sntech.de, jay.xu@rock-chips.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] pinctrl/rockchip: add a queue for deferred pin output settings on probe
Date:   Tue, 14 Sep 2021 00:49:25 +0200
Message-Id: <20210913224926.1260726-4-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210913224926.1260726-1-heiko@sntech.de>
References: <20210913224926.1260726-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The separation of pinctrl and gpio drivers created a tiny window where
a pinconfig setting might produce a null-pointer dereference.

The affected device were rk3288-veyron devices in this case.

Pinctrl-hogs are claimed when the pinctrl driver is registered,
at which point their pinconfig settings will be applied.
At this time the now separate gpio devices will not have been created
yet and the matching driver won't have probed yet, making the gpio->foo()
call run into a null-ptr.

As probing is not really guaranteed to have been completed at a specific
time, introduce a queue that can hold the output settings until the gpio
driver has probed and will (in a separate patch) fetch the elements
of the list.

We expect the gpio driver to empty the list, but will nevertheless empty
it ourself on remove if that didn't happen.

Fixes: 9ce9a02039de ("pinctrl/rockchip: drop the gpio related codes")
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/pinctrl/pinctrl-rockchip.c | 67 ++++++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-rockchip.h | 10 +++++
 2 files changed, 77 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index ae33e376695f..5ce260f152ce 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -2092,6 +2092,23 @@ static bool rockchip_pinconf_pull_valid(struct rockchip_pin_ctrl *ctrl,
 	return false;
 }
 
+static int rockchip_pinconf_defer_output(struct rockchip_pin_bank *bank,
+					 unsigned int pin, u32 arg)
+{
+	struct rockchip_pin_output_deferred *cfg;
+
+	cfg = kzalloc(sizeof(*cfg), GFP_KERNEL);
+	if (!cfg)
+		return -ENOMEM;
+
+	cfg->pin = pin;
+	cfg->arg = arg;
+
+	list_add_tail(&cfg->head, &bank->deferred_output);
+
+	return 0;
+}
+
 /* set the pin config settings for a specified pin */
 static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 				unsigned long *configs, unsigned num_configs)
@@ -2136,6 +2153,22 @@ static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			if (rc != RK_FUNC_GPIO)
 				return -EINVAL;
 
+			/*
+			 * Check for gpio driver not being probed yet.
+			 * The lock makes sure that either gpio-probe has completed
+			 * or the gpio driver hasn't probed yet.
+			 */
+			mutex_lock(&bank->deferred_lock);
+			if (!gpio || !gpio->direction_output) {
+				rc = rockchip_pinconf_defer_output(bank, pin - bank->pin_base, arg);
+				mutex_unlock(&bank->deferred_lock);
+				if (rc)
+					return rc;
+
+				break;
+			}
+			mutex_unlock(&bank->deferred_lock);
+
 			rc = gpio->direction_output(gpio, pin - bank->pin_base,
 						    arg);
 			if (rc)
@@ -2204,6 +2237,11 @@ static int rockchip_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 		if (rc != RK_FUNC_GPIO)
 			return -EINVAL;
 
+		if (!gpio || !gpio->get) {
+			arg = 0;
+			break;
+		}
+
 		rc = gpio->get(gpio, pin - bank->pin_base);
 		if (rc < 0)
 			return rc;
@@ -2450,6 +2488,9 @@ static int rockchip_pinctrl_register(struct platform_device *pdev,
 						pin_bank->name, pin);
 			pdesc++;
 		}
+
+		INIT_LIST_HEAD(&pin_bank->deferred_output);
+		mutex_init(&pin_bank->deferred_lock);
 	}
 
 	ret = rockchip_pinctrl_parse_dt(pdev, info);
@@ -2716,6 +2757,31 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static int rockchip_pinctrl_remove(struct platform_device *pdev)
+{
+	struct rockchip_pinctrl *info = platform_get_drvdata(pdev);
+	struct rockchip_pin_bank *bank;
+	struct rockchip_pin_output_deferred *cfg;
+	int i;
+
+	of_platform_depopulate(&pdev->dev);
+
+	for (i = 0; i < info->ctrl->nr_banks; i++) {
+		bank = &info->ctrl->pin_banks[i];
+
+		mutex_lock(&bank->deferred_lock);
+		while (!list_empty(&bank->deferred_output)) {
+			cfg = list_first_entry(&bank->deferred_output,
+					       struct rockchip_pin_output_deferred, head);
+			list_del(&cfg->head);
+			kfree(cfg);
+		}
+		mutex_unlock(&bank->deferred_lock);
+	}
+
+	return 0;
+}
+
 static struct rockchip_pin_bank px30_pin_banks[] = {
 	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", IOMUX_SOURCE_PMU,
 					     IOMUX_SOURCE_PMU,
@@ -3175,6 +3241,7 @@ static const struct of_device_id rockchip_pinctrl_dt_match[] = {
 
 static struct platform_driver rockchip_pinctrl_driver = {
 	.probe		= rockchip_pinctrl_probe,
+	.remove		= rockchip_pinctrl_remove,
 	.driver = {
 		.name	= "rockchip-pinctrl",
 		.pm = &rockchip_pinctrl_dev_pm_ops,
diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
index 589d4d2a98c9..91f10279d084 100644
--- a/drivers/pinctrl/pinctrl-rockchip.h
+++ b/drivers/pinctrl/pinctrl-rockchip.h
@@ -141,6 +141,8 @@ struct rockchip_drv {
  * @toggle_edge_mode: bit mask to toggle (falling/rising) edge mode
  * @recalced_mask: bit mask to indicate a need to recalulate the mask
  * @route_mask: bits describing the routing pins of per bank
+ * @deferred_output: gpio output settings to be done after gpio bank probed
+ * @deferred_lock: mutex for the deferred_output shared btw gpio and pinctrl
  */
 struct rockchip_pin_bank {
 	struct device			*dev;
@@ -169,6 +171,8 @@ struct rockchip_pin_bank {
 	u32				toggle_edge_mode;
 	u32				recalced_mask;
 	u32				route_mask;
+	struct list_head		deferred_output;
+	struct mutex			deferred_lock;
 };
 
 /**
@@ -243,6 +247,12 @@ struct rockchip_pin_config {
 	unsigned int		nconfigs;
 };
 
+struct rockchip_pin_output_deferred {
+	struct list_head head;
+	unsigned int pin;
+	u32 arg;
+};
+
 /**
  * struct rockchip_pin_group: represent group of pins of a pinmux function.
  * @name: name of the pin group, used to lookup the group.
-- 
2.29.2

