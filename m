Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CBA83CDE07
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jul 2021 17:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344118AbhGSPBm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jul 2021 11:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344079AbhGSO72 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jul 2021 10:59:28 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34D09C06A032
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jul 2021 07:47:27 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:1844:c86f:c84a:fde8])
        by andre.telenet-ops.be with bizsmtp
        id X3H3250082WKXR1013H3Et; Mon, 19 Jul 2021 17:17:03 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m5V0w-000sMX-Sh; Mon, 19 Jul 2021 17:17:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m5V0w-00Aixe-5K; Mon, 19 Jul 2021 17:17:02 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2] pinctrl: renesas: Fix pin control matching on R-Car H3e-2G
Date:   Mon, 19 Jul 2021 17:17:00 +0200
Message-Id: <6cdc5bfa424461105779b56f455387e03560cf66.1626707688.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

As R-Car H3 ES1.x (R8A77950) and R-Car ES2.0+ (R8A77951) use the same
compatible value, the pin control driver relies on soc_device_match()
with soc_id = "r8a7795" and the (non)matching of revision = "ES1.*" to
match with and distinguish between the two SoC variants.  The
corresponding entries in the normal of_match_table are present only to
make the optional sanity checks work.

The R-Car H3e-2G (R8A779M1) SoC is a different grading of the R-Car H3
ES3.0 (R8A77951) SoC.  It uses the same compatible values for individual
devices, but has an additional compatible value for the root node.
When running on an R-Car H3e-2G SoC, soc_device_match() with soc_id =
"r8a7795" does not return a match.  Hence the pin control driver falls
back to the normal of_match_table, and, as the R8A77950 entry is listed
first, incorrectly uses the sub-driver for R-Car H3 ES1.x.

Fix this by moving the entry for R8A77951 before the entry for R8A77950.
Simplify sh_pfc_quirk_match() to only handle R-Car H3 ES1,x, as R-Car H3
ES2.0+ can now be matched using the normal of_match_table as well.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
Extracted from series "[PATCH 00/14] arm64: renesas: Add support for R Car H3e
2G-and M3e-2G"
(https://lore.kernel.org/r/cover.1623315732.git.geert+renesas@glider.be/).
To be queued in renesas-pinctrl for v5.15.

v2:
  - Add Reviewed-by,
  - Stop using sh_pfc_quirk_match() for R-Car H3 ES2.0+.
---
 drivers/pinctrl/renesas/core.c   | 29 ++++++++++++-----------------
 drivers/pinctrl/renesas/sh_pfc.h |  4 ++--
 2 files changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index 5ccc49b387f17eb9..f2ab02225837ec3b 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -571,17 +571,21 @@ static const struct of_device_id sh_pfc_of_table[] = {
 		.data = &r8a7794_pinmux_info,
 	},
 #endif
-/* Both r8a7795 entries must be present to make sanity checks work */
-#ifdef CONFIG_PINCTRL_PFC_R8A77950
+/*
+ * Both r8a7795 entries must be present to make sanity checks work, but only
+ * the first entry is actually used.
+ * R-Car H3 ES1.x is matched using soc_device_match() instead.
+ */
+#ifdef CONFIG_PINCTRL_PFC_R8A77951
 	{
 		.compatible = "renesas,pfc-r8a7795",
-		.data = &r8a77950_pinmux_info,
+		.data = &r8a77951_pinmux_info,
 	},
 #endif
-#ifdef CONFIG_PINCTRL_PFC_R8A77951
+#ifdef CONFIG_PINCTRL_PFC_R8A77950
 	{
 		.compatible = "renesas,pfc-r8a7795",
-		.data = &r8a77951_pinmux_info,
+		.data = &r8a77950_pinmux_info,
 	},
 #endif
 #ifdef CONFIG_PINCTRL_PFC_R8A77960
@@ -1085,26 +1089,20 @@ static inline void sh_pfc_check_driver(struct platform_driver *pdrv) {}
 #ifdef CONFIG_OF
 static const void *sh_pfc_quirk_match(void)
 {
-#if defined(CONFIG_PINCTRL_PFC_R8A77950) || \
-    defined(CONFIG_PINCTRL_PFC_R8A77951)
+#ifdef CONFIG_PINCTRL_PFC_R8A77950
 	const struct soc_device_attribute *match;
 	static const struct soc_device_attribute quirks[] = {
 		{
 			.soc_id = "r8a7795", .revision = "ES1.*",
 			.data = &r8a77950_pinmux_info,
 		},
-		{
-			.soc_id = "r8a7795",
-			.data = &r8a77951_pinmux_info,
-		},
-
 		{ /* sentinel */ }
 	};
 
 	match = soc_device_match(quirks);
 	if (match)
-		return match->data ?: ERR_PTR(-ENODEV);
-#endif /* CONFIG_PINCTRL_PFC_R8A77950 || CONFIG_PINCTRL_PFC_R8A77951 */
+		return match->data;
+#endif /* CONFIG_PINCTRL_PFC_R8A77950 */
 
 	return NULL;
 }
@@ -1119,9 +1117,6 @@ static int sh_pfc_probe(struct platform_device *pdev)
 #ifdef CONFIG_OF
 	if (pdev->dev.of_node) {
 		info = sh_pfc_quirk_match();
-		if (IS_ERR(info))
-			return PTR_ERR(info);
-
 		if (!info)
 			info = of_device_get_match_data(&pdev->dev);
 	} else
diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
index bf9822ef7e8c67b6..2479b4fb9cf957ff 100644
--- a/drivers/pinctrl/renesas/sh_pfc.h
+++ b/drivers/pinctrl/renesas/sh_pfc.h
@@ -332,8 +332,8 @@ extern const struct sh_pfc_soc_info r8a7791_pinmux_info;
 extern const struct sh_pfc_soc_info r8a7792_pinmux_info;
 extern const struct sh_pfc_soc_info r8a7793_pinmux_info;
 extern const struct sh_pfc_soc_info r8a7794_pinmux_info;
-extern const struct sh_pfc_soc_info r8a77950_pinmux_info __weak;
-extern const struct sh_pfc_soc_info r8a77951_pinmux_info __weak;
+extern const struct sh_pfc_soc_info r8a77950_pinmux_info;
+extern const struct sh_pfc_soc_info r8a77951_pinmux_info;
 extern const struct sh_pfc_soc_info r8a77960_pinmux_info;
 extern const struct sh_pfc_soc_info r8a77961_pinmux_info;
 extern const struct sh_pfc_soc_info r8a77965_pinmux_info;
-- 
2.25.1

