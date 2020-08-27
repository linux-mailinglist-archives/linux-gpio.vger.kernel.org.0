Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81317254FD0
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 22:09:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbgH0UIw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 16:08:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:55358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727116AbgH0UIw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 Aug 2020 16:08:52 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6543520737;
        Thu, 27 Aug 2020 20:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598558931;
        bh=HjZ45Ea8Nex20zUFNvtFaU1eRcozwjjKB1eLAew+OQE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sCPSmc9RxrMHbIf6S8DABmPBVlWx8Ssyvwkq6fqtZgQ4sPo1puCHk3yqn4Jhj0CfV
         4ut/br5MNdIKoFME0nJm9+dMCdSXmVHF8pKuMZJ+qgVlKu3KSC6Iq8q2JBSEb4+Y8W
         IXv0MI8WvrzwzNgPoCG63B4mZtcC0EieIcoaOhTQ=
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
Subject: [PATCH 5/6] gpio: pisosr: Simplify with dev_err_probe()
Date:   Thu, 27 Aug 2020 22:08:26 +0200
Message-Id: <20200827200827.26462-5-krzk@kernel.org>
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
 drivers/gpio/gpio-pisosr.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
index 6698feabaced..8e04054cf07e 100644
--- a/drivers/gpio/gpio-pisosr.c
+++ b/drivers/gpio/gpio-pisosr.c
@@ -148,12 +148,9 @@ static int pisosr_gpio_probe(struct spi_device *spi)
 		return -ENOMEM;
 
 	gpio->load_gpio = devm_gpiod_get_optional(dev, "load", GPIOD_OUT_LOW);
-	if (IS_ERR(gpio->load_gpio)) {
-		ret = PTR_ERR(gpio->load_gpio);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Unable to allocate load GPIO\n");
-		return ret;
-	}
+	if (IS_ERR(gpio->load_gpio))
+		return dev_err_probe(dev, PTR_ERR(gpio->load_gpio),
+				     "Unable to allocate load GPIO\n");
 
 	mutex_init(&gpio->lock);
 
-- 
2.17.1

