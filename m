Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD32443369
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 17:44:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234857AbhKBQqw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 12:46:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234694AbhKBQqs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 12:46:48 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA7D2C06122A;
        Tue,  2 Nov 2021 09:11:57 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id r4so77080290edi.5;
        Tue, 02 Nov 2021 09:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K8dKASe/l2+LOI+r38ZTu5MH6BDOV4wDKFWMxZBsmrs=;
        b=NC+a7fSABTHdEFYnL0X9sKcIXcTxympPS2FPwiJBxm5rQFNWc9UqSp5eG5D+Qa4I4T
         aTYB+8ed7fS+55LF7Rx8CAj5w+EH3NGj33GMzeHZPumIcHdXAmUmrdqgLPlZV2Z0eep0
         5i7qZAZQFdE/IbqsdbbB4CDLxquzWFlsVyYIwYSvpRS7LtsF/7Wfwcdw4TxkXAzJknMH
         qvYUmYFMiG3NwbDbEm6MhOWNfqRr2iRNmbf01T8Jj6W2WelGteZ1Sv3l/F4hs+g8lGZt
         WKgO70p+FSjwTrtiALiK//4ZzmaVwkQLqUYtYfYEvEr0LeIkw51zhelzoD8rht+Kz2jn
         6rQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=K8dKASe/l2+LOI+r38ZTu5MH6BDOV4wDKFWMxZBsmrs=;
        b=Dj/gq9ESn5Uv4L/1gjPntPNaBNTFAxaD1jOJGJQiMbEuIxuP76SAP5Pul6lyFGTwR4
         u8CSkVEIccIn4J3God73J+JKDRmfGw+RXJRRXXNyGUM9fXEihR8mW0vzzsTT3O+0FrLl
         WyMMUbrMbdVxeJ0Q7dQRGQmeK0n7gMFVWQ5BIUVTbm1Gymb5h+pBkD7Um0rzGZ7OjA+H
         zukK36dlFmfOQMZCiHdNTGZMLuLmzCDn4pKukEjGDhAb/358Zei6Ui58lihxLydyAtWX
         To4I92sr3mf5FSOSP9jL1TDKb7QWEPaN/BFj+g2auVyTwBuAgreYbCfZFZMh8TjD5FC6
         knLg==
X-Gm-Message-State: AOAM531lJjsHuig44/h+ni2TgMsY99G30yH/4SjbXQqzH5Q0Xi9p4oLJ
        Rz2hLPjeRcl/LYM2VExyqKQ=
X-Google-Smtp-Source: ABdhPJy7Gq0cHLOzthLU4ELAQpTjizRkGFHCGSBjxs0yvBz9E5eJMooRXqkEBIwrOY+84qFsya5LRQ==
X-Received: by 2002:a17:907:1b16:: with SMTP id mp22mr46184216ejc.487.1635869516443;
        Tue, 02 Nov 2021 09:11:56 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id c7sm8451374ejd.91.2021.11.02.09.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 09:11:56 -0700 (PDT)
Sender: Emil Renner Berthing <emil.renner.berthing@gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
To:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        linux-kernel@vger.kernel.org,
        Emil Renner Berthing <kernel@esmil.dk>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 07/16] dt-bindings: reset: Add StarFive JH7100 reset definitions
Date:   Tue,  2 Nov 2021 17:11:16 +0100
Message-Id: <20211102161125.1144023-8-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102161125.1144023-1-kernel@esmil.dk>
References: <20211102161125.1144023-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Geert Uytterhoeven <geert@linux-m68k.org>

Add all resets for the StarFive JH7100 reset controller.

Based on work by Ahmad Fatoum for Barebox, with "JH7100_" prefixes added
to all definitions.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Acked-by: Rob Herring <robh@kernel.org>
---
 include/dt-bindings/reset/starfive-jh7100.h | 126 ++++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100644 include/dt-bindings/reset/starfive-jh7100.h

diff --git a/include/dt-bindings/reset/starfive-jh7100.h b/include/dt-bindings/reset/starfive-jh7100.h
new file mode 100644
index 000000000000..540e19254f39
--- /dev/null
+++ b/include/dt-bindings/reset/starfive-jh7100.h
@@ -0,0 +1,126 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
+ * Copyright (C) 2021 Ahmad Fatoum, Pengutronix
+ */
+
+#ifndef __DT_BINDINGS_RESET_STARFIVE_JH7100_H__
+#define __DT_BINDINGS_RESET_STARFIVE_JH7100_H__
+
+#define JH7100_RSTN_DOM3AHB_BUS		0
+#define JH7100_RSTN_DOM7AHB_BUS		1
+#define JH7100_RST_U74			2
+#define JH7100_RSTN_U74_AXI		3
+#define JH7100_RSTN_SGDMA2P_AHB		4
+#define JH7100_RSTN_SGDMA2P_AXI		5
+#define JH7100_RSTN_DMA2PNOC_AXI	6
+#define JH7100_RSTN_DLA_AXI		7
+#define JH7100_RSTN_DLANOC_AXI		8
+#define JH7100_RSTN_DLA_APB		9
+#define JH7100_RST_VP6_DRESET		10
+#define JH7100_RST_VP6_BRESET		11
+#define JH7100_RSTN_VP6_AXI		12
+#define JH7100_RSTN_VDECBRG_MAIN	13
+#define JH7100_RSTN_VDEC_AXI		14
+#define JH7100_RSTN_VDEC_BCLK		15
+#define JH7100_RSTN_VDEC_CCLK		16
+#define JH7100_RSTN_VDEC_APB		17
+#define JH7100_RSTN_JPEG_AXI		18
+#define JH7100_RSTN_JPEG_CCLK		19
+#define JH7100_RSTN_JPEG_APB		20
+#define JH7100_RSTN_JPCGC300_MAIN	21
+#define JH7100_RSTN_GC300_2X		22
+#define JH7100_RSTN_GC300_AXI		23
+#define JH7100_RSTN_GC300_AHB		24
+#define JH7100_RSTN_VENC_AXI		25
+#define JH7100_RSTN_VENCBRG_MAIN	26
+#define JH7100_RSTN_VENC_BCLK		27
+#define JH7100_RSTN_VENC_CCLK		28
+#define JH7100_RSTN_VENC_APB		29
+#define JH7100_RSTN_DDRPHY_APB		30
+#define JH7100_RSTN_NOC_ROB		31
+#define JH7100_RSTN_NOC_COG		32
+#define JH7100_RSTN_HIFI4_AXI		33
+#define JH7100_RSTN_HIFI4NOC_AXI	34
+#define JH7100_RST_HIFI4_DRESET		35
+#define JH7100_RST_HIFI4_BRESET		36
+#define JH7100_RSTN_USB_AXI		37
+#define JH7100_RSTN_USBNOC_AXI		38
+#define JH7100_RSTN_SGDMA1P_AXI		39
+#define JH7100_RSTN_DMA1P_AXI		40
+#define JH7100_RSTN_X2C_AXI		41
+#define JH7100_RSTN_NNE_AHB		42
+#define JH7100_RSTN_NNE_AXI		43
+#define JH7100_RSTN_NNENOC_AXI		44
+#define JH7100_RSTN_DLASLV_AXI		45
+#define JH7100_RSTN_DSPX2C_AXI		46
+#define JH7100_RSTN_VIN_SRC		47
+#define JH7100_RSTN_ISPSLV_AXI		48
+#define JH7100_RSTN_VIN_AXI		49
+#define JH7100_RSTN_VINNOC_AXI		50
+#define JH7100_RSTN_ISP0_AXI		51
+#define JH7100_RSTN_ISP0NOC_AXI		52
+#define JH7100_RSTN_ISP1_AXI		53
+#define JH7100_RSTN_ISP1NOC_AXI		54
+#define JH7100_RSTN_VOUT_SRC		55
+#define JH7100_RSTN_DISP_AXI		56
+#define JH7100_RSTN_DISPNOC_AXI		57
+#define JH7100_RSTN_SDIO0_AHB		58
+#define JH7100_RSTN_SDIO1_AHB		59
+#define JH7100_RSTN_GMAC_AHB		60
+#define JH7100_RSTN_SPI2AHB_AHB		61
+#define JH7100_RSTN_SPI2AHB_CORE	62
+#define JH7100_RSTN_EZMASTER_AHB	63
+#define JH7100_RST_E24			64
+#define JH7100_RSTN_QSPI_AHB		65
+#define JH7100_RSTN_QSPI_CORE		66
+#define JH7100_RSTN_QSPI_APB		67
+#define JH7100_RSTN_SEC_AHB		68
+#define JH7100_RSTN_AES			69
+#define JH7100_RSTN_PKA			70
+#define JH7100_RSTN_SHA			71
+#define JH7100_RSTN_TRNG_APB		72
+#define JH7100_RSTN_OTP_APB		73
+#define JH7100_RSTN_UART0_APB		74
+#define JH7100_RSTN_UART0_CORE		75
+#define JH7100_RSTN_UART1_APB		76
+#define JH7100_RSTN_UART1_CORE		77
+#define JH7100_RSTN_SPI0_APB		78
+#define JH7100_RSTN_SPI0_CORE		79
+#define JH7100_RSTN_SPI1_APB		80
+#define JH7100_RSTN_SPI1_CORE		81
+#define JH7100_RSTN_I2C0_APB		82
+#define JH7100_RSTN_I2C0_CORE		83
+#define JH7100_RSTN_I2C1_APB		84
+#define JH7100_RSTN_I2C1_CORE		85
+#define JH7100_RSTN_GPIO_APB		86
+#define JH7100_RSTN_UART2_APB		87
+#define JH7100_RSTN_UART2_CORE		88
+#define JH7100_RSTN_UART3_APB		89
+#define JH7100_RSTN_UART3_CORE		90
+#define JH7100_RSTN_SPI2_APB		91
+#define JH7100_RSTN_SPI2_CORE		92
+#define JH7100_RSTN_SPI3_APB		93
+#define JH7100_RSTN_SPI3_CORE		94
+#define JH7100_RSTN_I2C2_APB		95
+#define JH7100_RSTN_I2C2_CORE		96
+#define JH7100_RSTN_I2C3_APB		97
+#define JH7100_RSTN_I2C3_CORE		98
+#define JH7100_RSTN_WDTIMER_APB		99
+#define JH7100_RSTN_WDT			100
+#define JH7100_RSTN_TIMER0		101
+#define JH7100_RSTN_TIMER1		102
+#define JH7100_RSTN_TIMER2		103
+#define JH7100_RSTN_TIMER3		104
+#define JH7100_RSTN_TIMER4		105
+#define JH7100_RSTN_TIMER5		106
+#define JH7100_RSTN_TIMER6		107
+#define JH7100_RSTN_VP6INTC_APB		108
+#define JH7100_RSTN_PWM_APB		109
+#define JH7100_RSTN_MSI_APB		110
+#define JH7100_RSTN_TEMP_APB		111
+#define JH7100_RSTN_TEMP_SENSE		112
+#define JH7100_RSTN_SYSERR_APB		113
+
+#define JH7100_RSTN_END			114
+
+#endif /* __DT_BINDINGS_RESET_STARFIVE_JH7100_H__ */
-- 
2.33.1

