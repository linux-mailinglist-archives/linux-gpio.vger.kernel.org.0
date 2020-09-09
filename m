Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 443FD263217
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 18:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731181AbgIIQe4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 12:34:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730955AbgIIQ1B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 12:27:01 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02874C061795
        for <linux-gpio@vger.kernel.org>; Wed,  9 Sep 2020 09:26:57 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id RsSr230034C55Sk01sSrm2; Wed, 09 Sep 2020 18:26:51 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kG2vq-0000Qv-Ub; Wed, 09 Sep 2020 18:26:50 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kFzwm-0003Mq-Ls; Wed, 09 Sep 2020 15:15:36 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] pinctrl: rzn1: Do not select GENERIC_PIN{CTRL_GROUPS,MUX_FUNCTIONS}
Date:   Wed,  9 Sep 2020 15:15:32 +0200
Message-Id: <20200909131534.12897-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200909131534.12897-1-geert+renesas@glider.be>
References: <20200909131534.12897-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The RZ/N1 pin control driver does not use pin groups or pin functions,
so there is no need to select GENERIC_PINCTRL_GROUPS or
GENERIC_PINMUX_FUNCTIONS.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/Kconfig b/drivers/pinctrl/sh-pfc/Kconfig
index 2cff88684f364a39..9eb793cb464b8806 100644
--- a/drivers/pinctrl/sh-pfc/Kconfig
+++ b/drivers/pinctrl/sh-pfc/Kconfig
@@ -179,8 +179,6 @@ config PINCTRL_RZN1
 	bool "pin control support for RZ/N1"
 	depends on OF
 	depends on ARCH_RZN1 || COMPILE_TEST
-	select GENERIC_PINCTRL_GROUPS
-	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
 	help
 	  This selects pinctrl driver for Renesas RZ/N1 devices.
-- 
2.17.1

