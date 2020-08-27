Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12842254FCD
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 22:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727105AbgH0UIr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 16:08:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:55204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727056AbgH0UIo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 Aug 2020 16:08:44 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0D601208D5;
        Thu, 27 Aug 2020 20:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598558923;
        bh=xl8J41Jd34mayLp7JsZohH5l8Z/xyH60BLO5q6GW978=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=s1jCf85kf9gUWk+cboz4RbMo+kbKymOjBmvK8MSRzQSI0+0079W9y+PJ+YLap35BD
         ahUJl48XNuIUk5N1VIgJ2BdrDuAGr/y0ePeZgn2V2f8axn94ZrrZUTMgC3H2JrdcSn
         dhwJOE/tt9B2LszTiVINSYgUMi6PtILVcrkbjYo0=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Ray Jui <rjui@broadcom.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, Keerthy <j-keerthy@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 3/6] gpio: omap: Simplify with dev_err_probe()
Date:   Thu, 27 Aug 2020 22:08:24 +0200
Message-Id: <20200827200827.26462-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827200827.26462-1-krzk@kernel.org>
References: <20200827200827.26462-1-krzk@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/gpio/gpio-omap.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 7fbe0c9e1fc1..2dc12f4addbd 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -1394,10 +1394,7 @@ static int omap_gpio_probe(struct platform_device *pdev)
 	if (bank->irq <= 0) {
 		if (!bank->irq)
 			bank->irq = -ENXIO;
-		if (bank->irq != -EPROBE_DEFER)
-			dev_err(dev,
-				"can't get irq resource ret=%d\n", bank->irq);
-		return bank->irq;
+		return dev_err_probe(dev, bank->irq, "can't get irq resource\n");
 	}
 
 	bank->chip.parent = dev;
-- 
2.17.1

