Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0B791CFD34
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2020 20:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbgELS01 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 May 2020 14:26:27 -0400
Received: from mga07.intel.com ([134.134.136.100]:8825 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725938AbgELS01 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 May 2020 14:26:27 -0400
IronPort-SDR: DLPCJXOjScP/CLX0XW0dVayByyJWvPq8K3N68UWInW/qA6yCoYIQkGh+GNegkbJFnXBRvfi3mo
 RYHbGMfRQ1Hg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2020 11:26:26 -0700
IronPort-SDR: BI2Be/0mVCPCKFeDa54aUO25asM7c+2XUlD9XhcyAVfxVWGZIOvb23nHR8E+TO6Mvt5SRlXPJ6
 5CRxnycoYszw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,384,1583222400"; 
   d="scan'208";a="250984094"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 12 May 2020 11:26:24 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 0C54E76; Tue, 12 May 2020 21:26:23 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/2] gpio: mb86s7x: Use devm_clk_get_optional() to get the input clock
Date:   Tue, 12 May 2020 21:26:22 +0300
Message-Id: <20200512182623.54990-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Simplify the code which fetches the input clock by using
devm_clk_get_optional(). If no input clock is present
devm_clk_get_optional() will return NULL instead of an error
which matches the behavior of the old code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-mb86s7x.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-mb86s7x.c b/drivers/gpio/gpio-mb86s7x.c
index 501e89548f533b..3be2e56f7c4321 100644
--- a/drivers/gpio/gpio-mb86s7x.c
+++ b/drivers/gpio/gpio-mb86s7x.c
@@ -168,15 +168,13 @@ static int mb86s70_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(gchip->base))
 		return PTR_ERR(gchip->base);
 
-	if (!has_acpi_companion(&pdev->dev)) {
-		gchip->clk = devm_clk_get(&pdev->dev, NULL);
-		if (IS_ERR(gchip->clk))
-			return PTR_ERR(gchip->clk);
-
-		ret = clk_prepare_enable(gchip->clk);
-		if (ret)
-			return ret;
-	}
+	gchip->clk = devm_clk_get_optional(&pdev->dev, NULL);
+	if (IS_ERR(gchip->clk))
+		return PTR_ERR(gchip->clk);
+
+	ret = clk_prepare_enable(gchip->clk);
+	if (ret)
+		return ret;
 
 	spin_lock_init(&gchip->lock);
 
-- 
2.26.2

