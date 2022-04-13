Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 664D44FFC4B
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237294AbiDMR0p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:26:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235710AbiDMR0m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:26:42 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71D15119
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:24:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by andre.telenet-ops.be with bizsmtp
        id JHQF2700Y2t8Arn01HQFPh; Wed, 13 Apr 2022 19:24:15 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj1-000Tq7-5W; Wed, 13 Apr 2022 19:24:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj0-00DfRv-1C; Wed, 13 Apr 2022 19:24:14 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 03/50] pinctrl: renesas: rmobile: Mark unused PORTCR bits reserved
Date:   Wed, 13 Apr 2022 19:23:25 +0200
Message-Id: <1b123d8f04c2314d5a7a87004971868ba2176499.1649865241.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649865241.git.geert+renesas@glider.be>
References: <cover.1649865241.git.geert+renesas@glider.be>
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

The PULMD bits and the SEC bit in the PORTCR register descriptions on
SH/R-Mobile SoCs are either unused or unsupported.  Describe them as
reserved bits using a negative field width value, and drop the
corresponding dummy enum IDs.

This reduces kernel size by 2832 (R-Mobile APE6), 2544 (R-Mobile A1),
and/or 3228 (SH-Mobile AG5) bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/sh_pfc.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
index 64e3dde997347ad5..12bc279f573311d5 100644
--- a/drivers/pinctrl/renesas/sh_pfc.h
+++ b/drivers/pinctrl/renesas/sh_pfc.h
@@ -739,14 +739,12 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
  * PORTnCR helper macro for SH-Mobile/R-Mobile
  */
 #define PORTCR(nr, reg) {						\
-	PINMUX_CFG_REG_VAR("PORT" nr "CR", reg, 8, GROUP(2, 2, 1, 3),	\
+	PINMUX_CFG_REG_VAR("PORT" nr "CR", reg, 8, GROUP(-2, 2, -1, 3),	\
 			   GROUP(					\
 		/* PULMD[1:0], handled by .set_bias() */		\
-		0, 0, 0, 0,						\
 		/* IE and OE */						\
 		0, PORT##nr##_OUT, PORT##nr##_IN, 0,			\
 		/* SEC, not supported */				\
-		0, 0,							\
 		/* PTMD[2:0] */						\
 		PORT##nr##_FN0, PORT##nr##_FN1,				\
 		PORT##nr##_FN2, PORT##nr##_FN3,				\
-- 
2.25.1

