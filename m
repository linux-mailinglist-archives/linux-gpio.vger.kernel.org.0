Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE95178DD42
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Aug 2023 20:54:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243494AbjH3Ssm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Aug 2023 14:48:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245520AbjH3P0B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Aug 2023 11:26:01 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6572D83
        for <linux-gpio@vger.kernel.org>; Wed, 30 Aug 2023 08:25:58 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6c13:6b1b:7366:87c0])
        by michel.telenet-ops.be with bizsmtp
        id frRw2A00Q3874jb06rRwk5; Wed, 30 Aug 2023 17:25:57 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qbN4i-0023rx-Rp;
        Wed, 30 Aug 2023 17:25:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qbN4u-005M0f-OE;
        Wed, 30 Aug 2023 17:25:56 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: r8a7779: s/LSBC/LBSC/
Date:   Wed, 30 Aug 2023 17:25:55 +0200
Message-Id: <129f08c4246f88fd5a25ca5b82c255919b71ca6c.1693409115.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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

Fix a misspelling of "LBSC" (Local Bus State Controller).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-pinctrl for v6.7.

 drivers/pinctrl/renesas/pfc-r8a7779.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7779.c b/drivers/pinctrl/renesas/pfc-r8a7779.c
index 1172a359384d5799..e1a8cb6691201ce0 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7779.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7779.c
@@ -1942,7 +1942,7 @@ static const unsigned int intc_irq3_b_pins[] = {
 static const unsigned int intc_irq3_b_mux[] = {
 	IRQ3_B_MARK,
 };
-/* - LSBC ------------------------------------------------------------------- */
+/* - LBSC ------------------------------------------------------------------- */
 static const unsigned int lbsc_cs0_pins[] = {
 	/* CS */
 	RCAR_GP_PIN(0, 13),
-- 
2.34.1

