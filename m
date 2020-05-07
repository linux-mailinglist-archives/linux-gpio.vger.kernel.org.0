Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E33D31C886E
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2020 13:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbgEGLgh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 May 2020 07:36:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725969AbgEGLgh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 May 2020 07:36:37 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46012C05BD0A
        for <linux-gpio@vger.kernel.org>; Thu,  7 May 2020 04:36:37 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:6572:4a1f:d283:9ae8])
        by albert.telenet-ops.be with bizsmtp
        id bncT2200U3ZRV0X06ncTEk; Thu, 07 May 2020 13:36:28 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jWepH-0007DU-Kt; Thu, 07 May 2020 13:36:27 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jWepH-0006GK-KB; Thu, 07 May 2020 13:36:27 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Ramuthevar Vadivel Murugan 
        <vadivel.muruganx.ramuthevar@linux.intel.com>,
        Rahul Tanwar <rahul.tanwar@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] pinctrl: equilibrium: Add architecture dependency
Date:   Thu,  7 May 2020 13:36:25 +0200
Message-Id: <20200507113626.24026-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200507113626.24026-1-geert+renesas@glider.be>
References: <20200507113626.24026-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Equilibrium pin controller is only present on Intel Lightning
Mountain SoCs.  Add an architecture dependency to the
PINCTRL_EQUILIBRIUM config symbol, to avoid asking the user about it
when configuring a kernel for a non-x86 architecture.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index bed67c08a0892240..85b644a6c74db92d 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -443,6 +443,7 @@ config PINCTRL_TB10X
 config PINCTRL_EQUILIBRIUM
 	tristate "Generic pinctrl and GPIO driver for Intel Lightning Mountain SoC"
 	depends on OF && HAS_IOMEM
+	depends on X86 || COMPILE_TEST
 	select PINMUX
 	select PINCONF
 	select GPIOLIB
-- 
2.17.1

