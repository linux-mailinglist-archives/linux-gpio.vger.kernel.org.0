Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB89D622C87
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 14:37:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbiKINhB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 08:37:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230077AbiKINhA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 08:37:00 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C96B22B605
        for <linux-gpio@vger.kernel.org>; Wed,  9 Nov 2022 05:36:59 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:410d:c657:be54:f60b])
        by albert.telenet-ops.be with bizsmtp
        id iDcx2800D47WmLZ06Dcxbd; Wed, 09 Nov 2022 14:36:58 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oslGC-0006fl-UI; Wed, 09 Nov 2022 14:36:56 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oslGC-001cM9-CB; Wed, 09 Nov 2022 14:36:56 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Kevin Hilman <khilman@kernel.org>,
        Tony Lindgren <tony@atomide.com>, Keerthy <j-keerthy@ti.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: OMAP2+: Remove unneeded #include <linux/pinctrl/pinmux.h>
Date:   Wed,  9 Nov 2022 14:36:55 +0100
Message-Id: <7f22fb21f76f4d23be2e31a5908bcfa295704ef4.1668000965.git.geert+renesas@glider.be>
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

Commit 44c22a2d12a5c04d ("ARM: OMAP2+: pm33xx: Add support for rtc+ddr
in self refresh mode") added the include, but no user.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-omap2/pm33xx-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-omap2/pm33xx-core.c b/arch/arm/mach-omap2/pm33xx-core.c
index bf0d25fd2cea44d4..711bcc6c8dddc253 100644
--- a/arch/arm/mach-omap2/pm33xx-core.c
+++ b/arch/arm/mach-omap2/pm33xx-core.c
@@ -16,7 +16,6 @@
 #include <linux/clk.h>
 #include <linux/cpu.h>
 #include <linux/platform_data/gpio-omap.h>
-#include <linux/pinctrl/pinmux.h>
 #include <linux/wkup_m3_ipc.h>
 #include <linux/of.h>
 #include <linux/rtc.h>
-- 
2.25.1

