Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04B434D100B
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Mar 2022 07:19:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232412AbiCHGUi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Mar 2022 01:20:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235991AbiCHGUh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2022 01:20:37 -0500
Received: from mail-m17661.qiye.163.com (mail-m17661.qiye.163.com [59.111.176.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CDD5344DB
        for <linux-gpio@vger.kernel.org>; Mon,  7 Mar 2022 22:19:40 -0800 (PST)
Received: from localhost.localdomain (unknown [58.22.7.114])
        by mail-m17661.qiye.163.com (Hmail) with ESMTPA id 14D2A1DF6C3;
        Tue,  8 Mar 2022 14:19:39 +0800 (CST)
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     heiko@sntech.de
Cc:     linus.walleij@linaro.org, huangtao@rock-chips.com,
        kever.yang@rock-chips.com, linux-rockchip@lists.infradead.org,
        linux-gpio@vger.kernel.org, Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH 4/4] pinctrl: rockchip: register gpio driver before pinctrl driver
Date:   Tue,  8 Mar 2022 14:19:35 +0800
Message-Id: <20220308061935.2441447-5-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308061935.2441447-1-jay.xu@rock-chips.com>
References: <20220308061935.2441447-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
        kWDxoPAgseWUFZKDYvK1lXWShZQUlKS0tKN1dZLVlBSVdZDwkaFQgSH1lBWUNNH0lWQhlLSR5NQk
        5NH0NLVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktITUpVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NUk6TDo5Tj5RGTI0FhcDKxoi
        AUowCi5VSlVKTU9NTElLSExCTkhPVTMWGhIXVREaAlUDDjsJFBgQVhgTEgsIVRgUFkVZV1kSC1lB
        WU5DVUlJVUxVSkpPWVdZCAFZQUxOTk83Bg++
X-HM-Tid: 0a7f682ee96cda2bkuws14d2a1df6c3
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch should co-work with the gpio-rockchip driver patch, it
populates the gpio platform first and add gpio_chip after pinctrl
register.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 90 ++++++++++--------------------
 drivers/pinctrl/pinctrl-rockchip.h |  2 +-
 2 files changed, 29 insertions(+), 63 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index d8dd8415fa81..8e60811b4942 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -2095,30 +2095,13 @@ static bool rockchip_pinconf_pull_valid(struct rockchip_pin_ctrl *ctrl,
 	return false;
 }
 
-static int rockchip_pinconf_defer_output(struct rockchip_pin_bank *bank,
-					 unsigned int pin, u32 arg)
-{
-	struct rockchip_pin_output_deferred *cfg;
-
-	cfg = kzalloc(sizeof(*cfg), GFP_KERNEL);
-	if (!cfg)
-		return -ENOMEM;
-
-	cfg->pin = pin;
-	cfg->arg = arg;
-
-	list_add_tail(&cfg->head, &bank->deferred_output);
-
-	return 0;
-}
-
 /* set the pin config settings for a specified pin */
 static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 				unsigned long *configs, unsigned num_configs)
 {
 	struct rockchip_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
 	struct rockchip_pin_bank *bank = pin_to_bank(info, pin);
-	struct gpio_chip *gpio = &bank->gpio_chip;
+	struct gpio_chip *gpio = bank->gpio_chip;
 	enum pin_config_param param;
 	u32 arg;
 	int i;
@@ -2156,22 +2139,6 @@ static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			if (rc != RK_FUNC_GPIO)
 				return -EINVAL;
 
-			/*
-			 * Check for gpio driver not being probed yet.
-			 * The lock makes sure that either gpio-probe has completed
-			 * or the gpio driver hasn't probed yet.
-			 */
-			mutex_lock(&bank->deferred_lock);
-			if (!gpio || !gpio->direction_output) {
-				rc = rockchip_pinconf_defer_output(bank, pin - bank->pin_base, arg);
-				mutex_unlock(&bank->deferred_lock);
-				if (rc)
-					return rc;
-
-				break;
-			}
-			mutex_unlock(&bank->deferred_lock);
-
 			rc = gpio->direction_output(gpio, pin - bank->pin_base,
 						    arg);
 			if (rc)
@@ -2211,7 +2178,7 @@ static int rockchip_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 {
 	struct rockchip_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
 	struct rockchip_pin_bank *bank = pin_to_bank(info, pin);
-	struct gpio_chip *gpio = &bank->gpio_chip;
+	struct gpio_chip *gpio = bank->gpio_chip;
 	enum pin_config_param param = pinconf_to_config_param(*config);
 	u16 arg;
 	int rc;
@@ -2484,9 +2451,6 @@ static int rockchip_pinctrl_register(struct platform_device *pdev,
 			pdesc->name = pin_names[pin];
 			pdesc++;
 		}
-
-		INIT_LIST_HEAD(&pin_bank->deferred_output);
-		mutex_init(&pin_bank->deferred_lock);
 	}
 
 	ret = rockchip_pinctrl_parse_dt(pdev, info);
@@ -2525,7 +2489,6 @@ static struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
 	for (i = 0; i < ctrl->nr_banks; ++i, ++bank) {
 		int bank_pins = 0;
 
-		raw_spin_lock_init(&bank->slock);
 		bank->drvdata = d;
 		bank->pin_base = ctrl->nr_pins;
 		ctrl->nr_pins += bank->nr_pins;
@@ -2666,6 +2629,13 @@ static int __maybe_unused rockchip_pinctrl_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(rockchip_pinctrl_dev_pm_ops, rockchip_pinctrl_suspend,
 			 rockchip_pinctrl_resume);
 
+static int gpiochip_match_name(struct gpio_chip *gc, void *data)
+{
+	const char *name = data;
+
+	return !strcmp(gc->label, name);
+}
+
 static int rockchip_pinctrl_probe(struct platform_device *pdev)
 {
 	struct rockchip_pinctrl *info;
@@ -2674,7 +2644,7 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 	struct rockchip_pin_ctrl *ctrl;
 	struct resource *res;
 	void __iomem *base;
-	int ret;
+	int ret, i;
 
 	if (!dev->of_node)
 		return dev_err_probe(dev, -ENODEV, "device tree node not found\n");
@@ -2683,6 +2653,10 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 	if (!info)
 		return -ENOMEM;
 
+	ret = of_platform_populate(np, NULL, NULL, NULL);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register gpio device\n");
+
 	info->dev = dev;
 
 	ctrl = rockchip_pinctrl_get_soc_data(info, pdev);
@@ -2733,37 +2707,29 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	platform_set_drvdata(pdev, info);
+	for (i = 0; i < ctrl->nr_banks; i++) {
+		struct gpio_chip *gc;
+		struct rockchip_pin_bank *bank = &ctrl->pin_banks[i];
 
-	ret = of_platform_populate(np, NULL, NULL, &pdev->dev);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to register gpio device\n");
+		gc = gpiochip_find((void *)ctrl->pin_banks[i].name, gpiochip_match_name);
+		ret = gpiochip_add_pin_range(gc, dev_name(dev), 0, gc->base, gc->ngpio);
+		if (ret) {
+			dev_err(dev, "fail to add pin range\n");
+			return ret;
+		}
+		bank->gpio_chip = gc;
+	}
+
+	platform_set_drvdata(pdev, info);
+	dev_info(dev, "probed %s\n", dev_name(dev));
 
 	return 0;
 }
 
 static int rockchip_pinctrl_remove(struct platform_device *pdev)
 {
-	struct rockchip_pinctrl *info = platform_get_drvdata(pdev);
-	struct rockchip_pin_bank *bank;
-	struct rockchip_pin_output_deferred *cfg;
-	int i;
-
 	of_platform_depopulate(&pdev->dev);
 
-	for (i = 0; i < info->ctrl->nr_banks; i++) {
-		bank = &info->ctrl->pin_banks[i];
-
-		mutex_lock(&bank->deferred_lock);
-		while (!list_empty(&bank->deferred_output)) {
-			cfg = list_first_entry(&bank->deferred_output,
-					       struct rockchip_pin_output_deferred, head);
-			list_del(&cfg->head);
-			kfree(cfg);
-		}
-		mutex_unlock(&bank->deferred_lock);
-	}
-
 	return 0;
 }
 
diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
index 91f10279d084..b109750ac294 100644
--- a/drivers/pinctrl/pinctrl-rockchip.h
+++ b/drivers/pinctrl/pinctrl-rockchip.h
@@ -163,7 +163,7 @@ struct rockchip_pin_bank {
 	struct device_node		*of_node;
 	struct rockchip_pinctrl		*drvdata;
 	struct irq_domain		*domain;
-	struct gpio_chip		gpio_chip;
+	struct gpio_chip		*gpio_chip;
 	struct pinctrl_gpio_range	grange;
 	raw_spinlock_t			slock;
 	const struct rockchip_gpio_regs	*gpio_regs;
-- 
2.25.1

