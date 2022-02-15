Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1E934B6339
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Feb 2022 07:02:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232501AbiBOGCZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Feb 2022 01:02:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbiBOGCY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Feb 2022 01:02:24 -0500
X-Greylist: delayed 517 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 14 Feb 2022 22:02:15 PST
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [IPv6:2a01:37:3000::53df:4ef0:0])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38795B5637
        for <linux-gpio@vger.kernel.org>; Mon, 14 Feb 2022 22:02:15 -0800 (PST)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
        by bmailout2.hostsharing.net (Postfix) with ESMTPS id 7E1572800B3C2;
        Tue, 15 Feb 2022 06:53:36 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id 6F6522EDAB4; Tue, 15 Feb 2022 06:53:36 +0100 (CET)
Message-Id: <c399da9deab3ede9b0c4d4680d8ac508707aa8c3.1644903104.git.lukas@wunner.de>
From:   Lukas Wunner <lukas@wunner.de>
Date:   Tue, 15 Feb 2022 06:52:36 +0100
Subject: [PATCH] pinctrl: bcm2835: Use bcm2835 gpio_chip label for bcm2711
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Linus Walleij <linus.walleij@linaro.org>,
        "Nicolas Saenz Julienne" <nsaenz@kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Lino Sanfilippo <LinoSanfilippo@gmx.de>,
        Philipp Rosenberger <p.rosenberger@kunbus.com>,
        linux-rpi-kernel@lists.infradead.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Commit b1d84a3d0a26 ("pinctrl: bcm2835: Add support for all GPIOs on
BCM2711") used a different label for the bcm2711 gpio_chip vis-à-vis
the bcm2835.

That breaks compatibility for GPIO_LOOKUP_IDX() and GPIO_HOG() clauses
when porting from older Raspberry Pi Compute Modules to the CM4 or CM4S.

The name change seems unwarranted given it's essentially the same
hardware, so use the old name instead.

For consistency, modify the pinctrl_desc and pinctrl_gpio_range names
as well.  (It looks like they're only used by debugfs.)

Signed-off-by: Lukas Wunner <lukas@wunner.de>
Cc: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index 47e433e09c5c..41d0f32b9d66 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -375,7 +375,7 @@ static const struct gpio_chip bcm2835_gpio_chip = {
 };
 
 static const struct gpio_chip bcm2711_gpio_chip = {
-	.label = "pinctrl-bcm2711",
+	.label = MODULE_NAME,
 	.owner = THIS_MODULE,
 	.request = gpiochip_generic_request,
 	.free = gpiochip_generic_free,
@@ -1134,7 +1134,7 @@ static const struct pinctrl_desc bcm2835_pinctrl_desc = {
 };
 
 static const struct pinctrl_desc bcm2711_pinctrl_desc = {
-	.name = "pinctrl-bcm2711",
+	.name = MODULE_NAME,
 	.pins = bcm2835_gpio_pins,
 	.npins = BCM2711_NUM_GPIOS,
 	.pctlops = &bcm2835_pctl_ops,
@@ -1149,7 +1149,7 @@ static const struct pinctrl_gpio_range bcm2835_pinctrl_gpio_range = {
 };
 
 static const struct pinctrl_gpio_range bcm2711_pinctrl_gpio_range = {
-	.name = "pinctrl-bcm2711",
+	.name = MODULE_NAME,
 	.npins = BCM2711_NUM_GPIOS,
 };
 
-- 
2.34.1

