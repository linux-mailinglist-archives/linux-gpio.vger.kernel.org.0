Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2381C26822E
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 02:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725983AbgINAi6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Sep 2020 20:38:58 -0400
Received: from lucky1.263xmail.com ([211.157.147.130]:41184 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbgINAiz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Sep 2020 20:38:55 -0400
Received: from localhost (unknown [192.168.167.16])
        by lucky1.263xmail.com (Postfix) with ESMTP id 800AFCC3AE;
        Mon, 14 Sep 2020 08:38:51 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P23637T140494925444864S1600043930497733_;
        Mon, 14 Sep 2020 08:38:51 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <de5c6ad02f6aa7c49a146817455a2579>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: linus.walleij@linaro.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     linus.walleij@linaro.org, heiko@sntech.de
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH 2/2] pinctrl: rockchip: make driver be tristate module
Date:   Mon, 14 Sep 2020 08:38:47 +0800
Message-Id: <20200914003847.10341-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200907025927.9713-3-jay.xu@rock-chips.com>
References: <20200907025927.9713-3-jay.xu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make pinctrl-rockchip driver to be tristate module, support to build as
a module, this is useful for GKI.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/pinctrl/Kconfig            |  2 +-
 drivers/pinctrl/pinctrl-rockchip.c | 13 +++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 4284f39a5c61..743eb2bb8709 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -207,7 +207,7 @@ config PINCTRL_OXNAS
 	select MFD_SYSCON
 
 config PINCTRL_ROCKCHIP
-	bool
+	tristate "Rockchip gpio and pinctrl driver"
 	depends on OF
 	select PINMUX
 	select GENERIC_PINCONF
diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 0401c1da79dd..927d132d6716 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -16,10 +16,12 @@
  */
 
 #include <linux/init.h>
+#include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/bitops.h>
 #include <linux/gpio/driver.h>
+#include <linux/of_device.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/pinctrl/machine.h>
@@ -4258,3 +4260,14 @@ static int __init rockchip_pinctrl_drv_register(void)
 	return platform_driver_register(&rockchip_pinctrl_driver);
 }
 postcore_initcall(rockchip_pinctrl_drv_register);
+
+static void __exit rockchip_pinctrl_drv_unregister(void)
+{
+	platform_driver_unregister(&rockchip_pinctrl_driver);
+}
+module_exit(rockchip_pinctrl_drv_unregister);
+
+MODULE_DESCRIPTION("ROCKCHIP Pin Controller Driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:pinctrl-rockchip");
+MODULE_DEVICE_TABLE(of, rockchip_pinctrl_dt_match);
-- 
2.17.1



