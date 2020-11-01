Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A2042A1CBD
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Nov 2020 10:01:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgKAJBg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 1 Nov 2020 04:01:36 -0500
Received: from aposti.net ([89.234.176.197]:35504 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726118AbgKAJBg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 1 Nov 2020 04:01:36 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Zhou Yanjie <zhouyanjie@wanyeetech.com>, od@zcrc.me,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/2] pinctrl: ingenic: Add lcd-8bit group for JZ4770
Date:   Sun,  1 Nov 2020 09:01:04 +0000
Message-Id: <20201101090104.5088-3-paul@crapouillou.net>
In-Reply-To: <20201101090104.5088-1-paul@crapouillou.net>
References: <20201101090104.5088-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the "lcd-8bit" group to the "lcd" function.

As "lcd-24bit" is a superset of "lcd-8bit", in theory the former could
be modified to only contain the pins not already included in "lcd-8bit",
just like how it's done for the JZ4740 and JZ4725B platforms. However,
we can't do that without breaking Device Tree ABI, so in that case we
have no choice but to have two groups containing the same pins.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/pinctrl/pinctrl-ingenic.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index ed63dfb68241..53a6a24bd052 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -626,6 +626,10 @@ static int jz4770_cim_8bit_pins[] = {
 static int jz4770_cim_12bit_pins[] = {
 	0x32, 0x33, 0xb0, 0xb1,
 };
+static int jz4770_lcd_8bit_pins[] = {
+	0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x4c, 0x4d,
+	0x48, 0x49, 0x52, 0x53,
+};
 static int jz4770_lcd_24bit_pins[] = {
 	0x40, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47,
 	0x48, 0x49, 0x4a, 0x4b, 0x4c, 0x4d, 0x4e, 0x4f,
@@ -730,6 +734,7 @@ static const struct group_desc jz4770_groups[] = {
 	INGENIC_PIN_GROUP("i2c2-data", jz4770_i2c2, 2),
 	INGENIC_PIN_GROUP("cim-data-8bit", jz4770_cim_8bit, 0),
 	INGENIC_PIN_GROUP("cim-data-12bit", jz4770_cim_12bit, 0),
+	INGENIC_PIN_GROUP("lcd-8bit", jz4770_lcd_8bit, 0),
 	INGENIC_PIN_GROUP("lcd-24bit", jz4770_lcd_24bit, 0),
 	{ "lcd-no-pins", },
 	INGENIC_PIN_GROUP("pwm0", jz4770_pwm_pwm0, 0),
@@ -791,7 +796,9 @@ static const char *jz4770_i2c0_groups[] = { "i2c0-data", };
 static const char *jz4770_i2c1_groups[] = { "i2c1-data", };
 static const char *jz4770_i2c2_groups[] = { "i2c2-data", };
 static const char *jz4770_cim_groups[] = { "cim-data-8bit", "cim-data-12bit", };
-static const char *jz4770_lcd_groups[] = { "lcd-24bit", "lcd-no-pins", };
+static const char *jz4770_lcd_groups[] = {
+	"lcd-8bit", "lcd-24bit", "lcd-no-pins",
+};
 static const char *jz4770_pwm0_groups[] = { "pwm0", };
 static const char *jz4770_pwm1_groups[] = { "pwm1", };
 static const char *jz4770_pwm2_groups[] = { "pwm2", };
-- 
2.28.0

