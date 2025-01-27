Return-Path: <linux-gpio+bounces-15075-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 06821A1DC58
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jan 2025 19:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D5B11881EB9
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jan 2025 18:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF95F18A943;
	Mon, 27 Jan 2025 18:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n2GuMsTJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9610CDF59;
	Mon, 27 Jan 2025 18:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738004382; cv=none; b=tSsaVPLPNqqoXsQ/td6/BmIddu8vkejKxGOcmxgDGtaL1cVgmAZqAbFncvmMiBcWaHZnLOshHDXV6dJeoD0hF5hKqy/8xZ9K0VCs645VVhKse0jl7Zq3Ubqdp3iuaAZkm4gD3h5fPAhpVlU19lZH0co/9dLUw85PWOVoj3XXAoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738004382; c=relaxed/simple;
	bh=AT2ZxPgXT3E2xTLKhdLn/GaF61LTdzus5efSC1f26Ec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOAIZXsM9/+yDcbs+IKF9FKvIAtFCVZU5PVRKjhDN2IqpOZi0c6O2I2EUyVzS9YgJsXcdQID9SDFNSeXqfP8tA1wGZr0d1y0lFuCc3T812qTLpvrgAqMSZdi/Giopjxo/dqNgLE1rIuq6gXIcp+/Antwo/+QE75LGHowcjnqoZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n2GuMsTJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E06F4C4CEE0;
	Mon, 27 Jan 2025 18:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738004381;
	bh=AT2ZxPgXT3E2xTLKhdLn/GaF61LTdzus5efSC1f26Ec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n2GuMsTJaSw9Mfj2FiENWbgqSZ3wVfIMQVmbhkHkNsb4TkeGqalzHollxY5Po4kFl
	 zR/58oZx75I0QDtGdU8SnurUP3wh+ZxKX0TSeE3UpXkUQ6/HolK2IkCQzbcOSsaeyk
	 BL9WaFgF4rYqdorlvRYcMXpXp3xUS80VJnZf0s1gPya+S36lOItgt7kqKok2wkEWRH
	 prvblDTG1V5kOjWoPBWwun9/gnwm6tp1Ocqw/pSLzBE5b6x9C4aQkIahwLeMzgXXfv
	 Ft1Z46PiuEm9Hc72XP1kVd4F9ol0tet1H6N53hascvHxfGWRPntgNUWLaXLNfA/PU2
	 Zge4E+02FFkog==
Date: Mon, 27 Jan 2025 12:59:39 -0600
From: Rob Herring <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 1/5] dt-bindings: pinctrl: Add support for Amlogic SoCs
Message-ID: <20250127185939.GA612868-robh@kernel.org>
References: <20250122-amlogic-pinctrl-v4-0-4677b2e18ff1@amlogic.com>
 <20250122-amlogic-pinctrl-v4-1-4677b2e18ff1@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122-amlogic-pinctrl-v4-1-4677b2e18ff1@amlogic.com>

On Wed, Jan 22, 2025 at 11:25:59AM +0800, Xianwei Zhao wrote:
> Add the dt-bindings for Amlogic pin controller, and add a new
> dt-binding header file which document the GPIO bank names of
> all Amlogic subsequent SoCs.

Did you mean 'all subsequent Amlogic SoCs'? How can you know that? 
Future SoCs may be different.

Update the subject to say this is for A4 SoC.

> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       | 127 +++++++++++++++++++++
>  include/dt-bindings/pinctrl/amlogic,pinctrl.h      |  46 ++++++++
>  2 files changed, 173 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
> new file mode 100644
> index 000000000000..c4fdcd69bbf5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
> @@ -0,0 +1,127 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-a4.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic pinmux controller
> +
> +maintainers:
> +  - Xianwei Zhao <xianwei.zhao@amlogic.com>
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +properties:
> +  compatible:
> +    const: amlogic,pinctrl-a4
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2

Do you really need 2^64 address space to define the GPIO nodes?

> +
> +  ranges: true
> +
> +patternProperties:
> +  "^gpio@[0-9a-f]+$":
> +    type: object
> +
> +    properties:
> +      reg:
> +        minItems: 1
> +        items:
> +          - description: pin config register
> +          - description: pin mux setting register (some special pin fixed function)
> +          - description: pin drive strength register (optional)
> +
> +      reg-names:
> +        minItems: 1
> +        items:
> +          - const: gpio
> +          - const: mux
> +          - const: ds
> +
> +      gpio-controller: true
> +
> +      "#gpio-cells":
> +        const: 2
> +
> +      gpio-ranges:
> +        maxItems: 1
> +
> +    required:
> +      - reg
> +      - reg-names
> +      - gpio-controller
> +      - "#gpio-cells"
> +      - gpio-ranges
> +
> +    additionalProperties: false

Move this above 'properties'

> +
> +  "^func-[0-9a-z-]+$":
> +    type: object
> +    patternProperties:
> +      "^group-[0-9a-z-]+$":
> +        type: object
> +        allOf:
> +          - $ref: /schemas/pinctrl/pincfg-node.yaml
> +          - $ref: /schemas/pinctrl/pinmux-node.yaml
> +
> +        required:
> +          - pinmux
> +    additionalProperties: false

Move this above 'patternProperties'

> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
> +    apb {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +      periphs_pinctrl: pinctrl {
> +        compatible = "amlogic,pinctrl-a4";
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        ranges;
> +
> +        gpio@14 {
> +          reg = <0 0x14 0 0x10>, <0 0x14 0 0x10>;

Both registers at the same address? I hope that's a typo.

> +          reg-names = "gpio", "mux";
> +          gpio-controller;
> +          #gpio-cells = <2>;
> +          gpio-ranges = <&periphs_pinctrl 0 8 10>;
> +        };
> +
> +        func-uart-b {
> +          group-default {
> +            pinmux = <AML_PINMUX(AMLOGIC_GPIO_B, 1, 4)>;
> +            bias-pull-up;
> +            drive-strength-microamp = <4000>;
> +          };
> +
> +          group-pins1 {
> +            pinmux = <AML_PINMUX(AMLOGIC_GPIO_B, 5, 2)>;
> +            bias-pull-up;
> +            drive-strength-microamp = <4000>;
> +          };
> +        };
> +
> +        func-uart-c {
> +          group-default {
> +            pinmux = <AML_PINMUX(AMLOGIC_GPIO_B, 3, 1)>,
> +                     <AML_PINMUX(AMLOGIC_GPIO_B, 2, 1)>;
> +            bias-pull-up;
> +            drive-strength-microamp = <4000>;
> +          };
> +        };
> +      };
> +    };
> diff --git a/include/dt-bindings/pinctrl/amlogic,pinctrl.h b/include/dt-bindings/pinctrl/amlogic,pinctrl.h
> new file mode 100644
> index 000000000000..7d40aecc7147
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/amlogic,pinctrl.h
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
> + * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
> + */
> +
> +#ifndef _DT_BINDINGS_AMLOGIC_PINCTRL_H
> +#define _DT_BINDINGS_AMLOGIC_PINCTRL_H
> +/* Normal PIN bank */
> +#define AMLOGIC_GPIO_A		0
> +#define AMLOGIC_GPIO_B		1
> +#define AMLOGIC_GPIO_C		2
> +#define AMLOGIC_GPIO_D		3
> +#define AMLOGIC_GPIO_E		4
> +#define AMLOGIC_GPIO_F		5
> +#define AMLOGIC_GPIO_G		6
> +#define AMLOGIC_GPIO_H		7
> +#define AMLOGIC_GPIO_I		8
> +#define AMLOGIC_GPIO_J		9
> +#define AMLOGIC_GPIO_K		10
> +#define AMLOGIC_GPIO_L		11
> +#define AMLOGIC_GPIO_M		12
> +#define AMLOGIC_GPIO_N		13
> +#define AMLOGIC_GPIO_O		14
> +#define AMLOGIC_GPIO_P		15
> +#define AMLOGIC_GPIO_Q		16
> +#define AMLOGIC_GPIO_R		17
> +#define AMLOGIC_GPIO_S		18
> +#define AMLOGIC_GPIO_T		19
> +#define AMLOGIC_GPIO_U		20
> +#define AMLOGIC_GPIO_V		21
> +#define AMLOGIC_GPIO_W		22
> +#define AMLOGIC_GPIO_X		23
> +#define AMLOGIC_GPIO_Y		24
> +#define AMLOGIC_GPIO_Z		25
> +
> +/* Special PIN bank */
> +#define AMLOGIC_GPIO_DV		26
> +#define AMLOGIC_GPIO_AO		27
> +#define AMLOGIC_GPIO_CC		28
> +#define AMLOGIC_GPIO_TEST_N	29
> +#define AMLOGIC_GPIO_ANALOG	30
> +
> +#define AML_PINMUX(bank, offset, mode)	(((((bank) << 8) + (offset)) << 8) | (mode))
> +
> +#endif /* _DT_BINDINGS_AMLOGIC_PINCTRL_H */
> 
> -- 
> 2.37.1
> 

