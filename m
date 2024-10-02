Return-Path: <linux-gpio+bounces-10714-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 277EC98DB19
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 16:27:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD4561F21F9D
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 14:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F5F01D12EA;
	Wed,  2 Oct 2024 14:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DxkmXve4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B1D1D097D
	for <linux-gpio@vger.kernel.org>; Wed,  2 Oct 2024 14:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727878983; cv=none; b=BAnjYqFOj8jmFHhV7A23JvR6K257Y+sSSChNktsCse9tcdegRmBKsbc+ocGYQmtRZ6SUXDOwH2O2OFJRX215VGdC4tXLw106gNWhLioFDlCuAw44c+HTcaT3SvaJATQ07VqCvG9qBJBEY6Ifi9ADRstOFKQ8lw0q4MVeE3KV4qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727878983; c=relaxed/simple;
	bh=HdJ6Yr31q74099F4D7hWmMbCf4n3gN17sWvR+IWi/Js=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=c4QyicHdY+ip4dl6mvaJKCTwwPhUsMQunQGjPeV8MOvxr3EaIokrtjU86jo6KdFbUXuPDUff3IajBIzrz5lJPcDs5thQPSrfNMW8VI2B5ES8jcTjVRbYZBeIoAG3rh898MvWcxf6qJ2dWbqvBCA4qBHwUPfM7Ma6Nvwx8SPP5qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DxkmXve4; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a7aa086b077so961813666b.0
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2024 07:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727878979; x=1728483779; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nvJ/Eb7XwDztlhltYv0z3nSPXkVAIsKOSHvTDH0Csu0=;
        b=DxkmXve4Ajmzwaw4Vjk0qICd84BGOloFio5vm31m30OWgHRAqE5AtUsTSwO6wr6qWn
         SjQ5pfkeCETzIiiXSBBba4KPCir8qrF8Vo/AAc+5vXrceygIzs3z3Rb8Bzt4Z3PKIS7b
         +Zf1cKbN9ADiYDSqhiAMpBaVu65bzXffqWNz07g8WGTxeseRsC0sDaWCwhxifTSBaoz9
         /gLyLvj0mfseRLRXYtxm3Nit/kHc2L9NGk6DfYoFaCTtcfmjI7tkY3fI0uI/XGMAwYMT
         ObpHBEBo2ZLSG4RqtFe+hH/ZvmhbsGmL0tF6yRDsBRptXSf3ZBKR9gVCB5tenJapgi0f
         ggdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727878979; x=1728483779;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nvJ/Eb7XwDztlhltYv0z3nSPXkVAIsKOSHvTDH0Csu0=;
        b=WaocqtYExqXak61wR7EumZX/pnJYprpbWgs0x5NX2fbk1hqmC+GwTjgxh1eGfGxd7r
         eI6Q7KMQCQ7pdbaQa8UFW83lz5sY4gn8qBgQ/gXglqJfj4hcmnrDbzDSyRn08MlDq1h3
         LUiGjUlw2zx6K/nmxSeR7Y8Kq8hki395ntlkxNryd16dV3aIhJy7tTit56fMR6jy2uAc
         GnRwV9CUJB4e4X6u+aP/JTSMJ6/YbKSw0ZvYxWut/30Uagn/ZbDPUhv3lFmXT5jt+G5y
         J2tbtsSRlTqiXeeLzoiFHedzdmdIRHfwxh+dWuTw410Msu08evj56YLMB00WQ/Qy6043
         iD2A==
X-Gm-Message-State: AOJu0YwR4cZ2Pw7revCofzA7V+n1GGOl4jmFO90KF5mSEsdEWgA0x0Lk
	u6hXllmq99chMJ67DhBN9AvYOydONmjILBN1LZtq7izN6RcLeHIF7UBD3V5DEwM=
X-Google-Smtp-Source: AGHT+IGUn9sRPPzBvBjKtn7bdvUYJ7weCMGqk5dv93FXQmg2mONphSkAORyUofzaV0AS3OJ6TiKGoA==
X-Received: by 2002:a17:907:97c7:b0:a8d:510b:4f48 with SMTP id a640c23a62f3a-a98f82466e0mr336354566b.22.1727878979464;
        Wed, 02 Oct 2024 07:22:59 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c299af9esm871366966b.216.2024.10.02.07.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 07:22:59 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 02 Oct 2024 16:22:49 +0200
Subject: [PATCH] pinctrl: imx1: Fix too generic defines
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241002-fix-imx-pc-v1-1-95f8b89400ee@linaro.org>
X-B4-Tracking: v=1; b=H4sIADhX/WYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDAwMj3bTMCt3M3ArdgmRdyyRjYwszk2QDY2NDJaCGgqJUoCzYsOjY2lo
 AYZFAl1wAAAA=
To: Esben Haabendal <esben@geanix.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 kernel test robot <lkp@intel.com>, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0

The "PC" define is colliding with the (apparently broadcased)
define for "program counter" on Loongarch, so let's rename all
these 2-letter defines so they don't collide with stuff.

Fixes: a55222b7a132 pinctrl: freescale: enable use with COMPILE_TEST
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202410020940.wGISlWfV-lkp@intel.com/
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/freescale/pinctrl-imx1.c | 228 +++++++++++++++----------------
 1 file changed, 114 insertions(+), 114 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx1.c b/drivers/pinctrl/freescale/pinctrl-imx1.c
index 1e2b0fe9ffd6..bd39cadf1f34 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1.c
@@ -12,122 +12,122 @@
 #include "pinctrl-imx1.h"
 
 #define PAD_ID(port, pin)	((port) * 32 + (pin))
-#define PA	0
-#define PB	1
-#define PC	2
-#define PD	3
+#define IMX1_PA	0
+#define IMX1_PB	1
+#define IMX1_PC	2
+#define IMX1_PD	3
 
 enum imx1_pads {
-	MX1_PAD_A24		= PAD_ID(PA, 0),
-	MX1_PAD_TIN		= PAD_ID(PA, 1),
-	MX1_PAD_PWMO		= PAD_ID(PA, 2),
-	MX1_PAD_CSI_MCLK	= PAD_ID(PA, 3),
-	MX1_PAD_CSI_D0		= PAD_ID(PA, 4),
-	MX1_PAD_CSI_D1		= PAD_ID(PA, 5),
-	MX1_PAD_CSI_D2		= PAD_ID(PA, 6),
-	MX1_PAD_CSI_D3		= PAD_ID(PA, 7),
-	MX1_PAD_CSI_D4		= PAD_ID(PA, 8),
-	MX1_PAD_CSI_D5		= PAD_ID(PA, 9),
-	MX1_PAD_CSI_D6		= PAD_ID(PA, 10),
-	MX1_PAD_CSI_D7		= PAD_ID(PA, 11),
-	MX1_PAD_CSI_VSYNC	= PAD_ID(PA, 12),
-	MX1_PAD_CSI_HSYNC	= PAD_ID(PA, 13),
-	MX1_PAD_CSI_PIXCLK	= PAD_ID(PA, 14),
-	MX1_PAD_I2C_SDA		= PAD_ID(PA, 15),
-	MX1_PAD_I2C_SCL		= PAD_ID(PA, 16),
-	MX1_PAD_DTACK		= PAD_ID(PA, 17),
-	MX1_PAD_BCLK		= PAD_ID(PA, 18),
-	MX1_PAD_LBA		= PAD_ID(PA, 19),
-	MX1_PAD_ECB		= PAD_ID(PA, 20),
-	MX1_PAD_A0		= PAD_ID(PA, 21),
-	MX1_PAD_CS4		= PAD_ID(PA, 22),
-	MX1_PAD_CS5		= PAD_ID(PA, 23),
-	MX1_PAD_A16		= PAD_ID(PA, 24),
-	MX1_PAD_A17		= PAD_ID(PA, 25),
-	MX1_PAD_A18		= PAD_ID(PA, 26),
-	MX1_PAD_A19		= PAD_ID(PA, 27),
-	MX1_PAD_A20		= PAD_ID(PA, 28),
-	MX1_PAD_A21		= PAD_ID(PA, 29),
-	MX1_PAD_A22		= PAD_ID(PA, 30),
-	MX1_PAD_A23		= PAD_ID(PA, 31),
-	MX1_PAD_SD_DAT0		= PAD_ID(PB, 8),
-	MX1_PAD_SD_DAT1		= PAD_ID(PB, 9),
-	MX1_PAD_SD_DAT2		= PAD_ID(PB, 10),
-	MX1_PAD_SD_DAT3		= PAD_ID(PB, 11),
-	MX1_PAD_SD_SCLK		= PAD_ID(PB, 12),
-	MX1_PAD_SD_CMD		= PAD_ID(PB, 13),
-	MX1_PAD_SIM_SVEN	= PAD_ID(PB, 14),
-	MX1_PAD_SIM_PD		= PAD_ID(PB, 15),
-	MX1_PAD_SIM_TX		= PAD_ID(PB, 16),
-	MX1_PAD_SIM_RX		= PAD_ID(PB, 17),
-	MX1_PAD_SIM_RST		= PAD_ID(PB, 18),
-	MX1_PAD_SIM_CLK		= PAD_ID(PB, 19),
-	MX1_PAD_USBD_AFE	= PAD_ID(PB, 20),
-	MX1_PAD_USBD_OE		= PAD_ID(PB, 21),
-	MX1_PAD_USBD_RCV	= PAD_ID(PB, 22),
-	MX1_PAD_USBD_SUSPND	= PAD_ID(PB, 23),
-	MX1_PAD_USBD_VP		= PAD_ID(PB, 24),
-	MX1_PAD_USBD_VM		= PAD_ID(PB, 25),
-	MX1_PAD_USBD_VPO	= PAD_ID(PB, 26),
-	MX1_PAD_USBD_VMO	= PAD_ID(PB, 27),
-	MX1_PAD_UART2_CTS	= PAD_ID(PB, 28),
-	MX1_PAD_UART2_RTS	= PAD_ID(PB, 29),
-	MX1_PAD_UART2_TXD	= PAD_ID(PB, 30),
-	MX1_PAD_UART2_RXD	= PAD_ID(PB, 31),
-	MX1_PAD_SSI_RXFS	= PAD_ID(PC, 3),
-	MX1_PAD_SSI_RXCLK	= PAD_ID(PC, 4),
-	MX1_PAD_SSI_RXDAT	= PAD_ID(PC, 5),
-	MX1_PAD_SSI_TXDAT	= PAD_ID(PC, 6),
-	MX1_PAD_SSI_TXFS	= PAD_ID(PC, 7),
-	MX1_PAD_SSI_TXCLK	= PAD_ID(PC, 8),
-	MX1_PAD_UART1_CTS	= PAD_ID(PC, 9),
-	MX1_PAD_UART1_RTS	= PAD_ID(PC, 10),
-	MX1_PAD_UART1_TXD	= PAD_ID(PC, 11),
-	MX1_PAD_UART1_RXD	= PAD_ID(PC, 12),
-	MX1_PAD_SPI1_RDY	= PAD_ID(PC, 13),
-	MX1_PAD_SPI1_SCLK	= PAD_ID(PC, 14),
-	MX1_PAD_SPI1_SS		= PAD_ID(PC, 15),
-	MX1_PAD_SPI1_MISO	= PAD_ID(PC, 16),
-	MX1_PAD_SPI1_MOSI	= PAD_ID(PC, 17),
-	MX1_PAD_BT13		= PAD_ID(PC, 19),
-	MX1_PAD_BT12		= PAD_ID(PC, 20),
-	MX1_PAD_BT11		= PAD_ID(PC, 21),
-	MX1_PAD_BT10		= PAD_ID(PC, 22),
-	MX1_PAD_BT9		= PAD_ID(PC, 23),
-	MX1_PAD_BT8		= PAD_ID(PC, 24),
-	MX1_PAD_BT7		= PAD_ID(PC, 25),
-	MX1_PAD_BT6		= PAD_ID(PC, 26),
-	MX1_PAD_BT5		= PAD_ID(PC, 27),
-	MX1_PAD_BT4		= PAD_ID(PC, 28),
-	MX1_PAD_BT3		= PAD_ID(PC, 29),
-	MX1_PAD_BT2		= PAD_ID(PC, 30),
-	MX1_PAD_BT1		= PAD_ID(PC, 31),
-	MX1_PAD_LSCLK		= PAD_ID(PD, 6),
-	MX1_PAD_REV		= PAD_ID(PD, 7),
-	MX1_PAD_CLS		= PAD_ID(PD, 8),
-	MX1_PAD_PS		= PAD_ID(PD, 9),
-	MX1_PAD_SPL_SPR		= PAD_ID(PD, 10),
-	MX1_PAD_CONTRAST	= PAD_ID(PD, 11),
-	MX1_PAD_ACD_OE		= PAD_ID(PD, 12),
-	MX1_PAD_LP_HSYNC	= PAD_ID(PD, 13),
-	MX1_PAD_FLM_VSYNC	= PAD_ID(PD, 14),
-	MX1_PAD_LD0		= PAD_ID(PD, 15),
-	MX1_PAD_LD1		= PAD_ID(PD, 16),
-	MX1_PAD_LD2		= PAD_ID(PD, 17),
-	MX1_PAD_LD3		= PAD_ID(PD, 18),
-	MX1_PAD_LD4		= PAD_ID(PD, 19),
-	MX1_PAD_LD5		= PAD_ID(PD, 20),
-	MX1_PAD_LD6		= PAD_ID(PD, 21),
-	MX1_PAD_LD7		= PAD_ID(PD, 22),
-	MX1_PAD_LD8		= PAD_ID(PD, 23),
-	MX1_PAD_LD9		= PAD_ID(PD, 24),
-	MX1_PAD_LD10		= PAD_ID(PD, 25),
-	MX1_PAD_LD11		= PAD_ID(PD, 26),
-	MX1_PAD_LD12		= PAD_ID(PD, 27),
-	MX1_PAD_LD13		= PAD_ID(PD, 28),
-	MX1_PAD_LD14		= PAD_ID(PD, 29),
-	MX1_PAD_LD15		= PAD_ID(PD, 30),
-	MX1_PAD_TMR2OUT		= PAD_ID(PD, 31),
+	MX1_PAD_A24		= PAD_ID(IMX1_PA, 0),
+	MX1_PAD_TIN		= PAD_ID(IMX1_PA, 1),
+	MX1_PAD_PWMO		= PAD_ID(IMX1_PA, 2),
+	MX1_PAD_CSI_MCLK	= PAD_ID(IMX1_PA, 3),
+	MX1_PAD_CSI_D0		= PAD_ID(IMX1_PA, 4),
+	MX1_PAD_CSI_D1		= PAD_ID(IMX1_PA, 5),
+	MX1_PAD_CSI_D2		= PAD_ID(IMX1_PA, 6),
+	MX1_PAD_CSI_D3		= PAD_ID(IMX1_PA, 7),
+	MX1_PAD_CSI_D4		= PAD_ID(IMX1_PA, 8),
+	MX1_PAD_CSI_D5		= PAD_ID(IMX1_PA, 9),
+	MX1_PAD_CSI_D6		= PAD_ID(IMX1_PA, 10),
+	MX1_PAD_CSI_D7		= PAD_ID(IMX1_PA, 11),
+	MX1_PAD_CSI_VSYNC	= PAD_ID(IMX1_PA, 12),
+	MX1_PAD_CSI_HSYNC	= PAD_ID(IMX1_PA, 13),
+	MX1_PAD_CSI_PIXCLK	= PAD_ID(IMX1_PA, 14),
+	MX1_PAD_I2C_SDA		= PAD_ID(IMX1_PA, 15),
+	MX1_PAD_I2C_SCL		= PAD_ID(IMX1_PA, 16),
+	MX1_PAD_DTACK		= PAD_ID(IMX1_PA, 17),
+	MX1_PAD_BCLK		= PAD_ID(IMX1_PA, 18),
+	MX1_PAD_LBA		= PAD_ID(IMX1_PA, 19),
+	MX1_PAD_ECB		= PAD_ID(IMX1_PA, 20),
+	MX1_PAD_A0		= PAD_ID(IMX1_PA, 21),
+	MX1_PAD_CS4		= PAD_ID(IMX1_PA, 22),
+	MX1_PAD_CS5		= PAD_ID(IMX1_PA, 23),
+	MX1_PAD_A16		= PAD_ID(IMX1_PA, 24),
+	MX1_PAD_A17		= PAD_ID(IMX1_PA, 25),
+	MX1_PAD_A18		= PAD_ID(IMX1_PA, 26),
+	MX1_PAD_A19		= PAD_ID(IMX1_PA, 27),
+	MX1_PAD_A20		= PAD_ID(IMX1_PA, 28),
+	MX1_PAD_A21		= PAD_ID(IMX1_PA, 29),
+	MX1_PAD_A22		= PAD_ID(IMX1_PA, 30),
+	MX1_PAD_A23		= PAD_ID(IMX1_PA, 31),
+	MX1_PAD_SD_DAT0		= PAD_ID(IMX1_PB, 8),
+	MX1_PAD_SD_DAT1		= PAD_ID(IMX1_PB, 9),
+	MX1_PAD_SD_DAT2		= PAD_ID(IMX1_PB, 10),
+	MX1_PAD_SD_DAT3		= PAD_ID(IMX1_PB, 11),
+	MX1_PAD_SD_SCLK		= PAD_ID(IMX1_PB, 12),
+	MX1_PAD_SD_CMD		= PAD_ID(IMX1_PB, 13),
+	MX1_PAD_SIM_SVEN	= PAD_ID(IMX1_PB, 14),
+	MX1_PAD_SIM_PD		= PAD_ID(IMX1_PB, 15),
+	MX1_PAD_SIM_TX		= PAD_ID(IMX1_PB, 16),
+	MX1_PAD_SIM_RX		= PAD_ID(IMX1_PB, 17),
+	MX1_PAD_SIM_RST		= PAD_ID(IMX1_PB, 18),
+	MX1_PAD_SIM_CLK		= PAD_ID(IMX1_PB, 19),
+	MX1_PAD_USBD_AFE	= PAD_ID(IMX1_PB, 20),
+	MX1_PAD_USBD_OE		= PAD_ID(IMX1_PB, 21),
+	MX1_PAD_USBD_RCV	= PAD_ID(IMX1_PB, 22),
+	MX1_PAD_USBD_SUSPND	= PAD_ID(IMX1_PB, 23),
+	MX1_PAD_USBD_VP		= PAD_ID(IMX1_PB, 24),
+	MX1_PAD_USBD_VM		= PAD_ID(IMX1_PB, 25),
+	MX1_PAD_USBD_VPO	= PAD_ID(IMX1_PB, 26),
+	MX1_PAD_USBD_VMO	= PAD_ID(IMX1_PB, 27),
+	MX1_PAD_UART2_CTS	= PAD_ID(IMX1_PB, 28),
+	MX1_PAD_UART2_RTS	= PAD_ID(IMX1_PB, 29),
+	MX1_PAD_UART2_TXD	= PAD_ID(IMX1_PB, 30),
+	MX1_PAD_UART2_RXD	= PAD_ID(IMX1_PB, 31),
+	MX1_PAD_SSI_RXFS	= PAD_ID(IMX1_PC, 3),
+	MX1_PAD_SSI_RXCLK	= PAD_ID(IMX1_PC, 4),
+	MX1_PAD_SSI_RXDAT	= PAD_ID(IMX1_PC, 5),
+	MX1_PAD_SSI_TXDAT	= PAD_ID(IMX1_PC, 6),
+	MX1_PAD_SSI_TXFS	= PAD_ID(IMX1_PC, 7),
+	MX1_PAD_SSI_TXCLK	= PAD_ID(IMX1_PC, 8),
+	MX1_PAD_UART1_CTS	= PAD_ID(IMX1_PC, 9),
+	MX1_PAD_UART1_RTS	= PAD_ID(IMX1_PC, 10),
+	MX1_PAD_UART1_TXD	= PAD_ID(IMX1_PC, 11),
+	MX1_PAD_UART1_RXD	= PAD_ID(IMX1_PC, 12),
+	MX1_PAD_SPI1_RDY	= PAD_ID(IMX1_PC, 13),
+	MX1_PAD_SPI1_SCLK	= PAD_ID(IMX1_PC, 14),
+	MX1_PAD_SPI1_SS		= PAD_ID(IMX1_PC, 15),
+	MX1_PAD_SPI1_MISO	= PAD_ID(IMX1_PC, 16),
+	MX1_PAD_SPI1_MOSI	= PAD_ID(IMX1_PC, 17),
+	MX1_PAD_BT13		= PAD_ID(IMX1_PC, 19),
+	MX1_PAD_BT12		= PAD_ID(IMX1_PC, 20),
+	MX1_PAD_BT11		= PAD_ID(IMX1_PC, 21),
+	MX1_PAD_BT10		= PAD_ID(IMX1_PC, 22),
+	MX1_PAD_BT9		= PAD_ID(IMX1_PC, 23),
+	MX1_PAD_BT8		= PAD_ID(IMX1_PC, 24),
+	MX1_PAD_BT7		= PAD_ID(IMX1_PC, 25),
+	MX1_PAD_BT6		= PAD_ID(IMX1_PC, 26),
+	MX1_PAD_BT5		= PAD_ID(IMX1_PC, 27),
+	MX1_PAD_BT4		= PAD_ID(IMX1_PC, 28),
+	MX1_PAD_BT3		= PAD_ID(IMX1_PC, 29),
+	MX1_PAD_BT2		= PAD_ID(IMX1_PC, 30),
+	MX1_PAD_BT1		= PAD_ID(IMX1_PC, 31),
+	MX1_PAD_LSCLK		= PAD_ID(IMX1_PD, 6),
+	MX1_PAD_REV		= PAD_ID(IMX1_PD, 7),
+	MX1_PAD_CLS		= PAD_ID(IMX1_PD, 8),
+	MX1_PAD_PS		= PAD_ID(IMX1_PD, 9),
+	MX1_PAD_SPL_SPR		= PAD_ID(IMX1_PD, 10),
+	MX1_PAD_CONTRAST	= PAD_ID(IMX1_PD, 11),
+	MX1_PAD_ACD_OE		= PAD_ID(IMX1_PD, 12),
+	MX1_PAD_LP_HSYNC	= PAD_ID(IMX1_PD, 13),
+	MX1_PAD_FLM_VSYNC	= PAD_ID(IMX1_PD, 14),
+	MX1_PAD_LD0		= PAD_ID(IMX1_PD, 15),
+	MX1_PAD_LD1		= PAD_ID(IMX1_PD, 16),
+	MX1_PAD_LD2		= PAD_ID(IMX1_PD, 17),
+	MX1_PAD_LD3		= PAD_ID(IMX1_PD, 18),
+	MX1_PAD_LD4		= PAD_ID(IMX1_PD, 19),
+	MX1_PAD_LD5		= PAD_ID(IMX1_PD, 20),
+	MX1_PAD_LD6		= PAD_ID(IMX1_PD, 21),
+	MX1_PAD_LD7		= PAD_ID(IMX1_PD, 22),
+	MX1_PAD_LD8		= PAD_ID(IMX1_PD, 23),
+	MX1_PAD_LD9		= PAD_ID(IMX1_PD, 24),
+	MX1_PAD_LD10		= PAD_ID(IMX1_PD, 25),
+	MX1_PAD_LD11		= PAD_ID(IMX1_PD, 26),
+	MX1_PAD_LD12		= PAD_ID(IMX1_PD, 27),
+	MX1_PAD_LD13		= PAD_ID(IMX1_PD, 28),
+	MX1_PAD_LD14		= PAD_ID(IMX1_PD, 29),
+	MX1_PAD_LD15		= PAD_ID(IMX1_PD, 30),
+	MX1_PAD_TMR2OUT		= PAD_ID(IMX1_PD, 31),
 };
 
 /* Pad names for the pinmux subsystem */

---
base-commit: 30e830b8b952e550344224546f8cd83c5c49a5bf
change-id: 20241002-fix-imx-pc-9b33864c0331

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


