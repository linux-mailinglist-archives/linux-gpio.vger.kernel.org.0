Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8775B7762
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Sep 2022 19:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232507AbiIMRKw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Sep 2022 13:10:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231834AbiIMRK2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2022 13:10:28 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F01093513;
        Tue, 13 Sep 2022 08:59:22 -0700 (PDT)
Received: from pan.home (unknown [IPv6:2a00:23c6:c311:3401:dd1a:56ef:ffd9:f71c])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: martyn)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id E7FFB6601FFD;
        Tue, 13 Sep 2022 16:54:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.co.uk;
        s=mail; t=1663084444;
        bh=Cf57MQ0s0WfHM3ZV++Oefg0CZSnt/NVUvG5R/Wbna0U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Khgx52dmLTLTmBSuJP8BK4IMJHpR0RFyJ/0pKj40ATrJjKXh2Wm25cCq6x8DfA1bn
         8Objuoy2QbVAhRwO8E8dk0FUrlpTnBDLW6zOFOEZyNi6reneyldLd4yUkm6h1ZJyJp
         J+fj0CcOXKWGeqyxmg+0Ubjxot0LgBpvGZYsaNcjrIbaLPhqxyyquqb/+5T2YIg+o5
         AE8NW/sQnd4EgNoE081PZxlEwpnC6lVoyVwnB8WFxpfIA7VUtg40uSbJy+I+tmyaqY
         0X6ZgqpNJKo8NqtQNYtOWi44SHU7befW6apWQ93smHh70JxTvAUKm6V56DhAFn+/3/
         eRCTGmHwmxS/A==
From:   Martyn Welch <martyn.welch@collabora.co.uk>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Martyn Welch <martyn.welch@collabora.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/5] gpio: pca953x: Swap if statements to save later complexity
Date:   Tue, 13 Sep 2022 16:53:47 +0100
Message-Id: <20220913155348.38716-4-martyn.welch@collabora.co.uk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220913155348.38716-1-martyn.welch@collabora.co.uk>
References: <20220913155348.38716-1-martyn.welch@collabora.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Martyn Welch <martyn.welch@collabora.com>

A later patch in the series adds support for a further chip type that
shares some similarity with the PCA953X_TYPE. In order to keep the logic
simple, swap over the if and else portions where checks are made against
PCA953X_TYPE and instead check for PCA957X_TYPE.

Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---

Changes in v2:
 - None

Changes in v3:
 - None

Changes in v4:
 - None

 drivers/gpio/gpio-pca953x.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 62367c9d6e99..1e8f038734e0 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -293,13 +293,13 @@ static bool pca953x_readable_register(struct device *dev, unsigned int reg)
 	struct pca953x_chip *chip = dev_get_drvdata(dev);
 	u32 bank;
 
-	if (PCA_CHIP_TYPE(chip->driver_data) == PCA953X_TYPE) {
-		bank = PCA953x_BANK_INPUT | PCA953x_BANK_OUTPUT |
-		       PCA953x_BANK_POLARITY | PCA953x_BANK_CONFIG;
-	} else {
+	if (PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE) {
 		bank = PCA957x_BANK_INPUT | PCA957x_BANK_OUTPUT |
 		       PCA957x_BANK_POLARITY | PCA957x_BANK_CONFIG |
 		       PCA957x_BANK_BUSHOLD;
+	} else {
+		bank = PCA953x_BANK_INPUT | PCA953x_BANK_OUTPUT |
+		       PCA953x_BANK_POLARITY | PCA953x_BANK_CONFIG;
 	}
 
 	if (chip->driver_data & PCA_PCAL) {
@@ -316,12 +316,12 @@ static bool pca953x_writeable_register(struct device *dev, unsigned int reg)
 	struct pca953x_chip *chip = dev_get_drvdata(dev);
 	u32 bank;
 
-	if (PCA_CHIP_TYPE(chip->driver_data) == PCA953X_TYPE) {
-		bank = PCA953x_BANK_OUTPUT | PCA953x_BANK_POLARITY |
-			PCA953x_BANK_CONFIG;
-	} else {
+	if (PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE) {
 		bank = PCA957x_BANK_OUTPUT | PCA957x_BANK_POLARITY |
 			PCA957x_BANK_CONFIG | PCA957x_BANK_BUSHOLD;
+	} else {
+		bank = PCA953x_BANK_OUTPUT | PCA953x_BANK_POLARITY |
+			PCA953x_BANK_CONFIG;
 	}
 
 	if (chip->driver_data & PCA_PCAL)
@@ -336,10 +336,10 @@ static bool pca953x_volatile_register(struct device *dev, unsigned int reg)
 	struct pca953x_chip *chip = dev_get_drvdata(dev);
 	u32 bank;
 
-	if (PCA_CHIP_TYPE(chip->driver_data) == PCA953X_TYPE)
-		bank = PCA953x_BANK_INPUT;
-	else
+	if (PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE)
 		bank = PCA957x_BANK_INPUT;
+	else
+		bank = PCA953x_BANK_INPUT;
 
 	if (chip->driver_data & PCA_PCAL)
 		bank |= PCAL9xxx_BANK_IRQ_STAT;
@@ -1070,13 +1070,12 @@ static int pca953x_probe(struct i2c_client *client,
 	/* initialize cached registers from their original values.
 	 * we can't share this chip with another i2c master.
 	 */
-
-	if (PCA_CHIP_TYPE(chip->driver_data) == PCA953X_TYPE) {
-		chip->regs = &pca953x_regs;
-		ret = device_pca95xx_init(chip, invert);
-	} else {
+	if (PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE) {
 		chip->regs = &pca957x_regs;
 		ret = device_pca957x_init(chip, invert);
+	} else {
+		chip->regs = &pca953x_regs;
+		ret = device_pca95xx_init(chip, invert);
 	}
 	if (ret)
 		goto err_exit;
-- 
2.35.1

