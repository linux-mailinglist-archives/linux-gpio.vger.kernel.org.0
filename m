Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57F621128FC
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 11:11:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727671AbfLDKLH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 05:11:07 -0500
Received: from zimbra2.kalray.eu ([92.103.151.219]:56760 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727560AbfLDKLE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 05:11:04 -0500
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 6DC0827E10A2;
        Wed,  4 Dec 2019 11:11:03 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id TS2caAzpPi7e; Wed,  4 Dec 2019 11:11:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 1F09327E0A05;
        Wed,  4 Dec 2019 11:11:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 1F09327E0A05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1575454263;
        bh=aVVKHg4KNmfV7IMUo/teaWuIhAVpeMTfo8aWF5zQzBc=;
        h=From:To:Date:Message-Id;
        b=GJ8+87S1BicJnRFUE8oQ0PJ865YJUjAG3U8n2jC7WlFm2h9m1/4TSDh8ATYbCnv4V
         tAz5jvATmcDzgi8NFCAg3bfkTFvawgENQ+S90+oaap9xMOxkVV6+1AKiDH9ZWyx00o
         +GTddyrmLpwJZUHz7mmEQZ77SuzkOJaw+vOecyDU=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id su1OHbrt4e0x; Wed,  4 Dec 2019 11:11:03 +0100 (CET)
Received: from triton.lin.mbt.kalray.eu (unknown [192.168.37.25])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id 02B6227E1552;
        Wed,  4 Dec 2019 11:11:03 +0100 (CET)
From:   Clement Leger <cleger@kalray.eu>
To:     linux-kernel@vger.kernel.org
Cc:     Clement Leger <cleger@kalray.eu>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: [PATCH 3/5] pinctrl: dw: use devm_gpiochip_add_data
Date:   Wed,  4 Dec 2019 11:10:37 +0100
Message-Id: <20191204101042.4275-4-cleger@kalray.eu>
X-Mailer: git-send-email 2.15.0.276.g89ea799
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use managed gpiochip_add_data for easier handling of exit paths.

Signed-off-by: Clement Leger <cleger@kalray.eu>
---
 drivers/pinctrl/dw/pinctrl-dwapb.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/pinctrl/dw/pinctrl-dwapb.c b/drivers/pinctrl/dw/pinctrl-dwapb.c
index 62e598bdd9ff..3750205408e3 100644
--- a/drivers/pinctrl/dw/pinctrl-dwapb.c
+++ b/drivers/pinctrl/dw/pinctrl-dwapb.c
@@ -529,7 +529,7 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
 	if (pp->has_irq)
 		dwapb_configure_irqs(gpio, port, pp);
 
-	err = gpiochip_add_data(&port->gc, port);
+	err = devm_gpiochip_add_data(gpio->dev, &port->gc, port);
 	if (err)
 		dev_err(gpio->dev, "failed to register gpiochip for port%d\n",
 			port->idx);
@@ -543,15 +543,6 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
 	return err;
 }
 
-static void dwapb_gpio_unregister(struct dwapb_gpio *gpio)
-{
-	unsigned int m;
-
-	for (m = 0; m < gpio->nr_ports; ++m)
-		if (gpio->ports[m].is_registered)
-			gpiochip_remove(&gpio->ports[m].gc);
-}
-
 static struct dwapb_platform_data *
 dwapb_gpio_get_pdata(struct device *dev)
 {
@@ -719,7 +710,6 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
 	return 0;
 
 out_unregister:
-	dwapb_gpio_unregister(gpio);
 	dwapb_irq_teardown(gpio);
 	clk_disable_unprepare(gpio->clk);
 
@@ -730,7 +720,6 @@ static int dwapb_gpio_remove(struct platform_device *pdev)
 {
 	struct dwapb_gpio *gpio = platform_get_drvdata(pdev);
 
-	dwapb_gpio_unregister(gpio);
 	dwapb_irq_teardown(gpio);
 	reset_control_assert(gpio->rst);
 	clk_disable_unprepare(gpio->clk);
-- 
2.15.0.276.g89ea799

