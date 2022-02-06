Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA994AB1D5
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Feb 2022 20:51:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242064AbiBFTvY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Feb 2022 14:51:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233917AbiBFTvX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Feb 2022 14:51:23 -0500
X-Greylist: delayed 303 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 06 Feb 2022 11:51:22 PST
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9E3EBC06173B
        for <linux-gpio@vger.kernel.org>; Sun,  6 Feb 2022 11:51:21 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.88,348,1635174000"; 
   d="scan'208";a="110327359"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 07 Feb 2022 04:46:18 +0900
Received: from localhost.localdomain (unknown [10.226.92.17])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id F129740E9806;
        Mon,  7 Feb 2022 04:46:16 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] pinctrl: renesas: Kconfig: Update description for RZ/V2L pin control support
Date:   Sun,  6 Feb 2022 19:46:13 +0000
Message-Id: <20220206194614.13209-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

RZ/V2L uses RZ/G2L GPIO and pinctrl driver.
This patch updates description for RZ/V2L pin control support.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/renesas/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/Kconfig b/drivers/pinctrl/renesas/Kconfig
index 89f5ca76ab83..c0c740e660b8 100644
--- a/drivers/pinctrl/renesas/Kconfig
+++ b/drivers/pinctrl/renesas/Kconfig
@@ -179,14 +179,15 @@ config PINCTRL_RZA2
 	  This selects GPIO and pinctrl driver for Renesas RZ/A2 platforms.
 
 config PINCTRL_RZG2L
-	bool "pin control support for RZ/G2L" if COMPILE_TEST
+	bool "pin control support for RZ/{G2L,V2L}" if COMPILE_TEST
 	depends on OF
 	select GPIOLIB
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
 	help
-	  This selects GPIO and pinctrl driver for Renesas RZ/G2L platforms.
+	  This selects GPIO and pinctrl driver for Renesas RZ/{G2L,V2L}
+	  platforms.
 
 config PINCTRL_PFC_R8A77470
 	bool "pin control support for RZ/G1C" if COMPILE_TEST
-- 
2.17.1

