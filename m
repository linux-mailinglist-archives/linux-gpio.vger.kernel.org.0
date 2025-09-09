Return-Path: <linux-gpio+bounces-25778-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1325BB4A3F3
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 09:40:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A8F3541B25
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 07:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AABD93081A0;
	Tue,  9 Sep 2025 07:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UX49abhi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604953074AF;
	Tue,  9 Sep 2025 07:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757403460; cv=none; b=HeumM3zYqlD3C6OEY08EQmxIpOVnt7Eb7fhtM17imFohqPu4d07CQ3EZcztN/muE8dhECyFdb2/peJay8SkN0+sBzN8UB9fvZHNfsYcWatE7rm4U1i4u/PbW8N5HWQco0D3PmHe8P5GZkX0hcFazHNoocIDVg30Ln+6LvYM1Jwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757403460; c=relaxed/simple;
	bh=acORBv5pR0dL7OfFWOz7bIwEVi25cUViThTI06hdAIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NxUUha4LOf44ncwlYeoiG2mhnb8HUir9mzbzXrMlI3m4L9nUX2CVRU7rZdeMaYxreLQnlccqn+qvAvyYpOfckTMsqZ+TH2QwODsr+Jfz4inqwoQfCm9QkFvjtCi8CNmub4wX+uF02Ex0o7TjKqoO294+uG2M5t4hL5x2NU2H1yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UX49abhi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FAA5C4CEF4;
	Tue,  9 Sep 2025 07:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757403459;
	bh=acORBv5pR0dL7OfFWOz7bIwEVi25cUViThTI06hdAIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UX49abhitmL0DqTvMnmw2JD5Yfwhi9On6sWJ8WRknk0z7dNfTuDybQ5soyz60XSy+
	 5QZKyi+dkyjXuJik0BzNoVWYZ5lqPXdSFx6ZUtOiL6qzYTPse1g+1cgPf52nnw1W4q
	 Yf3R9fHZOYkL2PKVXDuJgqdQvvMCDKQyoo5DPFkGPqZ+V8nj2VECWY7VHik41N6YM/
	 H+W3atrzQvfUWnnzlo6if7Axjaw+Qp0A7thWODuRNJ1rGHqekmoIpHRTDswaKg0dKc
	 JK7yLPxnK7yFerWlIlXxyIIzKXZeni1YFqlxWOFvirOPb8j+YGVSzQEBl6vbuftwnQ
	 FKRXCkPb1smyQ==
Date: Tue, 9 Sep 2025 09:37:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: pinctrl: mediatek: Document MT6878 pin
 controller bindings
Message-ID: <20250909-mellow-eminent-duck-4c4619@kuoka>
References: <20250908-mt6878-pinctrl-support-v1-0-3fb78c8ab4e8@mentallysanemainliners.org>
 <20250908-mt6878-pinctrl-support-v1-1-3fb78c8ab4e8@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250908-mt6878-pinctrl-support-v1-1-3fb78c8ab4e8@mentallysanemainliners.org>

On Mon, Sep 08, 2025 at 09:17:55PM +0200, Igor Belwon wrote:
> Add device-tree bindings for the pin controller and the EINT controller
> found in the MediaTek MT6878 SoC.
> 
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---
>  .../bindings/pinctrl/mediatek,mt6878-pinctrl.yaml  |  209 ++++
>  include/dt-bindings/pinctrl/mt6878-pinfunc.h       | 1201 ++++++++++++++++++++
>  2 files changed, 1410 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6878-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6878-pinctrl.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..ecd24ab23a0c41810828ddb8827ab39c4cd3d2fc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6878-pinctrl.yaml
> @@ -0,0 +1,209 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/mediatek,mt6878-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6878 Pin Controller
> +
> +maintainers:
> +  - Igor Belwon <igor.belwon@mentallysanemainliners.org>
> +
> +description:
> +  The MediaTek MT6878 Pin controller is used to control SoC pins.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6878-pinctrl
> +
> +  reg:
> +    items:
> +      - description: pin controller base
> +      - description: bl group IO
> +      - description: bm group IO
> +      - description: br group IO
> +      - description: bl1 group IO
> +      - description: br1 group IO
> +      - description: lm group IO
> +      - description: lt group IO
> +      - description: rm group IO
> +      - description: rt group IO
> +      - description: EINT controller E block
> +      - description: EINT controller S block
> +      - description: EINT controller W block
> +      - description: EINT controller C block
> +
> +  reg-names:
> +    items:
> +      - const: base
> +      - const: bl
> +      - const: bm
> +      - const: br
> +      - const: bl1
> +      - const: br1
> +      - const: lm
> +      - const: lt
> +      - const: rm
> +      - const: rt
> +      - const: eint-e
> +      - const: eint-s
> +      - const: eint-w
> +      - const: eint-c
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    description:
> +      Number of cells in GPIO specifier. Since the generic GPIO binding is used,
> +      the amount of cells must be specified as 2. See the below mentioned gpio
> +      binding representation for description of particular cells.
> +    const: 2
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  gpio-line-names: true

How many GPIOs do you have? No limit?

> +
> +  interrupts:
> +    description: The interrupt outputs to sysirq
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
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
> +        allOf:
> +          - $ref: /schemas/pinctrl/pincfg-node.yaml
> +          - $ref: /schemas/pinctrl/pinmux-node.yaml
> +        description:
> +          A pinctrl node should contain at least one subnodes representing the
> +          pinctrl groups available on the machine. Each subnode will list the
> +          pins it needs, and how they should be configured, with regard to muxer
> +          configuration, pullups, drive strength, input enable/disable and input
> +          schmitt.
> +
> +        properties:
> +          pinmux:
> +            description:
> +              Integer array, represents gpio pin number and mux setting.
> +              Supported pin number and mux are defined as macros in
> +              arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h for this SoC.
> +
> +          drive-strength:
> +            enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +
> +          drive-strength-microamp:
> +            enum: [125, 250, 500, 1000]
> +
> +          bias-pull-down:
> +            oneOf:
> +              - type: boolean
> +              - enum: [75000, 5000]
> +                description: Pull down RSEL type resistance values (in ohms)
> +            description:
> +              For normal pull down type there is no need to specify a resistance
> +              value, hence this can be specified as a boolean property.
> +              For RSEL pull down type a resistance value (in ohms) can be added.
> +
> +          bias-pull-up:
> +            oneOf:
> +              - type: boolean
> +              - enum: [10000, 5000, 4000, 3000]
> +                description: Pull up RSEL type resistance values (in ohms)
> +            description:
> +              For normal pull up type there is no need to specify a resistance
> +              value, hence this can be specified as a boolean property.
> +              For RSEL pull up type a resistance value (in ohms) can be added.
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
> +        additionalProperties: false
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
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/pinctrl/mt65xx.h>

Why including mt65xx?

> +    #define PINMUX_GPIO0__FUNC_GPIO0 (MTK_PIN_NO(0) | 0)

I don't understand why do you need it? Didn't you have header for that?
Or you prepared for header removal (see my further comment), but then it
is just confusing.

> +    #define PINMUX_GPIO99__FUNC_SCL0 (MTK_PIN_NO(99) | 1)
> +    #define PINMUX_GPIO100__FUNC_SDA0 (MTK_PIN_NO(100) | 1)
> +
> +    pio: pinctrl@10005000 {
> +        compatible = "mediatek,mt6878-pinctrl";
> +        reg = <0x10005000 0x1000>,
> +              <0x11d10000 0x1000>,
> +              <0x11d30000 0x1000>,
> +              <0x11d40000 0x1000>,
> +              <0x11d50000 0x1000>,
> +              <0x11d60000 0x1000>,
> +              <0x11e20000 0x1000>,
> +              <0x11e30000 0x1000>,
> +              <0x11eb0000 0x1000>,
> +              <0x11ec0000 0x1000>,
> +              <0x11ce0000 0x1000>,
> +              <0x11de0000 0x1000>,
> +              <0x11e60000 0x1000>,
> +              <0x1c01e000 0x1000>;
> +        reg-names = "base", "bl", "bm", "br", "bl1", "br1",
> +                    "lm", "lt", "rm", "rt", "eint-e", "eint-s",
> +                    "eint-w", "eint-c";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&pio 0 0 220>;
> +        interrupt-controller;
> +        interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH 0>;
> +        #interrupt-cells = <2>;
> +
> +        gpio-pins {
> +            pins {
> +                pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
> +                bias-pull-up = <4000>;
> +                drive-strength = <6>;
> +            };
> +        };
> +
> +        i2c0-pins {
> +            pins-bus {
> +                pinmux = <PINMUX_GPIO99__FUNC_SCL0>,
> +                         <PINMUX_GPIO100__FUNC_SDA0>;
> +                bias-pull-down = <75000>;
> +                drive-strength-microamp = <1000>;
> +            };
> +        };
> +    };
> diff --git a/include/dt-bindings/pinctrl/mt6878-pinfunc.h b/include/dt-bindings/pinctrl/mt6878-pinfunc.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..4e8e475a74549b513ac7075ac2ef0fe6f7f1d097
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/mt6878-pinfunc.h

This is now in DTS.

> @@ -0,0 +1,1201 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Otherwise wrong license and wrong filename (vendor prefix, filename
matching binding).

Best regards,
Krzysztof


