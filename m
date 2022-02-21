Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 882B54BE66B
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Feb 2022 19:02:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380467AbiBUQ1q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Feb 2022 11:27:46 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380870AbiBUQ0L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Feb 2022 11:26:11 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 340CB2B1A8
        for <linux-gpio@vger.kernel.org>; Mon, 21 Feb 2022 08:24:47 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:49dc:a1b5:3fe0:3d2b])
        by xavier.telenet-ops.be with bizsmtp
        id xsQM2600P3YJRAw01sQMKt; Mon, 21 Feb 2022 17:24:21 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nMBU5-001Thx-0G; Mon, 21 Feb 2022 17:24:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nMBU4-006Fwd-Fo; Mon, 21 Feb 2022 17:24:20 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: Simplify multiplication/shift logic
Date:   Mon, 21 Feb 2022 17:24:19 +0100
Message-Id: <31eaa3226c61ecf653e2b031307eea42a9a3d54e.1645460548.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

"a * (1 << b)" == "a << b".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-pinctrl-for-v5.18.

 drivers/pinctrl/renesas/sh_pfc.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
index 6b5836ea47de224c..da05eec97acc323c 100644
--- a/drivers/pinctrl/renesas/sh_pfc.h
+++ b/drivers/pinctrl/renesas/sh_pfc.h
@@ -132,9 +132,8 @@ struct pinmux_cfg_reg {
 	.reg = r, .reg_width = r_width,					\
 	.field_width = f_width + BUILD_BUG_ON_ZERO(r_width % f_width) +	\
 	BUILD_BUG_ON_ZERO(sizeof((const u16 []) { ids }) / sizeof(u16) != \
-			  (r_width / f_width) * (1 << f_width)),	\
-	.enum_ids = (const u16 [(r_width / f_width) * (1 << f_width)])	\
-		{ ids }
+			  (r_width / f_width) << f_width),		\
+	.enum_ids = (const u16 [(r_width / f_width) << f_width]) { ids }
 
 /*
  * Describe a config register consisting of several fields of different widths
-- 
2.25.1

