Return-Path: <linux-gpio+bounces-8367-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B30A193A7B6
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 21:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4578A284003
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 19:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7DC1422C2;
	Tue, 23 Jul 2024 19:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AYoOLh+7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BA813D628;
	Tue, 23 Jul 2024 19:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721763115; cv=none; b=G6wZh64VqsUDB2cHE6I28DqGfqYIbX0Gu82W2bxBfongM/IH9aexAk6TO1joL7dnDGvoGBxhcuUkAJTSLPRuYsilOrr1JiKWypC0dxyxn4bu8Be/ndgEKc4cqRVDDh94G3aFnmbI1w6g8cZl2b9IAh8d2mjMSoQaNWQVH5UL9N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721763115; c=relaxed/simple;
	bh=o1cb58zWoAaLX2YYfI9NTmLR6gYzz9BPPWEXcPeG9/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qje9mqI/eNGlUzeaHNHGZ+6mlT9JZ2Nw6zb03KY5FxeuDSm7nNdf98+8Lb45UcMnfGS3PDKxdqL9rynBFrSxgq/zb2yA/kgusoTcb5UjFWNLZY7pAXOiczfrK3vgED+d3l+6zblUgB5C7aLWCSuTkbm4YQGdNtE4L5BIhXU9kGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AYoOLh+7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9935AC4AF09;
	Tue, 23 Jul 2024 19:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721763114;
	bh=o1cb58zWoAaLX2YYfI9NTmLR6gYzz9BPPWEXcPeG9/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AYoOLh+7TYQJc8U8Br1/u5SBbyXf2UbMOJ6oyP++MfP7T4QNuGQs/LPyiFH23jOdz
	 rEIPdBPysN2nPhc3C8xtXsomq2tATsVnS7YBUGfqRpbAB5OTqOPOv95pbBonuFkhse
	 9P49cIoajoXlfCKajyjLr2+zOiZx8F9VOtupCYCZT3s1/V4Fv/ZAIt6qz/tIUvSIOi
	 H+gkxmYrS3irUhFv0UTSKuw6QJ8ZB/h/h7ESMfWyNYuGOQMTukEmisRQVcKiPfK8rG
	 X5JiIm+VpXoSMUVgGsvsfFYXP/vhvuzKA9Rdob71yF3AcoBf4sDtlNPjNxChqcmmN5
	 KbQuX9UgC/3vg==
Date: Tue, 23 Jul 2024 13:31:53 -0600
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
	Drew Fustini <dfustini@baylibre.com>, Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/7] dt-bindings: pinctrl: Add pinctrl for Sophgo
 CV1800 series SoC.
Message-ID: <20240723193153.GA992922-robh@kernel.org>
References: <IA1PR20MB49535F9918829FA524BDB02ABBA82@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953E686117C52C2B4EF35C3BBA82@IA1PR20MB4953.namprd20.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA1PR20MB4953E686117C52C2B4EF35C3BBA82@IA1PR20MB4953.namprd20.prod.outlook.com>

On Mon, Jul 22, 2024 at 09:39:20AM +0800, Inochi Amaoto wrote:
> Add pinctrl support for Sophgo CV1800 series SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>  .../pinctrl/sophgo,cv1800-pinctrl.yaml        | 129 ++++++++++++++++++
>  include/dt-bindings/pinctrl/pinctrl-cv1800b.h |  63 +++++++++
>  include/dt-bindings/pinctrl/pinctrl-cv1812h.h | 127 +++++++++++++++++
>  include/dt-bindings/pinctrl/pinctrl-cv18xx.h  |  19 +++
>  include/dt-bindings/pinctrl/pinctrl-sg2000.h  | 127 +++++++++++++++++
>  include/dt-bindings/pinctrl/pinctrl-sg2002.h  |  79 +++++++++++
>  6 files changed, 544 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv1800b.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv1812h.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv18xx.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2000.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2002.h
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
> new file mode 100644
> index 000000000000..e6bd271ad22d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
> @@ -0,0 +1,129 @@
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
> +    description: |

Don't need '|' if no formatting.

> +      A pinctrl node should contain at least one subnode representing the
> +      pinctrl groups available on the machine.
> +
> +    additionalProperties: false
> +
> +    patternProperties:
> +      '-pins$':
> +        type: object
> +        description: |
> +          Each subnode will list the pins it needs, and how they should
> +          be configured, with regard to muxer configuration, bias, input
> +          enable/disable, input schmitt trigger, slew-rate, drive strength
> +          and bus hold state. In addition, all pins in the same subnode
> +          should have the same power domain. For configuration detail,
> +          refer to https://github.com/sophgo/sophgo-doc/.
> +        $ref: /schemas/pinctrl/pincfg-node.yaml
> +
> +        properties:
> +          pinmux:
> +            description: |
> +              The list of GPIOs and their mux settings that properties in the
> +              node apply to. This should be set using the GPIOMUX or GPIOMUX2
> +              macro.
> +            $ref: /schemas/pinctrl/pinmux-node.yaml#/properties/pinmux

You already referenced this above which is the right way. Drop this 
$ref.

> +
> +          bias-pull-up:
> +            type: boolean
> +
> +          bias-pull-down:
> +            type: boolean
> +
> +          drive-strength:
> +            description: typical current when output high level, but in mA.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +
> +          drive-strength-microamp:
> +            description: typical current when output high level.

New binding, why do you need both of these properties? Use the latter.

> +
> +          input-schmitt-microvolt:
> +            description: typical threshold for schmitt trigger.

No constraints?

> +
> +          power-source:
> +            description: power supplies at X mV.
> +            enum: [ 1800, 3300 ]
> +
> +          slew-rate:
> +            description: slew rate for output buffer (0 is fast, 1 is slow)
> +            enum: [ 0, 1 ]
> +
> +          bias-bus-hold:
> +            type: boolean
> +
> +        required:
> +          - pinmux
> +          - power-source
> +
> +        additionalProperties: false
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

You can remove 'soc' node from the example. 1 cell is the default for 
examples.

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
> +                    power-source = <3300>;
> +                    slew-rate = <0>;
> +                };
> +            };
> +        };
> +    };
> +
> +...

