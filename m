Return-Path: <linux-gpio+bounces-12278-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5B39B4121
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2024 04:41:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 533F71F22CC8
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2024 03:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A5031FCF50;
	Tue, 29 Oct 2024 03:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYzTvQC6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05711E0DA7;
	Tue, 29 Oct 2024 03:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730173264; cv=none; b=mfj2kDGVJaAfeh53/FRxGQ5DmVru7MMIENcM4ElGwG5ubRFmDhHp2KUcT43HDd4O7AeVlCgzNU6HDo0SXksDlRcZu0XK2xy0KaCdnh99cDx7EGCq4oZfQZ+mUqZLTwIclraUIBffdJk6otB8LJF0AazL73BKtTV+A74T0GNfQb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730173264; c=relaxed/simple;
	bh=GteqVZL3dPwnqNAXUavHeWUt26A1IzFbqSit4vyxlq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TnMrZo5Tx6PCoEz5NUQDM5oVdP3Ap/WhZ7I4dlOFaRg8lj7qbpUqeZTrf+ovLG1IA0iwfUYWoP/YEzx49ZODuIj9qAxAtmIs1aQ3DetAMDBXbSLRKgiBhnqLlU/POb7WpTGmQlzNpxnQ/n1IiclU4HVlH8Dw10T4Mlr+kGD+Xh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYzTvQC6; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20c8c50fdd9so38486155ad.0;
        Mon, 28 Oct 2024 20:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730173261; x=1730778061; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ekVevv1jyAJ3xBsgkLYdCxq419R6VVRG35CwPktsuZg=;
        b=SYzTvQC6fJPhBvVyjpEv0QS+7w4BkKOhLxkHY7Y/k2ikWNYSjygBfo6FBvp0bTBIfb
         IgB8QFdS6OCH+sgPE7qW7a8MfvidZgXUTV7fMmj38TcgUzz2FP9VDl6IdcgR2xn+Hy2c
         kLltb1v9DS4HwE60GpqyPnQoJ0pU7xGQnNJjs6sAGhHMF8DtLVWZTnCHkvdvZAR4m8ge
         PMcPZaMj9Xk1llqos8cZc15gzHvWce2pD4+ByCZ8QjbFoIi4MCOjEgTU4eMbkkxK0JMR
         TZtB0kZjqjIokUUraSNA+Go7knrrOKYpQffJWbCrxYMSY/IZZK5khq3jNDvZAIZ4lxLk
         A4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730173261; x=1730778061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekVevv1jyAJ3xBsgkLYdCxq419R6VVRG35CwPktsuZg=;
        b=GsbNUIgMMRUVo3ZWva5IWOo4JXZWt7JpeNJkrzc5H364npTGncKuFlXdxY2KcFL8wu
         CIQoBGcZPC9PmaBhBwiqihGsbEMUNu+hNIWs+q2Q4k0p/137n8+Mw18T9kio5NrlTCbl
         nI0s6a+Di5eYeWyIaMPGcBvlNGFLHTJIQnaQnY/ByBeWvAw4tIf6mQvb17Bp9SEK/kTj
         lubfo31TMV8MgcmdQsKl/VZv1vB0HIpAFlnFsac7P1y6I2wpm+TkRh8DdO2Nuie7rGmN
         AZLX4hUraNlo6Z3wl5eCIeODzQUu5xzjuFjMZYbfrr0oAQ+iqM76nvKtTq5sx2IBEND5
         dLuQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9aZBJbCZ6BXCEscrE1mRGtbTbLAwOMi0Oevt+lIdoAUClp/COauyk1w3mkUzGdXuOEfe2NCUvyLfNyDm8@vger.kernel.org, AJvYcCUhzo2pEmOK7LjpY6NGK7e+OqtCR4vri1BpqLUi+HQ5tqBVgtdEczBBtk4546+swmqTQxbYpMNS3tn6rQ==@vger.kernel.org, AJvYcCWfTbuPX+FtJpAFQdFJTGjyKossMacbETy1s5VfspFOMbnlLsUSGIvr3Qrypp1G5GtkrUQR3ncE8QFK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy603fHCK0p7nDSOHePHDeT4mEqazRotg1Awi5AVtrJOHGScVnK
	OTKVk3hX2e5O+/q4q75AN2vATPMs4RS8zBrMiAuzO8b61NWBQMrP
X-Google-Smtp-Source: AGHT+IGg4uZmqt1m6Va6p3rbQ+Tyl0RvwHVTp7tz0Q8ZTyse2Y3ElJe5nqTaCg155QKgEWvRtOgbQw==
X-Received: by 2002:a17:903:2289:b0:20c:f39e:4c04 with SMTP id d9443c01a7336-210eccfcd24mr13441505ad.2.1730173260995;
        Mon, 28 Oct 2024 20:41:00 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf46fc5sm57866805ad.45.2024.10.28.20.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 20:41:00 -0700 (PDT)
Date: Tue, 29 Oct 2024 11:40:35 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: Add pinctrl for Sophgo SG2042
 series SoC
Message-ID: <5x3iitxyebtllze3omjkelez7a7vqat6akbchcosjdmse7bpbv@jyirswzfzinr>
References: <20241024064356.865055-1-inochiama@gmail.com>
 <20241024064356.865055-2-inochiama@gmail.com>
 <MA0P287MB2822C6EF567040AAEB9F82A5FE4B2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MA0P287MB2822C6EF567040AAEB9F82A5FE4B2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>

On Tue, Oct 29, 2024 at 09:59:33AM +0800, Chen Wang wrote:
> Hello ~
> 
> On 2024/10/24 14:43, Inochi Amaoto wrote:
> > SG2042 introduces a simple pinctrl device for all configurable pins.
> > The pinconf and pinmux are mixed in a 16 bits register for each pin.
> Can we change this sentence to "For the SG2042 pinctl register file, each
> register (32 bits) is responsible for two pins, each occupying the upper 16
> bits and lower 16 bits of the register."

Yeah, it look like more clear. I will take it, thanks.

> > It supports setting pull up/down, drive strength and input schmitt
> > trigger.
> > 
> > Add support for SG2042 pinctrl device.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >   .../pinctrl/sophgo,sg2042-pinctrl.yaml        |  96 +++++++++
> >   include/dt-bindings/pinctrl/pinctrl-sg2042.h  | 196 ++++++++++++++++++
> >   2 files changed, 292 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/pinctrl/sophgo,sg2042-pinctrl.yaml
> >   create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2042.h
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/sophgo,sg2042-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/sophgo,sg2042-pinctrl.yaml
> > new file mode 100644
> > index 000000000000..5060deacd580
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/sophgo,sg2042-pinctrl.yaml
> > @@ -0,0 +1,96 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/sophgo,sg2042-pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sophgo SG2042 Pin Controller
> > +
> > +maintainers:
> > +  - Inochi Amaoto <inochiama@outlook.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - sophgo,sg2042-pinctrl
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +patternProperties:
> > +  '-cfg$':
> > +    type: object
> > +    description:
> > +      A pinctrl node should contain at least one subnode representing the
> > +      pinctrl groups available on the machine.
> > +
> > +    additionalProperties: false
> > +
> > +    patternProperties:
> > +      '-pins$':
> > +        type: object
> > +        description: |
> > +          Each subnode will list the pins it needs, and how they should
> > +          be configured, with regard to muxer configuration, bias input
> > +          enable/disable, input schmitt trigger enable, drive strength
> > +          output enable/disable state. For configuration detail,
> > +          refer to https://github.com/sophgo/sophgo-doc/.
> More accurate: https://github.com/sophgo/sophgo-doc/tree/main/SG2042/TRM
> > +
> > +        allOf:
> > +          - $ref: pincfg-node.yaml#
> > +          - $ref: pinmux-node.yaml#
> > +
> > +        properties:
> > +          pinmux:
> > +            description: |
> > +              The list of GPIOs and their mux settings that properties in the
> > +              node apply to. This should be set using the GPIOMUX
> Not GPIOMUX, should be PINMUX.

I will fix it.

> > +              macro.
> > +
> > +          bias-disable: true
> > +
> > +          bias-pull-up:
> > +            type: boolean
> > +
> > +          bias-pull-down:
> > +            type: boolean
> > +
> > +          drive-strength-microamp:
> > +            description: typical current when output high level.
> > +            enum: [ 4300, 6400, 8500, 10600, 12800, 14900, 17000, 19100,
> > +                    21200, 23300, 25500, 27600, 29700, 31800, 33900, 36000]
> Where can I find these enum values in TRM? I just see the field "Driving
> Selector" occupies 4 bits for each pin.

This is based on the electrical characteristics of the SG2042. However, this
document is not opened, you may ask sophgo to open it.

> > +          input-schmitt-enable: true
> > +
> > +          input-schmitt-disable: true
> > +
> > +        required:
> > +          - pinmux
> > +
> > +        additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/pinctrl/pinctrl-sg2042.h>
> > +
> > +    pinctrl@30011000 {
> > +        compatible = "sophgo,sg2042-pinctrl";
> > +        reg = <30011000 0x1000>;
> > +
> > +        uart0_cfg: uart0-cfg {
> > +            uart0-pins {
> > +                pinmux = <PINMUX(PIN_UART0_TX, 0)>,
> > +                         <PINMUX(PIN_UART0_RX, 0)>;
> > +                bias-pull-up;
> > +                drive-strength-microamp = <10600>;
> > +            };
> > +        };
> > +    };
> > +
> > +...
> > diff --git a/include/dt-bindings/pinctrl/pinctrl-sg2042.h b/include/dt-bindings/pinctrl/pinctrl-sg2042.h
> > new file mode 100644
> > index 000000000000..79d5bb8e04f8
> > --- /dev/null
> > +++ b/include/dt-bindings/pinctrl/pinctrl-sg2042.h
> > @@ -0,0 +1,196 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > +/*
> > + * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
> > + *
> > + */
> > +
> > +#ifndef _DT_BINDINGS_PINCTRL_SG2042_H
> > +#define _DT_BINDINGS_PINCTRL_SG2042_H
> > +
> > +#define PINMUX(pin, mux) \
> > +	(((pin) & 0xffff) | (((mux) & 0xff) << 16))
> > +
> > +#define PIN_LPC_LCLK			0
> > +#define PIN_LPC_LFRAME			1
> > +#define PIN_LPC_LAD0			2
> > +#define PIN_LPC_LAD1			3
> > +#define PIN_LPC_LAD2			4
> > +#define PIN_LPC_LAD3			5
> > +#define PIN_LPC_LDRQ0			6
> > +#define PIN_LPC_LDRQ1			7
> > +#define PIN_LPC_SERIRQ			8
> > +#define PIN_LPC_CLKRUN			9
> > +#define PIN_LPC_LPME			10
> > +#define PIN_LPC_LPCPD			11
> > +#define PIN_LPC_LSMI			12
> > +#define PIN_PCIE0_L0_RESET		13
> > +#define PIN_PCIE0_L1_RESET		14
> > +#define PIN_PCIE0_L0_WAKEUP		15
> > +#define PIN_PCIE0_L1_WAKEUP		16
> > +#define PIN_PCIE0_L0_CLKREQ_IN		17
> > +#define PIN_PCIE0_L1_CLKREQ_IN		18
> > +#define PIN_PCIE1_L0_RESET		19
> > +#define PIN_PCIE1_L1_RESET		20
> > +#define PIN_PCIE1_L0_WAKEUP		21
> > +#define PIN_PCIE1_L1_WAKEUP		22
> > +#define PIN_PCIE1_L0_CLKREQ_IN		23
> > +#define PIN_PCIE1_L1_CLKREQ_IN		24
> > +#define PIN_SPIF0_CLK_SEL1		25
> > +#define PIN_SPIF0_CLK_SEL0		26
> > +#define PIN_SPIF0_WP			27
> > +#define PIN_SPIF0_HOLD			28
> > +#define PIN_SPIF0_SDI			29
> > +#define PIN_SPIF0_CS			30
> > +#define PIN_SPIF0_SCK			31
> > +#define PIN_SPIF0_SDO			32
> > +#define PIN_SPIF1_CLK_SEL1		33
> > +#define PIN_SPIF1_CLK_SEL0		34
> > +#define PIN_SPIF1_WP			35
> > +#define PIN_SPIF1_HOLD			36
> > +#define PIN_SPIF1_SDI			37
> > +#define PIN_SPIF1_CS			38
> > +#define PIN_SPIF1_SCK			39
> > +#define PIN_SPIF1_SDO			40
> > +#define PIN_EMMC_WP			41
> > +#define PIN_EMMC_CD			42
> > +#define PIN_EMMC_RST			43
> > +#define PIN_EMMC_PWR_EN			44
> > +#define PIN_SDIO_CD			45
> > +#define PIN_SDIO_WP			46
> > +#define PIN_SDIO_RST			47
> > +#define PIN_SDIO_PWR_EN			48
> > +#define PIN_RGMII0_TXD0			49
> > +#define PIN_RGMII0_TXD1			50
> > +#define PIN_RGMII0_TXD2			51
> > +#define PIN_RGMII0_TXD3			52
> > +#define PIN_RGMII0_TXCTRL		53
> > +#define PIN_RGMII0_RXD0			54
> > +#define PIN_RGMII0_RXD1			55
> > +#define PIN_RGMII0_RXD2			56
> > +#define PIN_RGMII0_RXD3			57
> > +#define PIN_RGMII0_RXCTRL		58
> > +#define PIN_RGMII0_TXC			59
> > +#define PIN_RGMII0_RXC			60
> > +#define PIN_RGMII0_REFCLKO		61
> > +#define PIN_RGMII0_IRQ			62
> > +#define PIN_RGMII0_MDC			63
> > +#define PIN_RGMII0_MDIO			64
> > +#define PIN_PWM0			65
> > +#define PIN_PWM1			66
> > +#define PIN_PWM2			67
> > +#define PIN_PWM3			68
> > +#define PIN_FAN0			69
> > +#define PIN_FAN1			70
> > +#define PIN_FAN2			71
> > +#define PIN_FAN3			72
> > +#define PIN_IIC0_SDA			73
> > +#define PIN_IIC0_SCL			74
> > +#define PIN_IIC1_SDA			75
> > +#define PIN_IIC1_SCL			76
> > +#define PIN_IIC2_SDA			77
> > +#define PIN_IIC2_SCL			78
> > +#define PIN_IIC3_SDA			79
> > +#define PIN_IIC3_SCL			80
> > +#define PIN_UART0_TX			81
> > +#define PIN_UART0_RX			82
> > +#define PIN_UART0_RTS			83
> > +#define PIN_UART0_CTS			84
> > +#define PIN_UART1_TX			85
> > +#define PIN_UART1_RX			86
> > +#define PIN_UART1_RTS			87
> > +#define PIN_UART1_CTS			88
> > +#define PIN_UART2_TX			89
> > +#define PIN_UART2_RX			90
> > +#define PIN_UART2_RTS			91
> > +#define PIN_UART2_CTS			92
> > +#define PIN_UART3_TX			93
> > +#define PIN_UART3_RX			94
> > +#define PIN_UART3_RTS			95
> > +#define PIN_UART3_CTS			96
> > +#define PIN_SPI0_CS0			97
> > +#define PIN_SPI0_CS1			98
> > +#define PIN_SPI0_SDI			99
> > +#define PIN_SPI0_SDO			100
> > +#define PIN_SPI0_SCK			101
> > +#define PIN_SPI1_CS0			102
> > +#define PIN_SPI1_CS1			103
> > +#define PIN_SPI1_SDI			104
> > +#define PIN_SPI1_SDO			105
> > +#define PIN_SPI1_SCK			106
> > +#define PIN_JTAG0_TDO			107
> > +#define PIN_JTAG0_TCK			108
> > +#define PIN_JTAG0_TDI			109
> > +#define PIN_JTAG0_TMS			110
> > +#define PIN_JTAG0_TRST			111
> > +#define PIN_JTAG0_SRST			112
> > +#define PIN_JTAG1_TDO			113
> > +#define PIN_JTAG1_TCK			114
> > +#define PIN_JTAG1_TDI			115
> > +#define PIN_JTAG1_TMS			116
> > +#define PIN_JTAG1_TRST			117
> > +#define PIN_JTAG1_SRST			118
> > +#define PIN_JTAG2_TDO			119
> > +#define PIN_JTAG2_TCK			120
> > +#define PIN_JTAG2_TDI			121
> > +#define PIN_JTAG2_TMS			122
> > +#define PIN_JTAG2_TRST			123
> > +#define PIN_JTAG2_SRST			124
> > +#define PIN_GPIO0			125
> > +#define PIN_GPIO1			126
> > +#define PIN_GPIO2			127
> > +#define PIN_GPIO3			128
> > +#define PIN_GPIO4			129
> > +#define PIN_GPIO5			130
> > +#define PIN_GPIO6			131
> > +#define PIN_GPIO7			132
> > +#define PIN_GPIO8			133
> > +#define PIN_GPIO9			134
> > +#define PIN_GPIO10			135
> > +#define PIN_GPIO11			136
> > +#define PIN_GPIO12			137
> > +#define PIN_GPIO13			138
> > +#define PIN_GPIO14			139
> > +#define PIN_GPIO15			140
> > +#define PIN_GPIO16			141
> > +#define PIN_GPIO17			142
> > +#define PIN_GPIO18			143
> > +#define PIN_GPIO19			144
> > +#define PIN_GPIO20			145
> > +#define PIN_GPIO21			146
> > +#define PIN_GPIO22			147
> > +#define PIN_GPIO23			148
> > +#define PIN_GPIO24			149
> > +#define PIN_GPIO25			150
> > +#define PIN_GPIO26			151
> > +#define PIN_GPIO27			152
> > +#define PIN_GPIO28			153
> > +#define PIN_GPIO29			154
> > +#define PIN_GPIO30			155
> > +#define PIN_GPIO31			156
> > +#define PIN_MODE_SEL0			157
> > +#define PIN_MODE_SEL1			158
> > +#define PIN_MODE_SEL2			159
> > +#define PIN_BOOT_SEL0			160
> > +#define PIN_BOOT_SEL1			161
> > +#define PIN_BOOT_SEL2			162
> > +#define PIN_BOOT_SEL3			163
> > +#define PIN_BOOT_SEL4			164
> > +#define PIN_BOOT_SEL5			165
> > +#define PIN_BOOT_SEL6			166
> > +#define PIN_BOOT_SEL7			167
> > +#define PIN_MULTI_SCKT			168
> > +#define PIN_SCKT_ID0			169
> > +#define PIN_SCKT_ID1			170
> > +#define PIN_PLL_CLK_IN_MAIN		171
> > +#define PIN_PLL_CLK_IN_DDR_L		172
> > +#define PIN_PLL_CLK_IN_DDR_R		173
> > +#define PIN_XTAL_32K			174
> > +#define PIN_SYS_RST			175
> > +#define PIN_PWR_BUTTON			176
> > +#define PIN_TEST_EN			177
> > +#define PIN_TEST_MODE_MBIST		178
> > +#define PIN_TEST_MODE_SCAN		179
> > +#define PIN_TEST_MODE_BSD		180
> > +#define PIN_BISR_BYP			181
> > +
> > +#endif /* _DT_BINDINGS_PINCTRL_SG2042_H */

