Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89968622C83
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 14:36:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbiKINgI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 08:36:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbiKINgI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 08:36:08 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8733B2B605
        for <linux-gpio@vger.kernel.org>; Wed,  9 Nov 2022 05:36:07 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:410d:c657:be54:f60b])
        by michel.telenet-ops.be with bizsmtp
        id iDc22800L47WmLZ06Dc22d; Wed, 09 Nov 2022 14:36:06 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oslFJ-0006fW-Lp; Wed, 09 Nov 2022 14:36:01 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oslFI-001cKM-Vl; Wed, 09 Nov 2022 14:36:01 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: imx3: Remove unneeded #include <linux/pinctrl/machine.h>
Date:   Wed,  9 Nov 2022 14:35:58 +0100
Message-Id: <d5852583707c7f4cb2711b726f89f983e5171b60.1668000921.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Commit 6c5f05a6cd88c77f ("ARM: imx3: Remove imx3 soc_init()")
removed the last user of the pinctrl machine API.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-imx/mm-imx3.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-imx/mm-imx3.c b/arch/arm/mach-imx/mm-imx3.c
index 28db97289ee8ffec..0788c5cc7f9e6466 100644
--- a/arch/arm/mach-imx/mm-imx3.c
+++ b/arch/arm/mach-imx/mm-imx3.c
@@ -12,7 +12,6 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/of_address.h>
-#include <linux/pinctrl/machine.h>
 
 #include <asm/system_misc.h>
 #include <asm/hardware/cache-l2x0.h>
-- 
2.25.1

