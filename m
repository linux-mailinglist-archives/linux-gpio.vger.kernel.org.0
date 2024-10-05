Return-Path: <linux-gpio+bounces-10877-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EF70F99199E
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2024 20:44:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FE80B20EE0
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2024 18:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 955E515DBD5;
	Sat,  5 Oct 2024 18:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q+P8XbBw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB4215B968;
	Sat,  5 Oct 2024 18:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728153891; cv=none; b=KlrYPrBRaLF/UW/uJFGwD2l8YLPUGzYzCePlO6Z9RtRtsYyY7TNzMZ28ZUZ7rwdbTWCj0bUbRNte1CVLz++0hFZ06tPF2OuFS/2qu88V8bmGqSomXC8G1KSn/TZOObv80eElo3jDjqiqsBTVVLZ0rDVPsHIO8zb2RrBJ+vsZD4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728153891; c=relaxed/simple;
	bh=QzBTjgs8Gd4S8OzXv+cMY8UWpqOTQeB7OTK59kNUdfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hanOlukCElT62D7uC8LDHj+TInNm1bRwV6e2JaTKDzuag+F1lC+Pm3HscIX1qv+J+eL6nNA5wWGX2UEr6ccAyxqOQ32GVGPy0my7lnlMs669RhZrCsFVYF+Mt2nY6lJ+4amt9Pro0ZUTA7TGt0KPUeqybpciagsU0JNeIUGIeIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q+P8XbBw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77B2C4CEC2;
	Sat,  5 Oct 2024 18:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728153890;
	bh=QzBTjgs8Gd4S8OzXv+cMY8UWpqOTQeB7OTK59kNUdfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q+P8XbBw//9/pqHk6ZwIJgYp6H7Hf1lsqIG1h6yTtpQA4XRc9mhihdYtzhZ2mLAAf
	 f/mZV2ciUHYuJXc8fWng3VNiec2P+89b8sd5+t3MR2LLzpGwm1j/EXttp834IFzg0p
	 VpdSv4CRwWLi+ejJbHIsUEhfF1rDhOyFaSctPZbFVaNuzYSZNONvB7057ul7xXKbax
	 7WRsQQuoM2BH/kIWnyWcB0joVmn3HyKWhO9gDRAaU+BtO4ILHOG4Y3paoRfd4PgK2f
	 YDsRyg80t459/ymca5A4maZhQC38RFDIcp9BYFhHiL+xEJ0RFaTT7BFij/vDEqLezz
	 skN4WzBVBF4bg==
Date: Sat, 5 Oct 2024 13:44:49 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@kernel.org>,
	Frank Wunderlich <frank-w@public-files.de>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, daniel@makrotopia.org,
	john@phrozen.org, ansuelsmth@gmail.com, eladwf@gmail.com
Subject: Re: [PATCH v1 3/4] dt-bindings: pinctrl: add binding for MT7988 SoC
Message-ID: <20241005184449.GA505893-robh@kernel.org>
References: <20241004123423.34519-1-linux@fw-web.de>
 <20241004123423.34519-4-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004123423.34519-4-linux@fw-web.de>

On Fri, Oct 04, 2024 at 02:34:17PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This adds bindings for MT7988 pinctrl driver.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  .../pinctrl/mediatek,mt7988-pinctrl.yaml      | 575 ++++++++++++++++++
>  1 file changed, 575 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml
> new file mode 100644
> index 000000000000..da57608a3791
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml
> @@ -0,0 +1,575 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/mediatek,mt7988-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT7988 Pin Controller
> +
> +maintainers:
> +  - Sean Wang <sean.wang@kernel.org>
> +
> +description:
> +  The MediaTek's MT7988 Pin controller is used to control SoC pins.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt7988-pinctrl
> +
> +  reg:
> +    minItems: 7
> +    maxItems: 7
> +
> +  reg-names:
> +    items:
> +      - const: gpio
> +      - const: iocfg_tr
> +      - const: iocfg_br
> +      - const: iocfg_rb
> +      - const: iocfg_lb
> +      - const: iocfg_tl
> +      - const: eint
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +    description:
> +      Number of cells in GPIO specifier. Since the generic GPIO binding is used,
> +      the amount of cells must be specified as 2. See the below mentioned gpio
> +      binding representation for description of particular cells.

What below gpio binding representation? Just drop the description 
entirely.

> +
> +  gpio-ranges:
> +    minItems: 1
> +    maxItems: 5
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
> +  - reg-names
> +  - gpio-controller
> +  - "#gpio-cells"
> +
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    additionalProperties: false
> +
> +    patternProperties:
> +      '^.*mux.*$':

Do you really need 'mux' anywhere in the name?

> +        type: object
> +        additionalProperties: false
> +        description: |
> +          pinmux configuration nodes.
> +
> +          The following table shows the effective values of "group", "function"
> +          properties and chip pinout pins
> +
> +          groups               function           pins (in pin#)
> +          ---------------------------------------------------------------------
> +          "tops_jtag0_0"       "jtag"             0, 1, 2, 3, 4
> +          "wo0_jtag"           "jtag"             50, 51, 52, 53, 54
> +          "wo1_jtag"           "jtag"             50, 51, 52, 53, 54
> +          "wo2_jtag"           "jtag"             50, 51, 52, 53, 54
> +          "jtag"               "jtag"             58, 59, 60, 61, 62
> +          "tops_jtag0_1"       "jtag"             58, 59, 60, 61, 62
> +          "int_usxgmii"        "int_usxgmii"      2, 3
> +          "pwm0"               "pwm"              57
> +          "pwm1"               "pwm"              21
> +          "pwm2"               "pwm"              80
> +          "pwm3"               "pwm"              81
> +          "pwm4"               "pwm"              82
> +          "pwm5"               "pwm"              83
> +          "pwm6"               "pwm"              69
> +          "pwm7"               "pwm"              70
> +          "dfd"                "dfd"              0, 1, 2, 3, 4
> +          "xfi_phy0_i2c0"      "i2c"              0, 1
> +          "xfi_phy1_i2c0"      "i2c"              0, 1
> +          "xfi_phy_pll_i2c0"   "i2c"              3, 4
> +          "xfi_phy_pll_i2c1"   "i2c"              3, 4
> +          "i2c0_0"             "i2c"              5, 6
> +          "i2c1_sfp"           "i2c"              5, 6
> +          "xfi_pextp_phy0_i2c" "i2c"              5, 6
> +          "xfi_pextp_phy1_i2c" "i2c"              5, 6
> +          "i2c0_1"             "i2c"              15, 16
> +          "u30_phy_i2c0"       "i2c"              15, 16
> +          "u32_phy_i2c0"       "i2c"              15, 16
> +          "xfi_phy0_i2c1"      "i2c"              15, 16
> +          "xfi_phy1_i2c1"      "i2c"              15, 16
> +          "xfi_phy_pll_i2c2"   "i2c"              15, 16
> +          "i2c1_0"             "i2c"              17, 18
> +          "u30_phy_i2c1"       "i2c"              17, 18
> +          "u32_phy_i2c1"       "i2c"              17, 18
> +          "xfi_phy_pll_i2c3"   "i2c"              17, 18
> +          "sgmii0_i2c"         "i2c"              17, 18
> +          "sgmii1_i2c"         "i2c"              17, 18
> +          "i2c1_2"             "i2c"              69, 70
> +          "i2c2_0"             "i2c"              69, 70
> +          "i2c2_1"             "i2c"              71, 72
> +          "mdc_mdio0"          "eth"              5, 6
> +          "2p5g_ext_mdio"      "eth"              28, 29
> +          "gbe_ext_mdio"       "eth"              30, 31
> +          "mdc_mdio1"          "eth"              69, 70
> +          "pcie_wake_n0_0"     "pcie"             7
> +          "pcie_clk_req_n0_0"  "pcie"             8
> +          "pcie_wake_n3_0"     "pcie"             9
> +          "pcie_clk_req_n3"    "pcie"             10
> +          "pcie_clk_req_n0_1"  "pcie"             10
> +          "pcie_p0_phy_i2c"    "pcie"             7, 8
> +          "pcie_p1_phy_i2c"    "pcie"             7, 8
> +          "pcie_p3_phy_i2c"    "pcie"             9, 10
> +          "pcie_p2_phy_i2c"    "pcie"             7, 8
> +          "ckm_phy_i2c"        "pcie"             9, 10
> +          "pcie_wake_n0_1"     "pcie"             13
> +          "pcie_wake_n3_1"     "pcie"             14
> +          "pcie_2l_0_pereset"  "pcie"             19
> +          "pcie_1l_1_pereset"  "pcie"             20
> +          "pcie_clk_req_n2_1"  "pcie"             63
> +          "pcie_2l_1_pereset"  "pcie"             73
> +          "pcie_1l_0_pereset"  "pcie"             74
> +          "pcie_wake_n1_0"     "pcie"             75
> +          "pcie_clk_req_n1"    "pcie"             76
> +          "pcie_wake_n2_0"     "pcie"             77
> +          "pcie_clk_req_n2_0"  "pcie"             78
> +          "pcie_wake_n2_1"     "pcie"             79
> +          "pmic"               "pmic"             11
> +          "watchdog"           "watchdog"         12
> +          "spi0_wp_hold"       "spi"              22, 23
> +          "spi0"               "spi"              24, 25, 26, 27
> +          "spi1"               "spi"              28, 29, 30, 31
> +          "spi2"               "spi"              32, 33, 34, 35
> +          "spi2_wp_hold"       "spi"              36, 37
> +          "snfi"               "flash"            22, 23, 24, 25, 26, 27
> +          "emmc_45"            "flash"            21, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37
> +          "sdcard"             "flash"            32, 33, 34, 35, 36, 37
> +          "emmc_51"            "flash"            38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49
> +          "uart2"              "uart"             0, 1, 2, 3
> +          "tops_uart0_0"       "uart"             22, 23
> +          "uart2_0"            "uart"             28, 29, 30, 31
> +          "uart1_0"            "uart"             32, 33, 34, 35
> +          "uart2_1"            "uart"             32, 33, 34, 35
> +          "net_wo0_uart_txd_0" "uart"             28
> +          "net_wo1_uart_txd_0" "uart"             29
> +          "net_wo2_uart_txd_0" "uart"             30
> +          "tops_uart1_0"       "uart"             28, 29
> +          "tops_uart0_1"       "uart"             30, 31
> +          "tops_uart1_1"       "uart"             36, 37
> +          "uart0"              "uart"             55, 56
> +          "tops_uart0_2"       "uart"             55, 56
> +          "uart2_2"            "uart"             50, 51, 52, 53
> +          "uart1_1"            "uart"             58, 59, 60, 61
> +          "uart2_3"            "uart"             58, 59, 60, 61
> +          "uart1_2"            "uart"             80, 81, 82, 83
> +          "uart1_2_lite"       "uart"             80, 81
> +          "tops_uart1_2"       "uart"             80, 81
> +          "net_wo0_uart_txd_1" "uart"             80
> +          "net_wo1_uart_txd_1" "uart"             81
> +          "net_wo2_uart_txd_1" "uart"             82
> +          "udi"                "udi"              32, 33, 34, 35, 36
> +          "i2s"                "audio"            50, 51, 52, 53, 54
> +          "pcm"                "audio"            50, 51, 52, 53
> +          "gbe0_led1"          "led"              58
> +          "gbe1_led1"          "led"              59
> +          "gbe2_led1"          "led"              60
> +          "gbe3_led1"          "led"              61
> +          "2p5gbe_led1"        "led"              62
> +          "gbe0_led0"          "led"              64
> +          "gbe1_led0"          "led"              65
> +          "gbe2_led0"          "led"              66
> +          "gbe3_led0"          "led"              67
> +          "2p5gbe_led0"        "led"              68
> +          "drv_vbus_p1"        "usb"              63
> +          "drv_vbus"           "usb"              79
> +
> +        $ref: /schemas/pinctrl/pinmux-node.yaml

Put this before the description

> +        properties:
> +          function:
> +            description:
> +              A string containing the name of the function to mux to the group.
> +            enum: [audio, dfd, eth, flash, i2c, int_usxgmii, jtag, led, pcie, pmic, pwm, spi,
> +                   uart, udi, usb, watchdog]
> +          groups:
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
> +                  const: audio
> +            then:
> +              properties:
> +                groups:
> +                  enum: [i2s, pcm]
> +          - if:
> +              properties:
> +                function:
> +                  const: jtag
> +            then:
> +              properties:
> +                groups:
> +                  enum: [jtag, tops_jtag0_0, tops_jtag0_1, wo0_jtag, wo1_jtag, wo2_jtag]
> +          - if:
> +              properties:
> +                function:
> +                  const: int_usxgmii
> +            then:
> +              properties:
> +                groups:
> +                  enum: [int_usxgmii]
> +          - if:
> +              properties:
> +                function:
> +                  const: dfd
> +            then:
> +              properties:
> +                groups:
> +                  enum: [dfd]
> +          - if:
> +              properties:
> +                function:
> +                  const: flash
> +            then:
> +              properties:
> +                groups:
> +                  enum: [emmc_45, emmc_51, sdcard, snfi]
> +          - if:
> +              properties:
> +                function:
> +                  const: eth
> +            then:
> +              properties:
> +                groups:
> +                  enum: [2p5g_ext_mdio, gbe_ext_mdio, mdc_mdio0, mdc_mdio1]
> +          - if:
> +              properties:
> +                function:
> +                  const: i2c
> +            then:
> +              properties:
> +                groups:
> +                  enum: [xfi_phy0_i2c0, xfi_phy1_i2c0, xfi_phy_pll_i2c0,
> +                         xfi_phy_pll_i2c1, i2c0_0, i2c1_sfp, xfi_pextp_phy0_i2c,
> +                         xfi_pextp_phy1_i2c, i2c0_1, u30_phy_i2c0, u32_phy_i2c0,
> +                         xfi_phy0_i2c1, xfi_phy1_i2c1, xfi_phy_pll_i2c2, i2c1_0,
> +                         u30_phy_i2c1, u32_phy_i2c1, xfi_phy_pll_i2c3, sgmii0_i2c,
> +                         sgmii1_i2c, i2c1_2, i2c2_0, i2c2_1]
> +          - if:
> +              properties:
> +                function:
> +                  const: led
> +            then:
> +              properties:
> +                groups:
> +                  enum: [2p5gbe_led0, 2p5gbe_led1, gbe0_led0, gbe0_led1, gbe1_led0, gbe1_led1,
> +                         gbe2_led0, gbe2_led1, gbe3_led0, gbe3_led1, wf5g_led0, wf5g_led1]
> +          - if:
> +              properties:
> +                function:
> +                  const: pcie
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [pcie_wake_n0_0, pcie_clk_req_n0_0, pcie_wake_n3_0,
> +                           pcie_clk_req_n3, pcie_p0_phy_i2c, pcie_p1_phy_i2c,
> +                           pcie_p3_phy_i2c, pcie_p2_phy_i2c, ckm_phy_i2c,
> +                           pcie_wake_n0_1, pcie_wake_n3_1, pcie_2l_0_pereset,
> +                           pcie_1l_1_pereset, pcie_clk_req_n2_1, pcie_2l_1_pereset,
> +                           pcie_1l_0_pereset, pcie_wake_n1_0, pcie_clk_req_n1,
> +                           pcie_wake_n2_0, pcie_clk_req_n2_0, pcie_wake_n2_1,
> +                           pcie_clk_req_n0_1]
> +                  maxItems: 3
> +          - if:
> +              properties:
> +                function:
> +                  const: pmic
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [pmic]
> +                  maxItems: 1
> +          - if:
> +              properties:
> +                function:
> +                  const: pwm
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [pwm0, pwm1, pwm2, pwm3, pwm4, pwm5, pwm6, pwm7]
> +                  maxItems: 2
> +          - if:
> +              properties:
> +                function:
> +                  const: spi
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [spi0, spi0_wp_hold, spi1, spi2, spi2_wp_hold]
> +                  maxItems: 2
> +          - if:
> +              properties:
> +                function:
> +                  const: uart
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [uart2, tops_uart0_0, uart2_0, uart1_0, uart2_1,
> +                           net_wo0_uart_txd_0, net_wo1_uart_txd_0,
> +                           net_wo2_uart_txd_0, tops_uart1_0, ops_uart0_1,
> +                           ops_uart1_1, uart0, tops_uart0_2, uart1_1, uart2_3,
> +                           uart1_2, uart1_2_lite, tops_uart1_2,
> +                           net_wo0_uart_txd_1, net_wo1_uart_txd_1,
> +                           net_wo2_uart_txd_1]
> +                  maxItems: 2
> +          - if:
> +              properties:
> +                function:
> +                  const: watchdog
> +            then:
> +              properties:
> +                groups:
> +                  enum: [watchdog]
> +          - if:
> +              properties:
> +                function:
> +                  const: udi
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [udi]
> +                  maxItems: 1
> +          - if:
> +              properties:
> +                function:
> +                  const: usb
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [drv_vbus, drv_vbus_p1]
> +                  maxItems: 1
> +      '^.*conf.*$':

Really need 'conf' anywhere in the name? 

> +        type: object
> +        additionalProperties: false
> +        description:
> +          pinconf configuration nodes.
> +        $ref: /schemas/pinctrl/pincfg-node.yaml

