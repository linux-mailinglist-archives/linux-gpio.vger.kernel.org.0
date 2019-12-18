Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14979125240
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 20:48:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727558AbfLRTsT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 14:48:19 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:43466 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727532AbfLRTsT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Dec 2019 14:48:19 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id fXoF2100C5USYZQ06XoFVq; Wed, 18 Dec 2019 20:48:16 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ihfIt-0007y1-JB; Wed, 18 Dec 2019 20:48:15 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ihfIt-0003Kb-I4; Wed, 18 Dec 2019 20:48:15 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 6/6] sh: sh7269: Remove bogus SSU GPIO function definitions
Date:   Wed, 18 Dec 2019 20:48:12 +0100
Message-Id: <20191218194812.12741-7-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218194812.12741-1-geert+renesas@glider.be>
References: <20191218194812.12741-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SH7269 has no Synchronous Serial Communication Unit (SSU).
Remove the bogus enum IDs, which caused holes in pinmux_func_gpios[].

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Presumably this has been copied from sh7203.

The runtime-check under development reports:

    sh7269_pfc: empty function gpio 141
    sh7269_pfc: empty function gpio 142
    sh7269_pfc: empty function gpio 143
    sh7269_pfc: empty function gpio 144
    sh7269_pfc: empty function gpio 145
    sh7269_pfc: empty function gpio 146
    sh7269_pfc: empty function gpio 147
    sh7269_pfc: empty function gpio 148
    sh7269_pfc: empty function gpio 149
    sh7269_pfc: empty function gpio 150
    sh7269_pfc: empty function gpio 151
    sh7269_pfc: empty function gpio 152
    sh7269_pfc: empty function gpio 153
    sh7269_pfc: empty function gpio 154
    sh7269_pfc: empty function gpio 155
    sh7269_pfc: empty function gpio 156
---
 arch/sh/include/cpu-sh2a/cpu/sh7269.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/sh/include/cpu-sh2a/cpu/sh7269.h b/arch/sh/include/cpu-sh2a/cpu/sh7269.h
index b887cc402b712557..fece521c74b30d4d 100644
--- a/arch/sh/include/cpu-sh2a/cpu/sh7269.h
+++ b/arch/sh/include/cpu-sh2a/cpu/sh7269.h
@@ -126,12 +126,6 @@ enum {
 	GPIO_FN_TIOC0D, GPIO_FN_TIOC0C, GPIO_FN_TIOC0B, GPIO_FN_TIOC0A,
 	GPIO_FN_TCLKD, GPIO_FN_TCLKC, GPIO_FN_TCLKB, GPIO_FN_TCLKA,
 
-	/* SSU */
-	GPIO_FN_SCS0_PD, GPIO_FN_SSO0_PD, GPIO_FN_SSI0_PD, GPIO_FN_SSCK0_PD,
-	GPIO_FN_SCS0_PF, GPIO_FN_SSO0_PF, GPIO_FN_SSI0_PF, GPIO_FN_SSCK0_PF,
-	GPIO_FN_SCS1_PD, GPIO_FN_SSO1_PD, GPIO_FN_SSI1_PD, GPIO_FN_SSCK1_PD,
-	GPIO_FN_SCS1_PF, GPIO_FN_SSO1_PF, GPIO_FN_SSI1_PF, GPIO_FN_SSCK1_PF,
-
 	/* SCIF */
 	GPIO_FN_SCK0, GPIO_FN_RXD0, GPIO_FN_TXD0,
 	GPIO_FN_SCK1, GPIO_FN_RXD1, GPIO_FN_TXD1, GPIO_FN_RTS1, GPIO_FN_CTS1,
-- 
2.17.1

