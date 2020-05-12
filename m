Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1886C1CFD37
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2020 20:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728070AbgELS1Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 May 2020 14:27:24 -0400
Received: from mga03.intel.com ([134.134.136.65]:25505 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725950AbgELS1Y (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 May 2020 14:27:24 -0400
IronPort-SDR: /0HVrlGbk7usvI7WNQnJK9exEZVdIpy0Q07OvfBrfMA/QZYIX3AcNCYU7IYubUf7boHFJQVsPD
 0d0FQPNK5uDA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2020 11:27:24 -0700
IronPort-SDR: DGQTbCP+UtlmTeF/2+WWK6NjAJTD3qrF9tGjHJzMO1KCV9luUOseA8MMkgADlDbHobpIsfXN1o
 BZVUPSn4ocjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,384,1583222400"; 
   d="scan'208";a="250984352"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 12 May 2020 11:27:22 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 0C64725F; Tue, 12 May 2020 21:27:22 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/3] gpio: xgene-sb: Drop extra check to call acpi_gpiochip_request_interrupts()
Date:   Tue, 12 May 2020 21:27:21 +0300
Message-Id: <20200512182721.55127-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512182721.55127-1-andriy.shevchenko@linux.intel.com>
References: <20200512182721.55127-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is no need to have an additional check to call
acpi_gpiochip_request_interrupts(). Even without any interrupts available
the registered ACPI Event handlers can be useful for debugging purposes.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-xgene-sb.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index 203a268dd09c52..a809609ee9570d 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -290,10 +290,8 @@ static int xgene_gpio_sb_probe(struct platform_device *pdev)
 
 	dev_info(&pdev->dev, "X-Gene GPIO Standby driver registered\n");
 
-	if (priv->nirq > 0) {
-		/* Register interrupt handlers for gpio signaled acpi events */
-		acpi_gpiochip_request_interrupts(&priv->gc);
-	}
+	/* Register interrupt handlers for GPIO signaled ACPI Events */
+	acpi_gpiochip_request_interrupts(&priv->gc);
 
 	return ret;
 }
@@ -302,9 +300,7 @@ static int xgene_gpio_sb_remove(struct platform_device *pdev)
 {
 	struct xgene_gpio_sb *priv = platform_get_drvdata(pdev);
 
-	if (priv->nirq > 0) {
-		acpi_gpiochip_free_interrupts(&priv->gc);
-	}
+	acpi_gpiochip_free_interrupts(&priv->gc);
 
 	irq_domain_remove(priv->irq_domain);
 
-- 
2.26.2

