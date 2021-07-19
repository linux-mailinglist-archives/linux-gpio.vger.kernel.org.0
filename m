Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 989693CD3E6
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jul 2021 13:31:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236318AbhGSKtD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jul 2021 06:49:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:35644 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236076AbhGSKtD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 19 Jul 2021 06:49:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3329560698;
        Mon, 19 Jul 2021 11:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626694183;
        bh=8Bai57AVnBGXhgLKTPt1Og3K+sXqao8LMy9Cl9/cmI8=;
        h=From:To:Cc:Subject:Date:From;
        b=rQy4u4bJEh5hCRXk7UQYQjSrEIglO250NaZZUDk72bF7OUde601Iy1sO+tD+sXPwp
         cRLgc97YvyOBJowK83ueXZU35Z03HuTdSejcTuFNNdkoVGTHlkOnCl90u90lKmCmw5
         Thy/TI+df0giiolVjGOPvRAgg34SqfN0j+AWU15xBbV3f/dIFCyLClwzJL2YDQeFkA
         tH06xsL9sXHGpjK+GiW/AtdIHPukkabIx7uMjqWQbG1CSteg5gMBY7eLc0KwFTBvMP
         oyeN4QqXd2P98SnGb2H7NUUhJUsSnTKdugC0ap/tg9l4OeIDA/zU0HrA50cyzq8MF/
         VLYbbN4ago1ZQ==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Gregory Clement <gregory.clement@bootlin.com>
Cc:     Patrick Williams <alpawi@amazon.com>, pali@kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2] pinctrl: armada-37xx: Correct PWM pins definitions
Date:   Mon, 19 Jul 2021 13:29:38 +0200
Message-Id: <20210719112938.27594-1-kabel@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The PWM pins on North Bridge on Armada 37xx can be configured into PWM
or GPIO functions. When in PWM function, each pin can also be configured
to drive low on 0 and tri-state on 1 (LED mode).

The current definitions handle this by declaring two pin groups for each
pin:
- group "pwmN" with functions "pwm" and "gpio"
- group "ledN_od" ("od" for open drain) with functions "led" and "gpio"

This is semantically incorrect. The correct definition for each pin
should be one group with three functions: "pwm", "led" and "gpio".

Change the "pwmN" groups to support "led" function.

Remove "ledN_od" groups. This cannot break backwards compatibility with
older device trees: no device tree uses it since there is no PWM driver
for this SOC yet. Also "ledN_od" groups are not even documented.

Fixes: b835d6953009 ("pinctrl: armada-37xx: swap polarity on LED group")
Signed-off-by: Marek Behún <kabel@kernel.org>
Acked-by: Rob Herring <robh@kernel.org>
---
Since v1 I've added Fixes tag and Rob's Acked-by.
---
 .../pinctrl/marvell,armada-37xx-pinctrl.txt      |  8 ++++----
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c      | 16 ++++++++--------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/marvell,armada-37xx-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/marvell,armada-37xx-pinctrl.txt
index 38dc56a57760..ecec514b3155 100644
--- a/Documentation/devicetree/bindings/pinctrl/marvell,armada-37xx-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/marvell,armada-37xx-pinctrl.txt
@@ -43,19 +43,19 @@ group emmc_nb
 
 group pwm0
  - pin 11 (GPIO1-11)
- - functions pwm, gpio
+ - functions pwm, led, gpio
 
 group pwm1
  - pin 12
- - functions pwm, gpio
+ - functions pwm, led, gpio
 
 group pwm2
  - pin 13
- - functions pwm, gpio
+ - functions pwm, led, gpio
 
 group pwm3
  - pin 14
- - functions pwm, gpio
+ - functions pwm, led, gpio
 
 group pmic1
  - pin 7
diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 5a68e242f6b3..5cb018f98800 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -167,10 +167,14 @@ static struct armada_37xx_pin_group armada_37xx_nb_groups[] = {
 	PIN_GRP_GPIO("jtag", 20, 5, BIT(0), "jtag"),
 	PIN_GRP_GPIO("sdio0", 8, 3, BIT(1), "sdio"),
 	PIN_GRP_GPIO("emmc_nb", 27, 9, BIT(2), "emmc"),
-	PIN_GRP_GPIO("pwm0", 11, 1, BIT(3), "pwm"),
-	PIN_GRP_GPIO("pwm1", 12, 1, BIT(4), "pwm"),
-	PIN_GRP_GPIO("pwm2", 13, 1, BIT(5), "pwm"),
-	PIN_GRP_GPIO("pwm3", 14, 1, BIT(6), "pwm"),
+	PIN_GRP_GPIO_3("pwm0", 11, 1, BIT(3) | BIT(20), 0, BIT(20), BIT(3),
+		       "pwm", "led"),
+	PIN_GRP_GPIO_3("pwm1", 12, 1, BIT(4) | BIT(21), 0, BIT(21), BIT(4),
+		       "pwm", "led"),
+	PIN_GRP_GPIO_3("pwm2", 13, 1, BIT(5) | BIT(22), 0, BIT(22), BIT(5),
+		       "pwm", "led"),
+	PIN_GRP_GPIO_3("pwm3", 14, 1, BIT(6) | BIT(23), 0, BIT(23), BIT(6),
+		       "pwm", "led"),
 	PIN_GRP_GPIO("pmic1", 7, 1, BIT(7), "pmic"),
 	PIN_GRP_GPIO("pmic0", 6, 1, BIT(8), "pmic"),
 	PIN_GRP_GPIO("i2c2", 2, 2, BIT(9), "i2c"),
@@ -184,10 +188,6 @@ static struct armada_37xx_pin_group armada_37xx_nb_groups[] = {
 	PIN_GRP_EXTRA("uart2", 9, 2, BIT(1) | BIT(13) | BIT(14) | BIT(19),
 		      BIT(1) | BIT(13) | BIT(14), BIT(1) | BIT(19),
 		      18, 2, "gpio", "uart"),
-	PIN_GRP_GPIO_2("led0_od", 11, 1, BIT(20), BIT(20), 0, "led"),
-	PIN_GRP_GPIO_2("led1_od", 12, 1, BIT(21), BIT(21), 0, "led"),
-	PIN_GRP_GPIO_2("led2_od", 13, 1, BIT(22), BIT(22), 0, "led"),
-	PIN_GRP_GPIO_2("led3_od", 14, 1, BIT(23), BIT(23), 0, "led"),
 };
 
 static struct armada_37xx_pin_group armada_37xx_sb_groups[] = {
-- 
2.31.1

