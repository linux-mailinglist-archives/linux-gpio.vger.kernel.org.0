Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA7E1F1A49
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2020 15:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729761AbgFHNn1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 09:43:27 -0400
Received: from mga06.intel.com ([134.134.136.31]:2281 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729840AbgFHNnI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Jun 2020 09:43:08 -0400
IronPort-SDR: Pvd/IdgEcfIttSDh+1lQ+azh6WkT0mLo+fpmRCX7dWlU8xXuMSkd8tFPTaC8S/a8rk2C8jgVSg
 sY/n/pL+/dbA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2020 06:43:08 -0700
IronPort-SDR: uYYuKJygUPTNNSnZ5lPujlqYfkWFp71cyRYTrmZ5fP3PxmPbp4R/L2gAUQc58Tg88diMCmqlZ2
 Lf2xm6ZcRAOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,487,1583222400"; 
   d="scan'208";a="288473542"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 08 Jun 2020 06:43:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E09583CF; Mon,  8 Jun 2020 16:43:02 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <fancer.lancer@gmail.com>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 6/6] gpio: dwapb: Define magic number for IRQ and GPIO lines
Date:   Mon,  8 Jun 2020 16:43:00 +0300
Message-Id: <20200608134300.76091-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200608134300.76091-1-andriy.shevchenko@linux.intel.com>
References: <20200608134300.76091-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Define maximum number of IRQ and GPIO lines per port and
replace magic number by it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-dwapb.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index de01b8943bd2..77a86a8eaee0 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -63,6 +63,7 @@
 #define GPIO_INTSTATUS_V2	0x3c
 #define GPIO_PORTA_EOI_V2	0x40
 
+#define DWAPB_NR_GPIOS		32
 #define DWAPB_NR_CLOCKS		2
 
 struct dwapb_port_property {
@@ -70,7 +71,7 @@ struct dwapb_port_property {
 	unsigned int idx;
 	unsigned int ngpio;
 	unsigned int gpio_base;
-	int irq[32];
+	int irq[DWAPB_NR_GPIOS];
 };
 
 struct dwapb_platform_data {
@@ -174,7 +175,7 @@ static struct dwapb_gpio_port *dwapb_offs_to_port(struct dwapb_gpio *gpio, unsig
 
 	for (i = 0; i < gpio->nr_ports; i++) {
 		port = &gpio->ports[i];
-		if (port->idx == offs / 32)
+		if (port->idx == offs / DWAPB_NR_GPIOS)
 			return port;
 	}
 
@@ -194,7 +195,7 @@ static void dwapb_toggle_trigger(struct dwapb_gpio *gpio, unsigned int offs)
 
 	pol = dwapb_read(gpio, GPIO_INT_POLARITY);
 	/* Just read the current value right out of the data register */
-	val = gc->get(gc, offs % 32);
+	val = gc->get(gc, offs % DWAPB_NR_GPIOS);
 	if (val)
 		pol &= ~BIT(offs);
 	else
@@ -209,7 +210,7 @@ static u32 dwapb_do_irq(struct dwapb_gpio *gpio)
 	irq_hw_number_t hwirq;
 
 	irq_status = dwapb_read(gpio, GPIO_INTSTATUS);
-	for_each_set_bit(hwirq, &irq_status, 32) {
+	for_each_set_bit(hwirq, &irq_status, DWAPB_NR_GPIOS) {
 		int gpio_irq = irq_find_mapping(gpio->domain, hwirq);
 		u32 irq_type = irq_get_trigger_type(gpio_irq);
 
@@ -608,7 +609,7 @@ static struct dwapb_platform_data *dwapb_gpio_get_pdata(struct device *dev)
 			dev_info(dev,
 				 "failed to get number of gpios for port%d\n",
 				 i);
-			pp->ngpio = 32;
+			pp->ngpio = DWAPB_NR_GPIOS;
 		}
 
 		if (fwnode_property_read_u32(fwnode, "snps,gpio-base", &pp->gpio_base))
-- 
2.27.0.rc2

