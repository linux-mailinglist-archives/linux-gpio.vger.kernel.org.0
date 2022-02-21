Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 432ED4BDE70
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Feb 2022 18:47:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379543AbiBUPpG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Feb 2022 10:45:06 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379458AbiBUPoz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Feb 2022 10:44:55 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE02C237F8
        for <linux-gpio@vger.kernel.org>; Mon, 21 Feb 2022 07:43:53 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:49dc:a1b5:3fe0:3d2b])
        by laurent.telenet-ops.be with bizsmtp
        id xrjr2600Q3YJRAw01rjrfa; Mon, 21 Feb 2022 16:43:52 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nMAqt-001TTo-Ar; Mon, 21 Feb 2022 16:43:51 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nMAqs-006EhY-BV; Mon, 21 Feb 2022 16:43:50 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     LUU HOAI <hoai.luu.ub@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 02/12] pinctrl: renesas: Add PORT_GP_CFG_19 macros
Date:   Mon, 21 Feb 2022 16:43:37 +0100
Message-Id: <f7fc711d065f78911bac1b616880ba3dbc858158.1645457792.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645457792.git.geert+renesas@glider.be>
References: <cover.1645457792.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add PORT_GP_CFG_19() and PORT_GP_19() helper macros, to be used by the
r8a779f0 subdriver.

Based on a larger patch in the BSP by LUU HOAI.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by.

Changes compared to the BSP:
  - Rework PORT_GP_CFG_20() on top of the new PORT_GP_CFG_19().
---
 drivers/pinctrl/renesas/sh_pfc.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
index 2bd96b28bb8b49c9..2932c8d4e993509f 100644
--- a/drivers/pinctrl/renesas/sh_pfc.h
+++ b/drivers/pinctrl/renesas/sh_pfc.h
@@ -517,9 +517,13 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
 	PORT_GP_CFG_1(bank, 17, fn, sfx, cfg)
 #define PORT_GP_18(bank, fn, sfx)	PORT_GP_CFG_18(bank, fn, sfx, 0)
 
-#define PORT_GP_CFG_20(bank, fn, sfx, cfg)				\
+#define PORT_GP_CFG_19(bank, fn, sfx, cfg)				\
 	PORT_GP_CFG_18(bank, fn, sfx, cfg),				\
-	PORT_GP_CFG_1(bank, 18, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 18, fn, sfx, cfg)
+#define PORT_GP_19(bank, fn, sfx)	PORT_GP_CFG_19(bank, fn, sfx, 0)
+
+#define PORT_GP_CFG_20(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_19(bank, fn, sfx, cfg),				\
 	PORT_GP_CFG_1(bank, 19, fn, sfx, cfg)
 #define PORT_GP_20(bank, fn, sfx)	PORT_GP_CFG_20(bank, fn, sfx, 0)
 
-- 
2.25.1

