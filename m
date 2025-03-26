Return-Path: <linux-gpio+bounces-17988-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3F6A70E47
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 01:44:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9847B3B0341
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 00:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B565F18AFC;
	Wed, 26 Mar 2025 00:44:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016BA10E4;
	Wed, 26 Mar 2025 00:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742949887; cv=none; b=mk3O42yfzXQzjpzdT5xJhp8lNSOB0SiTwwQDDUVSBlzKI74tqAR5ZgKqJVGfcj+N/UgtdOmmPF9TXiFll78XWaafbPaGRmLOXBCGsihp9t5GNsu1zyW2S+v0WdcSzYWIF2lNc/sF5ZPpKwKtil/Xw46/Ht4Vz/seDD13FHSQIy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742949887; c=relaxed/simple;
	bh=NUOEHR7dk5KiHVe+jW5sAGgBP6C0nlCCJmq7FVIGbQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sBYdI2OOhRJ1r41b77LttVOhjmn7RPfkJc7AcNaS/MDk70ssYBNoqpjuE10zk20fcq60bsmXOr1t42Um1kYNYHBmUUVuK5D27cNTTLUauSQ8nQcPajY/zlqZeTciRZtwhnyZmKJi5XPgGsRRSYytalZi7+tV+yZ3dL98HJ1rAyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.48.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C772C3431A4;
	Wed, 26 Mar 2025 00:44:44 +0000 (UTC)
Date: Wed, 26 Mar 2025 00:44:40 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Min Lin <linmin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH 1/4] dt-bindings: pinctrl: Add eswin,eic7700-pinctrl
 binding
Message-ID: <20250326004440-GYA24249@gentoo>
References: <20250325141311.758787-1-emil.renner.berthing@canonical.com>
 <20250325141311.758787-2-emil.renner.berthing@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325141311.758787-2-emil.renner.berthing@canonical.com>

Hi Emil Renner Berthing: 

On 15:13 Tue 25 Mar     , Emil Renner Berthing wrote:
> Add device tree binding for the pin controller on the ESWIN EIC7700
> RISC-V SoC.
> 
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---
>  .../pinctrl/eswin,eic7700-pinctrl.yaml        | 141 ++++++++++++++++++
>  1 file changed, 141 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/eswin,eic7700-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/eswin,eic7700-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/eswin,eic7700-pinctrl.yaml
> new file mode 100644
> index 000000000000..8ef966cebc5e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/eswin,eic7700-pinctrl.yaml
> @@ -0,0 +1,141 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/eswin,eic7700-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ESWIN EIC7700 SoC pin controller
> +
> +maintainers:
> +  - Emil Renner Berthing <emil.renner.berthing@canonical.com>
> +
> +description: |
no need |
> +  Pinmux and pinconf controller in the ESWIN EIC7700 RISC-V SoC.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - eswin,eic7700-pinctrl
why not const as single compatible here?
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +patternProperties:
> +  '-[0-9]+$':
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
> +
> +          bias-pull-down:
> +            oneOf:
> +              - type: boolean
> +              - const: 22000
> +            description: Enable internal 22kOhm pull-down
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
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pinctrl: pinctrl@51600080 {
       ~~~~~~~ no need alias phandle in example..
> +        compatible = "eswin,eic7700-pinctrl";
> +        reg = <0x51600080 0xff80>;
> +
> +        uart0_pins: uart0-0 {
> +            tx-pins {
> +                pins = "UART0_TX";
> +                function = "uart";
> +                bias-disable;
> +                drive-strength-microamp = <6700>;
> +                input-disable;
> +                input-schmitt-disable;
> +            };
> +
> +            rx-pins {
> +                pins = "UART0_RX";
> +                function = "uart";
> +                bias-pull-up;
> +                drive-strength-microamp = <6700>;
> +                input-enable;
> +                input-schmitt-enable;
> +            };
> +        };
> +    };
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

