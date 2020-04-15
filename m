Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7CC41AA9AA
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 16:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2636534AbgDOOQw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 10:16:52 -0400
Received: from mga14.intel.com ([192.55.52.115]:9843 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2634150AbgDOOPo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 10:15:44 -0400
IronPort-SDR: DN8+RihC+wRTYwomfD4kc8qXKUBBxkqqUllE3naSKW+ypB/yiPLLUk5PUhRTKvbKQFgQXNaU/N
 yRdF2QFEG8ZA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 07:15:40 -0700
IronPort-SDR: avfExghL/6HFMVpJm7kM6xR2q+KLkifbvYcu7cBB6Gg19Ct/Wei2Zlraf+7QjgJZDyjsa4BU5j
 2WyfcjoFwQQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; 
   d="scan'208";a="244112401"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 15 Apr 2020 07:15:38 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C5EFB49F; Wed, 15 Apr 2020 17:15:35 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v2 07/14] gpio: dwapb: Use device_get_match_data() to simplify code
Date:   Wed, 15 Apr 2020 17:15:27 +0300
Message-Id: <20200415141534.31240-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
References: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use device_get_match_data() here to simplify the code a bit.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/gpio/gpio-dwapb.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 2edccc5bbc25..8b30ded9322a 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -683,18 +683,7 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	gpio->flags = 0;
-	if (dev->of_node) {
-		gpio->flags = (uintptr_t)of_device_get_match_data(dev);
-	} else if (has_acpi_companion(dev)) {
-		const struct acpi_device_id *acpi_id;
-
-		acpi_id = acpi_match_device(dwapb_acpi_match, dev);
-		if (acpi_id) {
-			if (acpi_id->driver_data)
-				gpio->flags = acpi_id->driver_data;
-		}
-	}
+	gpio->flags = (uintptr_t)device_get_match_data(dev);
 
 	for (i = 0; i < gpio->nr_ports; i++) {
 		err = dwapb_gpio_add_port(gpio, &pdata->properties[i], i);
-- 
2.25.1

