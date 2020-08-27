Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88D7B254FCE
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 22:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727783AbgH0UIt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 16:08:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:55272 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727116AbgH0UIs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 Aug 2020 16:08:48 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 48205208C9;
        Thu, 27 Aug 2020 20:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598558927;
        bh=yKbOOPdL7+pZyGE3E1+yfNF4h5jwEHoSCybPJ3uzi8M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=V6bLk4HnAq9bJHAHUxEWuDmV6GHGctBbrcdHLb+vrQWQGBE03Vl66RbLLdknLICHQ
         +UMLr5pmALhNjszvyPq5Ch+KLiEGYqrnKzycspwl7K06ZFaairZDo4Z2PnysttwnG0
         1Tt5S/Xzw9GLXfesNCRjntPxgNca4AfPReMwD7Eo=
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
Subject: [PATCH 4/6] gpio: pca953x: Simplify with dev_err_probe()
Date:   Thu, 27 Aug 2020 22:08:25 +0200
Message-Id: <20200827200827.26462-4-krzk@kernel.org>
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
 drivers/gpio/gpio-pca953x.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index bd2e96c34f82..b5c3e56613a7 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -1000,12 +1000,9 @@ static int pca953x_probe(struct i2c_client *client,
 	chip->client = client;
 
 	reg = devm_regulator_get(&client->dev, "vcc");
-	if (IS_ERR(reg)) {
-		ret = PTR_ERR(reg);
-		if (ret != -EPROBE_DEFER)
-			dev_err(&client->dev, "reg get err: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(reg))
+		return dev_err_probe(&client->dev, PTR_ERR(reg), "reg get err\n");
+
 	ret = regulator_enable(reg);
 	if (ret) {
 		dev_err(&client->dev, "reg en err: %d\n", ret);
-- 
2.17.1

