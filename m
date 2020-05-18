Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D85471D80B9
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2020 19:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729316AbgERRlm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 May 2020 13:41:42 -0400
Received: from mga05.intel.com ([192.55.52.43]:27925 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729311AbgERRll (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 May 2020 13:41:41 -0400
IronPort-SDR: i9MrZ3F8+DJPo/s14duqE6wjtX3JUogdrndgr7Rw/o/pW5V4uh2D5GAHAy4+jc+LCOSMSbC21P
 DdfGZfBe4zIA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 10:41:41 -0700
IronPort-SDR: NU9Z11FDgeLTms4fj5qKgrzU4N1yJIZ5h7W2juM/Mn5RIgPUZgnwql/kjkRd2DdYm3B9IqhP2L
 Qc4oSTw8RBOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,407,1583222400"; 
   d="scan'208";a="465838981"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 18 May 2020 10:41:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8CFFC94; Mon, 18 May 2020 20:41:39 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v2 2/4] gpio: dwapb: avoid error message for optional IRQ
Date:   Mon, 18 May 2020 20:41:36 +0300
Message-Id: <20200518174138.19367-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200518174138.19367-1-andriy.shevchenko@linux.intel.com>
References: <20200518174138.19367-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

platform_get_irq() will generate an error message if the requested IRQ
is not present. Use platform_get_irq_optional() to avoid the error message
being generated.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
---
v2: added Rb tag (Serge)
 drivers/gpio/gpio-dwapb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index e5d844304f8d..944dae80d687 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -549,7 +549,7 @@ static void dwapb_get_irq(struct device *dev, struct fwnode_handle *fwnode,
 		if (np)
 			pp->irq[j] = of_irq_get(np, j);
 		else if (has_acpi_companion(dev))
-			pp->irq[j] = platform_get_irq(to_platform_device(dev), j);
+			pp->irq[j] = platform_get_irq_optional(to_platform_device(dev), j);
 
 		if (pp->irq[j] >= 0)
 			pp->has_irq = true;
-- 
2.26.2

