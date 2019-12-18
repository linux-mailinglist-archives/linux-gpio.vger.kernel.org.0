Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1644D125244
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 20:48:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727532AbfLRTsU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 14:48:20 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:60668 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727546AbfLRTsT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Dec 2019 14:48:19 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id fXoF2100a5USYZQ01XoFrg; Wed, 18 Dec 2019 20:48:16 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ihfIt-0007xy-II; Wed, 18 Dec 2019 20:48:15 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ihfIt-0003KY-H5; Wed, 18 Dec 2019 20:48:15 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/6] sh: sh7264: Remove bogus SSU GPIO function definitions
Date:   Wed, 18 Dec 2019 20:48:11 +0100
Message-Id: <20191218194812.12741-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218194812.12741-1-geert+renesas@glider.be>
References: <20191218194812.12741-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SH7264 has no Synchronous Serial Communication Unit (SSU).
Remove the bogus enum IDs, which caused holes in pinmux_func_gpios[].

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Presumably this has been copied from sh7203.

The runtime-check under development reports:

    sh7264_pfc: empty function gpio 118
    sh7264_pfc: empty function gpio 119
    sh7264_pfc: empty function gpio 120
    sh7264_pfc: empty function gpio 121
    sh7264_pfc: empty function gpio 122
    sh7264_pfc: empty function gpio 123
    sh7264_pfc: empty function gpio 124
    sh7264_pfc: empty function gpio 125
    sh7264_pfc: empty function gpio 126
    sh7264_pfc: empty function gpio 127
    sh7264_pfc: empty function gpio 128
    sh7264_pfc: empty function gpio 129
    sh7264_pfc: empty function gpio 130
    sh7264_pfc: empty function gpio 131
    sh7264_pfc: empty function gpio 132
    sh7264_pfc: empty function gpio 133
---
 arch/sh/include/cpu-sh2a/cpu/sh7264.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/sh/include/cpu-sh2a/cpu/sh7264.h b/arch/sh/include/cpu-sh2a/cpu/sh7264.h
index d12c1918684518b3..8a1338aaf10a5c41 100644
--- a/arch/sh/include/cpu-sh2a/cpu/sh7264.h
+++ b/arch/sh/include/cpu-sh2a/cpu/sh7264.h
@@ -112,12 +112,6 @@ enum {
 	GPIO_FN_TIOC0D, GPIO_FN_TIOC0C, GPIO_FN_TIOC0B, GPIO_FN_TIOC0A,
 	GPIO_FN_TCLKD, GPIO_FN_TCLKC, GPIO_FN_TCLKB, GPIO_FN_TCLKA,
 
-	/* SSU */
-	GPIO_FN_SCS0_PD, GPIO_FN_SSO0_PD, GPIO_FN_SSI0_PD, GPIO_FN_SSCK0_PD,
-	GPIO_FN_SCS0_PF, GPIO_FN_SSO0_PF, GPIO_FN_SSI0_PF, GPIO_FN_SSCK0_PF,
-	GPIO_FN_SCS1_PD, GPIO_FN_SSO1_PD, GPIO_FN_SSI1_PD, GPIO_FN_SSCK1_PD,
-	GPIO_FN_SCS1_PF, GPIO_FN_SSO1_PF, GPIO_FN_SSI1_PF, GPIO_FN_SSCK1_PF,
-
 	/* SCIF */
 	GPIO_FN_SCK0, GPIO_FN_SCK1, GPIO_FN_SCK2, GPIO_FN_SCK3,
 	GPIO_FN_RXD0, GPIO_FN_RXD1, GPIO_FN_RXD2, GPIO_FN_RXD3,
-- 
2.17.1

