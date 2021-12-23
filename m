Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F4E347E4B2
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:42:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348873AbhLWOmV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:42:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348883AbhLWOmQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:42:16 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFB9EC0617A1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:42:15 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by michel.telenet-ops.be with bizsmtp
        id ZqiD2600M1rdBcm06qiDap; Thu, 23 Dec 2021 15:42:13 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-006a9G-SU; Thu, 23 Dec 2021 15:42:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-003ra1-7j; Thu, 23 Dec 2021 15:42:12 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 16/60] pinctrl: renesas: r8a7778: Share MMC pin group data
Date:   Thu, 23 Dec 2021 15:41:26 +0100
Message-Id: <d3bf7dfda2952a0265171f82024931d490d9178a.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640269757.git.geert+renesas@glider.be>
References: <cover.1640269757.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pin groups mmc_data[14] are subsets of mmc_data8.

This reduces kernel size by 40 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a7778.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7778.c b/drivers/pinctrl/renesas/pfc-r8a7778.c
index d641e408f1bd413c..3b9bdd27cab98cc6 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7778.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7778.c
@@ -1427,25 +1427,17 @@ I2C_PFC_MUX(i2c3_c,	SDA3_C,			SCL3_C);
 /* - MMC macro -------------------------------------------------------------- */
 #define MMC_PFC_PINS(name, args...)		SH_PFC_PINS(name, args)
 #define MMC_PFC_CTRL(name, clk, cmd)		SH_PFC_MUX2(name, clk, cmd)
-#define MMC_PFC_DAT1(name, d0)			SH_PFC_MUX1(name, d0)
-#define MMC_PFC_DAT4(name, d0, d1, d2, d3)	SH_PFC_MUX4(name, d0, d1, d2, d3)
 #define MMC_PFC_DAT8(name, d0, d1, d2, d3, d4, d5, d6, d7)	\
 			SH_PFC_MUX8(name, d0, d1, d2, d3, d4, d5, d6, d7)
 
 /* - MMC -------------------------------------------------------------------- */
 MMC_PFC_PINS(mmc_ctrl,		RCAR_GP_PIN(1, 5),	RCAR_GP_PIN(1, 6));
 MMC_PFC_CTRL(mmc_ctrl,		MMC_CLK,		MMC_CMD);
-MMC_PFC_PINS(mmc_data1,		RCAR_GP_PIN(1, 7));
-MMC_PFC_DAT1(mmc_data1,		MMC_D0);
-MMC_PFC_PINS(mmc_data4,		RCAR_GP_PIN(1, 7),	RCAR_GP_PIN(1, 8),
-				RCAR_GP_PIN(0, 5),	RCAR_GP_PIN(0, 6));
-MMC_PFC_DAT4(mmc_data4,		MMC_D0,			MMC_D1,
-				MMC_D2,			MMC_D3);
-MMC_PFC_PINS(mmc_data8,		RCAR_GP_PIN(1, 7),	RCAR_GP_PIN(1, 8),
+MMC_PFC_PINS(mmc_data,		RCAR_GP_PIN(1, 7),	RCAR_GP_PIN(1, 8),
 				RCAR_GP_PIN(0, 5),	RCAR_GP_PIN(0, 6),
 				RCAR_GP_PIN(1, 4),	RCAR_GP_PIN(1, 0),
 				RCAR_GP_PIN(0, 30),	RCAR_GP_PIN(0, 31));
-MMC_PFC_DAT8(mmc_data8,		MMC_D0,			MMC_D1,
+MMC_PFC_DAT8(mmc_data,		MMC_D0,			MMC_D1,
 				MMC_D2,			MMC_D3,
 				MMC_D4,			MMC_D5,
 				MMC_D6,			MMC_D7);
@@ -1744,9 +1736,9 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(i2c3_b),
 	SH_PFC_PIN_GROUP(i2c3_c),
 	SH_PFC_PIN_GROUP(mmc_ctrl),
-	SH_PFC_PIN_GROUP(mmc_data1),
-	SH_PFC_PIN_GROUP(mmc_data4),
-	SH_PFC_PIN_GROUP(mmc_data8),
+	BUS_DATA_PIN_GROUP(mmc_data, 1),
+	BUS_DATA_PIN_GROUP(mmc_data, 4),
+	BUS_DATA_PIN_GROUP(mmc_data, 8),
 	SH_PFC_PIN_GROUP(scif_clk),
 	SH_PFC_PIN_GROUP(scif0_data_a),
 	SH_PFC_PIN_GROUP(scif0_data_b),
-- 
2.25.1

