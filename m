Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B52DA254FC3
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 22:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbgH0UIi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 16:08:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:55066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726289AbgH0UIg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 Aug 2020 16:08:36 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E478120737;
        Thu, 27 Aug 2020 20:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598558915;
        bh=GsZSIjNUufzxlG+lWH52LkwmFcasCpG+/8INcx8Ulgk=;
        h=From:To:Cc:Subject:Date:From;
        b=JFu15cCTxHA3ICWzg7fOthQ1h1OSPYSyM1SxSI9hWdyq1x4YeaV5N+CubpYZktS94
         8Q7t2nsnCTS0EhynQiiQsovUFqqYpzBK5ys8D4NFvKsyfzf0ixGuxlwGYNUoqQgj5E
         N2P+QdbAx3pIDCEyZKCvztUrIvzq4aZk3+tU6gAw=
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
Subject: [PATCH 1/6] gpio: bcm-kona: Simplify with dev_err_probe()
Date:   Thu, 27 Aug 2020 22:08:22 +0200
Message-Id: <20200827200827.26462-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/gpio/gpio-bcm-kona.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index cf3687a7925f..1e6b427f2c4a 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -590,10 +590,7 @@ static int bcm_kona_gpio_probe(struct platform_device *pdev)
 		dev_err(dev, "Couldn't determine # GPIO banks\n");
 		return -ENOENT;
 	} else if (ret < 0) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Couldn't determine GPIO banks: (%pe)\n",
-				ERR_PTR(ret));
-		return ret;
+		return dev_err_probe(dev, ret, "Couldn't determine GPIO banks\n");
 	}
 	kona_gpio->num_bank = ret;
 
-- 
2.17.1

