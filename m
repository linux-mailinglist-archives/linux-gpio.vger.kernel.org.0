Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A760D32C798
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 02:11:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355653AbhCDAcT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 19:32:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359089AbhCCN2l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 08:28:41 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61EE0C061794
        for <linux-gpio@vger.kernel.org>; Wed,  3 Mar 2021 05:26:28 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:cd47:42a6:c822:e50b])
        by michel.telenet-ops.be with bizsmtp
        id bpSR2400G4huzR806pSRhm; Wed, 03 Mar 2021 14:26:26 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lHRWD-004Ps2-Ad; Wed, 03 Mar 2021 14:26:25 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lHRWC-00GWVB-NS; Wed, 03 Mar 2021 14:26:24 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/6] pinctrl: renesas: Move R-Car bias helpers to sh_pfc.h
Date:   Wed,  3 Mar 2021 14:26:15 +0100
Message-Id: <20210303132619.3938128-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303132619.3938128-1-geert+renesas@glider.be>
References: <20210303132619.3938128-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Renesas Pin Function Controller driver uses two header files:
  - sh_pfc.h, for use by both core code and SoC-specific drivers,
  - core.h, for internal use by the core code only.

Hence move the R-Car bias helper declarations from core.h to sh_pfc.h,
and drop the inclusion of core.h from SoC-specific drivers that no
longer need it.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/core.h         | 4 ----
 drivers/pinctrl/renesas/pfc-r8a7778.c  | 1 -
 drivers/pinctrl/renesas/pfc-r8a7792.c  | 1 -
 drivers/pinctrl/renesas/pfc-r8a77950.c | 1 -
 drivers/pinctrl/renesas/pfc-r8a77951.c | 1 -
 drivers/pinctrl/renesas/pfc-r8a7796.c  | 1 -
 drivers/pinctrl/renesas/pfc-r8a77965.c | 1 -
 drivers/pinctrl/renesas/pfc-r8a77970.c | 1 -
 drivers/pinctrl/renesas/pfc-r8a77980.c | 1 -
 drivers/pinctrl/renesas/pfc-r8a77990.c | 1 -
 drivers/pinctrl/renesas/pfc-r8a77995.c | 1 -
 drivers/pinctrl/renesas/pfc-r8a779a0.c | 1 -
 drivers/pinctrl/renesas/sh_pfc.h       | 7 +++++++
 13 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/renesas/core.h b/drivers/pinctrl/renesas/core.h
index 19f7b4308fac7a8f..51f391e9713ae9bc 100644
--- a/drivers/pinctrl/renesas/core.h
+++ b/drivers/pinctrl/renesas/core.h
@@ -29,8 +29,4 @@ void sh_pfc_write(struct sh_pfc *pfc, u32 reg, u32 data);
 int sh_pfc_get_pin_index(struct sh_pfc *pfc, unsigned int pin);
 int sh_pfc_config_mux(struct sh_pfc *pfc, unsigned mark, int pinmux_type);
 
-unsigned int rcar_pinmux_get_bias(struct sh_pfc *pfc, unsigned int pin);
-void rcar_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
-			  unsigned int bias);
-
 #endif /* __SH_PFC_CORE_H__ */
diff --git a/drivers/pinctrl/renesas/pfc-r8a7778.c b/drivers/pinctrl/renesas/pfc-r8a7778.c
index 75f52b1798c3c5c9..6185af9c499006e7 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7778.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7778.c
@@ -16,7 +16,6 @@
 #include <linux/kernel.h>
 #include <linux/pinctrl/pinconf-generic.h>
 
-#include "core.h"
 #include "sh_pfc.h"
 
 #define PORT_GP_PUP_1(bank, pin, fn, sfx)	\
diff --git a/drivers/pinctrl/renesas/pfc-r8a7792.c b/drivers/pinctrl/renesas/pfc-r8a7792.c
index 258f82fb31c0ec10..f54a7c81005d0a78 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7792.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7792.c
@@ -8,7 +8,6 @@
 
 #include <linux/kernel.h>
 
-#include "core.h"
 #include "sh_pfc.h"
 
 #define CPU_ALL_GP(fn, sfx)						\
diff --git a/drivers/pinctrl/renesas/pfc-r8a77950.c b/drivers/pinctrl/renesas/pfc-r8a77950.c
index 32fe8caca70a119e..ee4ce9349aae2654 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77950.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77950.c
@@ -8,7 +8,6 @@
 #include <linux/errno.h>
 #include <linux/kernel.h>
 
-#include "core.h"
 #include "sh_pfc.h"
 
 #define CFG_FLAGS (SH_PFC_PIN_CFG_DRIVE_STRENGTH | SH_PFC_PIN_CFG_PULL_UP_DOWN)
diff --git a/drivers/pinctrl/renesas/pfc-r8a77951.c b/drivers/pinctrl/renesas/pfc-r8a77951.c
index bdd605e41303bf3a..1c14a3925bef909b 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77951.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77951.c
@@ -9,7 +9,6 @@
 #include <linux/kernel.h>
 #include <linux/sys_soc.h>
 
-#include "core.h"
 #include "sh_pfc.h"
 
 #define CFG_FLAGS (SH_PFC_PIN_CFG_DRIVE_STRENGTH | SH_PFC_PIN_CFG_PULL_UP_DOWN)
diff --git a/drivers/pinctrl/renesas/pfc-r8a7796.c b/drivers/pinctrl/renesas/pfc-r8a7796.c
index 96b5b1509bb70d16..71e69f2a431e05d4 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7796.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7796.c
@@ -14,7 +14,6 @@
 #include <linux/errno.h>
 #include <linux/kernel.h>
 
-#include "core.h"
 #include "sh_pfc.h"
 
 #define CFG_FLAGS (SH_PFC_PIN_CFG_DRIVE_STRENGTH | SH_PFC_PIN_CFG_PULL_UP_DOWN)
diff --git a/drivers/pinctrl/renesas/pfc-r8a77965.c b/drivers/pinctrl/renesas/pfc-r8a77965.c
index f15e29383d9b54fe..a5db0168fb86418e 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77965.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77965.c
@@ -15,7 +15,6 @@
 #include <linux/errno.h>
 #include <linux/kernel.h>
 
-#include "core.h"
 #include "sh_pfc.h"
 
 #define CFG_FLAGS (SH_PFC_PIN_CFG_DRIVE_STRENGTH | SH_PFC_PIN_CFG_PULL_UP_DOWN)
diff --git a/drivers/pinctrl/renesas/pfc-r8a77970.c b/drivers/pinctrl/renesas/pfc-r8a77970.c
index e8a0fc468eb260c6..7935826cfae7c9a3 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77970.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77970.c
@@ -16,7 +16,6 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 
-#include "core.h"
 #include "sh_pfc.h"
 
 #define CPU_ALL_GP(fn, sfx)						\
diff --git a/drivers/pinctrl/renesas/pfc-r8a77980.c b/drivers/pinctrl/renesas/pfc-r8a77980.c
index ebd07bebaeebca07..20cff93a2a13ca17 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77980.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77980.c
@@ -16,7 +16,6 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 
-#include "core.h"
 #include "sh_pfc.h"
 
 #define CPU_ALL_GP(fn, sfx)	\
diff --git a/drivers/pinctrl/renesas/pfc-r8a77990.c b/drivers/pinctrl/renesas/pfc-r8a77990.c
index 0a32e3c317c1a0c5..04a74b5d08e16f4c 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77990.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77990.c
@@ -14,7 +14,6 @@
 #include <linux/errno.h>
 #include <linux/kernel.h>
 
-#include "core.h"
 #include "sh_pfc.h"
 
 #define CFG_FLAGS (SH_PFC_PIN_CFG_PULL_UP_DOWN)
diff --git a/drivers/pinctrl/renesas/pfc-r8a77995.c b/drivers/pinctrl/renesas/pfc-r8a77995.c
index 672251d86c2de3cd..b479f87a3b23f0f1 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77995.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77995.c
@@ -14,7 +14,6 @@
 #include <linux/errno.h>
 #include <linux/kernel.h>
 
-#include "core.h"
 #include "sh_pfc.h"
 
 #define CPU_ALL_GP(fn, sfx)			\
diff --git a/drivers/pinctrl/renesas/pfc-r8a779a0.c b/drivers/pinctrl/renesas/pfc-r8a779a0.c
index 2250ccd0470aa504..ad6532443a785b13 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
@@ -11,7 +11,6 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 
-#include "core.h"
 #include "sh_pfc.h"
 
 #define CFG_FLAGS (SH_PFC_PIN_CFG_DRIVE_STRENGTH | SH_PFC_PIN_CFG_PULL_UP_DOWN)
diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
index 5934faeb23d756d8..2d511c7280fa49e3 100644
--- a/drivers/pinctrl/renesas/sh_pfc.h
+++ b/drivers/pinctrl/renesas/sh_pfc.h
@@ -773,4 +773,11 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
  */
 #define RCAR_GP_PIN(bank, pin)		(((bank) * 32) + (pin))
 
+/*
+ * Bias helpers
+ */
+unsigned int rcar_pinmux_get_bias(struct sh_pfc *pfc, unsigned int pin);
+void rcar_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
+			  unsigned int bias);
+
 #endif /* __SH_PFC_H */
-- 
2.25.1

