Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C04531C8876
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2020 13:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbgEGLhz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 May 2020 07:37:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbgEGLhy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 May 2020 07:37:54 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F925C05BD09
        for <linux-gpio@vger.kernel.org>; Thu,  7 May 2020 04:37:54 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:6572:4a1f:d283:9ae8])
        by michel.telenet-ops.be with bizsmtp
        id bnds2200Z3ZRV0X06ndsE6; Thu, 07 May 2020 13:37:52 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jWeqe-0007Eu-B3; Thu, 07 May 2020 13:37:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jWeqe-0006JS-9i; Thu, 07 May 2020 13:37:52 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>, Ken Xue <Ken.Xue@amd.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: amd: Add ACPI dependency
Date:   Thu,  7 May 2020 13:37:51 +0200
Message-Id: <20200507113751.24213-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently the AMD pin controller driver supports ACPI platform only.
Make the PINCTRL_AMD config symbol depend on ACPI, to avoid asking the
user about it when configuring a kernel without ACPI support.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index f646f070d98fc2cb..f0ce4ce3e0f52456 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -95,6 +95,7 @@ config PINCTRL_AT91PIO4
 config PINCTRL_AMD
 	tristate "AMD GPIO pin control"
 	depends on HAS_IOMEM
+	depends on ACPI || COMPILE_TEST
 	select GPIOLIB
 	select GPIOLIB_IRQCHIP
 	select PINMUX
-- 
2.17.1

