Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 253991A3577
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2020 16:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727081AbgDIOMd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Apr 2020 10:12:33 -0400
Received: from mga04.intel.com ([192.55.52.120]:28946 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726977AbgDIOMd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 Apr 2020 10:12:33 -0400
IronPort-SDR: xLJCTDETf2nM4fgATX2vx34tRF8Y2ERvEG4VfWnM1lF0BJZidzEBYLkga+bJBBtSlDDJesYq4v
 TWOl2whvz2cQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 07:12:33 -0700
IronPort-SDR: m4UfpJVHKaTm5MwlPk8WQEAbSv+ARmg0l/1x/gwG7BJac9ZSuoEXvwVzVfWHoIh0dJsF3txirH
 Ai14oP0PdhFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; 
   d="scan'208";a="242659530"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 09 Apr 2020 07:12:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 964BB7C6; Thu,  9 Apr 2020 17:12:29 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 06/13] gpio: dwapb: Use device_get_match_data() to simplify code
Date:   Thu,  9 Apr 2020 17:12:21 +0300
Message-Id: <20200409141228.49561-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
References: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use device_get_match_data() here to simplify the code a bit.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-dwapb.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 3a1f3fae923f..a0a0288bb73e 100644
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

