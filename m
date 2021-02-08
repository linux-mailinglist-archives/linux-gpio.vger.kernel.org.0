Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF52B3135BA
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Feb 2021 15:53:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232129AbhBHOxD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 09:53:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233150AbhBHOwo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2021 09:52:44 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B04EC061788
        for <linux-gpio@vger.kernel.org>; Mon,  8 Feb 2021 06:51:58 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id Seru240184C55Sk06eruDq; Mon, 08 Feb 2021 15:51:56 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l97tK-004eBQ-Ae; Mon, 08 Feb 2021 15:51:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l97tJ-001lok-UC; Mon, 08 Feb 2021 15:51:53 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Anson Huang <Anson.Huang@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: GPIO_MXS should not default to y, unconditionally
Date:   Mon,  8 Feb 2021 15:51:53 +0100
Message-Id: <20210208145153.422093-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Merely enabling CONFIG_COMPILE_TEST should not enable additional code.
To fix this, restrict the automatic enabling of GPIO_MXS to ARCH_MXS,
and ask the user in case of compile-testing.

Fixes: 6876ca311bfca5d7 ("gpio: mxs: add COMPILE_TEST support for GPIO_MXS")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 5fdf526fe973da38..412728ff2ab45c0d 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -442,8 +442,9 @@ config GPIO_MXC
 	select GENERIC_IRQ_CHIP
 
 config GPIO_MXS
-	def_bool y
+	bool "Freescale MXS GPIO support" if COMPILE_TEST
 	depends on ARCH_MXS || COMPILE_TEST
+	default y if ARCH_MXS
 	select GPIO_GENERIC
 	select GENERIC_IRQ_CHIP
 
-- 
2.25.1

