Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B99E2B767B
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2019 11:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388528AbfISJki (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Sep 2019 05:40:38 -0400
Received: from inva020.nxp.com ([92.121.34.13]:56704 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388084AbfISJki (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 19 Sep 2019 05:40:38 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 74DB11A00E7;
        Thu, 19 Sep 2019 11:40:36 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id AB9CB1A02DD;
        Thu, 19 Sep 2019 11:40:33 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id E5F60402D0;
        Thu, 19 Sep 2019 17:40:29 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V2] gpio: mxc: Only getting second IRQ when there is more than one IRQ
Date:   Thu, 19 Sep 2019 17:39:17 +0800
Message-Id: <1568885957-2968-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On some of i.MX SoCs like i.MX8QXP, there is ONLY one IRQ for each
GPIO bank, so it is better to check the IRQ count before getting
second IRQ to avoid below error message during probe:

[    1.070908] gpio-mxc 5d080000.gpio: IRQ index 1 not found
[    1.077420] gpio-mxc 5d090000.gpio: IRQ index 1 not found
[    1.083766] gpio-mxc 5d0a0000.gpio: IRQ index 1 not found
[    1.090122] gpio-mxc 5d0b0000.gpio: IRQ index 1 not found
[    1.096470] gpio-mxc 5d0c0000.gpio: IRQ index 1 not found
[    1.102804] gpio-mxc 5d0d0000.gpio: IRQ index 1 not found
[    1.109144] gpio-mxc 5d0e0000.gpio: IRQ index 1 not found
[    1.115475] gpio-mxc 5d0f0000.gpio: IRQ index 1 not found

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V1:
	- use local variable irq_count instead or err to avoid confusion.
---
 drivers/gpio/gpio-mxc.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 7907a87..c77d474 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -411,6 +411,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct mxc_gpio_port *port;
+	int irq_count;
 	int irq_base;
 	int err;
 
@@ -426,9 +427,15 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(port->base))
 		return PTR_ERR(port->base);
 
-	port->irq_high = platform_get_irq(pdev, 1);
-	if (port->irq_high < 0)
-		port->irq_high = 0;
+	irq_count = platform_irq_count(pdev);
+	if (irq_count < 0)
+		return irq_count;
+
+	if (irq_count > 1) {
+		port->irq_high = platform_get_irq(pdev, 1);
+		if (port->irq_high < 0)
+			port->irq_high = 0;
+	}
 
 	port->irq = platform_get_irq(pdev, 0);
 	if (port->irq < 0)
-- 
2.7.4

