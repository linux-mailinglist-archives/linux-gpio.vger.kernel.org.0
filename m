Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA62A1028AC
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2019 16:52:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728194AbfKSPw2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Nov 2019 10:52:28 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:53204 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728183AbfKSPw1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2019 10:52:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1574178740; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3FiBXtSRFixC8yyEq7mwTAb3MQ9xzazHpSbebQErgE4=;
        b=kEa7yRyF5p3u5qgzUTbPdi1RXF1PMPxndZjJ9Mgi2yuAWJjCnv00Nc5uLPz5svAla5DQAJ
        nwkS7HrasfkxGwMmAVI+mz3QruUQqstX9q1NWIUP1bLqJbZBmmWVYi2TX5SzDbluhfKyfh
        jKPfxOSlnfibV5uZDp7pl6Q1lvilUG4=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     od@zcrc.me, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/2] pinctrl: ingenic: Add OTG VBUS pin for the JZ4770
Date:   Tue, 19 Nov 2019 16:52:11 +0100
Message-Id: <20191119155211.102527-2-paul@crapouillou.net>
In-Reply-To: <20191119155211.102527-1-paul@crapouillou.net>
References: <20191119155211.102527-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pin mux configuration for the OTG VBUS pin of the JZ4770.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/pinctrl/pinctrl-ingenic.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index dbd907ef7cf0..44f96a4eb97c 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -686,6 +686,7 @@ static int jz4770_mac_rmii_pins[] = {
 	0xa9, 0xab, 0xaa, 0xac, 0xa5, 0xa4, 0xad, 0xae, 0xa6, 0xa8,
 };
 static int jz4770_mac_mii_pins[] = { 0xa7, 0xaf, };
+static int jz4770_otg_pins[] = { 0x8a, };
 
 static int jz4770_uart0_data_funcs[] = { 0, 0, };
 static int jz4770_uart0_hwflow_funcs[] = { 0, 0, };
@@ -744,6 +745,7 @@ static int jz4770_pwm_pwm6_funcs[] = { 0, };
 static int jz4770_pwm_pwm7_funcs[] = { 0, };
 static int jz4770_mac_rmii_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, };
 static int jz4770_mac_mii_funcs[] = { 0, 0, };
+static int jz4770_otg_funcs[] = { 0, };
 
 static const struct group_desc jz4770_groups[] = {
 	INGENIC_PIN_GROUP("uart0-data", jz4770_uart0_data),
@@ -799,6 +801,7 @@ static const struct group_desc jz4770_groups[] = {
 	INGENIC_PIN_GROUP("pwm7", jz4770_pwm_pwm7),
 	INGENIC_PIN_GROUP("mac-rmii", jz4770_mac_rmii),
 	INGENIC_PIN_GROUP("mac-mii", jz4770_mac_mii),
+	INGENIC_PIN_GROUP("otg-vbus", jz4770_otg),
 };
 
 static const char *jz4770_uart0_groups[] = { "uart0-data", "uart0-hwflow", };
@@ -841,6 +844,7 @@ static const char *jz4770_pwm5_groups[] = { "pwm5", };
 static const char *jz4770_pwm6_groups[] = { "pwm6", };
 static const char *jz4770_pwm7_groups[] = { "pwm7", };
 static const char *jz4770_mac_groups[] = { "mac-rmii", "mac-mii", };
+static const char *jz4770_otg_groups[] = { "otg-vbus", };
 
 static const struct function_desc jz4770_functions[] = {
 	{ "uart0", jz4770_uart0_groups, ARRAY_SIZE(jz4770_uart0_groups), },
@@ -871,6 +875,7 @@ static const struct function_desc jz4770_functions[] = {
 	{ "pwm6", jz4770_pwm6_groups, ARRAY_SIZE(jz4770_pwm6_groups), },
 	{ "pwm7", jz4770_pwm7_groups, ARRAY_SIZE(jz4770_pwm7_groups), },
 	{ "mac", jz4770_mac_groups, ARRAY_SIZE(jz4770_mac_groups), },
+	{ "otg", jz4770_otg_groups, ARRAY_SIZE(jz4770_otg_groups), },
 };
 
 static const struct ingenic_chip_info jz4770_chip_info = {
-- 
2.24.0

