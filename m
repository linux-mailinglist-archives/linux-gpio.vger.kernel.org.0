Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB9E32C795
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 02:11:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355651AbhCDAcS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 19:32:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359091AbhCCN2A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 08:28:00 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F780C0617A7
        for <linux-gpio@vger.kernel.org>; Wed,  3 Mar 2021 05:26:28 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:cd47:42a6:c822:e50b])
        by laurent.telenet-ops.be with bizsmtp
        id bpSS240054huzR801pSShK; Wed, 03 Mar 2021 14:26:26 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lHRWD-004Ps4-NS; Wed, 03 Mar 2021 14:26:25 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lHRWC-00GWVL-P2; Wed, 03 Mar 2021 14:26:24 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/6] pinctrl: renesas: Add PORT_GP_CFG_7 macros
Date:   Wed,  3 Mar 2021 14:26:17 +0100
Message-Id: <20210303132619.3938128-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303132619.3938128-1-geert+renesas@glider.be>
References: <20210303132619.3938128-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add PORT_GP_CFG_7() and PORT_GP_7() helper macros, to be used by the
r8a7791 subdriver.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/sh_pfc.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
index 8dc0fbb012b0c970..fc8391712af8cf4b 100644
--- a/drivers/pinctrl/renesas/sh_pfc.h
+++ b/drivers/pinctrl/renesas/sh_pfc.h
@@ -479,9 +479,13 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
 	PORT_GP_CFG_1(bank, 5,  fn, sfx, cfg)
 #define PORT_GP_6(bank, fn, sfx)	PORT_GP_CFG_6(bank, fn, sfx, 0)
 
-#define PORT_GP_CFG_8(bank, fn, sfx, cfg)				\
+#define PORT_GP_CFG_7(bank, fn, sfx, cfg)				\
 	PORT_GP_CFG_6(bank, fn, sfx, cfg),				\
-	PORT_GP_CFG_1(bank, 6,  fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 6,  fn, sfx, cfg)
+#define PORT_GP_7(bank, fn, sfx)	PORT_GP_CFG_7(bank, fn, sfx, 0)
+
+#define PORT_GP_CFG_8(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_7(bank, fn, sfx, cfg),				\
 	PORT_GP_CFG_1(bank, 7,  fn, sfx, cfg)
 #define PORT_GP_8(bank, fn, sfx)	PORT_GP_CFG_8(bank, fn, sfx, 0)
 
-- 
2.25.1

