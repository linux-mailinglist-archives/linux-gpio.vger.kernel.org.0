Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5615B12523D
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 20:48:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbfLRTsS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 14:48:18 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:48026 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727031AbfLRTsR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Dec 2019 14:48:17 -0500
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id fXoF2100E5USYZQ01XoFXL; Wed, 18 Dec 2019 20:48:16 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ihfIt-0007xm-Em; Wed, 18 Dec 2019 20:48:15 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ihfIt-0003KO-Du; Wed, 18 Dec 2019 20:48:15 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/6] pinctrl: sh-pfc: sh7264: Fix Port K I/O Register 0 definition
Date:   Wed, 18 Dec 2019 20:48:08 +0100
Message-Id: <20191218194812.12741-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218194812.12741-1-geert+renesas@glider.be>
References: <20191218194812.12741-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The register definition for the Port K I/O Register is accidentally
using the defines for Port J.  Replace them by the proper Port K
defines.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
The runtime-check under development reports:

    sh7264_pfc: config reg 0xfffe3932/8 enum_id 234 conflict
    sh7264_pfc: config reg 0xfffe3932/9 enum_id 360 conflict
    sh7264_pfc: config reg 0xfffe3932/10 enum_id 235 conflict
    sh7264_pfc: config reg 0xfffe3932/11 enum_id 361 conflict
    sh7264_pfc: config reg 0xfffe3932/12 enum_id 236 conflict
    sh7264_pfc: config reg 0xfffe3932/13 enum_id 362 conflict
    sh7264_pfc: config reg 0xfffe3932/14 enum_id 237 conflict
    sh7264_pfc: config reg 0xfffe3932/15 enum_id 363 conflict
---
 drivers/pinctrl/sh-pfc/pfc-sh7264.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-sh7264.c b/drivers/pinctrl/sh-pfc/pfc-sh7264.c
index 4a95867deb8af42a..4117bd8c0f413f99 100644
--- a/drivers/pinctrl/sh-pfc/pfc-sh7264.c
+++ b/drivers/pinctrl/sh-pfc/pfc-sh7264.c
@@ -2020,18 +2020,18 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 
 	{ PINMUX_CFG_REG("PKIOR0", 0xfffe3932, 16, 1, GROUP(
 		0, 0, 0, 0, 0, 0, 0, 0,
-		PJ11_IN, PJ11_OUT,
-		PJ10_IN, PJ10_OUT,
-		PJ9_IN, PJ9_OUT,
-		PJ8_IN, PJ8_OUT,
-		PJ7_IN, PJ7_OUT,
-		PJ6_IN, PJ6_OUT,
-		PJ5_IN, PJ5_OUT,
-		PJ4_IN, PJ4_OUT,
-		PJ3_IN, PJ3_OUT,
-		PJ2_IN, PJ2_OUT,
-		PJ1_IN, PJ1_OUT,
-		PJ0_IN, PJ0_OUT ))
+		PK11_IN, PK11_OUT,
+		PK10_IN, PK10_OUT,
+		PK9_IN, PK9_OUT,
+		PK8_IN, PK8_OUT,
+		PK7_IN, PK7_OUT,
+		PK6_IN, PK6_OUT,
+		PK5_IN, PK5_OUT,
+		PK4_IN, PK4_OUT,
+		PK3_IN, PK3_OUT,
+		PK2_IN, PK2_OUT,
+		PK1_IN, PK1_OUT,
+		PK0_IN, PK0_OUT ))
 	},
 	{}
 };
-- 
2.17.1

