Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF519FA4C8
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 03:19:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729242AbfKMCSa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Nov 2019 21:18:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:47306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729187AbfKMBzj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 Nov 2019 20:55:39 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 73C3522467;
        Wed, 13 Nov 2019 01:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573610138;
        bh=0heLWYa1fdiA1uuMdun/a5Epn3QCmKknV7kBb7keeDo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Nd4qgrkmPsezNRS2S6pyx8yw/MxPuhwVN3ytOovDJY824CumNarhvg1ZbIDN8ME3F
         HepG5hfpm0HpHqmpClIm9h7DNBW+x+NEqEIxg854SYfPQqTiZYQUdC7mc06ONG++5h
         sBs0YHJtMxWFA2ACQh4HQE21CrU8WLTAfcwtBuCA=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Sasha Levin <sashal@kernel.org>, linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 186/209] pinctrl: gemini: Fix up TVC clock group
Date:   Tue, 12 Nov 2019 20:50:02 -0500
Message-Id: <20191113015025.9685-186-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113015025.9685-1-sashal@kernel.org>
References: <20191113015025.9685-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Linus Walleij <linus.walleij@linaro.org>

[ Upstream commit a85c928f6a7856a09e47d9b37faa3407c7ac6a8e ]

The previous fix made the TVC clock get muxed in on the
D-Link DIR-685 instead of giving nagging warnings of this
not working. Not good. We didn't want that, as it breaks
video.

Create a specific group for the TVC CLK, and break out
a specific GPIO group for it on the SL3516 so we can use
that line as GPIO if we don't need the TVC CLK.

Fixes: d17f477c5bc6 ("pinctrl: gemini: Mask and set properly")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/pinctrl-gemini.c | 44 ++++++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-gemini.c b/drivers/pinctrl/pinctrl-gemini.c
index 1e484a36ff07e..3535f98418615 100644
--- a/drivers/pinctrl/pinctrl-gemini.c
+++ b/drivers/pinctrl/pinctrl-gemini.c
@@ -591,13 +591,16 @@ static const unsigned int tvc_3512_pins[] = {
 	319, /* TVC_DATA[1] */
 	301, /* TVC_DATA[2] */
 	283, /* TVC_DATA[3] */
-	265, /* TVC_CLK */
 	320, /* TVC_DATA[4] */
 	302, /* TVC_DATA[5] */
 	284, /* TVC_DATA[6] */
 	266, /* TVC_DATA[7] */
 };
 
+static const unsigned int tvc_clk_3512_pins[] = {
+	265, /* TVC_CLK */
+};
+
 /* NAND flash pins */
 static const unsigned int nflash_3512_pins[] = {
 	199, 200, 201, 202, 216, 217, 218, 219, 220, 234, 235, 236, 237, 252,
@@ -629,7 +632,7 @@ static const unsigned int pflash_3512_pins_extended[] = {
 /* Serial flash pins CE0, CE1, DI, DO, CK */
 static const unsigned int sflash_3512_pins[] = { 230, 231, 232, 233, 211 };
 
-/* The GPIO0A (0) pin overlap with TVC and extended parallel flash */
+/* The GPIO0A (0) pin overlap with TVC CLK and extended parallel flash */
 static const unsigned int gpio0a_3512_pins[] = { 265 };
 
 /* The GPIO0B (1-4) pins overlap with TVC and ICE */
@@ -823,7 +826,13 @@ static const struct gemini_pin_group gemini_3512_pin_groups[] = {
 		.num_pins = ARRAY_SIZE(tvc_3512_pins),
 		/* Conflict with character LCD and ICE */
 		.mask = LCD_PADS_ENABLE,
-		.value = TVC_PADS_ENABLE | TVC_CLK_PAD_ENABLE,
+		.value = TVC_PADS_ENABLE,
+	},
+	{
+		.name = "tvcclkgrp",
+		.pins = tvc_clk_3512_pins,
+		.num_pins = ARRAY_SIZE(tvc_clk_3512_pins),
+		.value = TVC_CLK_PAD_ENABLE,
 	},
 	/*
 	 * The construction is done such that it is possible to use a serial
@@ -860,8 +869,8 @@ static const struct gemini_pin_group gemini_3512_pin_groups[] = {
 		.name = "gpio0agrp",
 		.pins = gpio0a_3512_pins,
 		.num_pins = ARRAY_SIZE(gpio0a_3512_pins),
-		/* Conflict with TVC */
-		.mask = TVC_PADS_ENABLE,
+		/* Conflict with TVC CLK */
+		.mask = TVC_CLK_PAD_ENABLE,
 	},
 	{
 		.name = "gpio0bgrp",
@@ -1531,13 +1540,16 @@ static const unsigned int tvc_3516_pins[] = {
 	311, /* TVC_DATA[1] */
 	394, /* TVC_DATA[2] */
 	374, /* TVC_DATA[3] */
-	333, /* TVC_CLK */
 	354, /* TVC_DATA[4] */
 	395, /* TVC_DATA[5] */
 	312, /* TVC_DATA[6] */
 	334, /* TVC_DATA[7] */
 };
 
+static const unsigned int tvc_clk_3516_pins[] = {
+	333, /* TVC_CLK */
+};
+
 /* NAND flash pins */
 static const unsigned int nflash_3516_pins[] = {
 	243, 260, 261, 224, 280, 262, 281, 264, 300, 263, 282, 301, 320, 283,
@@ -1570,7 +1582,7 @@ static const unsigned int pflash_3516_pins_extended[] = {
 static const unsigned int sflash_3516_pins[] = { 296, 338, 295, 359, 339 };
 
 /* The GPIO0A (0-4) pins overlap with TVC and extended parallel flash */
-static const unsigned int gpio0a_3516_pins[] = { 333, 354, 395, 312, 334 };
+static const unsigned int gpio0a_3516_pins[] = { 354, 395, 312, 334 };
 
 /* The GPIO0B (5-7) pins overlap with ICE */
 static const unsigned int gpio0b_3516_pins[] = { 375, 396, 376 };
@@ -1602,6 +1614,9 @@ static const unsigned int gpio0j_3516_pins[] = { 359, 339 };
 /* The GPIO0K (30,31) pins overlap with NAND flash */
 static const unsigned int gpio0k_3516_pins[] = { 275, 298 };
 
+/* The GPIO0L (0) pins overlap with TVC_CLK */
+static const unsigned int gpio0l_3516_pins[] = { 333 };
+
 /* The GPIO1A (0-4) pins that overlap with IDE and parallel flash */
 static const unsigned int gpio1a_3516_pins[] = { 221, 200, 222, 201, 220 };
 
@@ -1761,7 +1776,13 @@ static const struct gemini_pin_group gemini_3516_pin_groups[] = {
 		.num_pins = ARRAY_SIZE(tvc_3516_pins),
 		/* Conflict with character LCD */
 		.mask = LCD_PADS_ENABLE,
-		.value = TVC_PADS_ENABLE | TVC_CLK_PAD_ENABLE,
+		.value = TVC_PADS_ENABLE,
+	},
+	{
+		.name = "tvcclkgrp",
+		.pins = tvc_clk_3516_pins,
+		.num_pins = ARRAY_SIZE(tvc_clk_3516_pins),
+		.value = TVC_CLK_PAD_ENABLE,
 	},
 	/*
 	 * The construction is done such that it is possible to use a serial
@@ -1872,6 +1893,13 @@ static const struct gemini_pin_group gemini_3516_pin_groups[] = {
 		/* Conflict with parallel and NAND flash */
 		.value = PFLASH_PADS_DISABLE | NAND_PADS_DISABLE,
 	},
+	{
+		.name = "gpio0lgrp",
+		.pins = gpio0l_3516_pins,
+		.num_pins = ARRAY_SIZE(gpio0l_3516_pins),
+		/* Conflict with TVE CLK */
+		.mask = TVC_CLK_PAD_ENABLE,
+	},
 	{
 		.name = "gpio1agrp",
 		.pins = gpio1a_3516_pins,
-- 
2.20.1

