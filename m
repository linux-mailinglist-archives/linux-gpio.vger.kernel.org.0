Return-Path: <linux-gpio+bounces-13486-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F619E3D06
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 15:43:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2830281ECC
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 14:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F129020A5FA;
	Wed,  4 Dec 2024 14:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rNSr/yv3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A646E20A5D8;
	Wed,  4 Dec 2024 14:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733323423; cv=none; b=QzkVO+RhCdmMFuG4JlepAXPBUyHYxU9ngISZSyocIvyuoz2rR4eYgcUi+QnFe8Cn2Ylm+wOOtZjuoINbLo3mq0+1OKUs8ovwOCQ59/RVPAiXle1yFZCOA5yH5fqwlxUenA3bxkw54EFYR/amC0cyO7ZFIb//G78kd2SJWY8k1AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733323423; c=relaxed/simple;
	bh=undE9DTFHVhAQNgkdMypYeAhhRQBawi8NRp2IEnHt4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VqpmYO55YioLi2Ca1vpVR0DRGeYVX+rbMiJtkZEzJtLBTLx3vSD4xzxlOn4oXv9QG7i6429uRn2t+2yKCZRHoBBlGebqYlUR4ol0eTWewGVyDHaQLAs85jqOSgwL+kS/3qNoJOAnLrzSKgy+UNxjWTRSa4ZhHDwip3DVp5jZCqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rNSr/yv3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1679BC4CECD;
	Wed,  4 Dec 2024 14:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733323423;
	bh=undE9DTFHVhAQNgkdMypYeAhhRQBawi8NRp2IEnHt4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rNSr/yv3mj0EZ/m19i9RxOi7Nnlo/ogkCfR8bstdKVHxnpVm1srNVqcNNAT0btNi3
	 C+lK1KSh5Yg33D4Hc4e2P0mVokgOosFLtXz1Ed1AupAgTtTo9/Ru1n7qcopV/vATBM
	 qgnQokM6eCoLHQtjNutQsARREPrgLTcHrCCyBq8a0dXgEKstk5h8402MOavxy56C/S
	 UegD73F9aJ3EvvkF8FUFFemQcoFlp8ARql4eo/g469HN2u4NsVywqK4FP8qkMrh94K
	 6dHnlAeKVE7hHw9hOH+rjiXDz2gJ2wgJ54uEp7UC/ZOEfLlN3hJVUzDx+XVxtQxvj1
	 LxpalJjq4+huA==
Date: Wed, 4 Dec 2024 08:43:41 -0600
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
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 3/5] dt-bindings: pinctrl: add binding for MT7988 SoC
Message-ID: <20241204144341.GA191772-robh@kernel.org>
References: <20241202110045.22084-1-linux@fw-web.de>
 <20241202110045.22084-4-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202110045.22084-4-linux@fw-web.de>

On Mon, Dec 02, 2024 at 12:00:37PM +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This adds bindings for MT7988 pinctrl driver.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> changes in v5 (so not adding RB from Rob given in v4):
> - do not use MTK_DRIVE_8mA in example
> - add _0 functions for pwm

Minor enough to keep my R-by, but if I review it again I can always find 
more. :)

> 
> changes in v4:
> - dt-binding: pinctrl: fix dt_binding_check fixed-string error
> 
> '^mux$' should not be valid under {'pattern': '^\\^[a-zA-Z0-9,\\-._#@]+\\$$'}
> 	hint: Fixed strings belong in 'properties', not 'patternProperties'
> 
> changes in v3:
> - limit conf subnode name with optional suffix like mmc on mt7986
> - match mux subnode without wildcards
> 
> changes in v2:
> - drop gpio-cells description
> - move ref in mux subnode up
> - order uart-functions alphanumeric and fix typo
> ---
>  .../pinctrl/mediatek,mt7988-pinctrl.yaml      | 578 ++++++++++++++++++
>  1 file changed, 578 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml
> new file mode 100644
> index 000000000000..dd5584557135
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml
> @@ -0,0 +1,578 @@
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
> +    properties:
> +      'mux':

Drop quotes.


> +        type: object
> +        additionalProperties: false
> +        $ref: /schemas/pinctrl/pinmux-node.yaml
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
> +          "pwm2_0"             "pwm"              58
> +          "pwm3"               "pwm"              81
> +          "pwm3_0"             "pwm"              59
> +          "pwm4"               "pwm"              82
> +          "pwm4_0"             "pwm"              60
> +          "pwm5"               "pwm"              83
> +          "pwm5_0"             "pwm"              61
> +          "pwm6"               "pwm"              69
> +          "pwm6_0"             "pwm"              62
> +          "pwm7"               "pwm"              70
> +          "pwm7_0"             "pwm"              4
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
> +        properties:
> +          function:
> +            description:
> +              A string containing the name of the function to mux to the group.
> +            enum: [audio, dfd, eth, flash, i2c, int_usxgmii, jtag, led, pcie, pmic, pwm, spi,
> +                   uart, udi, usb, watchdog]
> +          groups:
> +            description:
> +              An array of strings. Each string contains the name of a group.

blank line

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

Use const if only 1. Elsewhere too.

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

This can be just:

groups:
  const: pmic

A few other places too.

Rob

