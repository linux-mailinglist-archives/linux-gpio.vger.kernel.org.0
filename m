Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E532433D50E
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Mar 2021 14:41:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235302AbhCPNlY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Mar 2021 09:41:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235384AbhCPNlG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Mar 2021 09:41:06 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8968DC06174A
        for <linux-gpio@vger.kernel.org>; Tue, 16 Mar 2021 06:41:05 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b1e0:9434:c5b6:aecd])
        by michel.telenet-ops.be with bizsmtp
        id h1h22400P0UTkXy061h25K; Tue, 16 Mar 2021 14:41:04 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lM9wT-0088Uu-DB; Tue, 16 Mar 2021 14:41:01 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lM9wS-009yOn-MP; Tue, 16 Mar 2021 14:41:00 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Jianqun Xu <jay.xu@rock-chips.com>
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: PINCTRL_ROCKCHIP should depend on ARCH_ROCKCHIP
Date:   Tue, 16 Mar 2021 14:40:59 +0100
Message-Id: <20210316134059.2377081-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Rockchip GPIO and pin control modules are only present on Rockchip
SoCs.  Hence add a dependency on ARCH_ROCKCHIP, to prevent asking the
user about this driver when configuring a kernel without Rockchip
platform support.

Note that before, the PINCTRL_ROCKCHIP symbol was not visible, and
automatically selected when needed.  By making it tristate and
user-selectable, it became visible for everyone.

Fixes: be786ac5a6c4bf4e ("pinctrl: rockchip: make driver be tristate module")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index cfde05914abf7260..2a30b26fb30deef5 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -209,6 +209,7 @@ config PINCTRL_OXNAS
 
 config PINCTRL_ROCKCHIP
 	tristate "Rockchip gpio and pinctrl driver"
+	depends on ARCH_ROCKCHIP || COMPILE_TEST
 	depends on OF
 	select GPIOLIB
 	select PINMUX
-- 
2.25.1

