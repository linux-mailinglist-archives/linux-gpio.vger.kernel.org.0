Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22D5F23337D
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jul 2020 15:55:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729109AbgG3Nzw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jul 2020 09:55:52 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:56450 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728447AbgG3Nzv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jul 2020 09:55:51 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id F2FC48040A68;
        Thu, 30 Jul 2020 13:55:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id G19_VpqOIIFK; Thu, 30 Jul 2020 16:55:43 +0300 (MSK)
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
Subject: [PATCH v2 04/10] gpio: dwapb: Add max GPIOs macro
Date:   Thu, 30 Jul 2020 16:55:30 +0300
Message-ID: <20200730135536.19747-5-Sergey.Semin@baikalelectronics.ru>
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

Add a new macro DWAPB_MAX_GPIOS which defines the maximum possible number
of GPIO lines corresponding to the maximum DW APB GPIO controller port
width. Use the new macro instead of number literal 32 where it's
applicable.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/gpio/gpio-dwapb.c                | 8 ++++----
 include/linux/platform_data/gpio-dwapb.h | 4 +++-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 3081213247d8..f34001152850 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -162,7 +162,7 @@ static struct dwapb_gpio_port *dwapb_offs_to_port(struct dwapb_gpio *gpio, unsig
 
 	for (i = 0; i < gpio->nr_ports; i++) {
 		port = &gpio->ports[i];
-		if (port->idx == offs / 32)
+		if (port->idx == offs / DWAPB_MAX_GPIOS)
 			return port;
 	}
 
@@ -182,7 +182,7 @@ static void dwapb_toggle_trigger(struct dwapb_gpio *gpio, unsigned int offs)
 
 	pol = dwapb_read(gpio, GPIO_INT_POLARITY);
 	/* Just read the current value right out of the data register */
-	val = gc->get(gc, offs % 32);
+	val = gc->get(gc, offs % DWAPB_MAX_GPIOS);
 	if (val)
 		pol &= ~BIT(offs);
 	else
@@ -197,7 +197,7 @@ static u32 dwapb_do_irq(struct dwapb_gpio *gpio)
 	irq_hw_number_t hwirq;
 
 	irq_status = dwapb_read(gpio, GPIO_INTSTATUS);
-	for_each_set_bit(hwirq, &irq_status, 32) {
+	for_each_set_bit(hwirq, &irq_status, DWAPB_MAX_GPIOS) {
 		int gpio_irq = irq_find_mapping(gpio->domain, hwirq);
 		u32 irq_type = irq_get_trigger_type(gpio_irq);
 
@@ -599,7 +599,7 @@ static struct dwapb_platform_data *dwapb_gpio_get_pdata(struct device *dev)
 			dev_info(dev,
 				 "failed to get number of gpios for port%d\n",
 				 i);
-			pp->ngpio = 32;
+			pp->ngpio = DWAPB_MAX_GPIOS;
 		}
 
 		pp->irq_shared	= false;
diff --git a/include/linux/platform_data/gpio-dwapb.h b/include/linux/platform_data/gpio-dwapb.h
index ff1be737bad6..0aa5c6720259 100644
--- a/include/linux/platform_data/gpio-dwapb.h
+++ b/include/linux/platform_data/gpio-dwapb.h
@@ -6,12 +6,14 @@
 #ifndef GPIO_DW_APB_H
 #define GPIO_DW_APB_H
 
+#define DWAPB_MAX_GPIOS		32
+
 struct dwapb_port_property {
 	struct fwnode_handle *fwnode;
 	unsigned int	idx;
 	unsigned int	ngpio;
 	unsigned int	gpio_base;
-	int		irq[32];
+	int		irq[DWAPB_MAX_GPIOS];
 	bool		irq_shared;
 };
 
-- 
2.27.0

