Return-Path: <linux-gpio+bounces-21068-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D45EACF75C
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 20:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D1CF3A7B0D
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 18:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C475C1F099A;
	Thu,  5 Jun 2025 18:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DAx7zZ2z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7893E27815C;
	Thu,  5 Jun 2025 18:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749149054; cv=none; b=VohKSjU+NsUdSxpOqDmiGDA06J0ELPx552XNl5S8D34g31eM2JPA46v7wlRDzQ/aKM17yWTwuirWmeIGhVnadhj7BMpH0wEGlStjkwX14ILvZ1diQiG9GHwoiQFLGCpoGz+rzB4hYfIlXBgBoaSwWRbNGTfSi9U+K8rQU7HMsIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749149054; c=relaxed/simple;
	bh=bEQdqqelxFOfgPdgwAjMqHZfbmoLj4Z9zYDJHIPb7Ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QUMfNsQj5LIN0y/8XLI6h1ro70OlV3wfpjtSrHdcSVUqxDGYxgfVBirPB6deUN5S+sDLv/bn0ejqMn7pevbHQs2wn5C0Ak4SKZC0oH0xArejdFIGAH5diMe6Dp4TYtbQCNTZSmbSJdBBSn3WeTzQTCc/y91TQUq352xZUUjuxEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DAx7zZ2z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2758C4CEE7;
	Thu,  5 Jun 2025 18:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749149054;
	bh=bEQdqqelxFOfgPdgwAjMqHZfbmoLj4Z9zYDJHIPb7Ik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DAx7zZ2zFmy/ZHzLefriaEuQsJMdHTmSVIvLTWvKkZmelubY5uo5/btLlT0oOeTVa
	 oywkCtxRv08aByDdgz6rWAuig7nYWH4bykUBX7in/Le1WlAOao0INmSIFc1jmMZcLf
	 hbeKL4/z8NG13SQGj2CRgMLvErDBxKbn5wuJTr5YhNyg/dCAUFhKQ7u4Xf+H6JwXEE
	 VEz6SE800fbVd9oz+5gK5ixgMPRRRyKBz3QZivMZbJFNTX2hDrjHxniV2KPQlnWrc2
	 jiMJZVJWLWde6VaWqb9Yl9KlTaguObxIznSqC1FW6yOLT2Ue4ZdDyYyJtUFA+kQJRM
	 J8oQrAJ8lRXHg==
Date: Thu, 5 Jun 2025 13:44:11 -0500
From: Rob Herring <robh@kernel.org>
To: Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@kernel.org>, Lei Xue <lei.xue@mediatek.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Yong Mao <yong.mao@mediatek.com>,
	Wenbin Mei <Wenbin.Mei@mediatek.com>,
	Axe Yang <Axe.Yang@mediatek.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: mediatek: Add support for
 mt8189
Message-ID: <20250605184411.GA3015566-robh@kernel.org>
References: <20250523094319.10377-1-ot_cathy.xu@mediatek.com>
 <20250523094319.10377-2-ot_cathy.xu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523094319.10377-2-ot_cathy.xu@mediatek.com>

On Fri, May 23, 2025 at 05:42:46PM +0800, Cathy Xu wrote:
> Add the new binding document for pinctrl on MediaTek mt8189.
> 
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>
> ---
>  .../pinctrl/mediatek,mt8189-pinctrl.yaml      | 217 ++++++++++++++++++
>  1 file changed, 217 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8189-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8189-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8189-pinctrl.yaml
> new file mode 100644
> index 000000000000..43b6f15efad8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8189-pinctrl.yaml
> @@ -0,0 +1,217 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/mediatek,mt8189-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8189 Pin Controller
> +
> +maintainers:
> +  - Lei Xue <lei.xue@mediatek.com>
> +  - Cathy Xu <ot_cathy.xu@mediatek.com>
> +
> +description:
> +  The MediaTek's MT8189 Pin controller is used to control SoC pins.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8189-pinctrl
> +
> +  reg:
> +    items:
> +      - description: gpio base
> +      - description: lm group IO
> +      - description: rb0 group IO
> +      - description: rb1 group IO
> +      - description: bm0 group IO
> +      - description: bm1 group IO
> +      - description: bm2 group IO
> +      - description: lt0 group IO
> +      - description: lt1 group IO
> +      - description: rt group IO
> +      - description: eint0 group IO
> +      - description: eint1 group IO
> +      - description: eint2 group IO
> +      - description: eint3 group IO
> +      - description: eint4 group IO
> +
> +  reg-names:
> +    items:
> +      - const: base
> +      - const: lm
> +      - const: rb0
> +      - const: rb1
> +      - const: bm0
> +      - const: bm1
> +      - const: bm2
> +      - const: lt0
> +      - const: lt1
> +      - const: rt
> +      - const: eint0
> +      - const: eint1
> +      - const: eint2
> +      - const: eint3
> +      - const: eint4
> +
> +  interrupts:
> +    description: The interrupt outputs to sysirq.

Drop

> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    description:
> +      Number of cells in GPIO specifier, should be two. The first cell is the
> +      pin number, the second cell is used to specify optional parameters which
> +      are defined in <dt-bindings/gpio/gpio.h>.

Drop the 1st sentence.

> +    const: 2
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  gpio-line-names: true
> +
> +# PIN CONFIGURATION NODES
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    additionalProperties: false
> +
> +    patternProperties:
> +      '^pins':
> +        type: object
> +        $ref: /schemas/pinctrl/pincfg-node.yaml
> +        additionalProperties: false
> +        description:
> +          A pinctrl node should contain at least one subnode representing the
> +          pinctrl groups available on the machine. Each subnode will list the
> +          pins it needs, and how they should be configured, with regard to muxer
> +          configuration, pullups, drive strength, input enable/disable and input
> +          schmitt.
> +
> +        properties:
> +          pinmux:
> +            description:
> +              Integer array, represents gpio pin number and mux setting.
> +              Supported pin number and mux varies for different SoCs, and are
> +              defined as macros in arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h
> +              directly, for this SoC.
> +
> +          drive-strength:
> +            enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +
> +          bias-pull-down:
> +            oneOf:
> +              - type: boolean
> +              - enum: [100, 101, 102, 103]
> +                description: mt8189 pull down PUPD/R0/R1 type define value.
> +              - enum: [75000, 5000]
> +                description: mt8189 pull down RSEL type si unit value(ohm).
> +            description: |
> +              For pull down type is normal, it doesn't need add R1R0 define
> +              and resistance value.

blank line between paragraphs or re-wrap the text.

> +              For pull down type is PUPD/R0/R1 type, it can add R1R0 define to
> +              set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
> +              "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" &
> +              "MTK_PUPD_SET_R1R0_11" define in mt8189.
> +              For pull down type is PD/RSEL, it can add resistance value(ohm)
> +              to set different resistance by identifying property
> +              "mediatek,rsel-resistance-in-si-unit". It can support resistance
> +              value(ohm) "75000" & "5000" in mt8189.

No need to repeat values the schema says.

> +
> +          bias-pull-up:
> +            oneOf:
> +              - type: boolean
> +              - enum: [100, 101, 102, 103]
> +                description: mt8189 pull up PUPD/R0/R1 type define value.
> +              - enum: [1000, 1500, 2000, 3000, 4000, 5000, 75000]
> +                description: mt8189 pull up RSEL type si unit value(ohm).
> +            description: |
> +              For pull up type is normal, it don't need add R1R0 define
> +              and resistance value.
> +              For pull up type is PUPD/R0/R1 type, it can add R1R0 define to
> +              set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
> +              "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" &
> +              "MTK_PUPD_SET_R1R0_11" define in mt8189.
> +              For pull up type is PU/RSEL, it can add resistance value(ohm)
> +              to set different resistance by identifying property
> +              "mediatek,rsel-resistance-in-si-unit". It can support resistance
> +              value(ohm) "1000" & "1500" & "2000" & "3000" & "4000" & "5000" &
> +              "75000" in mt8189.

No need to repeat values the schema says.

> +
> +          bias-disable: true
> +
> +          output-high: true
> +
> +          output-low: true
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
> +          - pinmux
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - gpio-ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/pinctrl/mt65xx.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #define PINMUX_GPIO51__FUNC_SCL0 (MTK_PIN_NO(51) | 2)
> +    #define PINMUX_GPIO52__FUNC_SDA0 (MTK_PIN_NO(52) | 2)
> +
> +    pio: pinctrl@10005000 {
> +        compatible = "mediatek,mt8189-pinctrl";
> +        reg = <0x10005000 0x1000>,
> +              <0x11b50000 0x1000>,
> +              <0x11c50000 0x1000>,
> +              <0x11c60000 0x1000>,
> +              <0x11d20000 0x1000>,
> +              <0x11d30000 0x1000>,
> +              <0x11d40000 0x1000>,
> +              <0x11e20000 0x1000>,
> +              <0x11e30000 0x1000>,
> +              <0x11f20000 0x1000>,
> +              <0x11ce0000 0x1000>,
> +              <0x11de0000 0x1000>,
> +              <0x11e60000 0x1000>,
> +              <0x1c01e000 0x1000>,
> +              <0x11f00000 0x1000>;
> +        reg-names = "base", "lm", "rb0", "rb1", "bm0" , "bm1",
> +                    "bm2", "lt0", "lt1", "rt", "eint0", "eint1",
> +                    "eint2", "eint3", "eint4";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&pio 0 0 182>;
> +        interrupt-controller;
> +        interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH 0>;
> +        #interrupt-cells = <2>;
> +
> +        i2c0-pins {
> +            pins {
> +                pinmux = <PINMUX_GPIO51__FUNC_SCL0>,
> +                         <PINMUX_GPIO52__FUNC_SDA0>;
> +                bias-disable;
> +            };
> +        };
> +    };
> -- 
> 2.45.2
> 

