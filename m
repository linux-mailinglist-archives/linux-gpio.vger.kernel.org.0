Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5122322608
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Feb 2021 07:44:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbhBWGoj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Feb 2021 01:44:39 -0500
Received: from lucky1.263xmail.com ([211.157.147.132]:59754 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbhBWGoi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Feb 2021 01:44:38 -0500
Received: from localhost (unknown [192.168.167.70])
        by lucky1.263xmail.com (Postfix) with ESMTP id E6298F0D4C;
        Tue, 23 Feb 2021 14:42:14 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P31655T140708532963072S1614062532545348_;
        Tue, 23 Feb 2021 14:42:14 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <1157b6fd0490d94c5e65364f6913fe06>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: linus.walleij@linaro.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     linus.walleij@linaro.org, heiko@sntech.de
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH] pinctrl: rockchip: make driver be tristate module
Date:   Tue, 23 Feb 2021 14:42:11 +0800
Message-Id: <20210223064211.120935-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make pinctrl-rockchip driver to be tristate module, support to build as
a module, this is useful for GKI.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/pinctrl/Kconfig            |  2 +-
 drivers/pinctrl/pinctrl-rockchip.c | 13 +++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 03c62e1cb395..ba12061a80b1 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -208,7 +208,7 @@ config PINCTRL_OXNAS
 	select MFD_SYSCON
 
 config PINCTRL_ROCKCHIP
-	bool
+	tristate "Rockchip gpio and pinctrl driver"
 	depends on OF
 	select PINMUX
 	select GENERIC_PINCONF
diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index aa1a1c850d05..70dc03af5699 100644
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
@@ -4256,3 +4258,14 @@ static int __init rockchip_pinctrl_drv_register(void)
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
2.25.1



