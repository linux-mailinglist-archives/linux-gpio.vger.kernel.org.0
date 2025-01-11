Return-Path: <linux-gpio+bounces-14680-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8E2A0A260
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jan 2025 10:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2E297A3080
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jan 2025 09:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2729A1885B4;
	Sat, 11 Jan 2025 09:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JB8uxI4f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB40185920;
	Sat, 11 Jan 2025 09:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736588480; cv=none; b=o424MQs8XYgJXw6yQxc614obK6yBYYvRtmpA2rVJ0vzOzUK+TC3WasLauH7QGa7UV1SveCpFzw1AvjhkbJyq7ZoswWtgac4qeJZJBNf5kRiBjKVlMUaHsRjwChwfeEXTLBFqGNmBykot2Ow5snGnjDOwfbhep9KQK4TYdJ6dfcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736588480; c=relaxed/simple;
	bh=N2CiOKl4IO7VYA0htePZV6dQy45186pHAoS2+zEndyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bRZGT063+BKCurcmAVrkIYs/6sUMqC1HFXiZM14zocwL7IuXuIjWXbd/zTWZauOBs6F3z60WIE28V7tN9Y9KDZmu0QU8aTK1UHYgad+M4gYYwMJdX26oOebJtwlOZ6h79fZVrF0AVfKXtmKxHKE3OPV+kOLXEGlzhnLl+kWmmKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JB8uxI4f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84F75C4CED2;
	Sat, 11 Jan 2025 09:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736588480;
	bh=N2CiOKl4IO7VYA0htePZV6dQy45186pHAoS2+zEndyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JB8uxI4fL6BuzX4kp/L0rMg5AOp7YyL7Mhx0P7zggTV00JqJhkNBUEomUB/YKeeeR
	 cbnmiezAeb2+52k6SJXWLmoMW0CFF3UWyCGAROdDKUaWOa/N7OpVAiiJRagflEzdjk
	 e6DUwOtDZSIRblUgTJl2ghCHnyi/cah9nt8o/E/7u76ldJJvOGK+IfKc5qMoSl8tkL
	 H5zB6zrEtkG7meoOiHjyBrS96cBzw/02J3PY80jtTGsBrW5x8NpffpzV4AmBx4wTss
	 qvtDM2ePDGf1qj+3i+RxBSU2kzMzcw2eLh5cOXSbDP1zcSs1tQAi3+f1a9cBpF2QS1
	 c6WlqQBMyRxCw==
Date: Sat, 11 Jan 2025 10:41:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, Lei Xue <lei.xue@mediatek.com>, 
	wenbin.mei@mediatek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Guodong Liu <guodong.liu@mediatek.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: mediatek: add support for
 mt8196
Message-ID: <dnjtaapqbn6zy55k5ky7zltswkbg7cjh2xwlnrmqdiz7tfm6rc@wbepc5koem6e>
References: <20250110104703.13625-1-ot_cathy.xu@mediatek.com>
 <20250110104703.13625-2-ot_cathy.xu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250110104703.13625-2-ot_cathy.xu@mediatek.com>

On Fri, Jan 10, 2025 at 06:42:28PM +0800, Cathy Xu wrote:
> 1.Add pinctrl file on MediaTek mt8196.

Where? What is pinctrl file?

> 2.Add the new binding document for pinctrl on MediaTek mt8196.

Look at git history how commit msgs are written for such changes.

> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>
> ---
>  .../pinctrl/mediatek,mt8196-pinctrl.yaml      |  266 +++
>  include/dt-bindings/pinctrl/mt8196-pinfunc.h  | 1572 +++++++++++++++++
>  2 files changed, 1838 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/mt8196-pinfunc.h
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
> new file mode 100644
> index 000000000000..abeb0d942cc4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
> @@ -0,0 +1,266 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/mediatek,mt8196-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8196 Pin Controller
> +
> +maintainers:
> +  - Lei Xue <lei.xue@mediatek.com>
> +  - Cathy Xu <ot_cathy.xu@mediatek.com>
> +
> +description:
> +  The MediaTek's MT8196 Pin controller is used to control SoC pins.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8196-pinctrl
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    description:
> +      Number of cells in GPIO specifier, should be two. The first cell is the
> +      pin number, the second cell is used to specify optional parameters which
> +      are defined in <dt-bindings/gpio/gpio.h>.
> +    const: 2
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  gpio-line-names: true
> +
> +  reg:
> +    items:
> +      - description: gpio registers base address
> +      - description: rt group io configuration registers base address
> +      - description: rm1 group io configuration registers base address
> +      - description: rm2 group io configuration registers base address
> +      - description: rb group io configuration registers base address
> +      - description: bm1 group io configuration registers base address
> +      - description: bm2 group io configuration registers base address
> +      - description: bm3 group io configuration registers base address
> +      - description: lt group io configuration registers base address
> +      - description: lm1 group io configuration registers base address
> +      - description: lm2 group io configuration registers base address
> +      - description: lb1 group io configuration registers base address
> +      - description: lb2 group io configuration registers base address
> +      - description: tm1 group io configuration registers base address
> +      - description: tm2 group io configuration registers base address
> +      - description: tm3 group io configuration registers base address
> +
> +  reg-names:
> +    items:
> +      - const: iocfg0
> +      - const: iocfg_rt
> +      - const: iocfg_rm1
> +      - const: iocfg_rm2
> +      - const: iocfg_rb
> +      - const: iocfg_bm1
> +      - const: iocfg_bm2
> +      - const: iocfg_bm3
> +      - const: iocfg_lt
> +      - const: iocfg_lm1
> +      - const: iocfg_lm2
> +      - const: iocfg_lb1
> +      - const: iocfg_lb2
> +      - const: iocfg_tm1
> +      - const: iocfg_tm2
> +      - const: iocfg_tm3

Are you sure these are separate address spaces?

> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  interrupts:
> +    description: The interrupt outputs to sysirq.
> +    maxItems: 1
> +
> +  mediatek,rsel-resistance-in-si-unit:
> +    type: boolean
> +    description:
> +      We provide two methods to select the resistance for I2C when pull up or
> +      pull down. The first is by RSEL definition value, another one is by
> +      resistance value(ohm). This flag is used to identify if the method is
> +      resistance(si unit) value.

What is the point of choosing it? This is one hardware, one SoC, so how
different boards can have different units? No, just use Ohms

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
> +              defined as macros in dt-bindings/pinctrl/mt8196-pinfunc.h
> +              directly, for this SoC.
> +
> +          drive-strength:
> +            enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +
> +          drive-strength-microamp:
> +            enum: [125, 250, 500, 1000]

Why duplicating properties? No, use only one.

> +
> +          bias-pull-down:
> +            oneOf:
> +              - type: boolean
> +              - enum: [100, 101, 102, 103]
> +                description: mt8196 pull down PUPD/R0/R1 type define value.
> +              - enum: [200, 201, 202, 203, 204, 205, 206, 207]
> +                description: mt8196 pull down RSEL type define value.
> +              - enum: [75000, 5000]
> +                description: mt8196 pull down RSEL type si unit value(ohm).
> +            description: |
> +              For pull down type is normal, it doesn't need add RSEL & R1R0
> +              define and resistance value.
> +              For pull down type is PUPD/R0/R1 type, it can add R1R0 define to
> +              set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
> +              "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" &
> +              "MTK_PUPD_SET_R1R0_11" define in mt8196.
> +              For pull down type is RSEL, it can add RSEL define & resistance
> +              value(ohm) to set different resistance by identifying property
> +              "mediatek,rsel-resistance-in-si-unit". It can support
> +              "MTK_PULL_SET_RSEL_000" & "MTK_PULL_SET_RSEL_001" &
> +              "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" &
> +              "MTK_PULL_SET_RSEL_100" & "MTK_PULL_SET_RSEL_101" &
> +              "MTK_PULL_SET_RSEL_110" & "MTK_PULL_SET_RSEL_111" define in
> +              mt8196. It can also support resistance value(ohm) "75000" & "5000"
> +              in mt8196.
> +
> +          bias-pull-up:
> +            oneOf:
> +              - type: boolean
> +              - enum: [100, 101, 102, 103]
> +                description: mt8196 pull up PUPD/R0/R1 type define value.
> +              - enum: [200, 201, 202, 203, 204, 205, 206, 207]
> +                description: mt8196 pull up RSEL type define value.
> +              - enum: [1000, 1500, 2000, 3000, 4000, 5000, 10000, 75000]
> +                description: mt8196 pull up RSEL type si unit value(ohm).

Same problems.

> +++ b/include/dt-bindings/pinctrl/mt8196-pinfunc.h
> @@ -0,0 +1,1572 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Copyright (C) 2025 Mediatek Inc.
> + * Author: Guodong Liu <Guodong.Liu@mediatek.com>
> + */
> +
> +#ifndef __MT8196_PINFUNC_H
> +#define __MT8196_PINFUNC_H
> +
> +#include <dt-bindings/pinctrl/mt65xx.h>
> +
> +#define PINMUX_GPIO0__FUNC_GPIO0 (MTK_PIN_NO(0) | 0)
> +#define PINMUX_GPIO0__FUNC_DMIC1_CLK (MTK_PIN_NO(0) | 1)
> +#define PINMUX_GPIO0__FUNC_SPI3_A_MO (MTK_PIN_NO(0) | 3)
> +#define PINMUX_GPIO0__FUNC_FMI2S_B_LRCK (MTK_PIN_NO(0) | 4)
> +#define PINMUX_GPIO0__FUNC_SCP_DMIC1_CLK (MTK_PIN_NO(0) | 5)
> +#define PINMUX_GPIO0__FUNC_TP_GPIO14_AO (MTK_PIN_NO(0) | 6)

You got comment, so respond to it. Sending the same and expecting
different results is fast way to get a grumpy response.

Best regards,
Krzysztof


