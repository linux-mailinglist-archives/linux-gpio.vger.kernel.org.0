Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D293718FE25
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2020 20:54:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbgCWTyc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Mar 2020 15:54:32 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:38302 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727005AbgCWTyc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Mar 2020 15:54:32 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id CB6928030786;
        Mon, 23 Mar 2020 19:54:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id fY-1Ion74Gij; Mon, 23 Mar 2020 22:54:29 +0300 (MSK)
From:   <Sergey.Semin@baikalelectronics.ru>
To:     Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 4/6] gpio: dwapb: Use optional-clocks interface for APB ref-clock
Date:   Mon, 23 Mar 2020 22:53:59 +0300
Message-ID: <20200323195401.30338-5-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200323195401.30338-1-Sergey.Semin@baikalelectronics.ru>
References: <20200323180632.14119-1-Sergey.Semin@baikalelectronics.ru>
 <20200323195401.30338-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Serge Semin <Sergey.Semin@baikalelectronics.ru>

The common clocks kernel framework provides a generic way to use
an optional reference clock sources. If it's utilized there is no
need in checking whether the clock descriptor pointer is actually a
negative error at the moment of the prepare/unprepare clocks method
calling. So if the corresponding clock source is provided, then
getting an error shall actually terminate the device probe procedure.
If it isn't specified then the driver shall proceed with further
initializations.

We'll use the optional clocks getting method to handle the APB reference
clock, which can be provided for instance in the device of-node with
"bus" clock-name.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>

---

Changelog v2:
- Print error instead of info-message if APB clock either failed to be
  acquired or couldn't be enabled.
---
 drivers/gpio/gpio-dwapb.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 92e127e74813..0c5abfa361e6 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -690,13 +690,16 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(gpio->regs);
 
 	/* Optional bus clock */
-	gpio->clk = devm_clk_get(&pdev->dev, "bus");
-	if (!IS_ERR(gpio->clk)) {
-		err = clk_prepare_enable(gpio->clk);
-		if (err) {
-			dev_info(&pdev->dev, "Cannot enable clock\n");
-			return err;
-		}
+	gpio->clk = devm_clk_get_optional(&pdev->dev, "bus");
+	if (IS_ERR(gpio->clk)) {
+		dev_err(&pdev->dev, "Cannot get APB clock\n");
+		return PTR_ERR(gpio->clk);
+	}
+
+	err = clk_prepare_enable(gpio->clk);
+	if (err) {
+		dev_err(&pdev->dev, "Cannot enable APB clock\n");
+		return err;
 	}
 
 	gpio->flags = 0;
@@ -793,8 +796,7 @@ static int dwapb_gpio_resume(struct device *dev)
 	unsigned long flags;
 	int i;
 
-	if (!IS_ERR(gpio->clk))
-		clk_prepare_enable(gpio->clk);
+	clk_prepare_enable(gpio->clk);
 
 	spin_lock_irqsave(&gc->bgpio_lock, flags);
 	for (i = 0; i < gpio->nr_ports; i++) {
-- 
2.25.1

