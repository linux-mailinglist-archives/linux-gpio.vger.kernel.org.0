Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 160B13B8565
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jun 2021 16:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235631AbhF3OxT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Jun 2021 10:53:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235671AbhF3OxS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Jun 2021 10:53:18 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF2F2C061768
        for <linux-gpio@vger.kernel.org>; Wed, 30 Jun 2021 07:50:48 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:7d95:f75f:5ece:4663])
        by andre.telenet-ops.be with bizsmtp
        id PSql250024F6zkK01Sql1v; Wed, 30 Jun 2021 16:50:45 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lybY4-0059dI-NC; Wed, 30 Jun 2021 16:50:44 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lybY4-005c61-BA; Wed, 30 Jun 2021 16:50:44 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/2] pinctrl: renesas: rcar: Avoid changing PUDn when disabling bias
Date:   Wed, 30 Jun 2021 16:50:42 +0200
Message-Id: <071ec644de2555da593a4531ef5d3e4d79cf997d.1625064076.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625064076.git.geert+renesas@glider.be>
References: <cover.1625064076.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When disabling pin bias, there is no need to touch the LSI pin
pull-up/down control register (PUDn), which selects between pull-up and
pull-down.  Just disabling the pull-up/down function through the LSI pin
pull-enable register (PUENn) us sufficient.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 drivers/pinctrl/renesas/pinctrl.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl.c b/drivers/pinctrl/renesas/pinctrl.c
index bb488af298623407..85cb78cfcfa6c37d 100644
--- a/drivers/pinctrl/renesas/pinctrl.c
+++ b/drivers/pinctrl/renesas/pinctrl.c
@@ -898,17 +898,17 @@ void rcar_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
 
 	if (reg->puen) {
 		enable = sh_pfc_read(pfc, reg->puen) & ~BIT(bit);
-		if (bias != PIN_CONFIG_BIAS_DISABLE)
+		if (bias != PIN_CONFIG_BIAS_DISABLE) {
 			enable |= BIT(bit);
 
-		if (reg->pud) {
-			updown = sh_pfc_read(pfc, reg->pud) & ~BIT(bit);
-			if (bias == PIN_CONFIG_BIAS_PULL_UP)
-				updown |= BIT(bit);
+			if (reg->pud) {
+				updown = sh_pfc_read(pfc, reg->pud) & ~BIT(bit);
+				if (bias == PIN_CONFIG_BIAS_PULL_UP)
+					updown |= BIT(bit);
 
-			sh_pfc_write(pfc, reg->pud, updown);
+				sh_pfc_write(pfc, reg->pud, updown);
+			}
 		}
-
 		sh_pfc_write(pfc, reg->puen, enable);
 	} else {
 		enable = sh_pfc_read(pfc, reg->pud) & ~BIT(bit);
-- 
2.25.1

