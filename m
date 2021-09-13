Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC4C940A108
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Sep 2021 00:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350014AbhIMWxe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Sep 2021 18:53:34 -0400
Received: from gloria.sntech.de ([185.11.138.130]:51178 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349681AbhIMWvB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 Sep 2021 18:51:01 -0400
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146] helo=localhost.localdomain)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1mPulW-0003SX-Uz; Tue, 14 Sep 2021 00:49:31 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     heiko@sntech.de, jay.xu@rock-chips.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] gpio/rockchip: fetch deferred output settings on probe
Date:   Tue, 14 Sep 2021 00:49:26 +0200
Message-Id: <20210913224926.1260726-5-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210913224926.1260726-1-heiko@sntech.de>
References: <20210913224926.1260726-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fetch the output settings the pinctrl driver may have created
for pinctrl hogs and set the relevant pins as requested.

Fixes: 9ce9a02039de ("pinctrl/rockchip: drop the gpio related codes")
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/gpio/gpio-rockchip.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 3335bd57761d..cf1b465db8c3 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -689,6 +689,7 @@ static int rockchip_gpio_probe(struct platform_device *pdev)
 	struct device_node *pctlnp = of_get_parent(np);
 	struct pinctrl_dev *pctldev = NULL;
 	struct rockchip_pin_bank *bank = NULL;
+	struct rockchip_pin_output_deferred *cfg;
 	static int gpio;
 	int id, ret;
 
@@ -716,12 +717,33 @@ static int rockchip_gpio_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/*
+	 * Prevent clashes with a deferred output setting
+	 * being added right at this moment.
+	 */
+	mutex_lock(&bank->deferred_lock);
+
 	ret = rockchip_gpiolib_register(bank);
 	if (ret) {
 		clk_disable_unprepare(bank->clk);
+		mutex_unlock(&bank->deferred_lock);
 		return ret;
 	}
 
+	while (!list_empty(&bank->deferred_output)) {
+		cfg = list_first_entry(&bank->deferred_output,
+				       struct rockchip_pin_output_deferred, head);
+		list_del(&cfg->head);
+
+		ret = rockchip_gpio_direction_output(&bank->gpio_chip, cfg->pin, cfg->arg);
+		if (ret)
+			dev_warn(dev, "setting output pin %u to %u failed\n", cfg->pin, cfg->arg);
+
+		kfree(cfg);
+	}
+
+	mutex_unlock(&bank->deferred_lock);
+
 	platform_set_drvdata(pdev, bank);
 	dev_info(dev, "probed %pOF\n", np);
 
-- 
2.29.2

