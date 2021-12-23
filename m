Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6A5647E530
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:56:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239929AbhLWO4d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:56:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239951AbhLWO4b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:56:31 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6B50C06175A
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:56:30 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id ZqwV260044C55Sk01qwV2a; Thu, 23 Dec 2021 15:56:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PW8-006aMM-SG; Thu, 23 Dec 2021 15:56:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PW8-003rxQ-62; Thu, 23 Dec 2021 15:56:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 09/10] pinctrl: renesas: checker: Check bias pin conflicts
Date:   Thu, 23 Dec 2021 15:56:25 +0100
Message-Id: <dbda76f342258f8029f0420fbe3f341a9abd6f01.1640270559.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640270559.git.geert+renesas@glider.be>
References: <cover.1640270559.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Check that there is only a single entry for each pin with pull-up and/or
pull-down capabilities.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/core.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index ef88359ddf5c0f2a..1e0b21428e83c549 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -1161,6 +1161,28 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 	for (i = 0; bias_regs && (bias_regs[i].puen || bias_regs[i].pud); i++)
 		sh_pfc_check_bias_reg(info, &bias_regs[i]);
 
+	for (i = 0; bias_regs &&
+		    (bias_regs[i / 32].puen || bias_regs[i / 32].pud); i++) {
+		if (bias_regs[i / 32].pins[i % 32] == SH_PFC_PIN_NONE)
+			continue;
+
+		for (j = 0; j < i; j++) {
+			if (bias_regs[i / 32].pins[i % 32] !=
+			    bias_regs[j / 32].pins[j % 32])
+				continue;
+
+			if (bias_regs[i / 32].puen && bias_regs[j / 32].puen)
+				sh_pfc_err("bias_reg 0x%x:%u/0x%x:%u: pin conflict\n",
+					   bias_regs[i / 32].puen, i % 32,
+					   bias_regs[j / 32].puen, j % 32);
+			if (bias_regs[i / 32].pud && bias_regs[j / 32].pud)
+				sh_pfc_err("bias_reg 0x%x:%u/0x%x:%u: pin conflict\n",
+					   bias_regs[i / 32].pud, i % 32,
+					   bias_regs[j / 32].pud, j % 32);
+		}
+
+	}
+
 	/* Check ioctrl registers */
 	for (i = 0; info->ioctrl_regs && info->ioctrl_regs[i].reg; i++)
 		sh_pfc_check_reg(drvname, info->ioctrl_regs[i].reg, U32_MAX);
-- 
2.25.1

