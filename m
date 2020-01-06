Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 636C9131C56
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 00:27:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727308AbgAFX1n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jan 2020 18:27:43 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:40084 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726599AbgAFX1n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jan 2020 18:27:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1578353249; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rjiMBqJrVTsYAr3CDI0CHR05UkBBzGQQXFjv6S5FpPI=;
        b=nxoftjFHppVfEYzaa8U5xw2WxYnC+V16vC7beSopcHnxfOy4FuVVgEnqx6uG4VRXfparQW
        s7jem1p0Liav/0YWJzp+uKGuGb1a5weM11+UVfquiconJlgjmw4Xe+38L6SiB6PpAZjyEb
        Rqqw7MBAa8YthjLmCdrg2ctmlHvRh+k=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        od@zcrc.me, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 3/5] pinctrl: ingenic: Remove duplicated ingenic_chip_info structures
Date:   Tue,  7 Jan 2020 00:27:09 +0100
Message-Id: <20200106232711.559727-4-paul@crapouillou.net>
In-Reply-To: <20200106232711.559727-1-paul@crapouillou.net>
References: <20200106232711.559727-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Until there is the need to handle the JZ4760B and X1000E differently
there is no reason to use a separate ingenic_chip_info since the data
it contains is the same than for the JZ4760 and X1000 respectively.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/pinctrl/pinctrl-ingenic.c | 30 ++----------------------------
 1 file changed, 2 insertions(+), 28 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 7a1d6a720b78..7f73f27cce91 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -61,11 +61,9 @@ enum jz_version {
 	ID_JZ4740,
 	ID_JZ4725B,
 	ID_JZ4760,
-	ID_JZ4760B,
 	ID_JZ4770,
 	ID_JZ4780,
 	ID_X1000,
-	ID_X1000E,
 	ID_X1500,
 	ID_X1830,
 };
@@ -615,18 +613,6 @@ static const struct ingenic_chip_info jz4760_chip_info = {
 	.pull_downs = jz4760_pull_downs,
 };
 
-static const struct ingenic_chip_info jz4760b_chip_info = {
-	.num_chips = 6,
-	.reg_offset = 0x100,
-	.version = ID_JZ4760B,
-	.groups = jz4760_groups,
-	.num_groups = ARRAY_SIZE(jz4760_groups),
-	.functions = jz4760_functions,
-	.num_functions = ARRAY_SIZE(jz4760_functions),
-	.pull_ups = jz4760_pull_ups,
-	.pull_downs = jz4760_pull_downs,
-};
-
 static const u32 jz4770_pull_ups[6] = {
 	0x3fffffff, 0xfff0030c, 0xffffffff, 0xffff4fff, 0xfffffb7c, 0xffa7f00f,
 };
@@ -1300,18 +1286,6 @@ static const struct ingenic_chip_info x1000_chip_info = {
 	.pull_downs = x1000_pull_downs,
 };
 
-static const struct ingenic_chip_info x1000e_chip_info = {
-	.num_chips = 4,
-	.reg_offset = 0x100,
-	.version = ID_X1000E,
-	.groups = x1000_groups,
-	.num_groups = ARRAY_SIZE(x1000_groups),
-	.functions = x1000_functions,
-	.num_functions = ARRAY_SIZE(x1000_functions),
-	.pull_ups = x1000_pull_ups,
-	.pull_downs = x1000_pull_downs,
-};
-
 static int x1500_uart0_data_pins[] = { 0x4a, 0x4b, };
 static int x1500_uart0_hwflow_pins[] = { 0x4c, 0x4d, };
 static int x1500_uart1_data_a_pins[] = { 0x04, 0x05, };
@@ -2460,11 +2434,11 @@ static const struct of_device_id ingenic_pinctrl_of_match[] = {
 	{ .compatible = "ingenic,jz4740-pinctrl", .data = &jz4740_chip_info },
 	{ .compatible = "ingenic,jz4725b-pinctrl", .data = &jz4725b_chip_info },
 	{ .compatible = "ingenic,jz4760-pinctrl", .data = &jz4760_chip_info },
-	{ .compatible = "ingenic,jz4760b-pinctrl", .data = &jz4760b_chip_info },
+	{ .compatible = "ingenic,jz4760b-pinctrl", .data = &jz4760_chip_info },
 	{ .compatible = "ingenic,jz4770-pinctrl", .data = &jz4770_chip_info },
 	{ .compatible = "ingenic,jz4780-pinctrl", .data = &jz4780_chip_info },
 	{ .compatible = "ingenic,x1000-pinctrl", .data = &x1000_chip_info },
-	{ .compatible = "ingenic,x1000e-pinctrl", .data = &x1000e_chip_info },
+	{ .compatible = "ingenic,x1000e-pinctrl", .data = &x1000_chip_info },
 	{ .compatible = "ingenic,x1500-pinctrl", .data = &x1500_chip_info },
 	{ .compatible = "ingenic,x1830-pinctrl", .data = &x1830_chip_info },
 	{},
-- 
2.24.1

