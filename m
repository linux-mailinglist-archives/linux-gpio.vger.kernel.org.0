Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58EFF454582
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Nov 2021 12:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236718AbhKQLXH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Nov 2021 06:23:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236709AbhKQLXE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Nov 2021 06:23:04 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BB55C061746
        for <linux-gpio@vger.kernel.org>; Wed, 17 Nov 2021 03:20:05 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:ddf9:dff6:f4f:5b4a])
        by baptiste.telenet-ops.be with bizsmtp
        id KPL22600X3CS3Fw01PL2C8; Wed, 17 Nov 2021 12:20:02 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mnIyw-00D8m3-A4; Wed, 17 Nov 2021 12:20:02 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mnHj3-002jJ3-K7; Wed, 17 Nov 2021 10:59:33 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: Remove unneeded locking around sh_pfc_read() calls
Date:   Wed, 17 Nov 2021 10:59:32 +0100
Message-Id: <2008ca99f0079fd5d4e640b7ef78710c98cc9f77.1637143108.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is no need to acquire the spinlock when reading from a pin
controller register:
  1. Reading a single MMIO register is an atomic operation,
  2. While sh_pfc_phys_to_virt() inside sh_pfc_read() has to traverse
     all mapped windows to find the appropriate virtual address, this
     does not need any locking, as the window mappings are never
     changed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-pinctrl-for-v5.17.

 drivers/pinctrl/renesas/pinctrl.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl.c b/drivers/pinctrl/renesas/pinctrl.c
index f3eecb20c0869a41..96b9de974246ac23 100644
--- a/drivers/pinctrl/renesas/pinctrl.c
+++ b/drivers/pinctrl/renesas/pinctrl.c
@@ -504,7 +504,6 @@ static u32 sh_pfc_pinconf_find_drive_strength_reg(struct sh_pfc *pfc,
 static int sh_pfc_pinconf_get_drive_strength(struct sh_pfc *pfc,
 					     unsigned int pin)
 {
-	unsigned long flags;
 	unsigned int offset;
 	unsigned int size;
 	u32 reg;
@@ -514,11 +513,7 @@ static int sh_pfc_pinconf_get_drive_strength(struct sh_pfc *pfc,
 	if (!reg)
 		return -EINVAL;
 
-	spin_lock_irqsave(&pfc->lock, flags);
-	val = sh_pfc_read(pfc, reg);
-	spin_unlock_irqrestore(&pfc->lock, flags);
-
-	val = (val >> offset) & GENMASK(size - 1, 0);
+	val = (sh_pfc_read(pfc, reg) >> offset) & GENMASK(size - 1, 0);
 
 	/* Convert the value to mA based on a full drive strength value of 24mA.
 	 * We can make the full value configurable later if needed.
@@ -648,9 +643,7 @@ static int sh_pfc_pinconf_get(struct pinctrl_dev *pctldev, unsigned _pin,
 		if (WARN(bit < 0, "invalid pin %#x", _pin))
 			return bit;
 
-		spin_lock_irqsave(&pfc->lock, flags);
 		val = sh_pfc_read(pfc, pocctrl);
-		spin_unlock_irqrestore(&pfc->lock, flags);
 
 		lower_voltage = (pin->configs & SH_PFC_PIN_VOLTAGE_25_33) ?
 			2500 : 1800;
-- 
2.25.1

