Return-Path: <linux-gpio+bounces-14440-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CA0A00096
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 22:24:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0BAE1629BD
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 21:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EB0A1B87CD;
	Thu,  2 Jan 2025 21:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EnkRXRqo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAAA1420A8;
	Thu,  2 Jan 2025 21:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735853064; cv=none; b=dYuAw8DRc7re+QBz9HU8K9jSYBMpo2h3k7aFCmTuWqRWUV0UlTbnUzZ98mQlUlh6DxhaENoRXCjeZzaxTwvnINSLEmxX/rebUw2c7K5S0b/PItLRpHofPxm/1LfdlhuMiXo1j/QgTmFpBJYqA6XcFdoQzUCbrKet+ZfNbTrNCNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735853064; c=relaxed/simple;
	bh=RlEMXqLIvB66KqD+ZOSG+hVombFC6wVIgl14dTaT7rI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T/BTXeIMLF1YyssvqXSWctTvq2yqIXtvR5EQmXFEEfuOaF3SN7sQUXBrZIUDLXNAWwnOaVVgOYGspf2ep658FQdMMWkZW235/OtXVzJwlcXnfNV5Q8s5iZmxF1IYkb7h63JYQJrsefYXqqcDGZjSoTcX8g73hfsIcpicFsoYk3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EnkRXRqo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 155DDC4CED0;
	Thu,  2 Jan 2025 21:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735853064;
	bh=RlEMXqLIvB66KqD+ZOSG+hVombFC6wVIgl14dTaT7rI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EnkRXRqoDOUePeSUAUnsOv219OG38AV7+P70bYG5KRKrSCxqK5bQoQmThHVmXc8rH
	 Een33mJDfwBfYbA/KtLSbeYDbinbgYgvA6YKrHVFsKlDQaaG/RP4Q5lIHIf4p8UHCy
	 q8AUIXpEYv/FnWGY1A0+Gb+AVlANkE9dIrn24pdu+ZxhU6og+cK0i0HYSxyqBrIOJF
	 5CLVpNN87U/HC6B8Gi4c2NtQgY7UMvBaNnO85r2LW4HCbP0KvLk1zvnIMQcXHqy4Up
	 1UN9Yr4SRk3a/kj+I9MD2NftuPjq0gPsqG7B31q4f14k5PYFUm5GHHSDk0xHioqs/9
	 JutsEffKxgIdw==
Date: Thu, 2 Jan 2025 15:24:22 -0600
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
Subject: Re: [PATCH v2 1/5] dt-bindings: pinctrl: Add support for Amlogic SoCs
Message-ID: <20250102212422.GA554486-robh@kernel.org>
References: <20241226-amlogic-pinctrl-v2-0-cdae42a67b76@amlogic.com>
 <20241226-amlogic-pinctrl-v2-1-cdae42a67b76@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226-amlogic-pinctrl-v2-1-cdae42a67b76@amlogic.com>

On Thu, Dec 26, 2024 at 03:57:41PM +0800, Xianwei Zhao wrote:
> Add the dt-bindings for Amlogic pin controller, and add a new
> dt-binding header file which document the GPIO bank names and
> alternative func value of all Amlogic subsequent SoCs.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       | 155 +++++++++++++++++++++
>  include/dt-bindings/pinctrl/amlogic,pinctrl.h      |  68 +++++++++
>  2 files changed, 223 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
> new file mode 100644
> index 000000000000..75863d179933
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
> @@ -0,0 +1,155 @@
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
> +  reg:
> +    minItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: mux
> +      - const: gpio
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0

The addresses in 'reg' below are MMIO, right? If so, #size-cells can't 
be 0 and you also need 'ranges' here.

> +
> +required:

Move after 'patternProperties'.

> +  - compatible
> +  - reg
> +  - reg-names
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +patternProperties:
> +  "^gpio@[0-9a-f]+$":
> +    type: object
> +
> +    properties:
> +      reg:
> +        minItems: 2

You need to describe what each entry is:

items:
  - description: foo
  - description: bar

> +
> +      mask:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +      gpio-controller: true
> +
> +      "#gpio-cells":
> +        const: 2
> +
> +      ngpios:
> +        $ref: /schemas/types.yaml#/definitions/uint32

Don't need a type here.

> +        minimum: 1
> +        maximum: 32
> +
> +      identity:

Needs a better name. This is the bank number?

But shouldn't you be able to use gpio-ranges here:

gpio-ranges = <&periphs_pinctrl 0 (bank# << 8) (value of npgios)>;

And do you really need ngpios if you have the value here?

> +        description: |
> +          identifier are provided by the pin controller header file at:
> +          <include/dt-bindings/pinctrl/amlogic,pinctrl.h>
> +
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +    required:
> +      - reg
> +      - gpio-controller
> +      - "#gpio-cells"
> +      - ngpios
> +      - identity
> +
> +    additionalProperties: false
> +
> +  "^func-[0-9a-z-]+$":
> +    type: object
> +    additionalProperties:

Define a pattern for the node names instead. We only allow anything for 
existing bindings.

> +      type: object
> +      allOf:
> +        - $ref: pincfg-node.yaml#
> +        - $ref: pinmux-node.yaml#
> +
> +      description:
> +        A pin multiplexing sub-node describes how to configure a set of (or a
> +        single) pin in some desired alternate function mode.
> +        A single sub-node may define several pin configurations.
> +
> +      properties:
> +        pinmux:
> +          description: |
> +            Integer array representing pin number and pin multiplexing
> +            configuration.
> +            When a pin has to be configured in alternate function mode, use
> +            this property to identify the pin by its global index, and provide
> +            its alternate function configuration number along with it.
> +            bank identifier are provided by the pin controller header file at:
> +            <include/dt-bindings/pinctrl/amlogic,pinctrl.h>
> +            Integers values in "pinmux" argument list are assembled as:
> +            (((BANK << 8) + PIN) << 8)  | MUX_FUNC))
> +
> +      required:
> +        - pinmux
> +
> +      additionalProperties: true

No, not allowed to be true except on common schemas.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
> +    apb {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +      periphs_pinctrl: pinctrl@8e700 {
> +        compatible = "amlogic,pinctrl-a4";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        reg = <0x0 0x8e700 0x0 0x04>,
> +              <0x0 0x8e704 0x0 0x60>;
> +        reg-names = "mux", "gpio";
> +
> +        gpio@14 {
> +          reg = <0x14>,<0x30>;
> +          gpio-controller;
> +          #gpio-cells = <2>;
> +          ngpios = <10>;
> +          identity = <AMLOGIC_GPIO_B>;
> +        };
> +
> +        func-uart-b {
> +          uart-b-default {
> +            pinmux = <AML_PINMUX(AMLOGIC_GPIO_B, 1, AF4)>;
> +            bias-pull-up;
> +            drive-strength-microamp = <4000>;
> +          };
> +
> +          uart-b-pins1 {
> +            pinmux = <AML_PINMUX(AMLOGIC_GPIO_B, 5, AF2)>;
> +            bias-pull-up;
> +            drive-strength-microamp = <4000>;
> +          };
> +        };
> +
> +        func-uart-c {
> +          uart-c-default {
> +            pinmux = <AML_PINMUX(AMLOGIC_GPIO_B, 3, AF1)>,
> +                     <AML_PINMUX(AMLOGIC_GPIO_B, 2, AF1)>;
> +            bias-pull-up;
> +            drive-strength-microamp = <4000>;
> +          };
> +        };
> +      };
> +    };
> diff --git a/include/dt-bindings/pinctrl/amlogic,pinctrl.h b/include/dt-bindings/pinctrl/amlogic,pinctrl.h
> new file mode 100644
> index 000000000000..03db0a730e8b
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/amlogic,pinctrl.h
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
> + * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
> + */
> +
> +#ifndef _DT_BINDINGS_AMLOGIC_PINCTRL_H
> +#define _DT_BINDINGS_AMLOGIC_PINCTRL_H
> +
> +/* define PIN modes */
> +#define AF0	0x0
> +#define AF1	0x1
> +#define AF2	0x2
> +#define AF3	0x3
> +#define AF4	0x4
> +#define AF5	0x5
> +#define AF6	0x6
> +#define AF7	0x7
> +#define AF8	0x8
> +#define AF9	0x9
> +#define AF10	0xa
> +#define AF11	0xb
> +#define AF12	0xc
> +#define AF13	0xd
> +#define AF14	0xe
> +#define AF15	0xf

There's no need for defines in the form "FOOn n".

> +
> +#define AML_PIN_ALT_FUNC_MASK	0xf
> +
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
> +
> +#define AML_PINMUX(bank, offset, mode)	(((((bank) << 8) + (offset)) << 8) | (mode))
> +#define AML_PINMUX_TO_BANK(pinmux)	(((pinmux) >> 16) & 0xff)
> +#define AML_PINMUX_TO_OFFSET(pinmux)	(((pinmux) >> 8) & 0xff)
> +
> +#endif /* _DT_BINDINGS_AMLOGIC_PINCTRL_H */
> 
> -- 
> 2.37.1
> 

