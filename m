Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C53551B9FF
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2019 17:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731356AbfEMP3G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 May 2019 11:29:06 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:33942 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731351AbfEMP3F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 May 2019 11:29:05 -0400
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id BrV22000c3XaVaC01rV2Df; Mon, 13 May 2019 17:29:03 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hQCsx-0001eM-GC; Mon, 13 May 2019 17:29:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hQCsx-0003R8-F1; Mon, 13 May 2019 17:29:03 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Chris Paterson <chris.paterson2@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 11/11] pinctrl: sh-pfc: Remove obsolete SH_PFC_PIN_NAMED*() macros
Date:   Mon, 13 May 2019 17:28:57 +0200
Message-Id: <20190513152857.13122-12-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190513152857.13122-1-geert+renesas@glider.be>
References: <20190513152857.13122-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Now all Renesas pin control drivers have been converted to use the new
non-GPIO helper macros, SH_PFC_PIN_NAMED() and SH_PFC_PIN_NAMED_CFG()
are no longer used.  Remove them.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/sh_pfc.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index a379698c97410202..835148fc0f28fbcb 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -667,22 +667,6 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
 		.configs = cfgs,					\
 	}
 
-/* SH_PFC_PIN_NAMED - Expand to a sh_pfc_pin entry with the given name */
-#define SH_PFC_PIN_NAMED(row, col, _name)				\
-	{								\
-		.pin = PIN_NUMBER(row, col),				\
-		.name = __stringify(PIN_##_name),			\
-		.configs = SH_PFC_PIN_CFG_NO_GPIO,			\
-	}
-
-/* SH_PFC_PIN_NAMED_CFG - Expand to a sh_pfc_pin entry with the given name */
-#define SH_PFC_PIN_NAMED_CFG(row, col, _name, cfgs)			\
-	{								\
-		.pin = PIN_NUMBER(row, col),				\
-		.name = __stringify(PIN_##_name),			\
-		.configs = SH_PFC_PIN_CFG_NO_GPIO | cfgs,		\
-	}
-
 /* PINMUX_DATA_ALL - Expand to a list of PORT_name_DATA, PORT_name_FN0,
  *		     PORT_name_OUT, PORT_name_IN marks
  */
-- 
2.17.1

