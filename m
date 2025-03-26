Return-Path: <linux-gpio+bounces-17998-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7E2A7128C
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 09:21:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0BB33BAE18
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 08:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 016F11A2398;
	Wed, 26 Mar 2025 08:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pHQ7sKWP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2893191F84;
	Wed, 26 Mar 2025 08:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742977209; cv=none; b=PnJ0KqwpvaH6oHaWAOrE+0MUqAOPnOC12UOUGQmTS1wMcGckdS2iM26Ai6dmXS8UjIs4ntWEzSo6Iwsop31pbPrY9Z4JwM0JVi49Fg/bmmi9ugIgRXr2COkRKsKxellL6D2f8oqEZ/Fusc3o0YgY/l4zfyhb872z2B0MdpRgXvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742977209; c=relaxed/simple;
	bh=e7hTra+jevl2B8uxxtnN9m+T7DIhVwGcC9yda51Yf5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i0vGTMKgvKldc1e5UfgwMtqqqWdOdtYJPTx8HQLcunh+zflR/9B/beS91zfeNnfyd+nv/037dkHqle57ys8tlMEhKVTQSje0GQkItm8nTn3S4kZTW7zIMBeQ22t5bFbNjjchcV0gDmyV3qt6dHbRAqTyJgm+e6hypqahMwZ0c8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pHQ7sKWP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2767EC4CEE2;
	Wed, 26 Mar 2025 08:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742977209;
	bh=e7hTra+jevl2B8uxxtnN9m+T7DIhVwGcC9yda51Yf5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pHQ7sKWPyzNnOX3+F9rTKTkdH3F4FUhPYjldAwzOUzNQ4KaKzoaYSQiLBwJn3mR1C
	 uK1U28f52jVATYdvAr1lwmDmJ1V0Ixu7zureEUJ6hRm9LI9ZipAdnTgOLPLBkXmW+I
	 DHYuBWOaQXL20YdFrbDQt1EvegpuZqaj61GVLVo+Ah0pP9ZYi+f0UlpYEmTVf/s+15
	 mzRcGPTOmBgIRGX8Sb8E0HAYxehBNqs+U8pXpsFLE5r1qvh9fUwIqBkQP5k9GBjuan
	 /xMSXoTZw0XI2YaNy5dJe4TsFa90PcEKvUkibn3G15mfe+cpDLrAEMo2piYSbmJmVb
	 txW4fKA8wQ+jw==
Date: Wed, 26 Mar 2025 09:20:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>, 
	Pritesh Patel <pritesh.patel@einfochips.com>, Min Lin <linmin@eswincomputing.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH 1/4] dt-bindings: pinctrl: Add eswin,eic7700-pinctrl
 binding
Message-ID: <20250326-owl-of-algebraic-wealth-61aeda@krzk-bin>
References: <20250325141311.758787-1-emil.renner.berthing@canonical.com>
 <20250325141311.758787-2-emil.renner.berthing@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250325141311.758787-2-emil.renner.berthing@canonical.com>

On Tue, Mar 25, 2025 at 03:13:03PM +0100, Emil Renner Berthing wrote:
> +properties:
> +  compatible:
> +    enum:
> +      - eswin,eic7700-pinctrl

Blank line

> +  reg:
> +    maxItems: 1
> +
> +required:

required: goes after patternProperties.

> +  - compatible
> +  - reg
> +
> +patternProperties:
> +  '-[0-9]+$':

Recommended is to have more meaningful prefix or suffix, e.g.
-grp/-group. I also don't get why it has to end with number.

> +    type: object
> +    additionalProperties: false
> +
> +    patternProperties:
> +      '-pins$':
> +        type: object
> +        allOf:
> +          - $ref: /schemas/pinctrl/pincfg-node.yaml#
> +          - $ref: /schemas/pinctrl/pinmux-node.yaml#
> +
> +        additionalProperties: false
> +
> +        description:
> +          A pinctrl node should contain at least one subnode describing one
> +          or more pads and their associated pinmux and pinconf settings.
> +
> +        properties:
> +          pins:
> +            items:
> +              enum: [ CHIP_MODE, MODE_SET0, MODE_SET1, MODE_SET2, MODE_SET3,
> +                      XIN, RTC_XIN, RST_OUT_N, KEY_RESET_N, GPIO0, POR_SEL,
> +                      JTAG0_TCK, JTAG0_TMS, JTAG0_TDI, JTAG0_TDO, GPIO5, SPI2_CS0_N,
> +                      JTAG1_TCK, JTAG1_TMS, JTAG1_TDI, JTAG1_TDO, GPIO11, SPI2_CS1_N,
> +                      PCIE_CLKREQ_N, PCIE_WAKE_N, PCIE_PERST_N, HDMI_SCL, HDMI_SDA,
> +                      HDMI_CEC, JTAG2_TRST, RGMII0_CLK_125, RGMII0_TXEN,
> +                      RGMII0_TXCLK, RGMII0_TXD0, RGMII0_TXD1, RGMII0_TXD2,
> +                      RGMII0_TXD3, I2S0_BCLK, I2S0_WCLK, I2S0_SDI, I2S0_SDO,
> +                      I2S_MCLK, RGMII0_RXCLK, RGMII0_RXDV, RGMII0_RXD0, RGMII0_RXD1,
> +                      RGMII0_RXD2, RGMII0_RXD3, I2S2_BCLK, I2S2_WCLK, I2S2_SDI,
> +                      I2S2_SDO, GPIO27, GPIO28, GPIO29, RGMII0_MDC, RGMII0_MDIO,
> +                      RGMII0_INTB, RGMII1_CLK_125, RGMII1_TXEN, RGMII1_TXCLK,
> +                      RGMII1_TXD0, RGMII1_TXD1, RGMII1_TXD2, RGMII1_TXD3, I2S1_BCLK,
> +                      I2S1_WCLK, I2S1_SDI, I2S1_SDO, GPIO34, RGMII1_RXCLK,
> +                      RGMII2_RXDV, RGMII2_RXD0, RGMII2_RXD1, RGMII2_RXD2,
> +                      RGMII2_RXD3, SPI1_CS0_N, SPI1_CLK, SPI1_D0, SPI1_D1, SPI1_D2,
> +                      SPI1_D3, SPI1_CS1_N, RGMII1_MDC, RGMII1_MDIO, RGMII1_INTB,
> +                      USB0_PWREN, USB1_PWREN, I2C0_SCL, I2C0_SDA, I2C1_SCL, I2C1_SDA,
> +                      I2C2_SCL, I2C2_SDA, I2C3_SCL, I2C3_SDA, I2C4_SCL, I2C4_SDA,
> +                      I2C5_SCL, I2C5_SDA, UART0_TX, UART0_RX, UART1_TX, UART1_RX,
> +                      UART1_CTS, UART1_RTS, UART2_TX, UART2_RX, JTAG2_TCK, JTAG2_TMS,
> +                      JTAG2_TDI, JTAG2_TDO, FAN_PWM, FAN_TACH, MIPI_CSI0_XVS,
> +                      MIPI_CSI0_XHS, MIPI_CSI0_MCLK, MIPI_CSI1_XVS, MIPI_CSI1_XHS,
> +                      MIPI_CSI1_MCLK, MIPI_CSI2_XVS, MIPI_CSI2_XHS, MIPI_CSI2_MCLK,
> +                      MIPI_CSI3_XVS, MIPI_CSI3_XHS, MIPI_CSI3_MCLK, MIPI_CSI4_XVS,
> +                      MIPI_CSI4_XHS, MIPI_CSI4_MCLK, MIPI_CSI5_XVS, MIPI_CSI5_XHS,
> +                      MIPI_CSI5_MCLK, SPI3_CS_N, SPI3_CLK, SPI3_DI, SPI3_DO, GPIO92,
> +                      GPIO93, S_MODE, GPIO95, SPI0_CS_N, SPI0_CLK, SPI0_D0, SPI0_D1,
> +                      SPI0_D2, SPI0_D3, I2C10_SCL, I2C10_SDA, I2C11_SCL, I2C11_SDA,
> +                      GPIO106, BOOT_SEL0, BOOT_SEL1, BOOT_SEL2, BOOT_SEL3, GPIO111,
> +                      LPDDR_REF_CLK ]

All these should be lowercase.

> +            description: List of pads that properties in the node apply to.
> +
> +          function:
> +            enum: [ csi, debug, ddr, fan, gpio, hdmi, i2c, i2s, jtag, mipi,
> +                    mode, oscillator, pci, pwm, rgmii, reset, sata, spi, sdio,
> +                    uart, usb ]
> +            description: The mux function to select for the given pins.
> +
> +          bias-disable: true
> +
> +          bias-pull-up:
> +            oneOf:
> +              - type: boolean
> +              - const: 25000
> +            description: Enable internal 25kOhm pull-up

Why bool and fixed value? Do they have different meaning? Description
says they are the same.

Anyway, don't repeat constraints in free form text.

> +
> +          bias-pull-down:
> +            oneOf:
> +              - type: boolean
> +              - const: 22000
> +            description: Enable internal 22kOhm pull-down

Same questions

> +
> +          drive-strength-microamp:
> +            enum: [ 3100, 6700, 9600, 12900, 18000, 20900, 23200, 25900 ]
> +
> +          input-enable: true
> +
> +          input-disable: true
> +
> +          input-schmitt-enable: true
> +
> +          input-schmitt-disable: true
> +
> +        required:
> +          - pins

Best regards,
Krzysztof


