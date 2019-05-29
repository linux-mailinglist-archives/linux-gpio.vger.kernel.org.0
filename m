Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 052922D7DC
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2019 10:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbfE2IbN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 May 2019 04:31:13 -0400
Received: from inva021.nxp.com ([92.121.34.21]:60710 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726752AbfE2IbN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 May 2019 04:31:13 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8736F200273;
        Wed, 29 May 2019 10:31:09 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3F2902011C3;
        Wed, 29 May 2019 10:31:04 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id C8C27402FB;
        Wed, 29 May 2019 16:30:57 +0800 (SGT)
From:   Chuanhua Han <chuanhua.han@nxp.com>
To:     shawnguo@kernel.org, leoyang.li@nxp.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Chuanhua Han <chuanhua.han@nxp.com>,
        Zhang Ying-22455 <ying.zhang22455@nxp.com>
Subject: [PATCH 1/3] gpio: mpc8xxx: Enable port input and interrupt
Date:   Wed, 29 May 2019 16:32:52 +0800
Message-Id: <20190529083254.39581-1-chuanhua.han@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The GPIO Input Buffer Enable register is used to control the input
enable of each individual GPIO port. When an individual GPIO port's
direction is set to input (GPIO_GPDIR[DRn=0]), the associated
input enable must be set (GPIOxGPIE[IEn]=1) to propagate the port
value to the GPIO Data Register.

This patch enable port input and interrupt.

Signed-off-by: Zhang Ying-22455 <ying.zhang22455@nxp.com>
Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>
---
 drivers/gpio/gpio-mpc8xxx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index c8673a5d9412..555e0e7957d9 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -373,9 +373,10 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 	if (!mpc8xxx_gc->irq)
 		return 0;
 
-	/* ack and mask all irqs */
+	/* ack and enable irqs */
 	gc->write_reg(mpc8xxx_gc->regs + GPIO_IER, 0xffffffff);
-	gc->write_reg(mpc8xxx_gc->regs + GPIO_IMR, 0);
+	gc->write_reg(mpc8xxx_gc->regs + GPIO_IMR, 0xffffffff);
+	gc->write_reg(mpc8xxx_gc->regs + GPIO_ICR2, 0xffffffff);
 
 	irq_set_chained_handler_and_data(mpc8xxx_gc->irqn,
 					 mpc8xxx_gpio_irq_cascade, mpc8xxx_gc);
-- 
2.17.1

