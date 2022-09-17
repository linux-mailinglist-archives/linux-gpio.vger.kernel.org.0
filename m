Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FA7B5BB69B
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Sep 2022 08:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbiIQGJh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 17 Sep 2022 02:09:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiIQGJf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 17 Sep 2022 02:09:35 -0400
Received: from mail-m11873.qiye.163.com (mail-m11873.qiye.163.com [115.236.118.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43DBED92
        for <linux-gpio@vger.kernel.org>; Fri, 16 Sep 2022 23:09:33 -0700 (PDT)
Received: from localhost.localdomain (unknown [58.22.7.114])
        by mail-m11873.qiye.163.com (Hmail) with ESMTPA id 33B4C900346;
        Sat, 17 Sep 2022 14:09:31 +0800 (CST)
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     jbx6244@gmail.com, heiko@sntech.de, linus.walleij@linaro.org,
        andriy.shevchenko@linux.intel.com
Cc:     brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH v2 1/2] pinctrl: rockchip: find gpiochip by name from gpio module
Date:   Sat, 17 Sep 2022 14:09:28 +0800
Message-Id: <20220917060929.657778-2-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220917060929.657778-1-jay.xu@rock-chips.com>
References: <20220917060929.657778-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
        tZV1koWUFJSktLSjdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTxhPVkoeTk1DGE5PSEsYHlUTARMWGhIXJB
        QOD1lXWRgSC1lBWU5DVUlJVUxVSkpPWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVSktLVUtZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Njo6Fhw*FT0jCBpJCQlCET4a
        OB0wCzVVSlVKTU1ISEJPQkxKTE5CVTMWGhIXVREaAlUDDjsJFBgQVhgTEgsIVRgUFkVZV1kSC1lB
        WU5DVUlJVUxVSkpPWVdZCAFZQU5ITU83Bg++
X-HM-Tid: 0a834a10fefe2eafkusn33b4c900346
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently the pinctrl device acts as parent for the gpio devices for
rockchip platform, the pinctrl driver probes first and then populate the
gpio platform lastly.

This patch makes the pinctrl to populate gpio platform firstly and then
do probe after gpio probed successfully. And get gpiochips througth a
find function by the gpio label.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
v2 RESEND:
- first version RESEND

 drivers/pinctrl/pinctrl-rockchip.c | 48 +++++++++++++++++++++++-------
 drivers/pinctrl/pinctrl-rockchip.h |  2 +-
 2 files changed, 38 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index a91061f9c2ac..5b828798bfa5 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -2726,7 +2726,7 @@ static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 {
 	struct rockchip_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
 	struct rockchip_pin_bank *bank = pin_to_bank(info, pin);
-	struct gpio_chip *gpio = &bank->gpio_chip;
+	struct gpio_chip *gpio = bank->gpio_chip;
 	enum pin_config_param param;
 	u32 arg;
 	int i;
@@ -2832,7 +2832,7 @@ static int rockchip_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 {
 	struct rockchip_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
 	struct rockchip_pin_bank *bank = pin_to_bank(info, pin);
-	struct gpio_chip *gpio = &bank->gpio_chip;
+	struct gpio_chip *gpio = bank->gpio_chip;
 	enum pin_config_param param = pinconf_to_config_param(*config);
 	u16 arg;
 	int rc;
@@ -3289,18 +3289,29 @@ static int __maybe_unused rockchip_pinctrl_resume(struct device *dev)
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
-	struct rockchip_pinctrl *info;
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node, *node;
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
+	struct rockchip_pinctrl *info;
 	struct rockchip_pin_ctrl *ctrl;
+	struct device_node *np, *node;
 	struct resource *res;
 	void __iomem *base;
-	int ret;
+	int ret, i;
 
-	if (!dev->of_node)
-		return dev_err_probe(dev, -ENODEV, "device tree node not found\n");
+	if (is_of_node(fwnode)) {
+		ret = of_platform_populate(np, NULL, NULL, NULL);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to register gpio device\n");
+	}
 
 	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
 	if (!info)
@@ -3358,11 +3369,26 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
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
+		if (!gc) {
+			dev_err(dev, "fail to find gpiochip\n");
+			return ret;
+		}
+
+		ret = gpiochip_add_pin_range(gc, dev_name(dev), 0, gc->base, gc->ngpio);
+		if (ret) {
+			dev_err(dev, "fail to add pin range\n");
+			return ret;
+		}
+		bank->gpio_chip = gc;
+	}
+
+	platform_set_drvdata(pdev, info);
+	dev_info(dev, "probed %pfw\n", fwnode);
 
 	return 0;
 }
diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
index 4759f336941e..2be12e76b2c4 100644
--- a/drivers/pinctrl/pinctrl-rockchip.h
+++ b/drivers/pinctrl/pinctrl-rockchip.h
@@ -330,7 +330,7 @@ struct rockchip_pin_bank {
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

