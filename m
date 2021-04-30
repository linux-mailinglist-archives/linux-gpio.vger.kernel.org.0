Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DAC736FA37
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Apr 2021 14:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbhD3McK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Apr 2021 08:32:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232019AbhD3McG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Apr 2021 08:32:06 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8A38C061345
        for <linux-gpio@vger.kernel.org>; Fri, 30 Apr 2021 05:31:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d4dd:70b4:3264:8d97])
        by andre.telenet-ops.be with bizsmtp
        id z0XG2400B4p6Y38010XGUl; Fri, 30 Apr 2021 14:31:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lcSId-001ecG-NJ; Fri, 30 Apr 2021 14:31:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lcSId-00Bdut-1r; Fri, 30 Apr 2021 14:31:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 04/12] pinctrl: renesas: r8a7778: Remove unused PORT_GP_PUP_1() macro
Date:   Fri, 30 Apr 2021 14:31:03 +0200
Message-Id: <129147ac57f5e931cc7108db0a6483b803a1b8f4.1619785375.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619785375.git.geert+renesas@glider.be>
References: <cover.1619785375.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The last user was removed in commit dd1f760bffcee2c5 ("pinctrl: sh-pfc:
r8a7778: Use common PORT_GP_CFG_27() macro").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a7778.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7778.c b/drivers/pinctrl/renesas/pfc-r8a7778.c
index 6185af9c499006e7..d641e408f1bd413c 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7778.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7778.c
@@ -18,9 +18,6 @@
 
 #include "sh_pfc.h"
 
-#define PORT_GP_PUP_1(bank, pin, fn, sfx)	\
-	PORT_GP_CFG_1(bank, pin, fn, sfx, SH_PFC_PIN_CFG_PULL_UP)
-
 #define CPU_ALL_GP(fn, sfx)		\
 	PORT_GP_CFG_32(0, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
 	PORT_GP_CFG_32(1, fn, sfx, SH_PFC_PIN_CFG_PULL_UP),		\
-- 
2.25.1

