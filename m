Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EAFE22A4AF
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jul 2020 03:39:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387572AbgGWBjI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 21:39:08 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:32942 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387462AbgGWBjI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 21:39:08 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 4CE4D80307CB;
        Thu, 23 Jul 2020 01:39:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id TInw2puhoxo6; Thu, 23 Jul 2020 04:39:05 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Serge Semin <fancer.lancer@gmail.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Rob Herring <robh+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/7] gpio: dwapb: Move MFD-specific IRQ handler
Date:   Thu, 23 Jul 2020 04:38:54 +0300
Message-ID: <20200723013858.10766-4-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200723013858.10766-1-Sergey.Semin@baikalelectronics.ru>
References: <20200723013858.10766-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

For better readability let's group all the IRQ handler in a single place
of the driver instead of having them scatter around all over the file.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/gpio/gpio-dwapb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index ccd80df16062..3081213247d8 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -220,6 +220,11 @@ static void dwapb_irq_handler(struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
+static irqreturn_t dwapb_irq_handler_mfd(int irq, void *dev_id)
+{
+	return IRQ_RETVAL(dwapb_do_irq(dev_id));
+}
+
 static void dwapb_irq_enable(struct irq_data *d)
 {
 	struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
@@ -349,11 +354,6 @@ static int dwapb_gpio_set_config(struct gpio_chip *gc, unsigned offset,
 	return dwapb_gpio_set_debounce(gc, offset, debounce);
 }
 
-static irqreturn_t dwapb_irq_handler_mfd(int irq, void *dev_id)
-{
-	return IRQ_RETVAL(dwapb_do_irq(dev_id));
-}
-
 static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 				 struct dwapb_gpio_port *port,
 				 struct dwapb_port_property *pp)
-- 
2.26.2

