Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCED6190304
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2020 01:44:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbgCXAoR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Mar 2020 20:44:17 -0400
Received: from lists.nic.cz ([217.31.204.67]:41998 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726986AbgCXAoR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 23 Mar 2020 20:44:17 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id E8F02143135;
        Tue, 24 Mar 2020 01:44:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1585010655; bh=urXM1C/NpGF4/UVm2X2kN+vx+fSbzt7HMlncBR+atYU=;
        h=From:To:Date;
        b=CVM9sfsbZ2iyomoPJQb+U+lhUc9gLpDTK7gsLe1o+aXorP+jub31wV94Oun/oNLRH
         HVtab5fuTWrFUBmCsKIkhx3w0DtwoVGIQRz5gunkqoLZilnh4asioeQncekGlU1odR
         K4S0XwI44IOMy/0ais5mRrKfozLkgVt+hcO+xf5M=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Andrew Lunn <andrew@lunn.ch>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH pinctrl REGRESSION] Revert "pinctrl: mvebu: armada-37xx: use use platform api"
Date:   Tue, 24 Mar 2020 01:44:13 +0100
Message-Id: <20200324004413.14355-1-marek.behun@nic.cz>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.101.4 at mail
X-Virus-Status: Clean
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This reverts commit 06e26b75f5e613b400116fdb7ff6206a681ab271.

This commit caused a regression on Armada 37xx. The pinctrl driver says
  armada-37xx-pinctrl d0013800.pinctrl: invalid or no IRQ
  armada-37xx-pinctrl d0018800.pinctrl: invalid or no IRQ
and afterwards other drivers cannot use GPIOs by this driver as IRQs.

Fixes: 06e26b75f5e6 ("pinctrl: mvebu: armada-37xx: use use platform...")
Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 32f12a388b3c..5f125bd6279d 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -15,6 +15,7 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
+#include <linux/of_irq.h>
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinctrl.h>
@@ -741,14 +742,7 @@ static int armada_37xx_irqchip_register(struct platform_device *pdev,
 		return ret;
 	}
 
-	nr_irq_parent = platform_irq_count(pdev);
-	if (nr_irq_parent < 0) {
-		if (nr_irq_parent != -EPROBE_DEFER)
-			dev_err(dev, "Couldn't determine irq count: %pe\n",
-				ERR_PTR(nr_irq_parent));
-		return nr_irq_parent;
-	}
-
+	nr_irq_parent = of_irq_count(np);
 	spin_lock_init(&info->irq_lock);
 
 	if (!nr_irq_parent) {
@@ -785,7 +779,7 @@ static int armada_37xx_irqchip_register(struct platform_device *pdev,
 	if (!girq->parents)
 		return -ENOMEM;
 	for (i = 0; i < nr_irq_parent; i++) {
-		int irq = platform_get_irq(pdev, i);
+		int irq = irq_of_parse_and_map(np, i);
 
 		if (irq < 0)
 			continue;
-- 
2.24.1

