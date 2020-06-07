Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48EC71F0D70
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Jun 2020 19:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbgFGRnM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 7 Jun 2020 13:43:12 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:34640 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbgFGRnL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 7 Jun 2020 13:43:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1591551789; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=FSFQiXi8mo7IP2wgLUtgrK+iWKDgIGEwYt8WEKc9CXM=;
        b=J8xcGiwAWTIA3WSET0jy8NBC/G7jJAZFejSYvDyK6v6M3MR6fUj4Gxc1UrUXLUkAjmCvy8
        C7aXNtydM9PqoL7MHyyW4GsY4CHSYjn+cEwPGHIn/xQqd4wzr8BXn+GXa5hdKuvxTVzcYt
        UhQa9wAXTqTeAE1VTqkiBnqtlo348WM=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        od@zcrc.me, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] pinctrl: ingenic: Add NAND FRE/FWE pins for JZ4740
Date:   Sun,  7 Jun 2020 19:42:43 +0200
Message-Id: <20200607174243.2361664-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the FRE/FWE pins for the JZ4740.

These pins must be in function #0 for the NAND to work. The reason it
worked before was because the bootloader did set these pins to the
correct function beforehand.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/pinctrl/pinctrl-ingenic.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 6a8d44504f94..1da72438d680 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -124,6 +124,7 @@ static int jz4740_nand_cs1_pins[] = { 0x39, };
 static int jz4740_nand_cs2_pins[] = { 0x3a, };
 static int jz4740_nand_cs3_pins[] = { 0x3b, };
 static int jz4740_nand_cs4_pins[] = { 0x3c, };
+static int jz4740_nand_fre_fwe_pins[] = { 0x5c, 0x5d, };
 static int jz4740_pwm_pwm0_pins[] = { 0x77, };
 static int jz4740_pwm_pwm1_pins[] = { 0x78, };
 static int jz4740_pwm_pwm2_pins[] = { 0x79, };
@@ -146,6 +147,7 @@ static int jz4740_nand_cs1_funcs[] = { 0, };
 static int jz4740_nand_cs2_funcs[] = { 0, };
 static int jz4740_nand_cs3_funcs[] = { 0, };
 static int jz4740_nand_cs4_funcs[] = { 0, };
+static int jz4740_nand_fre_fwe_funcs[] = { 0, 0, };
 static int jz4740_pwm_pwm0_funcs[] = { 0, };
 static int jz4740_pwm_pwm1_funcs[] = { 0, };
 static int jz4740_pwm_pwm2_funcs[] = { 0, };
@@ -178,6 +180,7 @@ static const struct group_desc jz4740_groups[] = {
 	INGENIC_PIN_GROUP("nand-cs2", jz4740_nand_cs2),
 	INGENIC_PIN_GROUP("nand-cs3", jz4740_nand_cs3),
 	INGENIC_PIN_GROUP("nand-cs4", jz4740_nand_cs4),
+	INGENIC_PIN_GROUP("nand-fre-fwe", jz4740_nand_fre_fwe),
 	INGENIC_PIN_GROUP("pwm0", jz4740_pwm_pwm0),
 	INGENIC_PIN_GROUP("pwm1", jz4740_pwm_pwm1),
 	INGENIC_PIN_GROUP("pwm2", jz4740_pwm_pwm2),
@@ -195,7 +198,7 @@ static const char *jz4740_lcd_groups[] = {
 	"lcd-8bit", "lcd-16bit", "lcd-18bit", "lcd-18bit-tft", "lcd-no-pins",
 };
 static const char *jz4740_nand_groups[] = {
-	"nand-cs1", "nand-cs2", "nand-cs3", "nand-cs4",
+	"nand-cs1", "nand-cs2", "nand-cs3", "nand-cs4", "nand-fre-fwe",
 };
 static const char *jz4740_pwm0_groups[] = { "pwm0", };
 static const char *jz4740_pwm1_groups[] = { "pwm1", };
-- 
2.26.2

