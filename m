Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35ED154CAAA
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jun 2022 16:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355703AbiFOOAN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jun 2022 10:00:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355476AbiFOOAJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jun 2022 10:00:09 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7716744767
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2022 06:59:44 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:5439:2bcc:4a70:48e8])
        by laurent.telenet-ops.be with bizsmtp
        id jRzj270034lJ8fu01RzjJ1; Wed, 15 Jun 2022 15:59:43 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1o1TYc-0044ov-PJ; Wed, 15 Jun 2022 15:59:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1o1TYc-006xp9-9y; Wed, 15 Jun 2022 15:59:42 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: r8a779f0: Remove unused POC2
Date:   Wed, 15 Jun 2022 15:59:41 +0200
Message-Id: <d8a9ea39b49d24e39f4da3f00b64bce34016887d.1655301529.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The POWER Condition Control Register 2 (POC2) is unused, and the
documentation does not define any valid bits.  Remove it.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-pinctrl for v5.20.

 drivers/pinctrl/renesas/pfc-r8a779f0.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779f0.c b/drivers/pinctrl/renesas/pfc-r8a779f0.c
index aaca4ee2af5554c7..417c357f16b194d5 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779f0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779f0.c
@@ -1902,7 +1902,6 @@ static const struct pinmux_drive_reg pinmux_drive_regs[] = {
 enum ioctrl_regs {
 	POC0,
 	POC1,
-	POC2,
 	POC3,
 	TD0SEL1,
 };
@@ -1910,7 +1909,6 @@ enum ioctrl_regs {
 static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
 	[POC0] = { 0xe60500a0, },
 	[POC1] = { 0xe60508a0, },
-	[POC2] = { 0xe60510a0, },
 	[POC3] = { 0xe60518a0, },
 	[TD0SEL1] = { 0xe6050920, },
 	{ /* sentinel */ },
-- 
2.25.1

