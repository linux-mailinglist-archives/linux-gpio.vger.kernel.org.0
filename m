Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE8041D870F
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2020 20:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731136AbgERS33 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 May 2020 14:29:29 -0400
Received: from mga04.intel.com ([192.55.52.120]:49465 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729313AbgERRlm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 May 2020 13:41:42 -0400
IronPort-SDR: s5qomSU/FfoTchsUXiqOSLZuB1dJ94XD6e2sUm279kEpr09UAl1u8wLxMfPA+B5OdhIp7BwSrh
 ahb+HJG+UY4Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 10:41:41 -0700
IronPort-SDR: GUqoxsNWqFAN90Ak2HQTF0yYVljEpUH7Znqv5ySUA5CSsp7QOeFb1eMGc27XAARlgWquickhiv
 YUjWuO6EceIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,407,1583222400"; 
   d="scan'208";a="299298222"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 18 May 2020 10:41:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9A5F819E; Mon, 18 May 2020 20:41:39 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v2 3/4] gpio: dwapb: Don't use 0 as valid Linux interrupt number
Date:   Mon, 18 May 2020 20:41:37 +0300
Message-Id: <20200518174138.19367-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200518174138.19367-1-andriy.shevchenko@linux.intel.com>
References: <20200518174138.19367-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

0 is not valid IRQ number in Linux interrupt number space.
Refactor the code with this kept in mind.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Serge Semin <fancer.lancer@gmail.com>
---
v2: drop memchr_inv() use by moving it to the patch which needs it (Serge)
 drivers/gpio/gpio-dwapb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 944dae80d687..c939afac44c9 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -417,7 +417,7 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 		int i;
 
 		for (i = 0; i < pp->ngpio; i++) {
-			if (pp->irq[i] >= 0)
+			if (pp->irq[i])
 				irq_set_chained_handler_and_data(pp->irq[i],
 						dwapb_irq_handler, gpio);
 		}
@@ -538,18 +538,18 @@ static void dwapb_get_irq(struct device *dev, struct fwnode_handle *fwnode,
 			  struct dwapb_port_property *pp)
 {
 	struct device_node *np = NULL;
-	int j;
+	int irq = -ENXIO, j;
 
 	if (fwnode_property_read_bool(fwnode, "interrupt-controller"))
 		np = to_of_node(fwnode);
 
 	for (j = 0; j < pp->ngpio; j++) {
-		pp->irq[j] = -ENXIO;
-
 		if (np)
-			pp->irq[j] = of_irq_get(np, j);
+			irq = of_irq_get(np, j);
 		else if (has_acpi_companion(dev))
-			pp->irq[j] = platform_get_irq_optional(to_platform_device(dev), j);
+			irq = platform_get_irq_optional(to_platform_device(dev), j);
+		if (irq > 0)
+			pp->irq[j] = irq;
 
 		if (pp->irq[j] >= 0)
 			pp->has_irq = true;
-- 
2.26.2

