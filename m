Return-Path: <linux-gpio+bounces-10797-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9113298F12C
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 16:17:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2A3C1F21CD5
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 14:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D74519CC1E;
	Thu,  3 Oct 2024 14:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GJwibjgx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BCA12D1FA
	for <linux-gpio@vger.kernel.org>; Thu,  3 Oct 2024 14:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727965015; cv=none; b=g0WTym/p/e/EpkaVRjG2b9j5yGrkO7IzEinmZCQ2KiNrzJMuIsLRSzpV1sqQDEqmCW2BuIXXaftntHP0l1GwB5uTD3JY+p5I3YSTlUIQLbROgMF0IlNKoNXGqZRq4ROiS4myNCAaL4I0P7sJky014xplBwi9aH0K6pgZjRG3jaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727965015; c=relaxed/simple;
	bh=2V0FSsBUEK1YSjhhrV/4tw2MgZ8433fBunRjyQWOQNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SNgvukp2kjE2NAKe53cfxaYIwLZE8DpCYvxBNHWWYgF7JJ2vz3wEt6ntRSa0KEQjGk/yM6M923Irqjjv3v6TOmkZSpTNuR7+5pceBpVM2998ZinyJO+AYDs76ntUVWCet9+2erJDA96zJmXCrgMWyNXfFitPT5endFu3FLE5kNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GJwibjgx; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c89668464cso1246858a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 03 Oct 2024 07:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727965010; x=1728569810; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sIRo0R9Ru8WoD9y3TRJXMRZ5Ajvd7H1cnftn09CMgiQ=;
        b=GJwibjgxjZAluHBG/qVgb+jRUGitgeb0tAVN8BYgbu2EDibZBQaP0UVJ5AoRtAp63Z
         3iCUXBv3jZWi3rLGeKyriqjyBLlRv+caqf4pdAYketity5dZ2ya0IowxSKONUwf0JSE6
         ZgKv1RHKmjU0wL0jOTEQp4bzD9jtcbYCCGcyR7yPZfxY3msUR2iykkWe3zMegLKndb6F
         WI4sszcKST4c7a+t2WBNfjX1FMdyd3iayqv5wJkXglDLN4lep6FQMo58NHTYFxrIieCA
         KSnlVPpXHeZ6ixEjJ3DRS9yG68/O26ZolwxpyX0NvRER9SJazT0lwWN5XFuicNTPQjDN
         CieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727965010; x=1728569810;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sIRo0R9Ru8WoD9y3TRJXMRZ5Ajvd7H1cnftn09CMgiQ=;
        b=MWKIEZ8TcaksysMvaETc8pWWwqh5/84o72DywMIK61ZS/Hs9fpy1gpzcGSbW25DnX1
         IOmkWYd2fZ5Oy0DFE+EZnK+AiIkkImRydj9WXyWgbljAfvEddWd6BbRGm9ili4bP/u0T
         nRmbOzHKZvFVqQIkiD5RkLvK0dH5e5r8WVSbBetOu+qDKbW/iTQUiErestq+O9s88DsM
         sZo27KoEXFfamXtzK9kqYjHSJhR/m+UJR4m6C4yVtrlanHFuONv6zayUSKY7autR2BR8
         xRtQLBLjscKSapD8tIMZTUxFD+bptOMHBWQr93194f//Q7MJ7w3VL0bVoHnl2GupprOX
         kIVQ==
X-Gm-Message-State: AOJu0YzNFRXMqxCGWgAy7ssRwJkNdZUQ1Xmrs2Ci+GefH5ThFkDdO8ag
	f8DBfM3NKQj1wOY/U7vdauAR8Re9DjJ/SRbzYwyMKvrcXgy4yIA/uErkx0WpJqY=
X-Google-Smtp-Source: AGHT+IFjMJ15NnWrEJrn2rlvfam+PuZLDLn+eOt6seTZFHWXKWI0elg1GsLrbZ/cOdd8tmAesnmOxw==
X-Received: by 2002:a05:6402:51c6:b0:5c8:a0ac:f3b5 with SMTP id 4fb4d7f45d1cf-5c8b1925b77mr4978742a12.10.1727965010276;
        Thu, 03 Oct 2024 07:16:50 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8ca3e0062sm769757a12.37.2024.10.03.07.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 07:16:49 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 03 Oct 2024 16:16:47 +0200
Subject: [PATCH] pinctrl: imx27: Fix too generic defines
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241003-fix-imx27-pc-v1-1-0e78d1fc6175@linaro.org>
X-B4-Tracking: v=1; b=H4sIAE6n/mYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDAwNj3bTMCt3M3Aojc92CZN00M0NTc0tLo1TDNEsloJaColSgPNi46Nj
 aWgDsNkgiXgAAAA==
To: Esben Haabendal <esben@geanix.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Esben Haabendal <esben@geanix.com>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 kernel test robot <lkp@intel.com>, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0

The "PC" define is colliding with the (apparently broadcased)
define for "program counter" on Loongarch, so let's rename all
these 2-letter defines so they don't collide with stuff.

Fixes: a55222b7a132 ("pinctrl: freescale: enable use with COMPILE_TEST")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202410030214.dPrgmUqd-lkp@intel.com/
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/freescale/pinctrl-imx27.c | 350 +++++++++++++++---------------
 1 file changed, 175 insertions(+), 175 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx27.c b/drivers/pinctrl/freescale/pinctrl-imx27.c
index 1738df461235..afeb39957203 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx27.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx27.c
@@ -16,188 +16,188 @@
 #include "pinctrl-imx1.h"
 
 #define PAD_ID(port, pin) (port*32 + pin)
-#define PA 0
-#define PB 1
-#define PC 2
-#define PD 3
-#define PE 4
-#define PF 5
+#define MX27_PA 0
+#define MX27_PB 1
+#define MX27_PC 2
+#define MX27_PD 3
+#define MX27_PE 4
+#define MX27_PF 5
 
 enum imx27_pads {
-	MX27_PAD_USBH2_CLK = PAD_ID(PA, 0),
-	MX27_PAD_USBH2_DIR = PAD_ID(PA, 1),
-	MX27_PAD_USBH2_DATA7 = PAD_ID(PA, 2),
-	MX27_PAD_USBH2_NXT = PAD_ID(PA, 3),
-	MX27_PAD_USBH2_STP = PAD_ID(PA, 4),
-	MX27_PAD_LSCLK = PAD_ID(PA, 5),
-	MX27_PAD_LD0 = PAD_ID(PA, 6),
-	MX27_PAD_LD1 = PAD_ID(PA, 7),
-	MX27_PAD_LD2 = PAD_ID(PA, 8),
-	MX27_PAD_LD3 = PAD_ID(PA, 9),
-	MX27_PAD_LD4 = PAD_ID(PA, 10),
-	MX27_PAD_LD5 = PAD_ID(PA, 11),
-	MX27_PAD_LD6 = PAD_ID(PA, 12),
-	MX27_PAD_LD7 = PAD_ID(PA, 13),
-	MX27_PAD_LD8 = PAD_ID(PA, 14),
-	MX27_PAD_LD9 = PAD_ID(PA, 15),
-	MX27_PAD_LD10 = PAD_ID(PA, 16),
-	MX27_PAD_LD11 = PAD_ID(PA, 17),
-	MX27_PAD_LD12 = PAD_ID(PA, 18),
-	MX27_PAD_LD13 = PAD_ID(PA, 19),
-	MX27_PAD_LD14 = PAD_ID(PA, 20),
-	MX27_PAD_LD15 = PAD_ID(PA, 21),
-	MX27_PAD_LD16 = PAD_ID(PA, 22),
-	MX27_PAD_LD17 = PAD_ID(PA, 23),
-	MX27_PAD_REV = PAD_ID(PA, 24),
-	MX27_PAD_CLS = PAD_ID(PA, 25),
-	MX27_PAD_PS = PAD_ID(PA, 26),
-	MX27_PAD_SPL_SPR = PAD_ID(PA, 27),
-	MX27_PAD_HSYNC = PAD_ID(PA, 28),
-	MX27_PAD_VSYNC = PAD_ID(PA, 29),
-	MX27_PAD_CONTRAST = PAD_ID(PA, 30),
-	MX27_PAD_OE_ACD = PAD_ID(PA, 31),
+	MX27_PAD_USBH2_CLK = PAD_ID(MX27_PA, 0),
+	MX27_PAD_USBH2_DIR = PAD_ID(MX27_PA, 1),
+	MX27_PAD_USBH2_DATA7 = PAD_ID(MX27_PA, 2),
+	MX27_PAD_USBH2_NXT = PAD_ID(MX27_PA, 3),
+	MX27_PAD_USBH2_STP = PAD_ID(MX27_PA, 4),
+	MX27_PAD_LSCLK = PAD_ID(MX27_PA, 5),
+	MX27_PAD_LD0 = PAD_ID(MX27_PA, 6),
+	MX27_PAD_LD1 = PAD_ID(MX27_PA, 7),
+	MX27_PAD_LD2 = PAD_ID(MX27_PA, 8),
+	MX27_PAD_LD3 = PAD_ID(MX27_PA, 9),
+	MX27_PAD_LD4 = PAD_ID(MX27_PA, 10),
+	MX27_PAD_LD5 = PAD_ID(MX27_PA, 11),
+	MX27_PAD_LD6 = PAD_ID(MX27_PA, 12),
+	MX27_PAD_LD7 = PAD_ID(MX27_PA, 13),
+	MX27_PAD_LD8 = PAD_ID(MX27_PA, 14),
+	MX27_PAD_LD9 = PAD_ID(MX27_PA, 15),
+	MX27_PAD_LD10 = PAD_ID(MX27_PA, 16),
+	MX27_PAD_LD11 = PAD_ID(MX27_PA, 17),
+	MX27_PAD_LD12 = PAD_ID(MX27_PA, 18),
+	MX27_PAD_LD13 = PAD_ID(MX27_PA, 19),
+	MX27_PAD_LD14 = PAD_ID(MX27_PA, 20),
+	MX27_PAD_LD15 = PAD_ID(MX27_PA, 21),
+	MX27_PAD_LD16 = PAD_ID(MX27_PA, 22),
+	MX27_PAD_LD17 = PAD_ID(MX27_PA, 23),
+	MX27_PAD_REV = PAD_ID(MX27_PA, 24),
+	MX27_PAD_CLS = PAD_ID(MX27_PA, 25),
+	MX27_PAD_PS = PAD_ID(MX27_PA, 26),
+	MX27_PAD_SPL_SPR = PAD_ID(MX27_PA, 27),
+	MX27_PAD_HSYNC = PAD_ID(MX27_PA, 28),
+	MX27_PAD_VSYNC = PAD_ID(MX27_PA, 29),
+	MX27_PAD_CONTRAST = PAD_ID(MX27_PA, 30),
+	MX27_PAD_OE_ACD = PAD_ID(MX27_PA, 31),
 
-	MX27_PAD_SD2_D0 = PAD_ID(PB, 4),
-	MX27_PAD_SD2_D1 = PAD_ID(PB, 5),
-	MX27_PAD_SD2_D2 = PAD_ID(PB, 6),
-	MX27_PAD_SD2_D3 = PAD_ID(PB, 7),
-	MX27_PAD_SD2_CMD = PAD_ID(PB, 8),
-	MX27_PAD_SD2_CLK = PAD_ID(PB, 9),
-	MX27_PAD_CSI_D0 = PAD_ID(PB, 10),
-	MX27_PAD_CSI_D1 = PAD_ID(PB, 11),
-	MX27_PAD_CSI_D2 = PAD_ID(PB, 12),
-	MX27_PAD_CSI_D3 = PAD_ID(PB, 13),
-	MX27_PAD_CSI_D4 = PAD_ID(PB, 14),
-	MX27_PAD_CSI_MCLK = PAD_ID(PB, 15),
-	MX27_PAD_CSI_PIXCLK = PAD_ID(PB, 16),
-	MX27_PAD_CSI_D5 = PAD_ID(PB, 17),
-	MX27_PAD_CSI_D6 = PAD_ID(PB, 18),
-	MX27_PAD_CSI_D7 = PAD_ID(PB, 19),
-	MX27_PAD_CSI_VSYNC = PAD_ID(PB, 20),
-	MX27_PAD_CSI_HSYNC = PAD_ID(PB, 21),
-	MX27_PAD_USBH1_SUSP = PAD_ID(PB, 22),
-	MX27_PAD_USB_PWR = PAD_ID(PB, 23),
-	MX27_PAD_USB_OC_B = PAD_ID(PB, 24),
-	MX27_PAD_USBH1_RCV = PAD_ID(PB, 25),
-	MX27_PAD_USBH1_FS = PAD_ID(PB, 26),
-	MX27_PAD_USBH1_OE_B = PAD_ID(PB, 27),
-	MX27_PAD_USBH1_TXDM = PAD_ID(PB, 28),
-	MX27_PAD_USBH1_TXDP = PAD_ID(PB, 29),
-	MX27_PAD_USBH1_RXDM = PAD_ID(PB, 30),
-	MX27_PAD_USBH1_RXDP = PAD_ID(PB, 31),
+	MX27_PAD_SD2_D0 = PAD_ID(MX27_PB, 4),
+	MX27_PAD_SD2_D1 = PAD_ID(MX27_PB, 5),
+	MX27_PAD_SD2_D2 = PAD_ID(MX27_PB, 6),
+	MX27_PAD_SD2_D3 = PAD_ID(MX27_PB, 7),
+	MX27_PAD_SD2_CMD = PAD_ID(MX27_PB, 8),
+	MX27_PAD_SD2_CLK = PAD_ID(MX27_PB, 9),
+	MX27_PAD_CSI_D0 = PAD_ID(MX27_PB, 10),
+	MX27_PAD_CSI_D1 = PAD_ID(MX27_PB, 11),
+	MX27_PAD_CSI_D2 = PAD_ID(MX27_PB, 12),
+	MX27_PAD_CSI_D3 = PAD_ID(MX27_PB, 13),
+	MX27_PAD_CSI_D4 = PAD_ID(MX27_PB, 14),
+	MX27_PAD_CSI_MCLK = PAD_ID(MX27_PB, 15),
+	MX27_PAD_CSI_PIXCLK = PAD_ID(MX27_PB, 16),
+	MX27_PAD_CSI_D5 = PAD_ID(MX27_PB, 17),
+	MX27_PAD_CSI_D6 = PAD_ID(MX27_PB, 18),
+	MX27_PAD_CSI_D7 = PAD_ID(MX27_PB, 19),
+	MX27_PAD_CSI_VSYNC = PAD_ID(MX27_PB, 20),
+	MX27_PAD_CSI_HSYNC = PAD_ID(MX27_PB, 21),
+	MX27_PAD_USBH1_SUSP = PAD_ID(MX27_PB, 22),
+	MX27_PAD_USB_PWR = PAD_ID(MX27_PB, 23),
+	MX27_PAD_USB_OC_B = PAD_ID(MX27_PB, 24),
+	MX27_PAD_USBH1_RCV = PAD_ID(MX27_PB, 25),
+	MX27_PAD_USBH1_FS = PAD_ID(MX27_PB, 26),
+	MX27_PAD_USBH1_OE_B = PAD_ID(MX27_PB, 27),
+	MX27_PAD_USBH1_TXDM = PAD_ID(MX27_PB, 28),
+	MX27_PAD_USBH1_TXDP = PAD_ID(MX27_PB, 29),
+	MX27_PAD_USBH1_RXDM = PAD_ID(MX27_PB, 30),
+	MX27_PAD_USBH1_RXDP = PAD_ID(MX27_PB, 31),
 
-	MX27_PAD_I2C2_SDA = PAD_ID(PC, 5),
-	MX27_PAD_I2C2_SCL = PAD_ID(PC, 6),
-	MX27_PAD_USBOTG_DATA5 = PAD_ID(PC, 7),
-	MX27_PAD_USBOTG_DATA6 = PAD_ID(PC, 8),
-	MX27_PAD_USBOTG_DATA0 = PAD_ID(PC, 9),
-	MX27_PAD_USBOTG_DATA2 = PAD_ID(PC, 10),
-	MX27_PAD_USBOTG_DATA1 = PAD_ID(PC, 11),
-	MX27_PAD_USBOTG_DATA4 = PAD_ID(PC, 12),
-	MX27_PAD_USBOTG_DATA3 = PAD_ID(PC, 13),
-	MX27_PAD_TOUT = PAD_ID(PC, 14),
-	MX27_PAD_TIN = PAD_ID(PC, 15),
-	MX27_PAD_SSI4_FS = PAD_ID(PC, 16),
-	MX27_PAD_SSI4_RXDAT = PAD_ID(PC, 17),
-	MX27_PAD_SSI4_TXDAT = PAD_ID(PC, 18),
-	MX27_PAD_SSI4_CLK = PAD_ID(PC, 19),
-	MX27_PAD_SSI1_FS = PAD_ID(PC, 20),
-	MX27_PAD_SSI1_RXDAT = PAD_ID(PC, 21),
-	MX27_PAD_SSI1_TXDAT = PAD_ID(PC, 22),
-	MX27_PAD_SSI1_CLK = PAD_ID(PC, 23),
-	MX27_PAD_SSI2_FS = PAD_ID(PC, 24),
-	MX27_PAD_SSI2_RXDAT = PAD_ID(PC, 25),
-	MX27_PAD_SSI2_TXDAT = PAD_ID(PC, 26),
-	MX27_PAD_SSI2_CLK = PAD_ID(PC, 27),
-	MX27_PAD_SSI3_FS = PAD_ID(PC, 28),
-	MX27_PAD_SSI3_RXDAT = PAD_ID(PC, 29),
-	MX27_PAD_SSI3_TXDAT = PAD_ID(PC, 30),
-	MX27_PAD_SSI3_CLK = PAD_ID(PC, 31),
+	MX27_PAD_I2C2_SDA = PAD_ID(MX27_PC, 5),
+	MX27_PAD_I2C2_SCL = PAD_ID(MX27_PC, 6),
+	MX27_PAD_USBOTG_DATA5 = PAD_ID(MX27_PC, 7),
+	MX27_PAD_USBOTG_DATA6 = PAD_ID(MX27_PC, 8),
+	MX27_PAD_USBOTG_DATA0 = PAD_ID(MX27_PC, 9),
+	MX27_PAD_USBOTG_DATA2 = PAD_ID(MX27_PC, 10),
+	MX27_PAD_USBOTG_DATA1 = PAD_ID(MX27_PC, 11),
+	MX27_PAD_USBOTG_DATA4 = PAD_ID(MX27_PC, 12),
+	MX27_PAD_USBOTG_DATA3 = PAD_ID(MX27_PC, 13),
+	MX27_PAD_TOUT = PAD_ID(MX27_PC, 14),
+	MX27_PAD_TIN = PAD_ID(MX27_PC, 15),
+	MX27_PAD_SSI4_FS = PAD_ID(MX27_PC, 16),
+	MX27_PAD_SSI4_RXDAT = PAD_ID(MX27_PC, 17),
+	MX27_PAD_SSI4_TXDAT = PAD_ID(MX27_PC, 18),
+	MX27_PAD_SSI4_CLK = PAD_ID(MX27_PC, 19),
+	MX27_PAD_SSI1_FS = PAD_ID(MX27_PC, 20),
+	MX27_PAD_SSI1_RXDAT = PAD_ID(MX27_PC, 21),
+	MX27_PAD_SSI1_TXDAT = PAD_ID(MX27_PC, 22),
+	MX27_PAD_SSI1_CLK = PAD_ID(MX27_PC, 23),
+	MX27_PAD_SSI2_FS = PAD_ID(MX27_PC, 24),
+	MX27_PAD_SSI2_RXDAT = PAD_ID(MX27_PC, 25),
+	MX27_PAD_SSI2_TXDAT = PAD_ID(MX27_PC, 26),
+	MX27_PAD_SSI2_CLK = PAD_ID(MX27_PC, 27),
+	MX27_PAD_SSI3_FS = PAD_ID(MX27_PC, 28),
+	MX27_PAD_SSI3_RXDAT = PAD_ID(MX27_PC, 29),
+	MX27_PAD_SSI3_TXDAT = PAD_ID(MX27_PC, 30),
+	MX27_PAD_SSI3_CLK = PAD_ID(MX27_PC, 31),
 
-	MX27_PAD_SD3_CMD = PAD_ID(PD, 0),
-	MX27_PAD_SD3_CLK = PAD_ID(PD, 1),
-	MX27_PAD_ATA_DATA0 = PAD_ID(PD, 2),
-	MX27_PAD_ATA_DATA1 = PAD_ID(PD, 3),
-	MX27_PAD_ATA_DATA2 = PAD_ID(PD, 4),
-	MX27_PAD_ATA_DATA3 = PAD_ID(PD, 5),
-	MX27_PAD_ATA_DATA4 = PAD_ID(PD, 6),
-	MX27_PAD_ATA_DATA5 = PAD_ID(PD, 7),
-	MX27_PAD_ATA_DATA6 = PAD_ID(PD, 8),
-	MX27_PAD_ATA_DATA7 = PAD_ID(PD, 9),
-	MX27_PAD_ATA_DATA8 = PAD_ID(PD, 10),
-	MX27_PAD_ATA_DATA9 = PAD_ID(PD, 11),
-	MX27_PAD_ATA_DATA10 = PAD_ID(PD, 12),
-	MX27_PAD_ATA_DATA11 = PAD_ID(PD, 13),
-	MX27_PAD_ATA_DATA12 = PAD_ID(PD, 14),
-	MX27_PAD_ATA_DATA13 = PAD_ID(PD, 15),
-	MX27_PAD_ATA_DATA14 = PAD_ID(PD, 16),
-	MX27_PAD_I2C_DATA = PAD_ID(PD, 17),
-	MX27_PAD_I2C_CLK = PAD_ID(PD, 18),
-	MX27_PAD_CSPI2_SS2 = PAD_ID(PD, 19),
-	MX27_PAD_CSPI2_SS1 = PAD_ID(PD, 20),
-	MX27_PAD_CSPI2_SS0 = PAD_ID(PD, 21),
-	MX27_PAD_CSPI2_SCLK = PAD_ID(PD, 22),
-	MX27_PAD_CSPI2_MISO = PAD_ID(PD, 23),
-	MX27_PAD_CSPI2_MOSI = PAD_ID(PD, 24),
-	MX27_PAD_CSPI1_RDY = PAD_ID(PD, 25),
-	MX27_PAD_CSPI1_SS2 = PAD_ID(PD, 26),
-	MX27_PAD_CSPI1_SS1 = PAD_ID(PD, 27),
-	MX27_PAD_CSPI1_SS0 = PAD_ID(PD, 28),
-	MX27_PAD_CSPI1_SCLK = PAD_ID(PD, 29),
-	MX27_PAD_CSPI1_MISO = PAD_ID(PD, 30),
-	MX27_PAD_CSPI1_MOSI = PAD_ID(PD, 31),
+	MX27_PAD_SD3_CMD = PAD_ID(MX27_PD, 0),
+	MX27_PAD_SD3_CLK = PAD_ID(MX27_PD, 1),
+	MX27_PAD_ATA_DATA0 = PAD_ID(MX27_PD, 2),
+	MX27_PAD_ATA_DATA1 = PAD_ID(MX27_PD, 3),
+	MX27_PAD_ATA_DATA2 = PAD_ID(MX27_PD, 4),
+	MX27_PAD_ATA_DATA3 = PAD_ID(MX27_PD, 5),
+	MX27_PAD_ATA_DATA4 = PAD_ID(MX27_PD, 6),
+	MX27_PAD_ATA_DATA5 = PAD_ID(MX27_PD, 7),
+	MX27_PAD_ATA_DATA6 = PAD_ID(MX27_PD, 8),
+	MX27_PAD_ATA_DATA7 = PAD_ID(MX27_PD, 9),
+	MX27_PAD_ATA_DATA8 = PAD_ID(MX27_PD, 10),
+	MX27_PAD_ATA_DATA9 = PAD_ID(MX27_PD, 11),
+	MX27_PAD_ATA_DATA10 = PAD_ID(MX27_PD, 12),
+	MX27_PAD_ATA_DATA11 = PAD_ID(MX27_PD, 13),
+	MX27_PAD_ATA_DATA12 = PAD_ID(MX27_PD, 14),
+	MX27_PAD_ATA_DATA13 = PAD_ID(MX27_PD, 15),
+	MX27_PAD_ATA_DATA14 = PAD_ID(MX27_PD, 16),
+	MX27_PAD_I2C_DATA = PAD_ID(MX27_PD, 17),
+	MX27_PAD_I2C_CLK = PAD_ID(MX27_PD, 18),
+	MX27_PAD_CSPI2_SS2 = PAD_ID(MX27_PD, 19),
+	MX27_PAD_CSPI2_SS1 = PAD_ID(MX27_PD, 20),
+	MX27_PAD_CSPI2_SS0 = PAD_ID(MX27_PD, 21),
+	MX27_PAD_CSPI2_SCLK = PAD_ID(MX27_PD, 22),
+	MX27_PAD_CSPI2_MISO = PAD_ID(MX27_PD, 23),
+	MX27_PAD_CSPI2_MOSI = PAD_ID(MX27_PD, 24),
+	MX27_PAD_CSPI1_RDY = PAD_ID(MX27_PD, 25),
+	MX27_PAD_CSPI1_SS2 = PAD_ID(MX27_PD, 26),
+	MX27_PAD_CSPI1_SS1 = PAD_ID(MX27_PD, 27),
+	MX27_PAD_CSPI1_SS0 = PAD_ID(MX27_PD, 28),
+	MX27_PAD_CSPI1_SCLK = PAD_ID(MX27_PD, 29),
+	MX27_PAD_CSPI1_MISO = PAD_ID(MX27_PD, 30),
+	MX27_PAD_CSPI1_MOSI = PAD_ID(MX27_PD, 31),
 
-	MX27_PAD_USBOTG_NXT = PAD_ID(PE, 0),
-	MX27_PAD_USBOTG_STP = PAD_ID(PE, 1),
-	MX27_PAD_USBOTG_DIR = PAD_ID(PE, 2),
-	MX27_PAD_UART2_CTS = PAD_ID(PE, 3),
-	MX27_PAD_UART2_RTS = PAD_ID(PE, 4),
-	MX27_PAD_PWMO = PAD_ID(PE, 5),
-	MX27_PAD_UART2_TXD = PAD_ID(PE, 6),
-	MX27_PAD_UART2_RXD = PAD_ID(PE, 7),
-	MX27_PAD_UART3_TXD = PAD_ID(PE, 8),
-	MX27_PAD_UART3_RXD = PAD_ID(PE, 9),
-	MX27_PAD_UART3_CTS = PAD_ID(PE, 10),
-	MX27_PAD_UART3_RTS = PAD_ID(PE, 11),
-	MX27_PAD_UART1_TXD = PAD_ID(PE, 12),
-	MX27_PAD_UART1_RXD = PAD_ID(PE, 13),
-	MX27_PAD_UART1_CTS = PAD_ID(PE, 14),
-	MX27_PAD_UART1_RTS = PAD_ID(PE, 15),
-	MX27_PAD_RTCK = PAD_ID(PE, 16),
-	MX27_PAD_RESET_OUT_B = PAD_ID(PE, 17),
-	MX27_PAD_SD1_D0 = PAD_ID(PE, 18),
-	MX27_PAD_SD1_D1 = PAD_ID(PE, 19),
-	MX27_PAD_SD1_D2 = PAD_ID(PE, 20),
-	MX27_PAD_SD1_D3 = PAD_ID(PE, 21),
-	MX27_PAD_SD1_CMD = PAD_ID(PE, 22),
-	MX27_PAD_SD1_CLK = PAD_ID(PE, 23),
-	MX27_PAD_USBOTG_CLK = PAD_ID(PE, 24),
-	MX27_PAD_USBOTG_DATA7 = PAD_ID(PE, 25),
+	MX27_PAD_USBOTG_NXT = PAD_ID(MX27_PE, 0),
+	MX27_PAD_USBOTG_STP = PAD_ID(MX27_PE, 1),
+	MX27_PAD_USBOTG_DIR = PAD_ID(MX27_PE, 2),
+	MX27_PAD_UART2_CTS = PAD_ID(MX27_PE, 3),
+	MX27_PAD_UART2_RTS = PAD_ID(MX27_PE, 4),
+	MX27_PAD_PWMO = PAD_ID(MX27_PE, 5),
+	MX27_PAD_UART2_TXD = PAD_ID(MX27_PE, 6),
+	MX27_PAD_UART2_RXD = PAD_ID(MX27_PE, 7),
+	MX27_PAD_UART3_TXD = PAD_ID(MX27_PE, 8),
+	MX27_PAD_UART3_RXD = PAD_ID(MX27_PE, 9),
+	MX27_PAD_UART3_CTS = PAD_ID(MX27_PE, 10),
+	MX27_PAD_UART3_RTS = PAD_ID(MX27_PE, 11),
+	MX27_PAD_UART1_TXD = PAD_ID(MX27_PE, 12),
+	MX27_PAD_UART1_RXD = PAD_ID(MX27_PE, 13),
+	MX27_PAD_UART1_CTS = PAD_ID(MX27_PE, 14),
+	MX27_PAD_UART1_RTS = PAD_ID(MX27_PE, 15),
+	MX27_PAD_RTCK = PAD_ID(MX27_PE, 16),
+	MX27_PAD_RESET_OUT_B = PAD_ID(MX27_PE, 17),
+	MX27_PAD_SD1_D0 = PAD_ID(MX27_PE, 18),
+	MX27_PAD_SD1_D1 = PAD_ID(MX27_PE, 19),
+	MX27_PAD_SD1_D2 = PAD_ID(MX27_PE, 20),
+	MX27_PAD_SD1_D3 = PAD_ID(MX27_PE, 21),
+	MX27_PAD_SD1_CMD = PAD_ID(MX27_PE, 22),
+	MX27_PAD_SD1_CLK = PAD_ID(MX27_PE, 23),
+	MX27_PAD_USBOTG_CLK = PAD_ID(MX27_PE, 24),
+	MX27_PAD_USBOTG_DATA7 = PAD_ID(MX27_PE, 25),
 
-	MX27_PAD_NFRB = PAD_ID(PF, 0),
-	MX27_PAD_NFCLE = PAD_ID(PF, 1),
-	MX27_PAD_NFWP_B = PAD_ID(PF, 2),
-	MX27_PAD_NFCE_B = PAD_ID(PF, 3),
-	MX27_PAD_NFALE = PAD_ID(PF, 4),
-	MX27_PAD_NFRE_B = PAD_ID(PF, 5),
-	MX27_PAD_NFWE_B = PAD_ID(PF, 6),
-	MX27_PAD_PC_POE = PAD_ID(PF, 7),
-	MX27_PAD_PC_RW_B = PAD_ID(PF, 8),
-	MX27_PAD_IOIS16 = PAD_ID(PF, 9),
-	MX27_PAD_PC_RST = PAD_ID(PF, 10),
-	MX27_PAD_PC_BVD2 = PAD_ID(PF, 11),
-	MX27_PAD_PC_BVD1 = PAD_ID(PF, 12),
-	MX27_PAD_PC_VS2 = PAD_ID(PF, 13),
-	MX27_PAD_PC_VS1 = PAD_ID(PF, 14),
-	MX27_PAD_CLKO = PAD_ID(PF, 15),
-	MX27_PAD_PC_PWRON = PAD_ID(PF, 16),
-	MX27_PAD_PC_READY = PAD_ID(PF, 17),
-	MX27_PAD_PC_WAIT_B = PAD_ID(PF, 18),
-	MX27_PAD_PC_CD2_B = PAD_ID(PF, 19),
-	MX27_PAD_PC_CD1_B = PAD_ID(PF, 20),
-	MX27_PAD_CS4_B = PAD_ID(PF, 21),
-	MX27_PAD_CS5_B = PAD_ID(PF, 22),
-	MX27_PAD_ATA_DATA15 = PAD_ID(PF, 23),
+	MX27_PAD_NFRB = PAD_ID(MX27_PF, 0),
+	MX27_PAD_NFCLE = PAD_ID(MX27_PF, 1),
+	MX27_PAD_NFWP_B = PAD_ID(MX27_PF, 2),
+	MX27_PAD_NFCE_B = PAD_ID(MX27_PF, 3),
+	MX27_PAD_NFALE = PAD_ID(MX27_PF, 4),
+	MX27_PAD_NFRE_B = PAD_ID(MX27_PF, 5),
+	MX27_PAD_NFWE_B = PAD_ID(MX27_PF, 6),
+	MX27_PAD_PC_POE = PAD_ID(MX27_PF, 7),
+	MX27_PAD_PC_RW_B = PAD_ID(MX27_PF, 8),
+	MX27_PAD_IOIS16 = PAD_ID(MX27_PF, 9),
+	MX27_PAD_PC_RST = PAD_ID(MX27_PF, 10),
+	MX27_PAD_PC_BVD2 = PAD_ID(MX27_PF, 11),
+	MX27_PAD_PC_BVD1 = PAD_ID(MX27_PF, 12),
+	MX27_PAD_PC_VS2 = PAD_ID(MX27_PF, 13),
+	MX27_PAD_PC_VS1 = PAD_ID(MX27_PF, 14),
+	MX27_PAD_CLKO = PAD_ID(MX27_PF, 15),
+	MX27_PAD_PC_PWRON = PAD_ID(MX27_PF, 16),
+	MX27_PAD_PC_READY = PAD_ID(MX27_PF, 17),
+	MX27_PAD_PC_WAIT_B = PAD_ID(MX27_PF, 18),
+	MX27_PAD_PC_CD2_B = PAD_ID(MX27_PF, 19),
+	MX27_PAD_PC_CD1_B = PAD_ID(MX27_PF, 20),
+	MX27_PAD_CS4_B = PAD_ID(MX27_PF, 21),
+	MX27_PAD_CS5_B = PAD_ID(MX27_PF, 22),
+	MX27_PAD_ATA_DATA15 = PAD_ID(MX27_PF, 23),
 };
 
 /* Pad names for the pinmux subsystem */

---
base-commit: d01240b22abf28ce32660c22458457f9b7f5dc1e
change-id: 20241003-fix-imx27-pc-f6157992e1f9

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


