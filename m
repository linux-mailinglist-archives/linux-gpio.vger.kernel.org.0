Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95BE2436956
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Oct 2021 19:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232288AbhJURo6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Oct 2021 13:44:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232202AbhJURoz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Oct 2021 13:44:55 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BC0FC061570;
        Thu, 21 Oct 2021 10:42:38 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id e19so3933622edy.0;
        Thu, 21 Oct 2021 10:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TeB76lo/VjI+1AB9IvSkLeFPHspsTWO28A6YWWLnyk0=;
        b=DW8yHo7mWHPWye6vlr8fMfVE5xtsKbuKNeGRhlNwoStR2WYeE1iMBcSAoAirFNARa4
         h0kagTcJ0T30VHG8nhCMl1BkqT5UwqyUdqc7qK6BIsy7uUkwo9hY2UY8K8ReMY6ZmwMY
         XWjylw49aR0GgqqG4fZJUQpXtOAIcQsp2ZlQoGPns3ohkpKi/Vwv6wOKIo6GFuEO8AIz
         n4t+gxSBJEhaCrJbJDI9M7WblSie5YFxY76oP5q8KAN3aa8SAhHexJDOA3jPuscB9EBm
         o/O1ByVEiLcwafoZCyAZ6xp2P/ZsAfVp5v2dOr7OYG4u7vNte+CGasVDtX1Te2aPtS4Z
         tOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=TeB76lo/VjI+1AB9IvSkLeFPHspsTWO28A6YWWLnyk0=;
        b=nXpp2tR8NtXj3kOtM7hcKmeZeb12h2Qntc6pW6dW7DzbWMM4hN+TWfAnxzzaRcbnCL
         T6fxXHiUqBD2JyyqzfIDQWcokMYY3nX6gwhzpE4nBLMdJFtz/eGSmATun0BLYy39pd/a
         kaY99W3H2kHM41uuNhKkxAIiggrW3Uiow8lIuEcOTNSG/jqdSWK8DSOOx2Kh3s8mPcy5
         1tAnNEDa2Vf7D7WXDYMZpGMiUZHMRhrWtyMTTvAep1+Wl4qmg97oq6nR2UcdOrs1VC14
         6RFpfJD+v281XziiwqV9+Xl425rCi6DiBc1JpEI0WVXGCEFy5/LRzy+hAooj2i2g1hWO
         Z4kA==
X-Gm-Message-State: AOAM530K2xUZzGChRj7XE9VHxN2+1wRvrH+PY7WDNMeS6O1DUh+NPMPK
        I852XI++LDUpZZN+axUvkB8=
X-Google-Smtp-Source: ABdhPJzs2aW6n8DnJPwLVE9V6Dgx5U/DuBlgP5VFppKwUWj0e4CRZVUOOlpd9uDheIYb+i2/XqG2Iw==
X-Received: by 2002:a05:6402:5142:: with SMTP id n2mr9240173edd.115.1634838157270;
        Thu, 21 Oct 2021 10:42:37 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id h7sm3144847edt.37.2021.10.21.10.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 10:42:36 -0700 (PDT)
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
        Emil Renner Berthing <kernel@esmil.dk>
Subject: [PATCH v2 04/16] dt-bindings: clock: starfive: Add JH7100 clock definitions
Date:   Thu, 21 Oct 2021 19:42:11 +0200
Message-Id: <20211021174223.43310-5-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211021174223.43310-1-kernel@esmil.dk>
References: <20211021174223.43310-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Geert Uytterhoeven <geert@linux-m68k.org>

Add all clock outputs for the StarFive JH7100 clock generator.

Based on work by Ahmad Fatoum for Barebox, with "JH7100_" prefixes added
to all definitions.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 include/dt-bindings/clock/starfive-jh7100.h | 202 ++++++++++++++++++++
 1 file changed, 202 insertions(+)
 create mode 100644 include/dt-bindings/clock/starfive-jh7100.h

diff --git a/include/dt-bindings/clock/starfive-jh7100.h b/include/dt-bindings/clock/starfive-jh7100.h
new file mode 100644
index 000000000000..742f93c6dd6b
--- /dev/null
+++ b/include/dt-bindings/clock/starfive-jh7100.h
@@ -0,0 +1,202 @@
+/* SPDX-License-Identifier: GPL-2.0 OR X11 */
+/*
+ * Copyright (C) 2021 Ahmad Fatoum, Pengutronix
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_STARFIVE_JH7100_H__
+#define __DT_BINDINGS_CLOCK_STARFIVE_JH7100_H__
+
+#define JH7100_CLK_CPUNDBUS_ROOT	0
+#define JH7100_CLK_DLA_ROOT		1
+#define JH7100_CLK_DSP_ROOT		2
+#define JH7100_CLK_GMACUSB_ROOT		3
+#define JH7100_CLK_PERH0_ROOT		4
+#define JH7100_CLK_PERH1_ROOT		5
+#define JH7100_CLK_VIN_ROOT		6
+#define JH7100_CLK_VOUT_ROOT		7
+#define JH7100_CLK_AUDIO_ROOT		8
+#define JH7100_CLK_CDECHIFI4_ROOT	9
+#define JH7100_CLK_CDEC_ROOT		10
+#define JH7100_CLK_VOUTBUS_ROOT		11
+#define JH7100_CLK_CPUNBUS_ROOT_DIV	12
+#define JH7100_CLK_DSP_ROOT_DIV		13
+#define JH7100_CLK_PERH0_SRC		14
+#define JH7100_CLK_PERH1_SRC		15
+#define JH7100_CLK_PLL0_TESTOUT		16
+#define JH7100_CLK_PLL1_TESTOUT		17
+#define JH7100_CLK_PLL2_TESTOUT		18
+#define JH7100_CLK_PLL2_REF		19
+#define JH7100_CLK_CPU_CORE		20
+#define JH7100_CLK_CPU_AXI		21
+#define JH7100_CLK_AHB_BUS		22
+#define JH7100_CLK_APB1_BUS		23
+#define JH7100_CLK_APB2_BUS		24
+#define JH7100_CLK_DOM3AHB_BUS		25
+#define JH7100_CLK_DOM7AHB_BUS		26
+#define JH7100_CLK_U74_CORE0		27
+#define JH7100_CLK_U74_CORE1		28
+#define JH7100_CLK_U74_AXI		29
+#define JH7100_CLK_U74RTC_TOGGLE	30
+#define JH7100_CLK_SGDMA2P_AXI		31
+#define JH7100_CLK_DMA2PNOC_AXI		32
+#define JH7100_CLK_SGDMA2P_AHB		33
+#define JH7100_CLK_DLA_BUS		34
+#define JH7100_CLK_DLA_AXI		35
+#define JH7100_CLK_DLANOC_AXI		36
+#define JH7100_CLK_DLA_APB		37
+#define JH7100_CLK_VP6_CORE		38
+#define JH7100_CLK_VP6BUS_SRC		39
+#define JH7100_CLK_VP6_AXI		40
+#define JH7100_CLK_VCDECBUS_SRC		41
+#define JH7100_CLK_VDEC_BUS		42
+#define JH7100_CLK_VDEC_AXI		43
+#define JH7100_CLK_VDECBRG_MAIN		44
+#define JH7100_CLK_VDEC_BCLK		45
+#define JH7100_CLK_VDEC_CCLK		46
+#define JH7100_CLK_VDEC_APB		47
+#define JH7100_CLK_JPEG_AXI		48
+#define JH7100_CLK_JPEG_CCLK		49
+#define JH7100_CLK_JPEG_APB		50
+#define JH7100_CLK_GC300_2X		51
+#define JH7100_CLK_GC300_AHB		52
+#define JH7100_CLK_JPCGC300_AXIBUS	53
+#define JH7100_CLK_GC300_AXI		54
+#define JH7100_CLK_JPCGC300_MAIN	55
+#define JH7100_CLK_VENC_BUS		56
+#define JH7100_CLK_VENC_AXI		57
+#define JH7100_CLK_VENCBRG_MAIN		58
+#define JH7100_CLK_VENC_BCLK		59
+#define JH7100_CLK_VENC_CCLK		60
+#define JH7100_CLK_VENC_APB		61
+#define JH7100_CLK_DDRPLL_DIV2		62
+#define JH7100_CLK_DDRPLL_DIV4		63
+#define JH7100_CLK_DDRPLL_DIV8		64
+#define JH7100_CLK_DDROSC_DIV2		65
+#define JH7100_CLK_DDRC0		66
+#define JH7100_CLK_DDRC1		67
+#define JH7100_CLK_DDRPHY_APB		68
+#define JH7100_CLK_NOC_ROB		69
+#define JH7100_CLK_NOC_COG		70
+#define JH7100_CLK_NNE_AHB		71
+#define JH7100_CLK_NNEBUS_SRC1		72
+#define JH7100_CLK_NNE_BUS		73
+#define JH7100_CLK_NNE_AXI		74
+#define JH7100_CLK_NNENOC_AXI		75
+#define JH7100_CLK_DLASLV_AXI		76
+#define JH7100_CLK_DSPX2C_AXI		77
+#define JH7100_CLK_HIFI4_SRC		78
+#define JH7100_CLK_HIFI4_COREFREE	79
+#define JH7100_CLK_HIFI4_CORE		80
+#define JH7100_CLK_HIFI4_BUS		81
+#define JH7100_CLK_HIFI4_AXI		82
+#define JH7100_CLK_HIFI4NOC_AXI		83
+#define JH7100_CLK_SGDMA1P_BUS		84
+#define JH7100_CLK_SGDMA1P_AXI		85
+#define JH7100_CLK_DMA1P_AXI		86
+#define JH7100_CLK_X2C_AXI		87
+#define JH7100_CLK_USB_BUS		88
+#define JH7100_CLK_USB_AXI		89
+#define JH7100_CLK_USBNOC_AXI		90
+#define JH7100_CLK_USBPHY_ROOTDIV	91
+#define JH7100_CLK_USBPHY_125M		92
+#define JH7100_CLK_USBPHY_PLLDIV25M	93
+#define JH7100_CLK_USBPHY_25M		94
+#define JH7100_CLK_AUDIO_DIV		95
+#define JH7100_CLK_AUDIO_SRC		96
+#define JH7100_CLK_AUDIO_12288		97
+#define JH7100_CLK_VIN_SRC		98
+#define JH7100_CLK_ISP0_BUS		99
+#define JH7100_CLK_ISP0_AXI		100
+#define JH7100_CLK_ISP0NOC_AXI		101
+#define JH7100_CLK_ISPSLV_AXI		102
+#define JH7100_CLK_ISP1_BUS		103
+#define JH7100_CLK_ISP1_AXI		104
+#define JH7100_CLK_ISP1NOC_AXI		105
+#define JH7100_CLK_VIN_BUS		106
+#define JH7100_CLK_VIN_AXI		107
+#define JH7100_CLK_VINNOC_AXI		108
+#define JH7100_CLK_VOUT_SRC		109
+#define JH7100_CLK_DISPBUS_SRC		110
+#define JH7100_CLK_DISP_BUS		111
+#define JH7100_CLK_DISP_AXI		112
+#define JH7100_CLK_DISPNOC_AXI		113
+#define JH7100_CLK_SDIO0_AHB		114
+#define JH7100_CLK_SDIO0_CCLKINT	115
+#define JH7100_CLK_SDIO0_CCLKINT_INV	116
+#define JH7100_CLK_SDIO1_AHB		117
+#define JH7100_CLK_SDIO1_CCLKINT	118
+#define JH7100_CLK_SDIO1_CCLKINT_INV	119
+#define JH7100_CLK_GMAC_AHB		120
+#define JH7100_CLK_GMAC_ROOT_DIV	121
+#define JH7100_CLK_GMAC_PTP_REF		122
+#define JH7100_CLK_GMAC_GTX		123
+#define JH7100_CLK_GMAC_RMII_TX		124
+#define JH7100_CLK_GMAC_RMII_RX		125
+#define JH7100_CLK_GMAC_TX		126
+#define JH7100_CLK_GMAC_TX_INV		127
+#define JH7100_CLK_GMAC_RX_PRE		128
+#define JH7100_CLK_GMAC_RX_INV		129
+#define JH7100_CLK_GMAC_RMII		130
+#define JH7100_CLK_GMAC_TOPHYREF	131
+#define JH7100_CLK_SPI2AHB_AHB		132
+#define JH7100_CLK_SPI2AHB_CORE		133
+#define JH7100_CLK_EZMASTER_AHB		134
+#define JH7100_CLK_E24_AHB		135
+#define JH7100_CLK_E24RTC_TOGGLE	136
+#define JH7100_CLK_QSPI_AHB		137
+#define JH7100_CLK_QSPI_APB		138
+#define JH7100_CLK_QSPI_REF		139
+#define JH7100_CLK_SEC_AHB		140
+#define JH7100_CLK_AES			141
+#define JH7100_CLK_SHA			142
+#define JH7100_CLK_PKA			143
+#define JH7100_CLK_TRNG_APB		144
+#define JH7100_CLK_OTP_APB		145
+#define JH7100_CLK_UART0_APB		146
+#define JH7100_CLK_UART0_CORE		147
+#define JH7100_CLK_UART1_APB		148
+#define JH7100_CLK_UART1_CORE		149
+#define JH7100_CLK_SPI0_APB		150
+#define JH7100_CLK_SPI0_CORE		151
+#define JH7100_CLK_SPI1_APB		152
+#define JH7100_CLK_SPI1_CORE		153
+#define JH7100_CLK_I2C0_APB		154
+#define JH7100_CLK_I2C0_CORE		155
+#define JH7100_CLK_I2C1_APB		156
+#define JH7100_CLK_I2C1_CORE		157
+#define JH7100_CLK_GPIO_APB		158
+#define JH7100_CLK_UART2_APB		159
+#define JH7100_CLK_UART2_CORE		160
+#define JH7100_CLK_UART3_APB		161
+#define JH7100_CLK_UART3_CORE		162
+#define JH7100_CLK_SPI2_APB		163
+#define JH7100_CLK_SPI2_CORE		164
+#define JH7100_CLK_SPI3_APB		165
+#define JH7100_CLK_SPI3_CORE		166
+#define JH7100_CLK_I2C2_APB		167
+#define JH7100_CLK_I2C2_CORE		168
+#define JH7100_CLK_I2C3_APB		169
+#define JH7100_CLK_I2C3_CORE		170
+#define JH7100_CLK_WDTIMER_APB		171
+#define JH7100_CLK_WDT_CORE		172
+#define JH7100_CLK_TIMER0_CORE		173
+#define JH7100_CLK_TIMER1_CORE		174
+#define JH7100_CLK_TIMER2_CORE		175
+#define JH7100_CLK_TIMER3_CORE		176
+#define JH7100_CLK_TIMER4_CORE		177
+#define JH7100_CLK_TIMER5_CORE		178
+#define JH7100_CLK_TIMER6_CORE		179
+#define JH7100_CLK_VP6INTC_APB		180
+#define JH7100_CLK_PWM_APB		181
+#define JH7100_CLK_MSI_APB		182
+#define JH7100_CLK_TEMP_APB		183
+#define JH7100_CLK_TEMP_SENSE		184
+#define JH7100_CLK_SYSERR_APB		185
+
+#define JH7100_CLK_PLL0_OUT		186
+#define JH7100_CLK_PLL1_OUT		187
+#define JH7100_CLK_PLL2_OUT		188
+
+#define JH7100_CLK_END			189
+
+#endif /* __DT_BINDINGS_CLOCK_STARFIVE_JH7100_H__ */
-- 
2.33.1

