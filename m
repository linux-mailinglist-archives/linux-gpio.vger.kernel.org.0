Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 248252054FC
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 16:40:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732829AbgFWOkI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 10:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732740AbgFWOkI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 10:40:08 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B2F6C061573
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2020 07:40:08 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:26:93a1:ff06:f8b0])
        by michel.telenet-ops.be with bizsmtp
        id ueg32200T4qCYS806eg3tp; Tue, 23 Jun 2020 16:40:04 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jnk5j-00075v-Od; Tue, 23 Jun 2020 16:40:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jnk5j-0004Rl-MN; Tue, 23 Jun 2020 16:40:03 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: Drop superfluous dependencies on GPIOLIB
Date:   Tue, 23 Jun 2020 16:40:01 +0200
Message-Id: <20200623144001.17052-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

All config options for GPIO drivers are inside a big "if GPIOLIB ...
endif" block, so there is no reason for individual config options to
have expicit dependencies on GPIOLIB.  Hence remove them.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index f875ec95ba8c3a7a..291bffb5c7e58d7f 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -411,7 +411,7 @@ config GPIO_MXS
 
 config GPIO_OCTEON
 	tristate "Cavium OCTEON GPIO"
-	depends on GPIOLIB && CAVIUM_OCTEON_SOC
+	depends on CAVIUM_OCTEON_SOC
 	default y
 	help
 	  Say yes here to support the on-chip GPIO lines on the OCTEON
@@ -1118,7 +1118,7 @@ config GPIO_DLN2
 
 config HTC_EGPIO
 	bool "HTC EGPIO support"
-	depends on GPIOLIB && ARM
+	depends on ARM
 	help
 	  This driver supports the CPLD egpio chip present on
 	  several HTC phones.  It provides basic support for input
-- 
2.17.1

