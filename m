Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 974D81CFD80
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2020 20:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbgELSpQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 May 2020 14:45:16 -0400
Received: from mga05.intel.com ([192.55.52.43]:50790 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725987AbgELSpQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 May 2020 14:45:16 -0400
IronPort-SDR: TB5JJKZbcaNH8yC1WVxHVthSCsZxwQDJkxNTTp/UVeiYBbf9xu1geqkQ3sNt0j+rMeWhqPv9Gd
 HMVVRgV7PQ8Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2020 11:45:15 -0700
IronPort-SDR: bsKSTUdjE16YxTmiE3SzQlIk5fn6ptW98/hHw/yuja3nvBvakkhfafHl0O9y4L/JoMSYd41UC4
 V0GVcITPSzBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,384,1583222400"; 
   d="scan'208";a="371653891"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 12 May 2020 11:45:14 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id ADB033B6; Tue, 12 May 2020 21:45:13 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v1 4/4] gpio: dwapb: Remove unneeded has_irq member in struct dwapb_port_property
Date:   Tue, 12 May 2020 21:45:13 +0300
Message-Id: <20200512184513.86883-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512184513.86883-1-andriy.shevchenko@linux.intel.com>
References: <20200512184513.86883-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

has_irq member of struct dwapb_port_property is used only in one place,
so, make it local test instead and remove from the structure.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/gpio/gpio-dwapb.c                | 12 +++++++-----
 include/linux/platform_data/gpio-dwapb.h |  1 -
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 2975f2d369874a..87834adccc4534 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -366,6 +366,11 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 	irq_hw_number_t hwirq;
 	int err, i;
 
+	if (memchr_inv(pp->irq, 0, sizeof(pp->irq)) == NULL) {
+		dev_warn(gpio->dev, "no IRQ for port%d\n", pp->idx);
+		return;
+	}
+
 	gpio->domain = irq_domain_create_linear(fwnode, ngpio,
 						 &irq_generic_chip_ops, gpio);
 	if (!gpio->domain)
@@ -501,7 +506,8 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
 	if (pp->idx == 0)
 		port->gc.set_config = dwapb_gpio_set_config;
 
-	if (pp->has_irq)
+	/* Only port A can provide interrupts in all configurations of the IP */
+	if (pp->idx == 0)
 		dwapb_configure_irqs(gpio, port, pp);
 
 	err = gpiochip_add_data(&port->gc, port);
@@ -553,10 +559,6 @@ static void dwapb_get_irq(struct device *dev, struct fwnode_handle *fwnode,
 
 		pp->irq[j] = err;
 	}
-
-	pp->has_irq = memchr_inv(pp->irq, 0, sizeof(pp->irq)) != NULL;
-	if (!pp->has_irq)
-		dev_warn(dev, "no irq for port%d\n", pp->idx);
 }
 
 static struct dwapb_platform_data *dwapb_gpio_get_pdata(struct device *dev)
diff --git a/include/linux/platform_data/gpio-dwapb.h b/include/linux/platform_data/gpio-dwapb.h
index 3c606c450d0596..ff1be737bad6aa 100644
--- a/include/linux/platform_data/gpio-dwapb.h
+++ b/include/linux/platform_data/gpio-dwapb.h
@@ -12,7 +12,6 @@ struct dwapb_port_property {
 	unsigned int	ngpio;
 	unsigned int	gpio_base;
 	int		irq[32];
-	bool		has_irq;
 	bool		irq_shared;
 };
 
-- 
2.26.2

