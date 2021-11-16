Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9A1D4534FF
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 16:05:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237971AbhKPPHs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 10:07:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233847AbhKPPGv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Nov 2021 10:06:51 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA2E2C06121D;
        Tue, 16 Nov 2021 07:01:52 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id z5so29276307edd.3;
        Tue, 16 Nov 2021 07:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l4A0QwuDXkWlHocxWGY/LKp7oE6NH5fpBzhs7/voy7Q=;
        b=ovBZ9RMncX3kit8IgWo6jmq7h/8kEh5f/XaA/Rb/491JNCUsTMwRpE+9mimbzllP+7
         aXsY1fkxeO0rRnGI4jfPQa5ETzZQMeLMq1Avs3Ecp1TGiDMIMkvacLsG9uW3AptbDkJq
         kU6sozB4wprjttjs9O12re0d8oCFHqtlDj7UUpdLKkesLGNUyC6mFYnjKuXUjzZTV4Vk
         J75K6TyyS6suz9JcatNXAOU62sP5eCSbb38L8viwMkuWH6CevBjkR8ahsYT9sTejh0NZ
         bshV9A0Ck3pjOCkPjNmOzISw+BC5V0Ig8ON4s5z4++6+ImsURYmfl+KXXq0zVx1wC2w8
         Rvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=l4A0QwuDXkWlHocxWGY/LKp7oE6NH5fpBzhs7/voy7Q=;
        b=2Nle+hGFuGcNW2il9WL8qg6dJcvIZe8gLaE9A268NKV5HsjFFF1Vu1GE9Y9lyLGSS+
         TraZNhnhuWuW79XsNvMCHsDG+U+mbchqqT8Q4uRMjH/FFXSxL/E+I/gJImL+EtgHt0nC
         bqpmTNebbtq6HYzf9WwynEnpRhHI39fWQYBW8jEC8IlEY0oEdNXDIF77MrudCAsouUmF
         Qb/SjyFcrH8myonq6Uxz9GKhYnOvwpkOTizok5CzbuPXJW+/omoE8CgQIqXm/1VokXnu
         njneWhRB7no+BLzXyvEIrcEVJ+k9hNN5aZqjiFSoU4OKSi5L+UYemzkATKNRx9qDmKJa
         l9jQ==
X-Gm-Message-State: AOAM532BVyb1UqdtJr+nFgcqvfl+LVCyxGruj3Z8HwUpLBRVwDdTlke1
        KzYbwCoJBsJIe8wmWgdFnSg=
X-Google-Smtp-Source: ABdhPJwuwARuXZlx24qiZ4QjT5Gt3QsbqyYmRh+LA17OOaxyWz/avf4FqZH/kpjzEYPRDqdVGgUT8g==
X-Received: by 2002:a17:906:9b88:: with SMTP id dd8mr11011493ejc.467.1637074909058;
        Tue, 16 Nov 2021 07:01:49 -0800 (PST)
Received: from stitch.. ([2a02:aa7:4600:b4ae:a375:e7a0:9eaf:8d7b])
        by smtp.gmail.com with ESMTPSA id u16sm9414311edr.43.2021.11.16.07.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 07:01:48 -0800 (PST)
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
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        Emil Renner Berthing <kernel@esmil.dk>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 04/16] dt-bindings: clock: starfive: Add JH7100 clock definitions
Date:   Tue, 16 Nov 2021 16:01:07 +0100
Message-Id: <20211116150119.2171-5-kernel@esmil.dk>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211116150119.2171-1-kernel@esmil.dk>
References: <20211116150119.2171-1-kernel@esmil.dk>
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
Acked-by: Rob Herring <robh@kernel.org>
---
 include/dt-bindings/clock/starfive-jh7100.h | 202 ++++++++++++++++++++
 1 file changed, 202 insertions(+)
 create mode 100644 include/dt-bindings/clock/starfive-jh7100.h

diff --git a/include/dt-bindings/clock/starfive-jh7100.h b/include/dt-bindings/clock/starfive-jh7100.h
new file mode 100644
index 000000000000..aa0863b9728d
--- /dev/null
+++ b/include/dt-bindings/clock/starfive-jh7100.h
@@ -0,0 +1,202 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
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

