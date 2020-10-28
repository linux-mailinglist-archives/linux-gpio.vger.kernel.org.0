Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA69D29D831
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Oct 2020 23:30:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733237AbgJ1WaY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 18:30:24 -0400
Received: from newton.telenet-ops.be ([195.130.132.45]:52536 "EHLO
        newton.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387663AbgJ1WaX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 18:30:23 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by newton.telenet-ops.be (Postfix) with ESMTPS id 4CLrFD462PzMqxH8
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 15:15:12 +0100 (CET)
Received: from ramsan.of.borg ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id lSFC2300P4C55Sk01SFCF5; Wed, 28 Oct 2020 15:15:12 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kXmEJ-000oZ6-W8; Wed, 28 Oct 2020 15:15:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kXmEJ-007FpY-Cj; Wed, 28 Oct 2020 15:15:11 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/4] gpio: rcar: Align register offsets
Date:   Wed, 28 Oct 2020 15:15:02 +0100
Message-Id: <20201028141504.1729093-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201028141504.1729093-1-geert+renesas@glider.be>
References: <20201028141504.1729093-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Improve readability by aligning the offsets in the register definitions.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpio-rcar.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index a75bbc9af1f14b06..a7fb0ec78e44a3ed 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -45,19 +45,19 @@ struct gpio_rcar_priv {
 	struct gpio_rcar_bank_info bank_info;
 };
 
-#define IOINTSEL 0x00	/* General IO/Interrupt Switching Register */
-#define INOUTSEL 0x04	/* General Input/Output Switching Register */
-#define OUTDT 0x08	/* General Output Register */
-#define INDT 0x0c	/* General Input Register */
-#define INTDT 0x10	/* Interrupt Display Register */
-#define INTCLR 0x14	/* Interrupt Clear Register */
-#define INTMSK 0x18	/* Interrupt Mask Register */
-#define MSKCLR 0x1c	/* Interrupt Mask Clear Register */
-#define POSNEG 0x20	/* Positive/Negative Logic Select Register */
-#define EDGLEVEL 0x24	/* Edge/level Select Register */
-#define FILONOFF 0x28	/* Chattering Prevention On/Off Register */
-#define OUTDTSEL 0x40	/* Output Data Select Register */
-#define BOTHEDGE 0x4c	/* One Edge/Both Edge Select Register */
+#define IOINTSEL	0x00	/* General IO/Interrupt Switching Register */
+#define INOUTSEL	0x04	/* General Input/Output Switching Register */
+#define OUTDT		0x08	/* General Output Register */
+#define INDT		0x0c	/* General Input Register */
+#define INTDT		0x10	/* Interrupt Display Register */
+#define INTCLR		0x14	/* Interrupt Clear Register */
+#define INTMSK		0x18	/* Interrupt Mask Register */
+#define MSKCLR		0x1c	/* Interrupt Mask Clear Register */
+#define POSNEG		0x20	/* Positive/Negative Logic Select Register */
+#define EDGLEVEL	0x24	/* Edge/level Select Register */
+#define FILONOFF	0x28	/* Chattering Prevention On/Off Register */
+#define OUTDTSEL	0x40	/* Output Data Select Register */
+#define BOTHEDGE	0x4c	/* One Edge/Both Edge Select Register */
 
 #define RCAR_MAX_GPIO_PER_BANK		32
 
-- 
2.25.1

