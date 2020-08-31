Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA332575C4
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 10:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgHaIsR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Aug 2020 04:48:17 -0400
Received: from lucky1.263xmail.com ([211.157.147.133]:47680 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727065AbgHaIsD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2020 04:48:03 -0400
Received: from localhost (unknown [192.168.167.32])
        by lucky1.263xmail.com (Postfix) with ESMTP id 5B5FCC6605;
        Mon, 31 Aug 2020 16:47:57 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P11834T140500763920128S1598863675343235_;
        Mon, 31 Aug 2020 16:47:57 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <3607ed3ee7b793450741574da9fea818>
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
Subject: [PATCH 1/6] pinctrl: rockchip: make driver be tristate module
Date:   Mon, 31 Aug 2020 16:47:48 +0800
Message-Id: <20200831084753.7115-2-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200831084753.7115-1-jay.xu@rock-chips.com>
References: <20200831084753.7115-1-jay.xu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make pinctrl-rockchip driver to be tristate module, support to build as
a module, this is useful for GKI.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/pinctrl/Kconfig            | 2 +-
 drivers/pinctrl/pinctrl-rockchip.c | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 8828613c4e0e..dd4874e2ac67 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -207,7 +207,7 @@ config PINCTRL_OXNAS
 	select MFD_SYSCON
 
 config PINCTRL_ROCKCHIP
-	bool
+	tristate "Rockchip gpio and pinctrl driver"
 	select PINMUX
 	select GENERIC_PINCONF
 	select GENERIC_IRQ_CHIP
diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index c07324d1f265..24dfc814dee1 100644
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
@@ -4256,3 +4258,8 @@ static int __init rockchip_pinctrl_drv_register(void)
 	return platform_driver_register(&rockchip_pinctrl_driver);
 }
 postcore_initcall(rockchip_pinctrl_drv_register);
+
+MODULE_DESCRIPTION("ROCKCHIP Pin Controller Driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:pinctrl-rockchip");
+MODULE_DEVICE_TABLE(of, rockchip_pinctrl_dt_match);
-- 
2.17.1



