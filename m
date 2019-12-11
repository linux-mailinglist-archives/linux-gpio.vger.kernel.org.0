Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2BD411A87F
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 11:03:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728420AbfLKKDM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 05:03:12 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:34842 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728370AbfLKKDM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 05:03:12 -0500
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id ca392100b5USYZQ01a39wX; Wed, 11 Dec 2019 11:03:09 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ieypp-0007OO-JU; Wed, 11 Dec 2019 11:03:09 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ieypp-0001oy-Hv; Wed, 11 Dec 2019 11:03:09 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: Remove use of ARCH_R8A7796
Date:   Wed, 11 Dec 2019 11:03:08 +0100
Message-Id: <20191211100308.6958-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

CONFIG_ARCH_R8A7796 was renamed to CONFIG_ARCH_R8A77960 in commit
39e57e14d7eaf818 ("soc: renesas: Add ARCH_R8A77960 for existing R-Car
M3-W"), so its users can be removed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in sh-pfc-for-v5.6.

 drivers/pinctrl/sh-pfc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/Kconfig b/drivers/pinctrl/sh-pfc/Kconfig
index 28d66e7cb098863b..ecf3b045bf755008 100644
--- a/drivers/pinctrl/sh-pfc/Kconfig
+++ b/drivers/pinctrl/sh-pfc/Kconfig
@@ -27,7 +27,7 @@ config PINCTRL_SH_PFC
 	select PINCTRL_PFC_R8A7793 if ARCH_R8A7793
 	select PINCTRL_PFC_R8A7794 if ARCH_R8A7794
 	select PINCTRL_PFC_R8A7795 if ARCH_R8A7795
-	select PINCTRL_PFC_R8A77960 if ARCH_R8A77960 || ARCH_R8A7796
+	select PINCTRL_PFC_R8A77960 if ARCH_R8A77960
 	select PINCTRL_PFC_R8A77961 if ARCH_R8A77961
 	select PINCTRL_PFC_R8A77965 if ARCH_R8A77965
 	select PINCTRL_PFC_R8A77970 if ARCH_R8A77970
-- 
2.17.1

