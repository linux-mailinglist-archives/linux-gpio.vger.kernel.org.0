Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8394E2ADF02
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 20:02:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbgKJTC1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 14:02:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbgKJTC1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 14:02:27 -0500
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D35EC0613D1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 11:02:26 -0800 (PST)
Received: by mail-qt1-x844.google.com with SMTP id g17so9383138qts.5
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 11:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=g4qwrBklLz12936QMPo/N4KhqDbJ7hTaYeAzvMnnKNw=;
        b=Qi8uTDbWnKBvZENM0+nEk/S7ovNdEKk2n9epRXQTi7CQcUIG7D3QRfn9SEKStPEvBv
         vf2+xOVp/+afXSfJ5YxWVIbYpZOfZdl+6lcxu3OoddK5mQi9f/JLovsokX4OuiIQoY5b
         nGyYct/a5W7d8mIy5dF1TtJ3yv9UWJJ3r4nYL59HwZ22Qpw6zyLhEs/uTTZaf1o3G1i8
         ycCtpueRtQtr4oPlOmef8B8RCtiahVP/tdszIWvrdPSay9C1A+J77GoSiP3JpmnofCvE
         Nx0yHDHjzb6mjBbaQg6bgBgs3AZ88QSMV3yBd5lBSVhF12SKlBb/XKfr0+2jDWx4v+II
         WTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=g4qwrBklLz12936QMPo/N4KhqDbJ7hTaYeAzvMnnKNw=;
        b=ThN3tb+J9Fui9PBPspZRfVEf+SRbaH/IG33l2VRbiEcxsowCkqH3Zs6XDKcpHFPpAU
         UO0WjkIgPxQtbxphp6dZT3G4W3ybR8brBmobNHTzA6IIjM+zyXV9U7wyi/F0wnmuAo/c
         XsXbOGwBBIEcxWdwoKp8017OcxZdU2ETtdU+D0dK8JozIh1DuO62mleGOmP7yQvh4oG5
         GCq1w2lxO8e3hxh7j/0XUTeGPImuPUojtX8+b61s0VwdeHZFpbEIX8Dp4m/SWBKQDC9s
         DnN9XOWTgeN81nA4xIQuPZIoJgXLwMcQLSZeTQ/GIViZBZWKLcpLczMNJ6VWQR+J34yr
         X1lg==
X-Gm-Message-State: AOAM533S5piIqWAOxwupa7zPDK6bXxoGLTvea6aO/yIVzqlil1dCqcTX
        8t3gn+x1Hjwoj7uzGawDKLQ=
X-Google-Smtp-Source: ABdhPJzRf+9RqRq1WkhXNxDk6gMv0mjdFF9e78S5eZW6n4mFZmv2cMOm9Q1S3XfWM0Z3mlgToOGhWw==
X-Received: by 2002:ac8:7c83:: with SMTP id y3mr2097656qtv.201.1605034945567;
        Tue, 10 Nov 2020 11:02:25 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:997:69a4:dc84:4b91:560e])
        by smtp.gmail.com with ESMTPSA id t133sm843525qke.82.2020.11.10.11.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 11:02:24 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     linus.walleij@linaro.org
Cc:     shawnguo@kernel.org, linux-gpio@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] pinctrl: imx21: Remove the driver
Date:   Tue, 10 Nov 2020 16:02:10 -0300
Message-Id: <20201110190210.29376-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since commit 4b563a066611 ("ARM: imx: Remove imx21 support") the imx21
SoC is no longer supported.

Get rid of its pinctrl driver too, which is now unused.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/pinctrl/freescale/Kconfig         |   7 -
 drivers/pinctrl/freescale/Makefile        |   1 -
 drivers/pinctrl/freescale/pinctrl-imx21.c | 330 ----------------------
 3 files changed, 338 deletions(-)
 delete mode 100644 drivers/pinctrl/freescale/pinctrl-imx21.c

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index a1fbb3b9ae34..f294336430cc 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -24,13 +24,6 @@ config PINCTRL_IMX1
 	help
 	  Say Y here to enable the imx1 pinctrl driver
 
-config PINCTRL_IMX21
-	bool "i.MX21 pinctrl driver"
-	depends on SOC_IMX21
-	select PINCTRL_IMX1_CORE
-	help
-	  Say Y here to enable the i.MX21 pinctrl driver
-
 config PINCTRL_IMX27
 	bool "IMX27 pinctrl driver"
 	depends on SOC_IMX27
diff --git a/drivers/pinctrl/freescale/Makefile b/drivers/pinctrl/freescale/Makefile
index c61722565289..e476cb671037 100644
--- a/drivers/pinctrl/freescale/Makefile
+++ b/drivers/pinctrl/freescale/Makefile
@@ -4,7 +4,6 @@ obj-$(CONFIG_PINCTRL_IMX)	+= pinctrl-imx.o
 obj-$(CONFIG_PINCTRL_IMX_SCU)	+= pinctrl-scu.o
 obj-$(CONFIG_PINCTRL_IMX1_CORE)	+= pinctrl-imx1-core.o
 obj-$(CONFIG_PINCTRL_IMX1)	+= pinctrl-imx1.o
-obj-$(CONFIG_PINCTRL_IMX21)	+= pinctrl-imx21.o
 obj-$(CONFIG_PINCTRL_IMX27)	+= pinctrl-imx27.o
 obj-$(CONFIG_PINCTRL_IMX35)	+= pinctrl-imx35.o
 obj-$(CONFIG_PINCTRL_IMX50)	+= pinctrl-imx50.o
diff --git a/drivers/pinctrl/freescale/pinctrl-imx21.c b/drivers/pinctrl/freescale/pinctrl-imx21.c
deleted file mode 100644
index 8a102275a053..000000000000
--- a/drivers/pinctrl/freescale/pinctrl-imx21.c
+++ /dev/null
@@ -1,330 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-//
-// i.MX21 pinctrl driver based on imx pinmux core
-//
-// Copyright (C) 2014 Alexander Shiyan <shc_work@mail.ru>
-
-#include <linux/init.h>
-#include <linux/of.h>
-#include <linux/platform_device.h>
-#include <linux/pinctrl/pinctrl.h>
-
-#include "pinctrl-imx1.h"
-
-#define PAD_ID(port, pin)	((port) * 32 + (pin))
-#define PA	0
-#define PB	1
-#define PC	2
-#define PD	3
-#define PE	4
-#define PF	5
-
-enum imx21_pads {
-	MX21_PAD_LSCLK		= PAD_ID(PA, 5),
-	MX21_PAD_LD0		= PAD_ID(PA, 6),
-	MX21_PAD_LD1		= PAD_ID(PA, 7),
-	MX21_PAD_LD2		= PAD_ID(PA, 8),
-	MX21_PAD_LD3		= PAD_ID(PA, 9),
-	MX21_PAD_LD4		= PAD_ID(PA, 10),
-	MX21_PAD_LD5		= PAD_ID(PA, 11),
-	MX21_PAD_LD6		= PAD_ID(PA, 12),
-	MX21_PAD_LD7		= PAD_ID(PA, 13),
-	MX21_PAD_LD8		= PAD_ID(PA, 14),
-	MX21_PAD_LD9		= PAD_ID(PA, 15),
-	MX21_PAD_LD10		= PAD_ID(PA, 16),
-	MX21_PAD_LD11		= PAD_ID(PA, 17),
-	MX21_PAD_LD12		= PAD_ID(PA, 18),
-	MX21_PAD_LD13		= PAD_ID(PA, 19),
-	MX21_PAD_LD14		= PAD_ID(PA, 20),
-	MX21_PAD_LD15		= PAD_ID(PA, 21),
-	MX21_PAD_LD16		= PAD_ID(PA, 22),
-	MX21_PAD_LD17		= PAD_ID(PA, 23),
-	MX21_PAD_REV		= PAD_ID(PA, 24),
-	MX21_PAD_CLS		= PAD_ID(PA, 25),
-	MX21_PAD_PS		= PAD_ID(PA, 26),
-	MX21_PAD_SPL_SPR	= PAD_ID(PA, 27),
-	MX21_PAD_HSYNC		= PAD_ID(PA, 28),
-	MX21_PAD_VSYNC		= PAD_ID(PA, 29),
-	MX21_PAD_CONTRAST	= PAD_ID(PA, 30),
-	MX21_PAD_OE_ACD		= PAD_ID(PA, 31),
-	MX21_PAD_SD2_D0		= PAD_ID(PB, 4),
-	MX21_PAD_SD2_D1		= PAD_ID(PB, 5),
-	MX21_PAD_SD2_D2		= PAD_ID(PB, 6),
-	MX21_PAD_SD2_D3		= PAD_ID(PB, 7),
-	MX21_PAD_SD2_CMD	= PAD_ID(PB, 8),
-	MX21_PAD_SD2_CLK	= PAD_ID(PB, 9),
-	MX21_PAD_CSI_D0		= PAD_ID(PB, 10),
-	MX21_PAD_CSI_D1		= PAD_ID(PB, 11),
-	MX21_PAD_CSI_D2		= PAD_ID(PB, 12),
-	MX21_PAD_CSI_D3		= PAD_ID(PB, 13),
-	MX21_PAD_CSI_D4		= PAD_ID(PB, 14),
-	MX21_PAD_CSI_MCLK	= PAD_ID(PB, 15),
-	MX21_PAD_CSI_PIXCLK	= PAD_ID(PB, 16),
-	MX21_PAD_CSI_D5		= PAD_ID(PB, 17),
-	MX21_PAD_CSI_D6		= PAD_ID(PB, 18),
-	MX21_PAD_CSI_D7		= PAD_ID(PB, 19),
-	MX21_PAD_CSI_VSYNC	= PAD_ID(PB, 20),
-	MX21_PAD_CSI_HSYNC	= PAD_ID(PB, 21),
-	MX21_PAD_USB_BYP	= PAD_ID(PB, 22),
-	MX21_PAD_USB_PWR	= PAD_ID(PB, 23),
-	MX21_PAD_USB_OC		= PAD_ID(PB, 24),
-	MX21_PAD_USBH_ON	= PAD_ID(PB, 25),
-	MX21_PAD_USBH1_FS	= PAD_ID(PB, 26),
-	MX21_PAD_USBH1_OE	= PAD_ID(PB, 27),
-	MX21_PAD_USBH1_TXDM	= PAD_ID(PB, 28),
-	MX21_PAD_USBH1_TXDP	= PAD_ID(PB, 29),
-	MX21_PAD_USBH1_RXDM	= PAD_ID(PB, 30),
-	MX21_PAD_USBH1_RXDP	= PAD_ID(PB, 31),
-	MX21_PAD_USBG_SDA	= PAD_ID(PC, 5),
-	MX21_PAD_USBG_SCL	= PAD_ID(PC, 6),
-	MX21_PAD_USBG_ON	= PAD_ID(PC, 7),
-	MX21_PAD_USBG_FS	= PAD_ID(PC, 8),
-	MX21_PAD_USBG_OE	= PAD_ID(PC, 9),
-	MX21_PAD_USBG_TXDM	= PAD_ID(PC, 10),
-	MX21_PAD_USBG_TXDP	= PAD_ID(PC, 11),
-	MX21_PAD_USBG_RXDM	= PAD_ID(PC, 12),
-	MX21_PAD_USBG_RXDP	= PAD_ID(PC, 13),
-	MX21_PAD_TOUT		= PAD_ID(PC, 14),
-	MX21_PAD_TIN		= PAD_ID(PC, 15),
-	MX21_PAD_SAP_FS		= PAD_ID(PC, 16),
-	MX21_PAD_SAP_RXD	= PAD_ID(PC, 17),
-	MX21_PAD_SAP_TXD	= PAD_ID(PC, 18),
-	MX21_PAD_SAP_CLK	= PAD_ID(PC, 19),
-	MX21_PAD_SSI1_FS	= PAD_ID(PC, 20),
-	MX21_PAD_SSI1_RXD	= PAD_ID(PC, 21),
-	MX21_PAD_SSI1_TXD	= PAD_ID(PC, 22),
-	MX21_PAD_SSI1_CLK	= PAD_ID(PC, 23),
-	MX21_PAD_SSI2_FS	= PAD_ID(PC, 24),
-	MX21_PAD_SSI2_RXD	= PAD_ID(PC, 25),
-	MX21_PAD_SSI2_TXD	= PAD_ID(PC, 26),
-	MX21_PAD_SSI2_CLK	= PAD_ID(PC, 27),
-	MX21_PAD_SSI3_FS	= PAD_ID(PC, 28),
-	MX21_PAD_SSI3_RXD	= PAD_ID(PC, 29),
-	MX21_PAD_SSI3_TXD	= PAD_ID(PC, 30),
-	MX21_PAD_SSI3_CLK	= PAD_ID(PC, 31),
-	MX21_PAD_I2C_DATA	= PAD_ID(PD, 17),
-	MX21_PAD_I2C_CLK	= PAD_ID(PD, 18),
-	MX21_PAD_CSPI2_SS2	= PAD_ID(PD, 19),
-	MX21_PAD_CSPI2_SS1	= PAD_ID(PD, 20),
-	MX21_PAD_CSPI2_SS0	= PAD_ID(PD, 21),
-	MX21_PAD_CSPI2_SCLK	= PAD_ID(PD, 22),
-	MX21_PAD_CSPI2_MISO	= PAD_ID(PD, 23),
-	MX21_PAD_CSPI2_MOSI	= PAD_ID(PD, 24),
-	MX21_PAD_CSPI1_RDY	= PAD_ID(PD, 25),
-	MX21_PAD_CSPI1_SS2	= PAD_ID(PD, 26),
-	MX21_PAD_CSPI1_SS1	= PAD_ID(PD, 27),
-	MX21_PAD_CSPI1_SS0	= PAD_ID(PD, 28),
-	MX21_PAD_CSPI1_SCLK	= PAD_ID(PD, 29),
-	MX21_PAD_CSPI1_MISO	= PAD_ID(PD, 30),
-	MX21_PAD_CSPI1_MOSI	= PAD_ID(PD, 31),
-	MX21_PAD_TEST_WB2	= PAD_ID(PE, 0),
-	MX21_PAD_TEST_WB1	= PAD_ID(PE, 1),
-	MX21_PAD_TEST_WB0	= PAD_ID(PE, 2),
-	MX21_PAD_UART2_CTS	= PAD_ID(PE, 3),
-	MX21_PAD_UART2_RTS	= PAD_ID(PE, 4),
-	MX21_PAD_PWMO		= PAD_ID(PE, 5),
-	MX21_PAD_UART2_TXD	= PAD_ID(PE, 6),
-	MX21_PAD_UART2_RXD	= PAD_ID(PE, 7),
-	MX21_PAD_UART3_TXD	= PAD_ID(PE, 8),
-	MX21_PAD_UART3_RXD	= PAD_ID(PE, 9),
-	MX21_PAD_UART3_CTS	= PAD_ID(PE, 10),
-	MX21_PAD_UART3_RTS	= PAD_ID(PE, 11),
-	MX21_PAD_UART1_TXD	= PAD_ID(PE, 12),
-	MX21_PAD_UART1_RXD	= PAD_ID(PE, 13),
-	MX21_PAD_UART1_CTS	= PAD_ID(PE, 14),
-	MX21_PAD_UART1_RTS	= PAD_ID(PE, 15),
-	MX21_PAD_RTCK		= PAD_ID(PE, 16),
-	MX21_PAD_RESET_OUT	= PAD_ID(PE, 17),
-	MX21_PAD_SD1_D0		= PAD_ID(PE, 18),
-	MX21_PAD_SD1_D1		= PAD_ID(PE, 19),
-	MX21_PAD_SD1_D2		= PAD_ID(PE, 20),
-	MX21_PAD_SD1_D3		= PAD_ID(PE, 21),
-	MX21_PAD_SD1_CMD	= PAD_ID(PE, 22),
-	MX21_PAD_SD1_CLK	= PAD_ID(PE, 23),
-	MX21_PAD_NFRB		= PAD_ID(PF, 0),
-	MX21_PAD_NFCE		= PAD_ID(PF, 1),
-	MX21_PAD_NFWP		= PAD_ID(PF, 2),
-	MX21_PAD_NFCLE		= PAD_ID(PF, 3),
-	MX21_PAD_NFALE		= PAD_ID(PF, 4),
-	MX21_PAD_NFRE		= PAD_ID(PF, 5),
-	MX21_PAD_NFWE		= PAD_ID(PF, 6),
-	MX21_PAD_NFIO0		= PAD_ID(PF, 7),
-	MX21_PAD_NFIO1		= PAD_ID(PF, 8),
-	MX21_PAD_NFIO2		= PAD_ID(PF, 9),
-	MX21_PAD_NFIO3		= PAD_ID(PF, 10),
-	MX21_PAD_NFIO4		= PAD_ID(PF, 11),
-	MX21_PAD_NFIO5		= PAD_ID(PF, 12),
-	MX21_PAD_NFIO6		= PAD_ID(PF, 13),
-	MX21_PAD_NFIO7		= PAD_ID(PF, 14),
-	MX21_PAD_CLKO		= PAD_ID(PF, 15),
-	MX21_PAD_RESERVED	= PAD_ID(PF, 16),
-	MX21_PAD_CS4		= PAD_ID(PF, 21),
-	MX21_PAD_CS5		= PAD_ID(PF, 22),
-};
-
-/* Pad names for the pinmux subsystem */
-static const struct pinctrl_pin_desc imx21_pinctrl_pads[] = {
-	IMX_PINCTRL_PIN(MX21_PAD_LSCLK),
-	IMX_PINCTRL_PIN(MX21_PAD_LD0),
-	IMX_PINCTRL_PIN(MX21_PAD_LD1),
-	IMX_PINCTRL_PIN(MX21_PAD_LD2),
-	IMX_PINCTRL_PIN(MX21_PAD_LD3),
-	IMX_PINCTRL_PIN(MX21_PAD_LD4),
-	IMX_PINCTRL_PIN(MX21_PAD_LD5),
-	IMX_PINCTRL_PIN(MX21_PAD_LD6),
-	IMX_PINCTRL_PIN(MX21_PAD_LD7),
-	IMX_PINCTRL_PIN(MX21_PAD_LD8),
-	IMX_PINCTRL_PIN(MX21_PAD_LD9),
-	IMX_PINCTRL_PIN(MX21_PAD_LD10),
-	IMX_PINCTRL_PIN(MX21_PAD_LD11),
-	IMX_PINCTRL_PIN(MX21_PAD_LD12),
-	IMX_PINCTRL_PIN(MX21_PAD_LD13),
-	IMX_PINCTRL_PIN(MX21_PAD_LD14),
-	IMX_PINCTRL_PIN(MX21_PAD_LD15),
-	IMX_PINCTRL_PIN(MX21_PAD_LD16),
-	IMX_PINCTRL_PIN(MX21_PAD_LD17),
-	IMX_PINCTRL_PIN(MX21_PAD_REV),
-	IMX_PINCTRL_PIN(MX21_PAD_CLS),
-	IMX_PINCTRL_PIN(MX21_PAD_PS),
-	IMX_PINCTRL_PIN(MX21_PAD_SPL_SPR),
-	IMX_PINCTRL_PIN(MX21_PAD_HSYNC),
-	IMX_PINCTRL_PIN(MX21_PAD_VSYNC),
-	IMX_PINCTRL_PIN(MX21_PAD_CONTRAST),
-	IMX_PINCTRL_PIN(MX21_PAD_OE_ACD),
-	IMX_PINCTRL_PIN(MX21_PAD_SD2_D0),
-	IMX_PINCTRL_PIN(MX21_PAD_SD2_D1),
-	IMX_PINCTRL_PIN(MX21_PAD_SD2_D2),
-	IMX_PINCTRL_PIN(MX21_PAD_SD2_D3),
-	IMX_PINCTRL_PIN(MX21_PAD_SD2_CMD),
-	IMX_PINCTRL_PIN(MX21_PAD_SD2_CLK),
-	IMX_PINCTRL_PIN(MX21_PAD_CSI_D0),
-	IMX_PINCTRL_PIN(MX21_PAD_CSI_D1),
-	IMX_PINCTRL_PIN(MX21_PAD_CSI_D2),
-	IMX_PINCTRL_PIN(MX21_PAD_CSI_D3),
-	IMX_PINCTRL_PIN(MX21_PAD_CSI_D4),
-	IMX_PINCTRL_PIN(MX21_PAD_CSI_MCLK),
-	IMX_PINCTRL_PIN(MX21_PAD_CSI_PIXCLK),
-	IMX_PINCTRL_PIN(MX21_PAD_CSI_D5),
-	IMX_PINCTRL_PIN(MX21_PAD_CSI_D6),
-	IMX_PINCTRL_PIN(MX21_PAD_CSI_D7),
-	IMX_PINCTRL_PIN(MX21_PAD_CSI_VSYNC),
-	IMX_PINCTRL_PIN(MX21_PAD_CSI_HSYNC),
-	IMX_PINCTRL_PIN(MX21_PAD_USB_BYP),
-	IMX_PINCTRL_PIN(MX21_PAD_USB_PWR),
-	IMX_PINCTRL_PIN(MX21_PAD_USB_OC),
-	IMX_PINCTRL_PIN(MX21_PAD_USBH_ON),
-	IMX_PINCTRL_PIN(MX21_PAD_USBH1_FS),
-	IMX_PINCTRL_PIN(MX21_PAD_USBH1_OE),
-	IMX_PINCTRL_PIN(MX21_PAD_USBH1_TXDM),
-	IMX_PINCTRL_PIN(MX21_PAD_USBH1_TXDP),
-	IMX_PINCTRL_PIN(MX21_PAD_USBH1_RXDM),
-	IMX_PINCTRL_PIN(MX21_PAD_USBH1_RXDP),
-	IMX_PINCTRL_PIN(MX21_PAD_USBG_SDA),
-	IMX_PINCTRL_PIN(MX21_PAD_USBG_SCL),
-	IMX_PINCTRL_PIN(MX21_PAD_USBG_ON),
-	IMX_PINCTRL_PIN(MX21_PAD_USBG_FS),
-	IMX_PINCTRL_PIN(MX21_PAD_USBG_OE),
-	IMX_PINCTRL_PIN(MX21_PAD_USBG_TXDM),
-	IMX_PINCTRL_PIN(MX21_PAD_USBG_TXDP),
-	IMX_PINCTRL_PIN(MX21_PAD_USBG_RXDM),
-	IMX_PINCTRL_PIN(MX21_PAD_USBG_RXDP),
-	IMX_PINCTRL_PIN(MX21_PAD_TOUT),
-	IMX_PINCTRL_PIN(MX21_PAD_TIN),
-	IMX_PINCTRL_PIN(MX21_PAD_SAP_FS),
-	IMX_PINCTRL_PIN(MX21_PAD_SAP_RXD),
-	IMX_PINCTRL_PIN(MX21_PAD_SAP_TXD),
-	IMX_PINCTRL_PIN(MX21_PAD_SAP_CLK),
-	IMX_PINCTRL_PIN(MX21_PAD_SSI1_FS),
-	IMX_PINCTRL_PIN(MX21_PAD_SSI1_RXD),
-	IMX_PINCTRL_PIN(MX21_PAD_SSI1_TXD),
-	IMX_PINCTRL_PIN(MX21_PAD_SSI1_CLK),
-	IMX_PINCTRL_PIN(MX21_PAD_SSI2_FS),
-	IMX_PINCTRL_PIN(MX21_PAD_SSI2_RXD),
-	IMX_PINCTRL_PIN(MX21_PAD_SSI2_TXD),
-	IMX_PINCTRL_PIN(MX21_PAD_SSI2_CLK),
-	IMX_PINCTRL_PIN(MX21_PAD_SSI3_FS),
-	IMX_PINCTRL_PIN(MX21_PAD_SSI3_RXD),
-	IMX_PINCTRL_PIN(MX21_PAD_SSI3_TXD),
-	IMX_PINCTRL_PIN(MX21_PAD_SSI3_CLK),
-	IMX_PINCTRL_PIN(MX21_PAD_I2C_DATA),
-	IMX_PINCTRL_PIN(MX21_PAD_I2C_CLK),
-	IMX_PINCTRL_PIN(MX21_PAD_CSPI2_SS2),
-	IMX_PINCTRL_PIN(MX21_PAD_CSPI2_SS1),
-	IMX_PINCTRL_PIN(MX21_PAD_CSPI2_SS0),
-	IMX_PINCTRL_PIN(MX21_PAD_CSPI2_SCLK),
-	IMX_PINCTRL_PIN(MX21_PAD_CSPI2_MISO),
-	IMX_PINCTRL_PIN(MX21_PAD_CSPI2_MOSI),
-	IMX_PINCTRL_PIN(MX21_PAD_CSPI1_RDY),
-	IMX_PINCTRL_PIN(MX21_PAD_CSPI1_SS2),
-	IMX_PINCTRL_PIN(MX21_PAD_CSPI1_SS1),
-	IMX_PINCTRL_PIN(MX21_PAD_CSPI1_SS0),
-	IMX_PINCTRL_PIN(MX21_PAD_CSPI1_SCLK),
-	IMX_PINCTRL_PIN(MX21_PAD_CSPI1_MISO),
-	IMX_PINCTRL_PIN(MX21_PAD_CSPI1_MOSI),
-	IMX_PINCTRL_PIN(MX21_PAD_TEST_WB2),
-	IMX_PINCTRL_PIN(MX21_PAD_TEST_WB1),
-	IMX_PINCTRL_PIN(MX21_PAD_TEST_WB0),
-	IMX_PINCTRL_PIN(MX21_PAD_UART2_CTS),
-	IMX_PINCTRL_PIN(MX21_PAD_UART2_RTS),
-	IMX_PINCTRL_PIN(MX21_PAD_PWMO),
-	IMX_PINCTRL_PIN(MX21_PAD_UART2_TXD),
-	IMX_PINCTRL_PIN(MX21_PAD_UART2_RXD),
-	IMX_PINCTRL_PIN(MX21_PAD_UART3_TXD),
-	IMX_PINCTRL_PIN(MX21_PAD_UART3_RXD),
-	IMX_PINCTRL_PIN(MX21_PAD_UART3_CTS),
-	IMX_PINCTRL_PIN(MX21_PAD_UART3_RTS),
-	IMX_PINCTRL_PIN(MX21_PAD_UART1_TXD),
-	IMX_PINCTRL_PIN(MX21_PAD_UART1_RXD),
-	IMX_PINCTRL_PIN(MX21_PAD_UART1_CTS),
-	IMX_PINCTRL_PIN(MX21_PAD_UART1_RTS),
-	IMX_PINCTRL_PIN(MX21_PAD_RTCK),
-	IMX_PINCTRL_PIN(MX21_PAD_RESET_OUT),
-	IMX_PINCTRL_PIN(MX21_PAD_SD1_D0),
-	IMX_PINCTRL_PIN(MX21_PAD_SD1_D1),
-	IMX_PINCTRL_PIN(MX21_PAD_SD1_D2),
-	IMX_PINCTRL_PIN(MX21_PAD_SD1_D3),
-	IMX_PINCTRL_PIN(MX21_PAD_SD1_CMD),
-	IMX_PINCTRL_PIN(MX21_PAD_SD1_CLK),
-	IMX_PINCTRL_PIN(MX21_PAD_NFRB),
-	IMX_PINCTRL_PIN(MX21_PAD_NFCE),
-	IMX_PINCTRL_PIN(MX21_PAD_NFWP),
-	IMX_PINCTRL_PIN(MX21_PAD_NFCLE),
-	IMX_PINCTRL_PIN(MX21_PAD_NFALE),
-	IMX_PINCTRL_PIN(MX21_PAD_NFRE),
-	IMX_PINCTRL_PIN(MX21_PAD_NFWE),
-	IMX_PINCTRL_PIN(MX21_PAD_NFIO0),
-	IMX_PINCTRL_PIN(MX21_PAD_NFIO1),
-	IMX_PINCTRL_PIN(MX21_PAD_NFIO2),
-	IMX_PINCTRL_PIN(MX21_PAD_NFIO3),
-	IMX_PINCTRL_PIN(MX21_PAD_NFIO4),
-	IMX_PINCTRL_PIN(MX21_PAD_NFIO5),
-	IMX_PINCTRL_PIN(MX21_PAD_NFIO6),
-	IMX_PINCTRL_PIN(MX21_PAD_NFIO7),
-	IMX_PINCTRL_PIN(MX21_PAD_CLKO),
-	IMX_PINCTRL_PIN(MX21_PAD_RESERVED),
-	IMX_PINCTRL_PIN(MX21_PAD_CS4),
-	IMX_PINCTRL_PIN(MX21_PAD_CS5),
-};
-
-static struct imx1_pinctrl_soc_info imx21_pinctrl_info = {
-	.pins	= imx21_pinctrl_pads,
-	.npins	= ARRAY_SIZE(imx21_pinctrl_pads),
-};
-
-static int __init imx21_pinctrl_probe(struct platform_device *pdev)
-{
-	return imx1_pinctrl_core_probe(pdev, &imx21_pinctrl_info);
-}
-
-static const struct of_device_id imx21_pinctrl_of_match[] = {
-	{ .compatible = "fsl,imx21-iomuxc", },
-	{ }
-};
-
-static struct platform_driver imx21_pinctrl_driver = {
-	.driver	= {
-		.name		= "imx21-pinctrl",
-		.of_match_table	= imx21_pinctrl_of_match,
-	},
-};
-builtin_platform_driver_probe(imx21_pinctrl_driver, imx21_pinctrl_probe);
-- 
2.17.1

