Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5761A47E53C
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 15:56:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232601AbhLWO4g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 09:56:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243944AbhLWO4c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 09:56:32 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32A25C061785
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 06:56:31 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id ZqwV2600b4C55Sk01qwVZL; Thu, 23 Dec 2021 15:56:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PW9-006aMC-7r; Thu, 23 Dec 2021 15:56:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PW7-003rwc-Vs; Thu, 23 Dec 2021 15:56:27 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 02/10] pinctrl: renesas: Factor out .pin_to_portcr() address handling
Date:   Thu, 23 Dec 2021 15:56:18 +0100
Message-Id: <a485d4986a17259256988eb14e3a4c2b8d61c303.1640270559.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640270559.git.geert+renesas@glider.be>
References: <cover.1640270559.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

All implementations of the .pin_to_portcr() method implement the same
conversion from Port Control Register offset to virtual address.  Factor
it out into the two callers.
Remove the pfc parameter, as it is no longer used.

Note that the failure handling in r8a7740_pin_to_portcr() is pro forma,
as the function is never called with an invalid pin number.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a73a4.c | 4 ++--
 drivers/pinctrl/renesas/pfc-r8a7740.c | 6 +++---
 drivers/pinctrl/renesas/pfc-sh73a0.c  | 4 ++--
 drivers/pinctrl/renesas/pinctrl.c     | 6 ++++--
 drivers/pinctrl/renesas/sh_pfc.h      | 2 +-
 5 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a73a4.c b/drivers/pinctrl/renesas/pfc-r8a73a4.c
index 1e569f6a03bf13e0..ba3a1857f80a08c4 100644
--- a/drivers/pinctrl/renesas/pfc-r8a73a4.c
+++ b/drivers/pinctrl/renesas/pfc-r8a73a4.c
@@ -2606,9 +2606,9 @@ static const unsigned int r8a73a4_portcr_offsets[] = {
 	0x00002000, 0x00003000, 0x00003000,
 };
 
-static void __iomem *r8a73a4_pin_to_portcr(struct sh_pfc *pfc, unsigned int pin)
+static int r8a73a4_pin_to_portcr(unsigned int pin)
 {
-	return pfc->windows->virt + r8a73a4_portcr_offsets[pin >> 5] + pin;
+	return r8a73a4_portcr_offsets[pin >> 5] + pin;
 }
 
 static const struct sh_pfc_soc_operations r8a73a4_pfc_ops = {
diff --git a/drivers/pinctrl/renesas/pfc-r8a7740.c b/drivers/pinctrl/renesas/pfc-r8a7740.c
index 3214331ba4e243cb..e8b9fb74a802ac03 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7740.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7740.c
@@ -3495,7 +3495,7 @@ static const struct r8a7740_portcr_group r8a7740_portcr_offsets[] = {
 	{ 83, 0x0000 }, { 114, 0x1000 }, { 209, 0x2000 }, { 211, 0x3000 },
 };
 
-static void __iomem *r8a7740_pin_to_portcr(struct sh_pfc *pfc, unsigned int pin)
+static int r8a7740_pin_to_portcr(unsigned int pin)
 {
 	unsigned int i;
 
@@ -3504,10 +3504,10 @@ static void __iomem *r8a7740_pin_to_portcr(struct sh_pfc *pfc, unsigned int pin)
 			&r8a7740_portcr_offsets[i];
 
 		if (pin <= group->end_pin)
-			return pfc->windows->virt + group->offset + pin;
+			return group->offset + pin;
 	}
 
-	return NULL;
+	return -1;
 }
 
 static const struct sh_pfc_soc_operations r8a7740_pfc_ops = {
diff --git a/drivers/pinctrl/renesas/pfc-sh73a0.c b/drivers/pinctrl/renesas/pfc-sh73a0.c
index 44cf1adaff13b02c..5d8a0179fd60fee4 100644
--- a/drivers/pinctrl/renesas/pfc-sh73a0.c
+++ b/drivers/pinctrl/renesas/pfc-sh73a0.c
@@ -4137,9 +4137,9 @@ static const unsigned int sh73a0_portcr_offsets[] = {
 	0x00002000, 0x00002000, 0x00003000, 0x00003000, 0x00002000,
 };
 
-static void __iomem *sh73a0_pin_to_portcr(struct sh_pfc *pfc, unsigned int pin)
+static int sh73a0_pin_to_portcr(unsigned int pin)
 {
-	return pfc->windows->virt + sh73a0_portcr_offsets[pin >> 5] + pin;
+	return sh73a0_portcr_offsets[pin >> 5] + pin;
 }
 
 /* -----------------------------------------------------------------------------
diff --git a/drivers/pinctrl/renesas/pinctrl.c b/drivers/pinctrl/renesas/pinctrl.c
index a5862c67a6ecc22e..f0c42c053f8e2460 100644
--- a/drivers/pinctrl/renesas/pinctrl.c
+++ b/drivers/pinctrl/renesas/pinctrl.c
@@ -919,7 +919,8 @@ void rcar_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
 
 unsigned int rmobile_pinmux_get_bias(struct sh_pfc *pfc, unsigned int pin)
 {
-	void __iomem *reg = pfc->info->ops->pin_to_portcr(pfc, pin);
+	void __iomem *reg = pfc->windows->virt +
+			    pfc->info->ops->pin_to_portcr(pin);
 	u32 value = ioread8(reg) & PORTnCR_PULMD_MASK;
 
 	switch (value) {
@@ -936,7 +937,8 @@ unsigned int rmobile_pinmux_get_bias(struct sh_pfc *pfc, unsigned int pin)
 void rmobile_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
 			     unsigned int bias)
 {
-	void __iomem *reg = pfc->info->ops->pin_to_portcr(pfc, pin);
+	void __iomem *reg = pfc->windows->virt +
+			    pfc->info->ops->pin_to_portcr(pin);
 	u32 value = ioread8(reg) & ~PORTnCR_PULMD_MASK;
 
 	switch (bias) {
diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
index d8a6bd0412e496d3..7191c1c9ca959954 100644
--- a/drivers/pinctrl/renesas/sh_pfc.h
+++ b/drivers/pinctrl/renesas/sh_pfc.h
@@ -255,7 +255,7 @@ struct sh_pfc_soc_operations {
 	void (*set_bias)(struct sh_pfc *pfc, unsigned int pin,
 			 unsigned int bias);
 	int (*pin_to_pocctrl)(unsigned int pin, u32 *pocctrl);
-	void __iomem * (*pin_to_portcr)(struct sh_pfc *pfc, unsigned int pin);
+	int (*pin_to_portcr)(unsigned int pin);
 };
 
 struct sh_pfc_soc_info {
-- 
2.25.1

