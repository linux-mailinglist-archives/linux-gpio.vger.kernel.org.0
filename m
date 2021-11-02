Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A50B1443364
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 17:44:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234798AbhKBQqu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 12:46:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234665AbhKBQqs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 12:46:48 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02640C06122D;
        Tue,  2 Nov 2021 09:12:02 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id w1so23974468edd.10;
        Tue, 02 Nov 2021 09:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eHCI686gjSJsab96Fo5WOZPxSVWOqbq/RnmnVZ54ba4=;
        b=S/Ydv+5jq4tYcIY71gkFsWDKAb6C/px4BwdDMqCQehNtlSgm4LRUv3DO2PhXaqHo2s
         xNKoQ5Jgv7AxBTFLV9x9zOBM6mHv0KahJv762y9jRHZdgsUIOAFfax3oXepSfbLjttYk
         sIT8pd8rUrw//rwFCRXSOiLgAcvunznJU3Z4U3iLKZzHt34QpxbWjcTA2/ra067m8RGa
         LAvFBPJtDnQw4T2LNhd9VdrBMt9Gzkva3lpSsn3QWSpTwUWxKpHy3KKy3yRh/V5yEWcu
         StNE7Z4Z4CH+r5CRI0P3ld22LhjLc+Eb/Tx+G6EMls7KDnX2HjItU8bijb8KaP2IPQ1v
         Uj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=eHCI686gjSJsab96Fo5WOZPxSVWOqbq/RnmnVZ54ba4=;
        b=fpzDLpCDLxwcINQ+9438fhpsQJpIskF2ooUclDw4UiBGxrtdD3D99SMIDFZQyny0uo
         O1EetE/DKr/pxB3rcZnFUnyd9/gFWqvZVs4mh6ERrAKYyW27dzIVUaS/rrbR3PwWUYbp
         jRHIXcvBn+pNMZxZJwr3LiOauSwDXmKP4v/sBaHpQj92GNfmLTh1IquIk1b99pyakX6x
         OPtQLXQK+ghWcqyNkIyJoFClKsCc664mIMieC2mMNl1CTKoX3LvCydbnjsUkjZAn+2sU
         0qyL5FybbHJi2p9pajPbC2A1XeBWffyhCYAWypm+2MhQnjSvMxcT+4+Ept/o20kpxUr9
         RAfw==
X-Gm-Message-State: AOAM531mizgnfbNkemSstDw6xGg/w0KYbDzSn4t05lBNOcl1IImAb13y
        lChbfqrdDx+sUruWJ5D52yY=
X-Google-Smtp-Source: ABdhPJzfyIygZJqJN0nX06ULwcmKtkLiAl33+CDkhUVQ4jiD/liCqFRBmbUEp9ZWyi4MYjL8p5ul6A==
X-Received: by 2002:a50:c449:: with SMTP id w9mr52042874edf.299.1635869520581;
        Tue, 02 Nov 2021 09:12:00 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id c7sm8451374ejd.91.2021.11.02.09.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 09:11:59 -0700 (PDT)
Sender: Emil Renner Berthing <emil.renner.berthing@gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
To:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org
Cc:     Emil Renner Berthing <kernel@esmil.dk>,
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
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/16] dt-bindings: pinctrl: Add StarFive pinctrl definitions
Date:   Tue,  2 Nov 2021 17:11:19 +0100
Message-Id: <20211102161125.1144023-11-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102161125.1144023-1-kernel@esmil.dk>
References: <20211102161125.1144023-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add definitons for pins and GPIO input, output and output enable
signals on the StarFive JH7100 SoC.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 .../dt-bindings/pinctrl/pinctrl-starfive.h    | 275 ++++++++++++++++++
 1 file changed, 275 insertions(+)
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-starfive.h

diff --git a/include/dt-bindings/pinctrl/pinctrl-starfive.h b/include/dt-bindings/pinctrl/pinctrl-starfive.h
new file mode 100644
index 000000000000..de4f75c2c9e8
--- /dev/null
+++ b/include/dt-bindings/pinctrl/pinctrl-starfive.h
@@ -0,0 +1,275 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
+ * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
+ */
+
+#ifndef __DT_BINDINGS_PINCTRL_STARFIVE_H__
+#define __DT_BINDINGS_PINCTRL_STARFIVE_H__
+
+#define PAD_GPIO_OFFSET		0
+#define PAD_FUNC_SHARE_OFFSET	64
+#define PAD_GPIO(x)		(PAD_GPIO_OFFSET + (x))
+#define PAD_FUNC_SHARE(x)	(PAD_FUNC_SHARE_OFFSET + (x))
+
+/*
+ * GPIOMUX bits:
+ *  | 31 - 24 | 23 - 16 | 15 - 8 |     7    |     6    |  5 - 0  |
+ *  |  dout   |  doen   |  din   | dout rev | doen rev | gpio nr |
+ *
+ * dout:     output signal
+ * doen:     output enable signal
+ * din:      optional input signal, 0xff = none
+ * dout rev: output signal reverse bit
+ * doen rev: output enable signal reverse bit
+ * gpio nr:  gpio number, 0 - 63
+ */
+#define GPIOMUX(n, dout, doen, din) ( \
+		(((dout) & 0x80000000) >> (31 - 7)) | (((dout) & 0xff) << 24) | \
+		(((doen) & 0x80000000) >> (31 - 6)) | (((doen) & 0xff) << 16) | \
+		(((din) & 0xff) << 8) | \
+		((n) & 0x3f))
+
+#define GPO_REVERSE				0x80000000
+
+#define GPO_LOW					0
+#define GPO_HIGH				1
+#define GPO_ENABLE				0
+#define GPO_DISABLE				1
+#define GPO_CLK_GMAC_PAPHYREF			2
+#define GPO_JTAG_TDO				3
+#define GPO_JTAG_TDO_OEN			4
+#define GPO_DMIC_CLK_OUT			5
+#define GPO_DSP_JTDOEN_PAD			6
+#define GPO_DSP_JTDO_PAD			7
+#define GPO_I2C0_PAD_SCK_OE			8
+#define GPO_I2C0_PAD_SCK_OEN			(GPO_I2C0_PAD_SCK_OE | GPO_REVERSE)
+#define GPO_I2C0_PAD_SDA_OE			9
+#define GPO_I2C0_PAD_SDA_OEN			(GPO_I2C0_PAD_SDA_OE | GPO_REVERSE)
+#define GPO_I2C1_PAD_SCK_OE			10
+#define GPO_I2C1_PAD_SCK_OEN			(GPO_I2C1_PAD_SCK_OE | GPO_REVERSE)
+#define GPO_I2C1_PAD_SDA_OE			11
+#define GPO_I2C1_PAD_SDA_OEN			(GPO_I2C1_PAD_SDA_OE | GPO_REVERSE)
+#define GPO_I2C2_PAD_SCK_OE			12
+#define GPO_I2C2_PAD_SCK_OEN			(GPO_I2C2_PAD_SCK_OE | GPO_REVERSE)
+#define GPO_I2C2_PAD_SDA_OE			13
+#define GPO_I2C2_PAD_SDA_OEN			(GPO_I2C2_PAD_SDA_OE | GPO_REVERSE)
+#define GPO_I2C3_PAD_SCK_OE			14
+#define GPO_I2C3_PAD_SCK_OEN			(GPO_I2C3_PAD_SCK_OE | GPO_REVERSE)
+#define GPO_I2C3_PAD_SDA_OE			15
+#define GPO_I2C3_PAD_SDA_OEN			(GPO_I2C3_PAD_SDA_OE | GPO_REVERSE)
+#define GPO_I2SRX_BCLK_OUT			16
+#define GPO_I2SRX_BCLK_OUT_OEN			17
+#define GPO_I2SRX_LRCK_OUT			18
+#define GPO_I2SRX_LRCK_OUT_OEN			19
+#define GPO_I2SRX_MCLK_OUT			20
+#define GPO_I2STX_BCLK_OUT			21
+#define GPO_I2STX_BCLK_OUT_OEN			22
+#define GPO_I2STX_LRCK_OUT			23
+#define GPO_I2STX_LRCK_OUT_OEN			24
+#define GPO_I2STX_MCLK_OUT			25
+#define GPO_I2STX_SDOUT0			26
+#define GPO_I2STX_SDOUT1			27
+#define GPO_LCD_PAD_CSM_N			28
+#define GPO_PWM_PAD_OE_N_BIT0			29
+#define GPO_PWM_PAD_OE_N_BIT1			30
+#define GPO_PWM_PAD_OE_N_BIT2			31
+#define GPO_PWM_PAD_OE_N_BIT3			32
+#define GPO_PWM_PAD_OE_N_BIT4			33
+#define GPO_PWM_PAD_OE_N_BIT5			34
+#define GPO_PWM_PAD_OE_N_BIT6			35
+#define GPO_PWM_PAD_OE_N_BIT7			36
+#define GPO_PWM_PAD_OUT_BIT0			37
+#define GPO_PWM_PAD_OUT_BIT1			38
+#define GPO_PWM_PAD_OUT_BIT2			39
+#define GPO_PWM_PAD_OUT_BIT3			40
+#define GPO_PWM_PAD_OUT_BIT4			41
+#define GPO_PWM_PAD_OUT_BIT5			42
+#define GPO_PWM_PAD_OUT_BIT6			43
+#define GPO_PWM_PAD_OUT_BIT7			44
+#define GPO_PWMDAC_LEFT_OUT			45
+#define GPO_PWMDAC_RIGHT_OUT			46
+#define GPO_QSPI_CSN1_OUT			47
+#define GPO_QSPI_CSN2_OUT			48
+#define GPO_QSPI_CSN3_OUT			49
+#define GPO_REGISTER23_SCFG_CMSENSOR_RST0	50
+#define GPO_REGISTER23_SCFG_CMSENSOR_RST1	51
+#define GPO_REGISTER32_SCFG_GMAC_PHY_RSTN	52
+#define GPO_SDIO0_PAD_CARD_POWER_EN		53
+#define GPO_SDIO0_PAD_CCLK_OUT			54
+#define GPO_SDIO0_PAD_CCMD_OE			55
+#define GPO_SDIO0_PAD_CCMD_OEN			(GPO_SDIO0_PAD_CCMD_OE | GPO_REVERSE)
+#define GPO_SDIO0_PAD_CCMD_OUT			56
+#define GPO_SDIO0_PAD_CDATA_OE_BIT0		57
+#define GPO_SDIO0_PAD_CDATA_OEN_BIT0		(GPO_SDIO0_PAD_CDATA_OE_BIT0 | GPO_REVERSE)
+#define GPO_SDIO0_PAD_CDATA_OE_BIT1		58
+#define GPO_SDIO0_PAD_CDATA_OEN_BIT1		(GPO_SDIO0_PAD_CDATA_OE_BIT1 | GPO_REVERSE)
+#define GPO_SDIO0_PAD_CDATA_OE_BIT2		59
+#define GPO_SDIO0_PAD_CDATA_OEN_BIT2		(GPO_SDIO0_PAD_CDATA_OE_BIT2 | GPO_REVERSE)
+#define GPO_SDIO0_PAD_CDATA_OE_BIT3		60
+#define GPO_SDIO0_PAD_CDATA_OEN_BIT3		(GPO_SDIO0_PAD_CDATA_OE_BIT3 | GPO_REVERSE)
+#define GPO_SDIO0_PAD_CDATA_OE_BIT4		61
+#define GPO_SDIO0_PAD_CDATA_OEN_BIT4		(GPO_SDIO0_PAD_CDATA_OE_BIT4 | GPO_REVERSE)
+#define GPO_SDIO0_PAD_CDATA_OE_BIT5		62
+#define GPO_SDIO0_PAD_CDATA_OEN_BIT5		(GPO_SDIO0_PAD_CDATA_OE_BIT5 | GPO_REVERSE)
+#define GPO_SDIO0_PAD_CDATA_OE_BIT6		63
+#define GPO_SDIO0_PAD_CDATA_OEN_BIT6		(GPO_SDIO0_PAD_CDATA_OE_BIT6 | GPO_REVERSE)
+#define GPO_SDIO0_PAD_CDATA_OE_BIT7		64
+#define GPO_SDIO0_PAD_CDATA_OEN_BIT7		(GPO_SDIO0_PAD_CDATA_OE_BIT7 | GPO_REVERSE)
+#define GPO_SDIO0_PAD_CDATA_OUT_BIT0		65
+#define GPO_SDIO0_PAD_CDATA_OUT_BIT1		66
+#define GPO_SDIO0_PAD_CDATA_OUT_BIT2		67
+#define GPO_SDIO0_PAD_CDATA_OUT_BIT3		68
+#define GPO_SDIO0_PAD_CDATA_OUT_BIT4		69
+#define GPO_SDIO0_PAD_CDATA_OUT_BIT5		70
+#define GPO_SDIO0_PAD_CDATA_OUT_BIT6		71
+#define GPO_SDIO0_PAD_CDATA_OUT_BIT7		72
+#define GPO_SDIO0_PAD_RST_N			73
+#define GPO_SDIO1_PAD_CARD_POWER_EN		74
+#define GPO_SDIO1_PAD_CCLK_OUT			75
+#define GPO_SDIO1_PAD_CCMD_OE			76
+#define GPO_SDIO1_PAD_CCMD_OEN			(GPO_SDIO1_PAD_CCMD_OE | GPO_REVERSE)
+#define GPO_SDIO1_PAD_CCMD_OUT			77
+#define GPO_SDIO1_PAD_CDATA_OE_BIT0		78
+#define GPO_SDIO1_PAD_CDATA_OEN_BIT0		(GPO_SDIO1_PAD_CDATA_OE_BIT0 | GPO_REVERSE)
+#define GPO_SDIO1_PAD_CDATA_OE_BIT1		79
+#define GPO_SDIO1_PAD_CDATA_OEN_BIT1		(GPO_SDIO1_PAD_CDATA_OE_BIT1 | GPO_REVERSE)
+#define GPO_SDIO1_PAD_CDATA_OE_BIT2		80
+#define GPO_SDIO1_PAD_CDATA_OEN_BIT2		(GPO_SDIO1_PAD_CDATA_OE_BIT2 | GPO_REVERSE)
+#define GPO_SDIO1_PAD_CDATA_OE_BIT3		81
+#define GPO_SDIO1_PAD_CDATA_OEN_BIT3		(GPO_SDIO1_PAD_CDATA_OE_BIT3 | GPO_REVERSE)
+#define GPO_SDIO1_PAD_CDATA_OE_BIT4		82
+#define GPO_SDIO1_PAD_CDATA_OEN_BIT4		(GPO_SDIO1_PAD_CDATA_OE_BIT4 | GPO_REVERSE)
+#define GPO_SDIO1_PAD_CDATA_OE_BIT5		83
+#define GPO_SDIO1_PAD_CDATA_OEN_BIT5		(GPO_SDIO1_PAD_CDATA_OE_BIT5 | GPO_REVERSE)
+#define GPO_SDIO1_PAD_CDATA_OE_BIT6		84
+#define GPO_SDIO1_PAD_CDATA_OEN_BIT6		(GPO_SDIO1_PAD_CDATA_OE_BIT6 | GPO_REVERSE)
+#define GPO_SDIO1_PAD_CDATA_OE_BIT7		85
+#define GPO_SDIO1_PAD_CDATA_OEN_BIT7		(GPO_SDIO1_PAD_CDATA_OE_BIT7 | GPO_REVERSE)
+#define GPO_SDIO1_PAD_CDATA_OUT_BIT0		86
+#define GPO_SDIO1_PAD_CDATA_OUT_BIT1		87
+#define GPO_SDIO1_PAD_CDATA_OUT_BIT2		88
+#define GPO_SDIO1_PAD_CDATA_OUT_BIT3		89
+#define GPO_SDIO1_PAD_CDATA_OUT_BIT4		90
+#define GPO_SDIO1_PAD_CDATA_OUT_BIT5		91
+#define GPO_SDIO1_PAD_CDATA_OUT_BIT6		92
+#define GPO_SDIO1_PAD_CDATA_OUT_BIT7		93
+#define GPO_SDIO1_PAD_RST_N			94
+#define GPO_SPDIF_TX_SDOUT			95
+#define GPO_SPDIF_TX_SDOUT_OEN			96
+#define GPO_SPI0_PAD_OE_N			97
+#define GPO_SPI0_PAD_SCK_OUT			98
+#define GPO_SPI0_PAD_SS_0_N			99
+#define GPO_SPI0_PAD_SS_1_N			100
+#define GPO_SPI0_PAD_TXD			101
+#define GPO_SPI1_PAD_OE_N			102
+#define GPO_SPI1_PAD_SCK_OUT			103
+#define GPO_SPI1_PAD_SS_0_N			104
+#define GPO_SPI1_PAD_SS_1_N			105
+#define GPO_SPI1_PAD_TXD			106
+#define GPO_SPI2_PAD_OE_N			107
+#define GPO_SPI2_PAD_SCK_OUT			108
+#define GPO_SPI2_PAD_SS_0_N			109
+#define GPO_SPI2_PAD_SS_1_N			110
+#define GPO_SPI2_PAD_TXD			111
+#define GPO_SPI2AHB_PAD_OE_N_BIT0		112
+#define GPO_SPI2AHB_PAD_OE_N_BIT1		113
+#define GPO_SPI2AHB_PAD_OE_N_BIT2		114
+#define GPO_SPI2AHB_PAD_OE_N_BIT3		115
+#define GPO_SPI2AHB_PAD_TXD_BIT0		116
+#define GPO_SPI2AHB_PAD_TXD_BIT1		117
+#define GPO_SPI2AHB_PAD_TXD_BIT2		118
+#define GPO_SPI2AHB_PAD_TXD_BIT3		119
+#define GPO_SPI3_PAD_OE_N			120
+#define GPO_SPI3_PAD_SCK_OUT			121
+#define GPO_SPI3_PAD_SS_0_N			122
+#define GPO_SPI3_PAD_SS_1_N			123
+#define GPO_SPI3_PAD_TXD			124
+#define GPO_UART0_PAD_DTRN			125
+#define GPO_UART0_PAD_RTSN			126
+#define GPO_UART0_PAD_SOUT			127
+#define GPO_UART1_PAD_SOUT			128
+#define GPO_UART2_PAD_DTR_N			129
+#define GPO_UART2_PAD_RTS_N			130
+#define GPO_UART2_PAD_SOUT			131
+#define GPO_UART3_PAD_SOUT			132
+#define GPO_USB_DRV_BUS				133
+
+#define GPI_CPU_JTAG_TCK			0
+#define GPI_CPU_JTAG_TDI			1
+#define GPI_CPU_JTAG_TMS			2
+#define GPI_CPU_JTAG_TRST			3
+#define GPI_DMIC_SDIN_BIT0			4
+#define GPI_DMIC_SDIN_BIT1			5
+#define GPI_DSP_JTCK_PAD			6
+#define GPI_DSP_JTDI_PAD			7
+#define GPI_DSP_JTMS_PAD			8
+#define GPI_DSP_TRST_PAD			9
+#define GPI_I2C0_PAD_SCK_IN			10
+#define GPI_I2C0_PAD_SDA_IN			11
+#define GPI_I2C1_PAD_SCK_IN			12
+#define GPI_I2C1_PAD_SDA_IN			13
+#define GPI_I2C2_PAD_SCK_IN			14
+#define GPI_I2C2_PAD_SDA_IN			15
+#define GPI_I2C3_PAD_SCK_IN			16
+#define GPI_I2C3_PAD_SDA_IN			17
+#define GPI_I2SRX_BCLK_IN			18
+#define GPI_I2SRX_LRCK_IN			19
+#define GPI_I2SRX_SDIN_BIT0			20
+#define GPI_I2SRX_SDIN_BIT1			21
+#define GPI_I2SRX_SDIN_BIT2			22
+#define GPI_I2STX_BCLK_IN			23
+#define GPI_I2STX_LRCK_IN			24
+#define GPI_SDIO0_PAD_CARD_DETECT_N		25
+#define GPI_SDIO0_PAD_CARD_WRITE_PRT		26
+#define GPI_SDIO0_PAD_CCMD_IN			27
+#define GPI_SDIO0_PAD_CDATA_IN_BIT0		28
+#define GPI_SDIO0_PAD_CDATA_IN_BIT1		29
+#define GPI_SDIO0_PAD_CDATA_IN_BIT2		30
+#define GPI_SDIO0_PAD_CDATA_IN_BIT3		31
+#define GPI_SDIO0_PAD_CDATA_IN_BIT4		32
+#define GPI_SDIO0_PAD_CDATA_IN_BIT5		33
+#define GPI_SDIO0_PAD_CDATA_IN_BIT6		34
+#define GPI_SDIO0_PAD_CDATA_IN_BIT7		35
+#define GPI_SDIO1_PAD_CARD_DETECT_N		36
+#define GPI_SDIO1_PAD_CARD_WRITE_PRT		37
+#define GPI_SDIO1_PAD_CCMD_IN			38
+#define GPI_SDIO1_PAD_CDATA_IN_BIT0		39
+#define GPI_SDIO1_PAD_CDATA_IN_BIT1		40
+#define GPI_SDIO1_PAD_CDATA_IN_BIT2		41
+#define GPI_SDIO1_PAD_CDATA_IN_BIT3		42
+#define GPI_SDIO1_PAD_CDATA_IN_BIT4		43
+#define GPI_SDIO1_PAD_CDATA_IN_BIT5		44
+#define GPI_SDIO1_PAD_CDATA_IN_BIT6		45
+#define GPI_SDIO1_PAD_CDATA_IN_BIT7		46
+#define GPI_SPDIF_RX_SDIN			47
+#define GPI_SPI0_PAD_RXD			48
+#define GPI_SPI0_PAD_SS_IN_N			49
+#define GPI_SPI1_PAD_RXD			50
+#define GPI_SPI1_PAD_SS_IN_N			51
+#define GPI_SPI2_PAD_RXD			52
+#define GPI_SPI2_PAD_SS_IN_N			53
+#define GPI_SPI2AHB_PAD_RXD_BIT0		54
+#define GPI_SPI2AHB_PAD_RXD_BIT1		55
+#define GPI_SPI2AHB_PAD_RXD_BIT2		56
+#define GPI_SPI2AHB_PAD_RXD_BIT3		57
+#define GPI_SPI2AHB_PAD_SS_N			58
+#define GPI_SPI2AHB_SLV_SCLKIN			59
+#define GPI_SPI3_PAD_RXD			60
+#define GPI_SPI3_PAD_SS_IN_N			61
+#define GPI_UART0_PAD_CTSN			62
+#define GPI_UART0_PAD_DCDN			63
+#define GPI_UART0_PAD_DSRN			64
+#define GPI_UART0_PAD_RIN			65
+#define GPI_UART0_PAD_SIN			66
+#define GPI_UART1_PAD_SIN			67
+#define GPI_UART2_PAD_CTS_N			68
+#define GPI_UART2_PAD_DCD_N			69
+#define GPI_UART2_PAD_DSR_N			70
+#define GPI_UART2_PAD_RI_N			71
+#define GPI_UART2_PAD_SIN			72
+#define GPI_UART3_PAD_SIN			73
+#define GPI_USB_OVER_CURRENT			74
+
+#define GPI_NONE				0xff
+
+#endif /* __DT_BINDINGS_PINCTRL_STARFIVE_H__ */
-- 
2.33.1

