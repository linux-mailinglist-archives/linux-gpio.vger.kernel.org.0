Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69F58233393
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jul 2020 15:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729362AbgG3N4S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jul 2020 09:56:18 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:56564 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbgG3Nzv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jul 2020 09:55:51 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 490C68040A7C;
        Thu, 30 Jul 2020 13:55:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id xmJFDaShvY46; Thu, 30 Jul 2020 16:55:44 +0300 (MSK)
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
Subject: [PATCH v2 06/10] gpio: dwapb: Discard GPIO-to-IRQ mapping function
Date:   Thu, 30 Jul 2020 16:55:32 +0300
Message-ID: <20200730135536.19747-7-Sergey.Semin@baikalelectronics.ru>
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

Since GPIOlib-based IRQ-chip interface is now utilized there is no need in
setting up a custom GPIO-to-IRQ mapping method. GPIO-lib defines the
standard mapping method - gpiochip_to_irq(), which will be used anyway no
matter whether the custom to_irq callback is specified or not.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

---

Changelog v2:
- This is a new patch detached from commit
  "gpio: dwapb: Convert driver to using the GPIO-lib-based IRQ-chip".
---
 drivers/gpio/gpio-dwapb.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 327333fbc750..f7acc5abbf5c 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -150,14 +150,6 @@ static inline void dwapb_write(struct dwapb_gpio *gpio, unsigned int offset,
 	gc->write_reg(reg_base + gpio_reg_convert(gpio, offset), val);
 }
 
-static int dwapb_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
-{
-	struct dwapb_gpio_port *port = gpiochip_get_data(gc);
-	struct dwapb_gpio *gpio = port->gpio;
-
-	return irq_find_mapping(gpio->domain, offset);
-}
-
 static struct dwapb_gpio_port *dwapb_offs_to_port(struct dwapb_gpio *gpio, unsigned int offs)
 {
 	struct dwapb_gpio_port *port;
@@ -466,8 +458,6 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 	}
 
 	girq->chip = &port->irqchip;
-
-	port->gc.to_irq = dwapb_gpio_to_irq;
 }
 
 static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
-- 
2.27.0

