Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E694129DCE6
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 01:33:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731905AbgJ1WXO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 18:23:14 -0400
Received: from leibniz.telenet-ops.be ([195.130.137.77]:41686 "EHLO
        leibniz.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732581AbgJ1WV5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 18:21:57 -0400
X-Greylist: delayed 1499 seconds by postgrey-1.27 at vger.kernel.org; Wed, 28 Oct 2020 18:21:55 EDT
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4CLsc85q05zMv7nN
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 16:16:40 +0100 (CET)
Received: from ramsan.of.borg ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id lTGf2300f4C55Sk01TGfGz; Wed, 28 Oct 2020 16:16:40 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kXnBn-000pDa-IS; Wed, 28 Oct 2020 16:16:39 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kXnBn-007H8r-7B; Wed, 28 Oct 2020 16:16:39 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/8] pinctrl: renesas: Singular/plural grammar fixes
Date:   Wed, 28 Oct 2020 16:16:31 +0100
Message-Id: <20201028151637.1734130-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201028151637.1734130-1-geert+renesas@glider.be>
References: <20201028151637.1734130-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix a few singular vs. plural grammar issues in comments.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/gpio.c    | 2 +-
 drivers/pinctrl/renesas/pinctrl.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/renesas/gpio.c b/drivers/pinctrl/renesas/gpio.c
index 9c6e931ae766edf7..ad06f5355d1ed1c5 100644
--- a/drivers/pinctrl/renesas/gpio.c
+++ b/drivers/pinctrl/renesas/gpio.c
@@ -328,7 +328,7 @@ int sh_pfc_register_gpiochip(struct sh_pfc *pfc)
 	if (pfc->info->data_regs == NULL)
 		return 0;
 
-	/* Find the memory window that contain the GPIO registers. Boards that
+	/* Find the memory window that contains the GPIO registers. Boards that
 	 * register a separate GPIO device will not supply a memory resource
 	 * that covers the data registers. In that case don't try to handle
 	 * GPIOs.
diff --git a/drivers/pinctrl/renesas/pinctrl.c b/drivers/pinctrl/renesas/pinctrl.c
index f8d5fae66e862fd6..8e54f9b662f37f37 100644
--- a/drivers/pinctrl/renesas/pinctrl.c
+++ b/drivers/pinctrl/renesas/pinctrl.c
@@ -399,7 +399,7 @@ static int sh_pfc_gpio_request_enable(struct pinctrl_dev *pctldev,
 	spin_lock_irqsave(&pfc->lock, flags);
 
 	if (!pfc->gpio) {
-		/* If GPIOs are handled externally the pin mux type need to be
+		/* If GPIOs are handled externally the pin mux type needs to be
 		 * set to GPIO here.
 		 */
 		const struct sh_pfc_pin *pin = &pfc->info->pins[idx];
@@ -450,8 +450,8 @@ static int sh_pfc_gpio_set_direction(struct pinctrl_dev *pctldev,
 	unsigned int dir;
 	int ret;
 
-	/* Check if the requested direction is supported by the pin. Not all SoC
-	 * provide pin config data, so perform the check conditionally.
+	/* Check if the requested direction is supported by the pin. Not all
+	 * SoCs provide pin config data, so perform the check conditionally.
 	 */
 	if (pin->configs) {
 		dir = input ? SH_PFC_PIN_CFG_INPUT : SH_PFC_PIN_CFG_OUTPUT;
-- 
2.25.1

