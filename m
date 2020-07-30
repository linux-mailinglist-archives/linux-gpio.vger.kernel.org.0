Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83095233399
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jul 2020 15:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729424AbgG3N4W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jul 2020 09:56:22 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:56568 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728462AbgG3Nzu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jul 2020 09:55:50 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id B0C4C8040A6B;
        Thu, 30 Jul 2020 13:55:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id GZldgJ5dsnYw; Thu, 30 Jul 2020 16:55:45 +0300 (MSK)
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
Subject: [PATCH v2 07/10] gpio: dwapb: Discard ACPI GPIO-chip IRQs request
Date:   Thu, 30 Jul 2020 16:55:33 +0300
Message-ID: <20200730135536.19747-8-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200730135536.19747-1-Sergey.Semin@baikalelectronics.ru>
References: <20200730135536.19747-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since GPIOlib-based IRQ-chip interface is now utilized there is no need
in calling the methods acpi_gpiochip_{request,free}_interrupts() here.
They will be called from gpiochip_add_irqchip()/gpiochip_irqchip_remove()
anyway.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

---

Changelog v2:
- This is a new patch detached from commit
  "gpio: dwapb: Convert driver to using the GPIO-lib-based IRQ-chip".
---
 drivers/gpio/gpio-dwapb.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index f7acc5abbf5c..226d9c2d9493 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -512,9 +512,6 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
 		return err;
 	}
 
-	/* Add GPIO-signaled ACPI event support */
-	acpi_gpiochip_request_interrupts(&port->gc);
-
 	port->is_registered = true;
 
 	return 0;
@@ -530,7 +527,6 @@ static void dwapb_gpio_unregister(struct dwapb_gpio *gpio)
 		if (!port->is_registered)
 			continue;
 
-		acpi_gpiochip_free_interrupts(&port->gc);
 		gpiochip_remove(&port->gc);
 	}
 }
-- 
2.27.0

