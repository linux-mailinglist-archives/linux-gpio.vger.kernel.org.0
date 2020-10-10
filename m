Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EACF28A381
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Oct 2020 01:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731292AbgJJW47 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Oct 2020 18:56:59 -0400
Received: from aposti.net ([89.234.176.197]:48068 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731467AbgJJTZa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 10 Oct 2020 15:25:30 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Zhou Yanjie <zhouyanjie@wanyeetech.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Artur Rojek <contact@artur-rojek.eu>
Subject: [PATCH] pinctrl: ingenic: Fix invalid SSI pins
Date:   Sat, 10 Oct 2020 21:25:09 +0200
Message-Id: <20201010192509.9098-1-paul@crapouillou.net>
In-Reply-To: <CACRpkda1B3LcGWc1PhXNgi-6JxapiKY4F_94c6dk4eBLgVGBJg@mail.gmail.com>
References: <CACRpkda1B3LcGWc1PhXNgi-6JxapiKY4F_94c6dk4eBLgVGBJg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The values for the SSI pins on GPIO chips D and E were off by 0x20.

Fixes: d3ef8c6b2286 ("pinctrl: Ingenic: Add SSI pins support for JZ4770 and JZ4780.")
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reported-by: Artur Rojek <contact@artur-rojek.eu>
---
 drivers/pinctrl/pinctrl-ingenic.c | 72 +++++++++++++++----------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index c8e50a58a5e5..621909b01deb 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -635,44 +635,44 @@ static int jz4770_uart3_data_pins[] = { 0x6c, 0x85, };
 static int jz4770_uart3_hwflow_pins[] = { 0x88, 0x89, };
 static int jz4770_ssi0_dt_a_pins[] = { 0x15, };
 static int jz4770_ssi0_dt_b_pins[] = { 0x35, };
-static int jz4770_ssi0_dt_d_pins[] = { 0x55, };
-static int jz4770_ssi0_dt_e_pins[] = { 0x71, };
+static int jz4770_ssi0_dt_d_pins[] = { 0x75, };
+static int jz4770_ssi0_dt_e_pins[] = { 0x91, };
 static int jz4770_ssi0_dr_a_pins[] = { 0x14, };
 static int jz4770_ssi0_dr_b_pins[] = { 0x34, };
-static int jz4770_ssi0_dr_d_pins[] = { 0x54, };
-static int jz4770_ssi0_dr_e_pins[] = { 0x6e, };
+static int jz4770_ssi0_dr_d_pins[] = { 0x74, };
+static int jz4770_ssi0_dr_e_pins[] = { 0x8e, };
 static int jz4770_ssi0_clk_a_pins[] = { 0x12, };
 static int jz4770_ssi0_clk_b_pins[] = { 0x3c, };
-static int jz4770_ssi0_clk_d_pins[] = { 0x58, };
-static int jz4770_ssi0_clk_e_pins[] = { 0x6f, };
+static int jz4770_ssi0_clk_d_pins[] = { 0x78, };
+static int jz4770_ssi0_clk_e_pins[] = { 0x8f, };
 static int jz4770_ssi0_gpc_b_pins[] = { 0x3e, };
-static int jz4770_ssi0_gpc_d_pins[] = { 0x56, };
-static int jz4770_ssi0_gpc_e_pins[] = { 0x73, };
+static int jz4770_ssi0_gpc_d_pins[] = { 0x76, };
+static int jz4770_ssi0_gpc_e_pins[] = { 0x93, };
 static int jz4770_ssi0_ce0_a_pins[] = { 0x13, };
 static int jz4770_ssi0_ce0_b_pins[] = { 0x3d, };
-static int jz4770_ssi0_ce0_d_pins[] = { 0x59, };
-static int jz4770_ssi0_ce0_e_pins[] = { 0x70, };
+static int jz4770_ssi0_ce0_d_pins[] = { 0x79, };
+static int jz4770_ssi0_ce0_e_pins[] = { 0x90, };
 static int jz4770_ssi0_ce1_b_pins[] = { 0x3f, };
-static int jz4770_ssi0_ce1_d_pins[] = { 0x57, };
-static int jz4770_ssi0_ce1_e_pins[] = { 0x72, };
+static int jz4770_ssi0_ce1_d_pins[] = { 0x77, };
+static int jz4770_ssi0_ce1_e_pins[] = { 0x92, };
 static int jz4770_ssi1_dt_b_pins[] = { 0x35, };
-static int jz4770_ssi1_dt_d_pins[] = { 0x55, };
-static int jz4770_ssi1_dt_e_pins[] = { 0x71, };
+static int jz4770_ssi1_dt_d_pins[] = { 0x75, };
+static int jz4770_ssi1_dt_e_pins[] = { 0x91, };
 static int jz4770_ssi1_dr_b_pins[] = { 0x34, };
-static int jz4770_ssi1_dr_d_pins[] = { 0x54, };
-static int jz4770_ssi1_dr_e_pins[] = { 0x6e, };
+static int jz4770_ssi1_dr_d_pins[] = { 0x74, };
+static int jz4770_ssi1_dr_e_pins[] = { 0x8e, };
 static int jz4770_ssi1_clk_b_pins[] = { 0x3c, };
-static int jz4770_ssi1_clk_d_pins[] = { 0x58, };
-static int jz4770_ssi1_clk_e_pins[] = { 0x6f, };
+static int jz4770_ssi1_clk_d_pins[] = { 0x78, };
+static int jz4770_ssi1_clk_e_pins[] = { 0x8f, };
 static int jz4770_ssi1_gpc_b_pins[] = { 0x3e, };
-static int jz4770_ssi1_gpc_d_pins[] = { 0x56, };
-static int jz4770_ssi1_gpc_e_pins[] = { 0x73, };
+static int jz4770_ssi1_gpc_d_pins[] = { 0x76, };
+static int jz4770_ssi1_gpc_e_pins[] = { 0x93, };
 static int jz4770_ssi1_ce0_b_pins[] = { 0x3d, };
-static int jz4770_ssi1_ce0_d_pins[] = { 0x59, };
-static int jz4770_ssi1_ce0_e_pins[] = { 0x70, };
+static int jz4770_ssi1_ce0_d_pins[] = { 0x79, };
+static int jz4770_ssi1_ce0_e_pins[] = { 0x90, };
 static int jz4770_ssi1_ce1_b_pins[] = { 0x3f, };
-static int jz4770_ssi1_ce1_d_pins[] = { 0x57, };
-static int jz4770_ssi1_ce1_e_pins[] = { 0x72, };
+static int jz4770_ssi1_ce1_d_pins[] = { 0x77, };
+static int jz4770_ssi1_ce1_e_pins[] = { 0x92, };
 static int jz4770_mmc0_1bit_a_pins[] = { 0x12, 0x13, 0x14, };
 static int jz4770_mmc0_4bit_a_pins[] = { 0x15, 0x16, 0x17, };
 static int jz4770_mmc0_1bit_e_pins[] = { 0x9c, 0x9d, 0x94, };
@@ -1050,35 +1050,35 @@ static int jz4780_ssi0_dt_a_19_pins[] = { 0x13, };
 static int jz4780_ssi0_dt_a_21_pins[] = { 0x15, };
 static int jz4780_ssi0_dt_a_28_pins[] = { 0x1c, };
 static int jz4780_ssi0_dt_b_pins[] = { 0x3d, };
-static int jz4780_ssi0_dt_d_pins[] = { 0x59, };
+static int jz4780_ssi0_dt_d_pins[] = { 0x79, };
 static int jz4780_ssi0_dr_a_20_pins[] = { 0x14, };
 static int jz4780_ssi0_dr_a_27_pins[] = { 0x1b, };
 static int jz4780_ssi0_dr_b_pins[] = { 0x34, };
-static int jz4780_ssi0_dr_d_pins[] = { 0x54, };
+static int jz4780_ssi0_dr_d_pins[] = { 0x74, };
 static int jz4780_ssi0_clk_a_pins[] = { 0x12, };
 static int jz4780_ssi0_clk_b_5_pins[] = { 0x25, };
 static int jz4780_ssi0_clk_b_28_pins[] = { 0x3c, };
-static int jz4780_ssi0_clk_d_pins[] = { 0x58, };
+static int jz4780_ssi0_clk_d_pins[] = { 0x78, };
 static int jz4780_ssi0_gpc_b_pins[] = { 0x3e, };
-static int jz4780_ssi0_gpc_d_pins[] = { 0x56, };
+static int jz4780_ssi0_gpc_d_pins[] = { 0x76, };
 static int jz4780_ssi0_ce0_a_23_pins[] = { 0x17, };
 static int jz4780_ssi0_ce0_a_25_pins[] = { 0x19, };
 static int jz4780_ssi0_ce0_b_pins[] = { 0x3f, };
-static int jz4780_ssi0_ce0_d_pins[] = { 0x57, };
+static int jz4780_ssi0_ce0_d_pins[] = { 0x77, };
 static int jz4780_ssi0_ce1_b_pins[] = { 0x35, };
-static int jz4780_ssi0_ce1_d_pins[] = { 0x55, };
+static int jz4780_ssi0_ce1_d_pins[] = { 0x75, };
 static int jz4780_ssi1_dt_b_pins[] = { 0x3d, };
-static int jz4780_ssi1_dt_d_pins[] = { 0x59, };
+static int jz4780_ssi1_dt_d_pins[] = { 0x79, };
 static int jz4780_ssi1_dr_b_pins[] = { 0x34, };
-static int jz4780_ssi1_dr_d_pins[] = { 0x54, };
+static int jz4780_ssi1_dr_d_pins[] = { 0x74, };
 static int jz4780_ssi1_clk_b_pins[] = { 0x3c, };
-static int jz4780_ssi1_clk_d_pins[] = { 0x58, };
+static int jz4780_ssi1_clk_d_pins[] = { 0x78, };
 static int jz4780_ssi1_gpc_b_pins[] = { 0x3e, };
-static int jz4780_ssi1_gpc_d_pins[] = { 0x56, };
+static int jz4780_ssi1_gpc_d_pins[] = { 0x76, };
 static int jz4780_ssi1_ce0_b_pins[] = { 0x3f, };
-static int jz4780_ssi1_ce0_d_pins[] = { 0x57, };
+static int jz4780_ssi1_ce0_d_pins[] = { 0x77, };
 static int jz4780_ssi1_ce1_b_pins[] = { 0x35, };
-static int jz4780_ssi1_ce1_d_pins[] = { 0x55, };
+static int jz4780_ssi1_ce1_d_pins[] = { 0x75, };
 static int jz4780_mmc0_8bit_a_pins[] = { 0x04, 0x05, 0x06, 0x07, 0x18, };
 static int jz4780_i2c3_pins[] = { 0x6a, 0x6b, };
 static int jz4780_i2c4_e_pins[] = { 0x8c, 0x8d, };
-- 
2.28.0

