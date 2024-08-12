Return-Path: <linux-gpio+bounces-8711-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1250294E721
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2024 08:49:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE5E82830C7
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2024 06:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE4BE152E1C;
	Mon, 12 Aug 2024 06:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wj9KDBdN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68E614EC64;
	Mon, 12 Aug 2024 06:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723445340; cv=none; b=j7SnTBmICCXbVPocG257OpPPFjtEe/rEFVCTS2I95POSQbbP/3xQFqukVcE1KXNBh2btgpMh2iJLdnpwYfZJVbIViAs1RXn+dg68T5Pu24Opt1/UHCak5klELO7Z2ygwOnHYy7z8zHzORZIR7B1ON75grfZr9gbJaphpc9M1iW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723445340; c=relaxed/simple;
	bh=hcxPgTeXWCzFQ7gTfSAbUs13+eSsAvdLE+Y/kSNsHOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rZGgbxkug4hPyvwI8oPNpMGsUAdlF4Nsf4mMTH7hCsK/d/XfA/IJuHei8l6vA9PzkY8zsjqYsL4PFx1RNqXrFJYlWgPZhjED9wYVnV6xjHbgXEsN+90qkIynd4Sbsivhddp5ZRBpEfQhuxdfRL1fQ1XX8aWE+eVtqYDdnhVQn00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wj9KDBdN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7F48C32782;
	Mon, 12 Aug 2024 06:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723445340;
	bh=hcxPgTeXWCzFQ7gTfSAbUs13+eSsAvdLE+Y/kSNsHOk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Wj9KDBdNRvKZULq0O17sXomGxH3pQ+ibxA2cK6zQizZv+OwPDYssi9RgGEW0h1FWz
	 q1Fwc3o9J7hLB9Irhm9w0nm1vyQTApGf2V9hkT0h+lWHvr0BN4niaLk1SY8Zoe5wUH
	 WuPFwfpz673z0vXAs2ztes7ro5mRNSymw1Yuhc0Ual4PKvKeN9vmKRV4otPJgRY2+Z
	 AihR8RfdWPOPOJVqe+rzxC4blT9iMZcFj1gV7Wf1m7GImeCz3ZR6/Z0UuEgSZIxNMe
	 J5IvVrMIrW5uzTqEJFm0SJJchC+T6sgv7AfI0by7OaEUTpGrMYCnZQokS/wDf4CoBP
	 IZbeo50Xh8QEQ==
Message-ID: <22144671-fc7c-4cb2-8bb6-ee7d3fbfcb0e@kernel.org>
Date: Mon, 12 Aug 2024 08:48:52 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, sean.wang@kernel.org,
 linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
 krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
 angelogioacchino.delregno@collabora.com, benjamin.larsson@genexis.eu,
 conor+dt@kernel.org, ansuelsmth@gmail.com
References: <cover.1723392444.git.lorenzo@kernel.org>
 <0d537e88b64847bc4e49756b249b2efdcf489b92.1723392444.git.lorenzo@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <0d537e88b64847bc4e49756b249b2efdcf489b92.1723392444.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/08/2024 18:12, Lorenzo Bianconi wrote:
> Introduce device-tree binding documentation for Airoha EN7581 pinctrl
> controller.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../pinctrl/airoha,en7581-pinctrl.yaml        | 467 ++++++++++++++++++
>  1 file changed, 467 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
> new file mode 100644
> index 000000000000..b1f980613864
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
> @@ -0,0 +1,467 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/airoha,en7581-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha EN7581 Pin Controller
> +
> +maintainers:
> +  - Lorenzo Bianconi <lorenzo@kernel.org>
> +
> +description:
> +  The Airoha's EN7581 Pin controller is used to control SoC pins.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - airoha,en7581-pinctrl
> +
> +  reg:
> +    items:
> +      - description: IOMUX base address
> +      - description: LED IOMUX base address
> +      - description: GPIO flash mode base address
> +      - description: GPIO flash mode extended base address
> +      - description: IO pin configuration base address
> +      - description: PCIE reset open-drain base address
> +      - description: GPIO bank0 data register base address
> +      - description: GPIO bank1 data register base address
> +      - description: GPIO bank0 first control register base address
> +      - description: GPIO bank0 second control register base address
> +      - description: GPIO bank1 first control register base address
> +      - description: GPIO bank1 second control register base address
> +      - description: GPIO bank0 output enable register base address
> +      - description: GPIO bank1 output enable register base address
> +      - description: GPIO bank0 irq status register base address
> +      - description: GPIO bank1 irq status register base address
> +      - description: GPIO bank0 irq level first control register base address
> +      - description: GPIO bank0 irq level second control register base address
> +      - description: GPIO bank1 irq level first control register base address
> +      - description: GPIO bank1 irq level second control register base address
> +      - description: GPIO bank0 irq edge first control register base address
> +      - description: GPIO bank0 irq edge second control register base address
> +      - description: GPIO bank1 irq edge first control register base address
> +      - description: GPIO bank1 irq edge second control register base address
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +    description:
> +      Number of cells in GPIO specifier. Since the generic GPIO binding is
> +      used, the amount of cells must be specified as 2. See the below mentioned
> +      gpio binding representation for description of particular cells.
> +
> +  gpio-ranges:
> +    maxItems: 1
> +    description:
> +      GPIO valid number range.
> +
> +  interrupt-controller: true
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - "#gpio-cells"
> +
> +patternProperties:

Keep it after properties: block.

> +  '-pins$':
> +    type: object
> +    additionalProperties: false
> +
> +    patternProperties:
> +      '^.*mux.*$':
> +        type: object
> +        additionalProperties: false
> +        description: |

Do not need '|' unless you need to preserve formatting.

> +          pinmux configuration nodes.
> +
> +        $ref: /schemas/pinctrl/pinmux-node.yaml
> +        properties:
> +          function:
> +            description:
> +              A string containing the name of the function to mux to the group.
> +            enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
> +                   pcm_spi, i2s, emmc, pnand, pcie_reset, pwm, phy1_led0,
> +                   phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
> +                   phy3_led1, phy4_led1]
> +          groups:

minItems: 1
maxItems: 32 (or whatever is sensible)

> +            description:
> +              An array of strings. Each string contains the name of a group.
> +        required:
> +          - function
> +          - groups
> +
> +        allOf:
> +          - if:
> +              properties:
> +                function:
> +                  const: pon
> +            then:
> +              properties:
> +                groups:
> +                  enum: [pon]
> +          - if:
> +              properties:
> +                function:
> +                  const: tod_1pps
> +            then:
> +              properties:
> +                groups:
> +                  enum: [pon_tod_1pps, gsw_tod_1pps]
> +          - if:
> +              properties:
> +                function:
> +                  const: sipo
> +            then:
> +              properties:
> +                groups:
> +                  enum: [sipo, sipo_rclk]
> +          - if:
> +              properties:
> +                function:
> +                  const: mdio
> +            then:
> +              properties:
> +                groups:
> +                  enum: [mdio]
> +          - if:
> +              properties:
> +                function:
> +                  const: uart
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [uart2, uart2_cts_rts, hsuart, hsuart_cts_rts, uart4,
> +                           uart5]
> +                  maxItems: 2
> +          - if:
> +              properties:
> +                function:
> +                  const: i2c
> +            then:
> +              properties:
> +                groups:
> +                  enum: [i2c1]
> +          - if:
> +              properties:
> +                function:
> +                  const: jtag
> +            then:
> +              properties:
> +                groups:
> +                  enum: [jtag_udi, jtag_dfd]
> +          - if:
> +              properties:
> +                function:
> +                  const: pcm
> +            then:
> +              properties:
> +                groups:
> +                  enum: [pcm1, pcm2]
> +          - if:
> +              properties:
> +                function:
> +                  const: spi
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [spi_quad, spi_cs1]
> +                  maxItems: 2
> +          - if:
> +              properties:
> +                function:
> +                  const: pcm_spi
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [pcm_spi, pcm_spi_int, pcm_spi_rst, pcm_spi_cs1,
> +                           pcm_spi_cs2_p156, pcm_spi_cs2_p128, pcm_spi_cs3,
> +                           pcm_spi_cs4]
> +                  maxItems: 7
> +          - if:
> +              properties:
> +                function:
> +                  const: i2c
> +            then:
> +              properties:
> +                groups:
> +                  enum: [i2s]
> +          - if:
> +              properties:
> +                function:
> +                  const: emmc
> +            then:
> +              properties:
> +                groups:
> +                  enum: [emmc]
> +          - if:
> +              properties:
> +                function:
> +                  const: pnand
> +            then:
> +              properties:
> +                groups:
> +                  enum: [pnand]
> +          - if:
> +              properties:
> +                function:
> +                  const: pcie_reset
> +            then:
> +              properties:
> +                groups:
> +                  enum: [pcie_reset0, pcie_reset1, pcie_reset2]
> +          - if:
> +              properties:
> +                function:
> +                  const: pwm
> +            then:
> +              properties:
> +                groups:
> +                  enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6,
> +                         gpio7, gpio8, gpio9, gpio10, gpio11, gpio12, gpio13,
> +                         gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
> +                         gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
> +                         gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
> +                         gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
> +                         gpio42, gpio43, gpio44, gpio45, gpio46, gpio47]
> +          - if:
> +              properties:
> +                function:
> +                  const: phy1_led0
> +            then:
> +              properties:
> +                groups:
> +                  enum: [gpio33, gpio34, gpio35, gpio42]
> +          - if:
> +              properties:
> +                function:
> +                  const: phy2_led0
> +            then:
> +              properties:
> +                groups:
> +                  enum: [gpio33, gpio34, gpio35, gpio42]
> +          - if:
> +              properties:
> +                function:
> +                  const: phy3_led0
> +            then:
> +              properties:
> +                groups:
> +                  enum: [gpio33, gpio34, gpio35, gpio42]
> +          - if:
> +              properties:
> +                function:
> +                  const: phy4_led0
> +            then:
> +              properties:
> +                groups:
> +                  enum: [gpio33, gpio34, gpio35, gpio42]
> +          - if:
> +              properties:
> +                function:
> +                  const: phy1_led1
> +            then:
> +              properties:
> +                groups:
> +                  enum: [gpio43, gpio44, gpio45, gpio46]
> +          - if:
> +              properties:
> +                function:
> +                  const: phy2_led1
> +            then:
> +              properties:
> +                groups:
> +                  enum: [gpio43, gpio44, gpio45, gpio46]
> +          - if:
> +              properties:
> +                function:
> +                  const: phy3_led1
> +            then:
> +              properties:
> +                groups:
> +                  enum: [gpio43, gpio44, gpio45, gpio46]
> +          - if:
> +              properties:
> +                function:
> +                  const: phy4_led1
> +            then:
> +              properties:
> +                groups:
> +                  enum: [gpio43, gpio44, gpio45, gpio46]
> +
> +      '^.*conf.*$':
> +        type: object
> +        additionalProperties: false
> +        description:
> +          pinconf configuration nodes.
> +        $ref: /schemas/pinctrl/pincfg-node.yaml
> +
> +        properties:
> +          pins:
> +            description:
> +              An array of strings. Each string contains the name of a pin.
> +            items:
> +              enum: [uart1_txd, uart1_rxd, i2c_scl, i2c_sda, spi_cs0, spi_clk,
> +                     spi_mosi, spi_miso, gpio0, gpio1, gpio2, gpio3, gpio4,
> +                     gpio5, gpio6, gpio7, gpio8, gpio9, gpio10, gpio11, gpio12,
> +                     gpio13, gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
> +                     gpio20, gpio21, gpio22, gpio23, gpio24, gpio25, gpio26,
> +                     gpio27, gpio28, gpio29, gpio30, gpio31, gpio32, gpio33,
> +                     gpio34, gpio35, gpio36, gpio37, gpio38, gpio39, gpio40,
> +                     gpio41, gpio42, gpio43, gpio44, gpio45, gpio46,
> +                     pcie_reset0, pcie_reset1, pcie_reset2]

minItems

> +            maxItems: 58
> +
> +          bias-disable: true
> +
> +          bias-pull-up: true
> +
> +          bias-pull-down: true
> +
> +          input-enable: true
> +
> +          output-enable: true
> +
> +          output-low: true
> +
> +          output-high: true
> +
> +          drive-open-drain: true

Drop blank lines between these.
> +
> +          drive-strength:

What are the units? Shouldn't this be drive-strength-microamp?

> +            enum: [2, 4, 6, 8]
> +
> +        required:
> +          - pins
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      pio: pinctrl@1fa20214 {
> +        compatible = "airoha,en7581-pinctrl";
> +        reg = <0x0 0x1fa20214 0x0 0x30>,
> +              <0x0 0x1fa2027c 0x0 0x8>,
> +              <0x0 0x1fbf0234 0x0 0x4>,
> +              <0x0 0x1fbf0268 0x0 0x4>,
> +              <0x0 0x1fa2001c 0x0 0x50>,
> +              <0x0 0x1fa2018c 0x0 0x4>,
> +              <0x0 0x1fbf0204 0x0 0x4>,
> +              <0x0 0x1fbf0270 0x0 0x4>,
> +              <0x0 0x1fbf0200 0x0 0x4>,
> +              <0x0 0x1fbf0220 0x0 0x4>,
> +              <0x0 0x1fbf0260 0x0 0x4>,
> +              <0x0 0x1fbf0264 0x0 0x4>,
> +              <0x0 0x1fbf0214 0x0 0x4>,
> +              <0x0 0x1fbf0278 0x0 0x4>,
> +              <0x0 0x1fbf0208 0x0 0x4>,
> +              <0x0 0x1fbf027c 0x0 0x4>,
> +              <0x0 0x1fbf0210 0x0 0x4>,
> +              <0x0 0x1fbf028c 0x0 0x4>,
> +              <0x0 0x1fbf0290 0x0 0x4>,
> +              <0x0 0x1fbf0294 0x0 0x4>,
> +              <0x0 0x1fbf020c 0x0 0x4>,
> +              <0x0 0x1fbf0280 0x0 0x4>,
> +              <0x0 0x1fbf0284 0x0 0x4>,
> +              <0x0 0x1fbf0288 0x0 0x4>;

Why are you mapping individual registers? At least half of these are
continuous.

> +
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&pio 0 13 47>;
> +
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +        interrupt-parent = <&gic>;
> +        interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        pcie1-rst-pins {
> +          conf {
> +            pins = "pcie_reset1";
> +            drive-open-drain = <1>;
> +          };
> +        };
> +
> +        pwm-pins {
> +          mux {
> +            function = "pwm";
> +            groups = "gpio18";
> +          };
> +        };
> +
> +        spi-pins {
> +          mux {
> +            function = "spi";
> +            groups = "spi_quad", "spi_cs1";
> +          };
> +        };
> +
> +        uuart2-pins {
> +          mux {
> +            function = "uart";
> +            groups = "uart2", "uart2_cts_rts";
> +          };
> +        };
> +
> +        uar5-pins {
> +          mux {
> +            function = "uart";
> +            groups = "uart5";
> +          };
> +        };
> +
> +        mmc-pins {
> +          mux {
> +            function = "emmc";
> +            groups = "emmc";
> +          };
> +        };
> +
> +        mdio-pins {
> +          mux {
> +            function = "mdio";
> +            groups = "mdio";
> +          };
> +
> +          conf {
> +            pins = "gpio2";

What is the point of having both groups and pins?

> +            output-enable;
> +          };
> +        };
> +
> +        gswp1-led0-pins {
> +          mux {
> +            function = "phy1_led0";
> +            groups = "gpio33";
> +          };
> +        };
> +
> +        gswp2-led1-pins {
> +          mux {
> +            function = "phy2_led1";
> +            groups = "gpio44";

That's not a group but pin name.

Best regards,
Krzysztof


