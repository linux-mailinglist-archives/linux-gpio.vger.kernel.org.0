Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB1E4FF834
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 15:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232388AbiDMNya (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 09:54:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231637AbiDMNy3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 09:54:29 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30FB92B27D
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 06:52:08 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by andre.telenet-ops.be with bizsmtp
        id JDs6270052t8Arn01Ds6SN; Wed, 13 Apr 2022 15:52:06 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nedPi-000Sfd-3K; Wed, 13 Apr 2022 15:52:06 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nedPh-00AjGr-HG; Wed, 13 Apr 2022 15:52:05 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: rzg2l: Restore pin config order
Date:   Wed, 13 Apr 2022 15:52:04 +0200
Message-Id: <f9b18be9e5402531d058bd2479b4881377f9b8b6.1649857772.git.geert+renesas@glider.be>
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

The PIN_CFG_* capabilities are always listed in the order they are
defined, except in the "TMS/SWDIO" pin definition.

Fix the order, to increase uniformity.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-pinctrl for v5.19.

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 86a7096640ad0bda..a48cac55152cefa3 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -1026,7 +1026,7 @@ static struct {
 		{ "NMI", RZG2L_SINGLE_PIN_PACK(0x1, 0,
 		 (PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL)) },
 		{ "TMS/SWDIO", RZG2L_SINGLE_PIN_PACK(0x2, 0,
-		 (PIN_CFG_SR | PIN_CFG_IOLH_A | PIN_CFG_IEN)) },
+		 (PIN_CFG_IOLH_A | PIN_CFG_SR | PIN_CFG_IEN)) },
 		{ "TDO", RZG2L_SINGLE_PIN_PACK(0x3, 0,
 		 (PIN_CFG_IOLH_A | PIN_CFG_SR | PIN_CFG_IEN)) },
 		{ "AUDIO_CLK1", RZG2L_SINGLE_PIN_PACK(0x4, 0, PIN_CFG_IEN) },
-- 
2.25.1

