Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE3A647E531
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:56:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244000AbhLWO4e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:56:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239963AbhLWO4c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:56:32 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDB69C06175D
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:56:30 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id ZqwV2600H4C55Sk01qwVZ9; Thu, 23 Dec 2021 15:56:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PW8-006aML-Sp; Thu, 23 Dec 2021 15:56:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PW8-003rxJ-5G; Thu, 23 Dec 2021 15:56:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 08/10] pinctrl: renesas: checker: Validate I/O voltage configs consistency
Date:   Thu, 23 Dec 2021 15:56:24 +0100
Message-Id: <de81cced01ae3f26d341177d66d4b8e918fbfb76.1640270559.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640270559.git.geert+renesas@glider.be>
References: <cover.1640270559.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Validate consistency of the pin control tables for pins with I/O voltage
capabilities.  If a pin has I/O voltage register bits declarations
through .pin_to_pocctrl(), the SH_PFC_PIN_CFG_IO_VOLTAGE flag should be
set in the pin's configs, and vice versa.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/core.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index 1789c96ad2aa2c79..ef88359ddf5c0f2a 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -747,6 +747,7 @@ static unsigned int sh_pfc_errors __initdata;
 static unsigned int sh_pfc_warnings __initdata;
 static bool sh_pfc_bias_done __initdata;
 static bool sh_pfc_drive_done __initdata;
+static bool sh_pfc_power_done __initdata;
 static struct {
 	u32 reg;
 	u32 bits;
@@ -1009,6 +1010,7 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 	sh_pfc_num_enums = 0;
 	sh_pfc_bias_done = false;
 	sh_pfc_drive_done = false;
+	sh_pfc_power_done = false;
 
 	/* Check pins */
 	for (i = 0; i < info->nr_pins; i++) {
@@ -1082,6 +1084,18 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 						   pin->name);
 			}
 		}
+
+		if (pin->configs & SH_PFC_PIN_CFG_IO_VOLTAGE) {
+			if (!info->ops || !info->ops->pin_to_pocctrl)
+				sh_pfc_err_once(power, "SH_PFC_PIN_CFG_IO_VOLTAGE flag set but .pin_to_pocctrl() not implemented\n");
+			else if (info->ops->pin_to_pocctrl(pin->pin, &x) < 0)
+				sh_pfc_err("pin %s: SH_PFC_PIN_CFG_IO_VOLTAGE set but invalid pin_to_pocctrl()\n",
+					   pin->name);
+		} else if (info->ops && info->ops->pin_to_pocctrl &&
+			   info->ops->pin_to_pocctrl(pin->pin, &x) >= 0) {
+			sh_pfc_warn("pin %s: SH_PFC_PIN_CFG_IO_VOLTAGE not set but valid pin_to_pocctrl()\n",
+				    pin->name);
+		}
 	}
 
 	/* Check groups and functions */
-- 
2.25.1

