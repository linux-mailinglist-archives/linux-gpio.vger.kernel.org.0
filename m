Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A7EF254FCC
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 22:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbgH0UIo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 16:08:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:55130 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726289AbgH0UIk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 Aug 2020 16:08:40 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 395FE208C9;
        Thu, 27 Aug 2020 20:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598558919;
        bh=7Xgw8IUGP7VLzG8Sb+5jL0H9jR3vAdKv/vfEHwLk754=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eQxNNqeGrTZ87zvEO01q+I627AIhrSDzy8XyPOHUpTNWuvcDNzqfP0Kwkba8wPkDd
         8j/Fie4cyZulrsCahbCBiqXdKHf61gmLwM9KYNur0QsqTFHAifFr/eN0YUIQSWUQTe
         umKg9mWDD/+Xti662qDARD2JVUCJmHyKGUblDEP8=
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
Subject: [PATCH 2/6] gpio: davinci: Simplify with dev_err_probe()
Date:   Thu, 27 Aug 2020 22:08:23 +0200
Message-Id: <20200827200827.26462-2-krzk@kernel.org>
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
 drivers/gpio/gpio-davinci.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 085b874db2a9..6f2138503726 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -237,12 +237,8 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 
 	for (i = 0; i < nirq; i++) {
 		chips->irqs[i] = platform_get_irq(pdev, i);
-		if (chips->irqs[i] < 0) {
-			if (chips->irqs[i] != -EPROBE_DEFER)
-				dev_info(dev, "IRQ not populated, err = %d\n",
-					 chips->irqs[i]);
-			return chips->irqs[i];
-		}
+		if (chips->irqs[i] < 0)
+			return dev_err_probe(dev, chips->irqs[i], "IRQ not populated\n");
 	}
 
 	chips->chip.label = dev_name(dev);
-- 
2.17.1

