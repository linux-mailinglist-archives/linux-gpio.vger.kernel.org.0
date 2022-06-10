Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72F98546B00
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jun 2022 18:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349836AbiFJQtU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jun 2022 12:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349830AbiFJQtL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jun 2022 12:49:11 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4679319C3B8
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jun 2022 09:49:05 -0700 (PDT)
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1nzhof-0002E6-4x; Fri, 10 Jun 2022 18:48:57 +0200
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sungbo Eo <mans0n@gorani.run>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, patchwork-lst@pengutronix.de
Subject: [PATCH] gpio: pca9570: add pca9571 support
Date:   Fri, 10 Jun 2022 18:48:55 +0200
Message-Id: <20220610164855.242563-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The PCA9571 very similar to the PCA9570, it only differs in the
number of GPIOs.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml | 1 +
 drivers/gpio/gpio-pca9570.c                              | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
index 338c5312a106..1acaa0a3d35a 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     enum:
       - nxp,pca9570
+      - nxp,pca9571
 
   reg:
     maxItems: 1
diff --git a/drivers/gpio/gpio-pca9570.c b/drivers/gpio/gpio-pca9570.c
index cb2b2f735c15..ab2a652964ec 100644
--- a/drivers/gpio/gpio-pca9570.c
+++ b/drivers/gpio/gpio-pca9570.c
@@ -121,12 +121,14 @@ static int pca9570_probe(struct i2c_client *client)
 
 static const struct i2c_device_id pca9570_id_table[] = {
 	{ "pca9570", 4 },
+	{ "pca9571", 8 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, pca9570_id_table);
 
 static const struct of_device_id pca9570_of_match_table[] = {
 	{ .compatible = "nxp,pca9570", .data = (void *)4 },
+	{ .compatible = "nxp,pca9571", .data = (void *)8 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, pca9570_of_match_table);
-- 
2.30.2

