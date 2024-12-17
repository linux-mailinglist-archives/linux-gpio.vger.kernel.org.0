Return-Path: <linux-gpio+bounces-13966-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA6F9F4D7B
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 15:20:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6383E16E44B
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 14:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3FA11F4E36;
	Tue, 17 Dec 2024 14:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WGKhjtld"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A943D1F428B;
	Tue, 17 Dec 2024 14:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734445230; cv=none; b=kPEFqdxUvI5JGk0ee6VqhtbtmjkGyJm09FClC1bMusgZOrokCE4wjuKKydGjM6ct/Sq2jNvIyjKsTwOG1e+cJ8mt71Q764N7SAI30Ye10SA28jUw6rvGawhVn7MEd3DljxqtYSNp1GWWkWVk+BygZSnxdX2T8aOzwNXdpH/vUU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734445230; c=relaxed/simple;
	bh=1xLYQcVFD6UDieUDBsRWEFAwh5cBNG7GFvrc7tOnR0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sHf4SotuUsqHC5gALJmOb0HBSe9z1iIhtYcA+H7iQpF3QMaDBfZdpnYp5FAsXSoHBQHv1bqyNSCKoDsd0DTvkpq6MX+0P2HoGx0BRzPdDSq14ioWqe8eCoWgk2u+ym/gIqiwg7YXQQ2BaU5S4w3HT60e56cdeQhEEK2jfceiV6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WGKhjtld; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D5B0C4CEE2;
	Tue, 17 Dec 2024 14:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734445230;
	bh=1xLYQcVFD6UDieUDBsRWEFAwh5cBNG7GFvrc7tOnR0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WGKhjtldNnWXqymtnR6R9dvmW+oRDpd4hLi40LZTAMvdT2q/x+LXqUE7LzzOQalIj
	 ojFyuY7eC9WIRaY4F87BdR3wmP3i34TT3xDHrdhAQ+fJ0kFPjS40ynesx+Ze6iL3kE
	 0YeR4/kdaCtXfdyoiJjSCDZeG0RmwPWwU2lLHdY8jDZgxD1iH3jZ9nT3peBhStO5rc
	 +OlIfAIsKOAEehZchXzocDLQXnWR1irEs/3dD9iKGE7aXj5LYeGgyscT1Ag45kAtpg
	 4FognD8V77G4YTQhAIBtuuH3AUnLHqEModOLBPUkBb2hGnhX6ZGJ4Hs6nXERiYaZRG
	 hd6p11dGKGa1g==
Date: Tue, 17 Dec 2024 08:20:28 -0600
From: Rob Herring <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH RFC 1/3] dt-bindings: pinctrl: Add support for Amlogic
 SoCs
Message-ID: <20241217142028.GA1441221-robh@kernel.org>
References: <20241211-amlogic-pinctrl-v1-0-410727335119@amlogic.com>
 <20241211-amlogic-pinctrl-v1-1-410727335119@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211-amlogic-pinctrl-v1-1-410727335119@amlogic.com>

On Wed, Dec 11, 2024 at 02:47:49PM +0800, Xianwei Zhao wrote:
> Add the dt-bindings for Amlogic pin controller, and add a new
> dt-binding header file which document the GPIO bank names and
> alternative func value of all Amlogic subsequent SoCs.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../bindings/pinctrl/amlogic,pinctrl.yaml          | 150 +++++++++++++++++++++
>  include/dt-bindings/pinctrl/amlogic,pinctrl.h      |  68 ++++++++++
>  2 files changed, 218 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl.yaml
> new file mode 100644
> index 000000000000..b0c2ae585d7d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl.yaml
> @@ -0,0 +1,150 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl.yaml#
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
> +    const: amlogic,pinctrl

Only one Amlogic pinctrl block? Pretty sure there's more than 1 SoC and 
pinctrl is unlikely identical for all. This must be SoC specific.

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
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2

Why do you need these? You don't have any child nodes with addresses. 
But maybe you should?

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +patternProperties:
> +  "^gpio[a-z]":

This allows "gpioanythingyouwant" for example. If there is no 
unit-address, then it should be '^gpio-[0-9]+$'.

> +    type: object
> +
> +    properties:
> +      gpio-controller: true
> +
> +      "#gpio-cells":
> +        const: 2
> +
> +      bank-name:
> +        $ref: /schemas/types.yaml#/definitions/string

You must define values, but why do you need this? No other GPIO 
controller needs something like this.

> +
> +      npins:

We have a standard property for this: ngpios

> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 1
> +        maximum: 32
> +
> +      bank-index:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 29

Consider if 'bank' should be part of the gpio cells rather than 
separate controller nodes. That works better if each bank is not its own 
separate h/w block. If banks share a register, then that's not separate 
blocks.

> +
> +      reg-mux-offset:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +      bit-mux-offset:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +      reg-gpio-offset:
> +        $ref: /schemas/types.yaml#/definitions/uint32

Put these into 'reg'. We even have a way to deal with bit offsets. See 
leds/register-bit-led.yaml for example.


> +
> +    required:
> +      - gpio-controller
> +      - "#gpio-cells"
> +      - npins
> +      - bank-index
> +      - reg-mux-offset
> +      - reg-gpio-offset
> +      - bank-name
> +
> +    additionalProperties: false
> +    unevaluatedProperties: false

Don't need both. 'additionalProperties' is more restrictive, so drop 
unevaluatedProperties.

> +
> +  "^func-[0-9a-z]":

"^func-[0-9a-z-]+$"

> +    type: object
> +    additionalProperties:
> +      type: object
> +      allOf:
> +        - $ref: pincfg-node.yaml#
> +        - $ref: pinmux-node.yaml#
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    apb {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +      periphs_pinctrl: pinctrl@8e700 {
> +        compatible = "amlogic,pinctrl";
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        reg = <0x0 0x8e700 0x0 0x04>,
> +              <0x0 0x8e704 0x0 0x60>;
> +        reg-names = "mux", "gpio";
> +
> +        gpiob {
> +          gpio-controller;
> +          #gpio-cells = <2>;
> +          npins = <10>;
> +          bank-index = <1>;
> +          reg-mux-offset = <0x14>;
> +          bit-mux-offset = <0x14>;
> +          reg-gpio-offset = <0x30>;
> +          bank-name = "GPIOB";
> +        };
> +
> +        gpioe {
> +          gpio-controller;
> +          #gpio-cells = <2>;
> +          npins = <10>;
> +          bank-index = <5>;
> +          reg-mux-offset = <0x14>;
> +          reg-gpio-offset = <0x30>;
> +          bank-name = "GPIOE";
> +        };
> +
> +        func-uart-b {
> +          uart-b-default{
> +            pinmux = <3>;
> +            bias-pull-up;
> +            drive-strength-microamp = <4000>;
> +          };
> +
> +          uart-c-default{
> +            pinmux = <4>;
> +            bias-pull-up;
> +            drive-strength-microamp = <4000>;
> +          };
> +        };
> +
> +        func-uart-c {
> +          uart-c-default{
> +            pinmux = <3>;
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

