Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63A9A29D778
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Oct 2020 23:24:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732637AbgJ1WWU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 18:22:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732596AbgJ1WV6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 18:21:58 -0400
Received: from leibniz.telenet-ops.be (leibniz.telenet-ops.be [IPv6:2a02:1800:110:4::f00:d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2E7EC0613CF
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 15:21:57 -0700 (PDT)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4CLsc868dVzMv7nb
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 16:16:40 +0100 (CET)
Received: from ramsan.of.borg ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id lTGg230064C55Sk01TGg24; Wed, 28 Oct 2020 16:16:40 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kXnBn-000pDc-Ru; Wed, 28 Oct 2020 16:16:39 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kXnBn-007H91-8i; Wed, 28 Oct 2020 16:16:39 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/8] pinctrl: renesas: Optimize sh_pfc_pin_config
Date:   Wed, 28 Oct 2020 16:16:33 +0100
Message-Id: <20201028151637.1734130-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201028151637.1734130-1-geert+renesas@glider.be>
References: <20201028151637.1734130-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Shrink sh_pfc_pin_config from 8 to 2 bytes:
  - The mux_set flag can be removed, as a non-zero mark value means the
    same (zero = PINMUX_RESERVED is an invalid mark value),
  - The gpio_enabled flag needs only a single bit,
  - Mark values are small integers, and can easily fit in a 15-bit
    bitfield.

This saves 6 bytes per pin when allocating the sh_pfc_pinctrl.configs
array, i.e. it reduces run-time memory consumption by ca. 1.5 KiB.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pinctrl.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl.c b/drivers/pinctrl/renesas/pinctrl.c
index 8e54f9b662f37f37..d34079726039c39d 100644
--- a/drivers/pinctrl/renesas/pinctrl.c
+++ b/drivers/pinctrl/renesas/pinctrl.c
@@ -26,9 +26,8 @@
 #include "../pinconf.h"
 
 struct sh_pfc_pin_config {
-	unsigned int mux_mark;
-	bool mux_set;
-	bool gpio_enabled;
+	u16 gpio_enabled:1;
+	u16 mux_mark:15;
 };
 
 struct sh_pfc_pinctrl {
@@ -371,12 +370,11 @@ static int sh_pfc_func_set_mux(struct pinctrl_dev *pctldev, unsigned selector,
 			goto done;
 	}
 
-	/* All group pins are configured, mark the pins as mux_set */
+	/* All group pins are configured, mark the pins as muxed */
 	for (i = 0; i < grp->nr_pins; ++i) {
 		int idx = sh_pfc_get_pin_index(pfc, grp->pins[i]);
 		struct sh_pfc_pin_config *cfg = &pmx->configs[idx];
 
-		cfg->mux_set = true;
 		cfg->mux_mark = grp->mux[i];
 	}
 
@@ -432,7 +430,7 @@ static void sh_pfc_gpio_disable_free(struct pinctrl_dev *pctldev,
 	spin_lock_irqsave(&pfc->lock, flags);
 	cfg->gpio_enabled = false;
 	/* If mux is already set, this configures it here */
-	if (cfg->mux_set)
+	if (cfg->mux_mark)
 		sh_pfc_config_mux(pfc, cfg->mux_mark, PINMUX_TYPE_FUNCTION);
 	spin_unlock_irqrestore(&pfc->lock, flags);
 }
-- 
2.25.1

