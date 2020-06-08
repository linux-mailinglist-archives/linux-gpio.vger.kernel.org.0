Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1636B1F1A43
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2020 15:43:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729842AbgFHNnI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 09:43:08 -0400
Received: from mga02.intel.com ([134.134.136.20]:9553 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729761AbgFHNnG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Jun 2020 09:43:06 -0400
IronPort-SDR: FKBOsi3t6VzgCk1YuqD7g9u4FX0vPLHlGX2TKoWsHpVeKXY7GKJM7Rq8+UwKLvedTKS0G9mUM+
 mXjpQ5IfuLaw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2020 06:43:05 -0700
IronPort-SDR: LabP5zzfHpvMu5B5Gwbe1V4+VQ5qBqJfN1/z3ptdv0sL11b7+acwfOnqWJDYLAbi5E1AeOrNH2
 4z/bMx62e1Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,487,1583222400"; 
   d="scan'208";a="472692070"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 08 Jun 2020 06:43:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id BA2E7111; Mon,  8 Jun 2020 16:43:02 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <fancer.lancer@gmail.com>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/6] gpio: dwapb: Replace irq_shared flag with fwnode type check
Date:   Mon,  8 Jun 2020 16:42:55 +0300
Message-Id: <20200608134300.76091-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200608134300.76091-1-andriy.shevchenko@linux.intel.com>
References: <20200608134300.76091-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Shared IRQ is only enabled for ACPI platforms or pure platform drivers,
there is no need to have a special flag for that, since we simple can test
port fwnode to be type of OF.

While at it, drop duplicate declaration of loop variable.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpio/gpio-dwapb.c                | 5 +----
 drivers/mfd/intel_quark_i2c_gpio.c       | 1 -
 include/linux/platform_data/gpio-dwapb.h | 1 -
 3 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 1d8d55bd63aa..a7ca72086511 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -418,9 +418,7 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 	irq_gc->chip_types[1].type = IRQ_TYPE_EDGE_BOTH;
 	irq_gc->chip_types[1].handler = handle_edge_irq;
 
-	if (!pp->irq_shared) {
-		int i;
-
+	if (to_of_node(pp->fwnode)) {
 		for (i = 0; i < pp->ngpio; i++) {
 			if (pp->irq[i])
 				irq_set_chained_handler_and_data(pp->irq[i],
@@ -601,7 +599,6 @@ static struct dwapb_platform_data *dwapb_gpio_get_pdata(struct device *dev)
 			pp->ngpio = 32;
 		}
 
-		pp->irq_shared	= false;
 		pp->gpio_base	= -1;
 
 		/*
diff --git a/drivers/mfd/intel_quark_i2c_gpio.c b/drivers/mfd/intel_quark_i2c_gpio.c
index 84ca7902e1df..06b538dd124c 100644
--- a/drivers/mfd/intel_quark_i2c_gpio.c
+++ b/drivers/mfd/intel_quark_i2c_gpio.c
@@ -216,7 +216,6 @@ static int intel_quark_gpio_setup(struct pci_dev *pdev, struct mfd_cell *cell)
 	pdata->properties->ngpio	= INTEL_QUARK_MFD_NGPIO;
 	pdata->properties->gpio_base	= INTEL_QUARK_MFD_GPIO_BASE;
 	pdata->properties->irq[0]	= pdev->irq;
-	pdata->properties->irq_shared	= true;
 
 	cell->platform_data = pdata;
 	cell->pdata_size = sizeof(*pdata);
diff --git a/include/linux/platform_data/gpio-dwapb.h b/include/linux/platform_data/gpio-dwapb.h
index ff1be737bad6..a63010b6e898 100644
--- a/include/linux/platform_data/gpio-dwapb.h
+++ b/include/linux/platform_data/gpio-dwapb.h
@@ -12,7 +12,6 @@ struct dwapb_port_property {
 	unsigned int	ngpio;
 	unsigned int	gpio_base;
 	int		irq[32];
-	bool		irq_shared;
 };
 
 struct dwapb_platform_data {
-- 
2.27.0.rc2

