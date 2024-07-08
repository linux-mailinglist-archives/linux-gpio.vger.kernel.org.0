Return-Path: <linux-gpio+bounces-8107-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 467D492A74F
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 18:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2BA61F2151F
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 16:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34C5146013;
	Mon,  8 Jul 2024 16:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aHZjQrfh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6807313FD69;
	Mon,  8 Jul 2024 16:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720456190; cv=none; b=lv9acfzPZsZOLmaWsDgNmYi2yaUEvzFPRvM85GmOHbK3bJnLGn9qErUMMGghq0dUwYZwLf2d+TA91OKVB5mn5QTrcwn6uRimncgjvdc5Q1kyOJZslMeVnDj6Q6lBg6qQUTFA0lczFp4hU4F8QlT3rz90LZJNVHpep6klUhenOPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720456190; c=relaxed/simple;
	bh=9Etrqgg9wXGz/o0li3pV1Lg2NQieqVmzJNLKHwZQWdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JmdxVkTmGM4sKtum/9xMZEfyWK9LBJf2wSLtVbpWu9LTWEhLVnnnVOvpgB37iGjBEz0pjGCu6Swh37XMiUHeh0uZHBzRVfjtkG6LMxJdC61/YUAaKi5rFoaLZLGuEVAVFADqWDEl4NmHZL8bAW/+MkoOolMOY0Rsk7BMlp1eXaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aHZjQrfh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 874B3C4AF0D;
	Mon,  8 Jul 2024 16:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720456189;
	bh=9Etrqgg9wXGz/o0li3pV1Lg2NQieqVmzJNLKHwZQWdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aHZjQrfhyspqVZ7Vxt2dX5T1cn7PmwreyiI59sH9a3VykWSr16LzngF+4+5PP/Vre
	 zaoQLdyIoF8+L8M2odnilz8PoAUt56yAEmojze44AFB5p0ImO1E1AmAbhAUJp3x4HD
	 PHsOjOifjcnpUdpTn0rs+QBAoQ9b6cdroA9mAHpXPTHBPIoX0PROblzNO6c3qDzVlN
	 aVEa9NhzpTjTlrRcJxIc42g7yMT2YXNGnPqM1bGgTh4hk0sgoxylGgVQ9rx4FFlWdo
	 Oy1rz4x3Rkjnc5NJKCH5SUWMpOvCQkDBjNyzFTsC3aSvy4fi8LtV+euNmuEi35GqCa
	 +1x+7mRC8/XjQ==
Date: Mon, 8 Jul 2024 10:29:48 -0600
From: Rob Herring <robh@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Drew Fustini <dfustini@baylibre.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/7] dt-bindings: pinctrl: Add pinctrl for Sophgo CV1800
 series SoC.
Message-ID: <20240708162948.GA3356671-robh@kernel.org>
References: <IA1PR20MB49530F0476B98DBB835B344FBBDE2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB49530D9BC6C8011B730433C2BBDE2@IA1PR20MB4953.namprd20.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA1PR20MB49530D9BC6C8011B730433C2BBDE2@IA1PR20MB4953.namprd20.prod.outlook.com>

On Thu, Jul 04, 2024 at 01:46:37PM +0800, Inochi Amaoto wrote:
> Add pinctrl support for Sophgo CV1800 series SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>  .../pinctrl/sophgo,cv1800-pinctrl.yaml        | 120 +++++++++++++++++
>  include/dt-bindings/pinctrl/pinctrl-cv1800b.h |  63 +++++++++
>  include/dt-bindings/pinctrl/pinctrl-cv1812h.h | 127 ++++++++++++++++++
>  include/dt-bindings/pinctrl/pinctrl-cv18xx.h  |  19 +++
>  include/dt-bindings/pinctrl/pinctrl-sg2000.h  | 127 ++++++++++++++++++
>  include/dt-bindings/pinctrl/pinctrl-sg2002.h  |  79 +++++++++++
>  6 files changed, 535 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv1800b.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv1812h.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv18xx.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2000.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2002.h
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
> new file mode 100644
> index 000000000000..b7e4084b78d6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/sophgo,cv1800-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo CV1800 Pin Controller
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@outlook.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - sophgo,cv1800b-pinctrl
> +      - sophgo,cv1812h-pinctrl
> +      - sophgo,sg2000-pinctrl
> +      - sophgo,sg2002-pinctrl
> +
> +  reg:
> +    items:
> +      - description: pinctrl for system domain
> +      - description: pinctrl for rtc domain

Based on the example's addresses, this isn't 1 block, but 2 blocks. Is 
this really 1 block, 2 instances of the same block, or 2 different 
blocks?

> +
> +  reg-names:
> +    items:
> +      - const: sys
> +      - const: rtc
> +
> +  resets:
> +    maxItems: 1
> +
> +patternProperties:
> +  '-cfg$':
> +    type: object
> +    patternProperties:
> +      '-pins$':
> +        type: object
> +        description: |
> +          A pinctrl node should contain at least one subnode representing the

It's the '-cfg' node that 'should contain at least one subnode', not 
this node.

> +          pinctrl groups available on the machine. Each subnode will list the
> +          pins it needs, and how they should be configured, with regard to
> +          muxer configuration, bias, input enable/disable, input schmitt
> +          trigger enable/disable, slew-rate and drive strength.
> +        $ref: /schemas/pinctrl/pincfg-node.yaml
> +
> +        properties:
> +          pinmux:
> +            description: |
> +              The list of GPIOs and their mux settings that properties in the
> +              node apply to. This should be set using the GPIOMUX or GPIOMUX2
> +              macro.
> +            $ref: /schemas/pinctrl/pinmux-node.yaml#/properties/pinmux
> +
> +          bias-pull-up:
> +            type: boolean
> +
> +          bias-pull-down:
> +            type: boolean
> +
> +          drive-strength:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            minimum: 0
> +            maximum: 7
> +
> +          input-schmitt:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            minimum: 0
> +            maximum: 7
> +
> +          slew-rate:
> +            enum: [ 0, 1 ]
> +
> +          sophgo,bus-holder:
> +            description: enable bus holder
> +            type: boolean
> +
> +        additionalProperties: false
> +
> +    additionalProperties: false

In the indented cases, put these before properties or patternProperties.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
> +
> +    soc {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        pinctrl@3001000 {
> +            compatible = "sophgo,cv1800b-pinctrl";
> +            reg = <0x03001000 0x1000>,
> +                  <0x05027000 0x1000>;
> +            reg-names = "sys", "rtc";
> +
> +            uart0_cfg: uart0-cfg {
> +                uart0-pins {
> +                    pinmux = <PINMUX(PIN_UART0_TX, 0)>,
> +                             <PINMUX(PIN_UART0_RX, 0)>;
> +                    bias-pull-up;
> +                    drive-strength = <2>;
> +                    slew-rate = <0>;
> +                };
> +            };
> +        };
> +
> +        uart0 {
> +            pinctrl-0 = <&uart0_cfg>;
> +            pinctrl-names = "default";

Not a complete node. Plus the examples for a provider don't show the 
consumer side and vice-versa. So drop the node.

> +        };
> +    };
> +
> +...
> diff --git a/include/dt-bindings/pinctrl/pinctrl-cv1800b.h b/include/dt-bindings/pinctrl/pinctrl-cv1800b.h
> new file mode 100644
> index 000000000000..0593fc33d470
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/pinctrl-cv1800b.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
> + *
> + * This file is generated from vendor pinout definition.
> + */
> +
> +#ifndef _DT_BINDINGS_PINCTRL_CV1800B_H
> +#define _DT_BINDINGS_PINCTRL_CV1800B_H
> +
> +#include <dt-bindings/pinctrl/pinctrl-cv18xx.h>
> +
> +#define PIN_AUD_AOUTR			1
> +#define PIN_SD0_CLK			3
> +#define PIN_SD0_CMD			4
> +#define PIN_SD0_D0			5
> +#define PIN_SD0_D1			7
> +#define PIN_SD0_D2			8
> +#define PIN_SD0_D3			9
> +#define PIN_SD0_CD			11
> +#define PIN_SD0_PWR_EN			12
> +#define PIN_SPK_EN			14
> +#define PIN_UART0_TX			15
> +#define PIN_UART0_RX			16
> +#define PIN_SPINOR_HOLD_X		17
> +#define PIN_SPINOR_SCK			18
> +#define PIN_SPINOR_MOSI			19
> +#define PIN_SPINOR_WP_X			20
> +#define PIN_SPINOR_MISO			21
> +#define PIN_SPINOR_CS_X			22
> +#define PIN_IIC0_SCL			23
> +#define PIN_IIC0_SDA			24
> +#define PIN_AUX0			25
> +#define PIN_PWR_VBAT_DET		30
> +#define PIN_PWR_SEQ2			31
> +#define PIN_XTAL_XIN			33
> +#define PIN_SD1_GPIO0			35
> +#define PIN_SD1_GPIO1			36
> +#define PIN_SD1_D3			38
> +#define PIN_SD1_D2			39
> +#define PIN_SD1_D1			40
> +#define PIN_SD1_D0			41
> +#define PIN_SD1_CMD			42
> +#define PIN_SD1_CLK			43
> +#define PIN_ADC1			44
> +#define PIN_USB_VBUS_DET		45
> +#define PIN_ETH_TXP			47
> +#define PIN_ETH_TXM			48
> +#define PIN_ETH_RXP			49
> +#define PIN_ETH_RXM			50
> +#define PIN_MIPIRX4N			56
> +#define PIN_MIPIRX4P			57
> +#define PIN_MIPIRX3N			58
> +#define PIN_MIPIRX3P			59
> +#define PIN_MIPIRX2N			60
> +#define PIN_MIPIRX2P			61
> +#define PIN_MIPIRX1N			62
> +#define PIN_MIPIRX1P			63
> +#define PIN_MIPIRX0N			64
> +#define PIN_MIPIRX0P			65
> +#define PIN_AUD_AINL_MIC		67
> +
> +#endif /* _DT_BINDINGS_PINCTRL_CV1800B_H */
> diff --git a/include/dt-bindings/pinctrl/pinctrl-cv1812h.h b/include/dt-bindings/pinctrl/pinctrl-cv1812h.h
> new file mode 100644
> index 000000000000..2908de347919
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/pinctrl-cv1812h.h
> @@ -0,0 +1,127 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
> + *
> + * This file is generated from vendor pinout definition.
> + */
> +
> +#ifndef _DT_BINDINGS_PINCTRL_CV1812H_H
> +#define _DT_BINDINGS_PINCTRL_CV1812H_H
> +
> +#include <dt-bindings/pinctrl/pinctrl-cv18xx.h>
> +
> +#define PINPOS(row, col)			\
> +	((((row) - 'A' + 1) << 8) + ((col) - 1))
> +
> +#define PIN_MIPI_TXM4			PINPOS('A', 2)
> +#define PIN_MIPIRX0N			PINPOS('A', 4)
> +#define PIN_MIPIRX3P			PINPOS('A', 6)
> +#define PIN_MIPIRX4P			PINPOS('A', 7)
> +#define PIN_VIVO_D2			PINPOS('A', 9)
> +#define PIN_VIVO_D3			PINPOS('A', 10)
> +#define PIN_VIVO_D10			PINPOS('A', 12)
> +#define PIN_USB_VBUS_DET		PINPOS('A', 13)
> +#define PIN_MIPI_TXP3			PINPOS('B', 1)
> +#define PIN_MIPI_TXM3			PINPOS('B', 2)
> +#define PIN_MIPI_TXP4			PINPOS('B', 3)
> +#define PIN_MIPIRX0P			PINPOS('B', 4)
> +#define PIN_MIPIRX1N			PINPOS('B', 5)
> +#define PIN_MIPIRX2N			PINPOS('B', 6)
> +#define PIN_MIPIRX4N			PINPOS('B', 7)
> +#define PIN_MIPIRX5N			PINPOS('B', 8)
> +#define PIN_VIVO_D1			PINPOS('B', 9)
> +#define PIN_VIVO_D5			PINPOS('B', 10)
> +#define PIN_VIVO_D7			PINPOS('B', 11)
> +#define PIN_VIVO_D9			PINPOS('B', 12)
> +#define PIN_USB_ID			PINPOS('B', 13)
> +#define PIN_ETH_RXM			PINPOS('B', 15)
> +#define PIN_MIPI_TXP2			PINPOS('C', 1)
> +#define PIN_MIPI_TXM2			PINPOS('C', 2)
> +#define PIN_CAM_PD0			PINPOS('C', 3)
> +#define PIN_CAM_MCLK0			PINPOS('C', 4)
> +#define PIN_MIPIRX1P			PINPOS('C', 5)
> +#define PIN_MIPIRX2P			PINPOS('C', 6)
> +#define PIN_MIPIRX3N			PINPOS('C', 7)
> +#define PIN_MIPIRX5P			PINPOS('C', 8)
> +#define PIN_VIVO_CLK			PINPOS('C', 9)
> +#define PIN_VIVO_D6			PINPOS('C', 10)
> +#define PIN_VIVO_D8			PINPOS('C', 11)
> +#define PIN_USB_VBUS_EN			PINPOS('C', 12)
> +#define PIN_ETH_RXP			PINPOS('C', 14)
> +#define PIN_GPIO_RTX			PINPOS('C', 15)
> +#define PIN_MIPI_TXP1			PINPOS('D', 1)
> +#define PIN_MIPI_TXM1			PINPOS('D', 2)
> +#define PIN_CAM_MCLK1			PINPOS('D', 3)
> +#define PIN_IIC3_SCL			PINPOS('D', 4)
> +#define PIN_VIVO_D4			PINPOS('D', 10)
> +#define PIN_ETH_TXM			PINPOS('D', 14)
> +#define PIN_ETH_TXP			PINPOS('D', 15)
> +#define PIN_MIPI_TXP0			PINPOS('E', 1)
> +#define PIN_MIPI_TXM0			PINPOS('E', 2)
> +#define PIN_CAM_PD1			PINPOS('E', 4)
> +#define PIN_CAM_RST0			PINPOS('E', 5)
> +#define PIN_VIVO_D0			PINPOS('E', 10)
> +#define PIN_ADC1			PINPOS('E', 13)
> +#define PIN_ADC2			PINPOS('E', 14)
> +#define PIN_ADC3			PINPOS('E', 15)
> +#define PIN_AUD_AOUTL			PINPOS('F', 2)
> +#define PIN_IIC3_SDA			PINPOS('F', 4)
> +#define PIN_SD1_D2			PINPOS('F', 14)
> +#define PIN_AUD_AOUTR			PINPOS('G', 2)
> +#define PIN_SD1_D3			PINPOS('G', 13)
> +#define PIN_SD1_CLK			PINPOS('G', 14)
> +#define PIN_SD1_CMD			PINPOS('G', 15)
> +#define PIN_AUD_AINL_MIC		PINPOS('H', 1)
> +#define PIN_RSTN			PINPOS('H', 12)
> +#define PIN_PWM0_BUCK			PINPOS('H', 13)
> +#define PIN_SD1_D1			PINPOS('H', 14)
> +#define PIN_SD1_D0			PINPOS('H', 15)
> +#define PIN_AUD_AINR_MIC		PINPOS('J', 1)
> +#define PIN_IIC2_SCL			PINPOS('J', 13)
> +#define PIN_IIC2_SDA			PINPOS('J', 14)
> +#define PIN_SD0_CD			PINPOS('K', 2)
> +#define PIN_SD0_D1			PINPOS('K', 3)
> +#define PIN_UART2_RX			PINPOS('K', 13)
> +#define PIN_UART2_CTS			PINPOS('K', 14)
> +#define PIN_UART2_TX			PINPOS('K', 15)
> +#define PIN_SD0_CLK			PINPOS('L', 1)
> +#define PIN_SD0_D0			PINPOS('L', 2)
> +#define PIN_SD0_CMD			PINPOS('L', 3)
> +#define PIN_CLK32K			PINPOS('L', 14)
> +#define PIN_UART2_RTS			PINPOS('L', 15)
> +#define PIN_SD0_D3			PINPOS('M', 1)
> +#define PIN_SD0_D2			PINPOS('M', 2)
> +#define PIN_UART0_RX			PINPOS('M', 4)
> +#define PIN_UART0_TX			PINPOS('M', 5)
> +#define PIN_JTAG_CPU_TRST		PINPOS('M', 6)
> +#define PIN_PWR_ON			PINPOS('M', 11)
> +#define PIN_PWR_GPIO2			PINPOS('M', 12)
> +#define PIN_PWR_GPIO0			PINPOS('M', 13)
> +#define PIN_CLK25M			PINPOS('M', 14)
> +#define PIN_SD0_PWR_EN			PINPOS('N', 1)
> +#define PIN_SPK_EN			PINPOS('N', 3)
> +#define PIN_JTAG_CPU_TCK		PINPOS('N', 4)
> +#define PIN_JTAG_CPU_TMS		PINPOS('N', 6)
> +#define PIN_PWR_WAKEUP1			PINPOS('N', 11)
> +#define PIN_PWR_WAKEUP0			PINPOS('N', 12)
> +#define PIN_PWR_GPIO1			PINPOS('N', 13)
> +#define PIN_EMMC_DAT3			PINPOS('P', 1)
> +#define PIN_EMMC_DAT0			PINPOS('P', 2)
> +#define PIN_EMMC_DAT2			PINPOS('P', 3)
> +#define PIN_EMMC_RSTN			PINPOS('P', 4)
> +#define PIN_AUX0			PINPOS('P', 5)
> +#define PIN_IIC0_SDA			PINPOS('P', 6)
> +#define PIN_PWR_SEQ3			PINPOS('P', 10)
> +#define PIN_PWR_VBAT_DET		PINPOS('P', 11)
> +#define PIN_PWR_SEQ1			PINPOS('P', 12)
> +#define PIN_PWR_BUTTON1			PINPOS('P', 13)
> +#define PIN_EMMC_DAT1			PINPOS('R', 2)
> +#define PIN_EMMC_CMD			PINPOS('R', 3)
> +#define PIN_EMMC_CLK			PINPOS('R', 4)
> +#define PIN_IIC0_SCL			PINPOS('R', 6)
> +#define PIN_GPIO_ZQ			PINPOS('R', 10)
> +#define PIN_PWR_RSTN			PINPOS('R', 11)
> +#define PIN_PWR_SEQ2			PINPOS('R', 12)
> +#define PIN_XTAL_XIN			PINPOS('R', 13)
> +
> +#endif /* _DT_BINDINGS_PINCTRL_CV1812H_H */
> diff --git a/include/dt-bindings/pinctrl/pinctrl-cv18xx.h b/include/dt-bindings/pinctrl/pinctrl-cv18xx.h
> new file mode 100644
> index 000000000000..bc92ad1067ec
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/pinctrl-cv18xx.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Copyright (C) 2023 Sophgo Ltd.
> + *
> + * Author: Inochi Amaoto <inochiama@outlook.com>
> + */
> +
> +#ifndef _DT_BINDINGS_PINCTRL_CV18XX_H
> +#define _DT_BINDINGS_PINCTRL_CV18XX_H
> +
> +#define PIN_MUX_INVALD				0xff
> +
> +#define PINMUX2(pin, mux, mux2)	\
> +	(((pin) & 0xffff) | (((mux) & 0xff) << 16) | (((mux2) & 0xff) << 24))
> +
> +#define PINMUX(pin, mux) \
> +	PINMUX2(pin, mux, PIN_MUX_INVALD)
> +
> +#endif /* _DT_BINDINGS_PINCTRL_CV18XX_H */
> diff --git a/include/dt-bindings/pinctrl/pinctrl-sg2000.h b/include/dt-bindings/pinctrl/pinctrl-sg2000.h
> new file mode 100644
> index 000000000000..4871f9a7c6c1
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/pinctrl-sg2000.h
> @@ -0,0 +1,127 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
> + *
> + * This file is generated from vendor pinout definition.
> + */
> +
> +#ifndef _DT_BINDINGS_PINCTRL_SG2000_H
> +#define _DT_BINDINGS_PINCTRL_SG2000_H
> +
> +#include <dt-bindings/pinctrl/pinctrl-cv18xx.h>
> +
> +#define PINPOS(row, col)			\
> +	((((row) - 'A' + 1) << 8) + ((col) - 1))
> +
> +#define PIN_MIPI_TXM4			PINPOS('A', 2)
> +#define PIN_MIPIRX0N			PINPOS('A', 4)
> +#define PIN_MIPIRX3P			PINPOS('A', 6)
> +#define PIN_MIPIRX4P			PINPOS('A', 7)
> +#define PIN_VIVO_D2			PINPOS('A', 9)
> +#define PIN_VIVO_D3			PINPOS('A', 10)
> +#define PIN_VIVO_D10			PINPOS('A', 12)
> +#define PIN_USB_VBUS_DET		PINPOS('A', 13)
> +#define PIN_MIPI_TXP3			PINPOS('B', 1)
> +#define PIN_MIPI_TXM3			PINPOS('B', 2)
> +#define PIN_MIPI_TXP4			PINPOS('B', 3)
> +#define PIN_MIPIRX0P			PINPOS('B', 4)
> +#define PIN_MIPIRX1N			PINPOS('B', 5)
> +#define PIN_MIPIRX2N			PINPOS('B', 6)
> +#define PIN_MIPIRX4N			PINPOS('B', 7)
> +#define PIN_MIPIRX5N			PINPOS('B', 8)
> +#define PIN_VIVO_D1			PINPOS('B', 9)
> +#define PIN_VIVO_D5			PINPOS('B', 10)
> +#define PIN_VIVO_D7			PINPOS('B', 11)
> +#define PIN_VIVO_D9			PINPOS('B', 12)
> +#define PIN_USB_ID			PINPOS('B', 13)
> +#define PIN_ETH_RXM			PINPOS('B', 15)
> +#define PIN_MIPI_TXP2			PINPOS('C', 1)
> +#define PIN_MIPI_TXM2			PINPOS('C', 2)
> +#define PIN_CAM_PD0			PINPOS('C', 3)
> +#define PIN_CAM_MCLK0			PINPOS('C', 4)
> +#define PIN_MIPIRX1P			PINPOS('C', 5)
> +#define PIN_MIPIRX2P			PINPOS('C', 6)
> +#define PIN_MIPIRX3N			PINPOS('C', 7)
> +#define PIN_MIPIRX5P			PINPOS('C', 8)
> +#define PIN_VIVO_CLK			PINPOS('C', 9)
> +#define PIN_VIVO_D6			PINPOS('C', 10)
> +#define PIN_VIVO_D8			PINPOS('C', 11)
> +#define PIN_USB_VBUS_EN			PINPOS('C', 12)
> +#define PIN_ETH_RXP			PINPOS('C', 14)
> +#define PIN_GPIO_RTX			PINPOS('C', 15)
> +#define PIN_MIPI_TXP1			PINPOS('D', 1)
> +#define PIN_MIPI_TXM1			PINPOS('D', 2)
> +#define PIN_CAM_MCLK1			PINPOS('D', 3)
> +#define PIN_IIC3_SCL			PINPOS('D', 4)
> +#define PIN_VIVO_D4			PINPOS('D', 10)
> +#define PIN_ETH_TXM			PINPOS('D', 14)
> +#define PIN_ETH_TXP			PINPOS('D', 15)
> +#define PIN_MIPI_TXP0			PINPOS('E', 1)
> +#define PIN_MIPI_TXM0			PINPOS('E', 2)
> +#define PIN_CAM_PD1			PINPOS('E', 4)
> +#define PIN_CAM_RST0			PINPOS('E', 5)
> +#define PIN_VIVO_D0			PINPOS('E', 10)
> +#define PIN_ADC1			PINPOS('E', 13)
> +#define PIN_ADC2			PINPOS('E', 14)
> +#define PIN_ADC3			PINPOS('E', 15)
> +#define PIN_AUD_AOUTL			PINPOS('F', 2)
> +#define PIN_IIC3_SDA			PINPOS('F', 4)
> +#define PIN_SD1_D2			PINPOS('F', 14)
> +#define PIN_AUD_AOUTR			PINPOS('G', 2)
> +#define PIN_SD1_D3			PINPOS('G', 13)
> +#define PIN_SD1_CLK			PINPOS('G', 14)
> +#define PIN_SD1_CMD			PINPOS('G', 15)
> +#define PIN_AUD_AINL_MIC		PINPOS('H', 1)
> +#define PIN_RSTN			PINPOS('H', 12)
> +#define PIN_PWM0_BUCK			PINPOS('H', 13)
> +#define PIN_SD1_D1			PINPOS('H', 14)
> +#define PIN_SD1_D0			PINPOS('H', 15)
> +#define PIN_AUD_AINR_MIC		PINPOS('J', 1)
> +#define PIN_IIC2_SCL			PINPOS('J', 13)
> +#define PIN_IIC2_SDA			PINPOS('J', 14)
> +#define PIN_SD0_CD			PINPOS('K', 2)
> +#define PIN_SD0_D1			PINPOS('K', 3)
> +#define PIN_UART2_RX			PINPOS('K', 13)
> +#define PIN_UART2_CTS			PINPOS('K', 14)
> +#define PIN_UART2_TX			PINPOS('K', 15)
> +#define PIN_SD0_CLK			PINPOS('L', 1)
> +#define PIN_SD0_D0			PINPOS('L', 2)
> +#define PIN_SD0_CMD			PINPOS('L', 3)
> +#define PIN_CLK32K			PINPOS('L', 14)
> +#define PIN_UART2_RTS			PINPOS('L', 15)
> +#define PIN_SD0_D3			PINPOS('M', 1)
> +#define PIN_SD0_D2			PINPOS('M', 2)
> +#define PIN_UART0_RX			PINPOS('M', 4)
> +#define PIN_UART0_TX			PINPOS('M', 5)
> +#define PIN_JTAG_CPU_TRST		PINPOS('M', 6)
> +#define PIN_PWR_ON			PINPOS('M', 11)
> +#define PIN_PWR_GPIO2			PINPOS('M', 12)
> +#define PIN_PWR_GPIO0			PINPOS('M', 13)
> +#define PIN_CLK25M			PINPOS('M', 14)
> +#define PIN_SD0_PWR_EN			PINPOS('N', 1)
> +#define PIN_SPK_EN			PINPOS('N', 3)
> +#define PIN_JTAG_CPU_TCK		PINPOS('N', 4)
> +#define PIN_JTAG_CPU_TMS		PINPOS('N', 6)
> +#define PIN_PWR_WAKEUP1			PINPOS('N', 11)
> +#define PIN_PWR_WAKEUP0			PINPOS('N', 12)
> +#define PIN_PWR_GPIO1			PINPOS('N', 13)
> +#define PIN_EMMC_DAT3			PINPOS('P', 1)
> +#define PIN_EMMC_DAT0			PINPOS('P', 2)
> +#define PIN_EMMC_DAT2			PINPOS('P', 3)
> +#define PIN_EMMC_RSTN			PINPOS('P', 4)
> +#define PIN_AUX0			PINPOS('P', 5)
> +#define PIN_IIC0_SDA			PINPOS('P', 6)
> +#define PIN_PWR_SEQ3			PINPOS('P', 10)
> +#define PIN_PWR_VBAT_DET		PINPOS('P', 11)
> +#define PIN_PWR_SEQ1			PINPOS('P', 12)
> +#define PIN_PWR_BUTTON1			PINPOS('P', 13)
> +#define PIN_EMMC_DAT1			PINPOS('R', 2)
> +#define PIN_EMMC_CMD			PINPOS('R', 3)
> +#define PIN_EMMC_CLK			PINPOS('R', 4)
> +#define PIN_IIC0_SCL			PINPOS('R', 6)
> +#define PIN_GPIO_ZQ			PINPOS('R', 10)
> +#define PIN_PWR_RSTN			PINPOS('R', 11)
> +#define PIN_PWR_SEQ2			PINPOS('R', 12)
> +#define PIN_XTAL_XIN			PINPOS('R', 13)
> +
> +#endif /* _DT_BINDINGS_PINCTRL_SG2000_H */
> diff --git a/include/dt-bindings/pinctrl/pinctrl-sg2002.h b/include/dt-bindings/pinctrl/pinctrl-sg2002.h
> new file mode 100644
> index 000000000000..3c36cfa0a550
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/pinctrl-sg2002.h
> @@ -0,0 +1,79 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
> + *
> + * This file is generated from vendor pinout definition.
> + */
> +
> +#ifndef _DT_BINDINGS_PINCTRL_SG2002_H
> +#define _DT_BINDINGS_PINCTRL_SG2002_H
> +
> +#include <dt-bindings/pinctrl/pinctrl-cv18xx.h>
> +
> +#define PIN_AUD_AINL_MIC		2
> +#define PIN_AUD_AOUTR			4
> +#define PIN_SD0_CLK			6
> +#define PIN_SD0_CMD			7
> +#define PIN_SD0_D0			8
> +#define PIN_SD0_D1			10
> +#define PIN_SD0_D2			11
> +#define PIN_SD0_D3			12
> +#define PIN_SD0_CD			14
> +#define PIN_SD0_PWR_EN			15
> +#define PIN_SPK_EN			17
> +#define PIN_UART0_TX			18
> +#define PIN_UART0_RX			19
> +#define PIN_EMMC_DAT2			20
> +#define PIN_EMMC_CLK			21
> +#define PIN_EMMC_DAT0			22
> +#define PIN_EMMC_DAT3			23
> +#define PIN_EMMC_CMD			24
> +#define PIN_EMMC_DAT1			25
> +#define PIN_JTAG_CPU_TMS		26
> +#define PIN_JTAG_CPU_TCK		27
> +#define PIN_IIC0_SCL			28
> +#define PIN_IIC0_SDA			29
> +#define PIN_AUX0			30
> +#define PIN_GPIO_ZQ			35
> +#define PIN_PWR_VBAT_DET		38
> +#define PIN_PWR_RSTN			39
> +#define PIN_PWR_SEQ1			40
> +#define PIN_PWR_SEQ2			41
> +#define PIN_PWR_WAKEUP0			43
> +#define PIN_PWR_BUTTON1			44
> +#define PIN_XTAL_XIN			45
> +#define PIN_PWR_GPIO0			47
> +#define PIN_PWR_GPIO1			48
> +#define PIN_PWR_GPIO2			49
> +#define PIN_SD1_D3			51
> +#define PIN_SD1_D2			52
> +#define PIN_SD1_D1			53
> +#define PIN_SD1_D0			54
> +#define PIN_SD1_CMD			55
> +#define PIN_SD1_CLK			56
> +#define PIN_PWM0_BUCK			58
> +#define PIN_ADC1			59
> +#define PIN_USB_VBUS_DET		60
> +#define PIN_ETH_TXP			62
> +#define PIN_ETH_TXM			63
> +#define PIN_ETH_RXP			64
> +#define PIN_ETH_RXM			65
> +#define PIN_GPIO_RTX			67
> +#define PIN_MIPIRX4N			72
> +#define PIN_MIPIRX4P			73
> +#define PIN_MIPIRX3N			74
> +#define PIN_MIPIRX3P			75
> +#define PIN_MIPIRX2N			76
> +#define PIN_MIPIRX2P			77
> +#define PIN_MIPIRX1N			78
> +#define PIN_MIPIRX1P			79
> +#define PIN_MIPIRX0N			80
> +#define PIN_MIPIRX0P			81
> +#define PIN_MIPI_TXM2			83
> +#define PIN_MIPI_TXP2			84
> +#define PIN_MIPI_TXM1			85
> +#define PIN_MIPI_TXP1			86
> +#define PIN_MIPI_TXM0			87
> +#define PIN_MIPI_TXP0			88
> +
> +#endif /* _DT_BINDINGS_PINCTRL_SG2002_H */
> --
> 2.45.2
> 

