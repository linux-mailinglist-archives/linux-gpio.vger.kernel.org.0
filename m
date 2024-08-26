Return-Path: <linux-gpio+bounces-9162-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9C895ECD6
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 11:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C08F91C217A0
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 09:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC05140394;
	Mon, 26 Aug 2024 09:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F35EmqxP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FB581741;
	Mon, 26 Aug 2024 09:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724663678; cv=none; b=DTKVvBzYev5jzu0WjNX0cuoJN7uYHDZJb8Armmgcxjmv7brWwPajfBhxHxDJYBFm84/2wsuIAIGhASikjMQZbMeEXbWHS6XI4u6AHKiOJ3vOQQUzCnX7Rtpttd1KmhQR9LqVHMke/3rq9iJeNBzqQ7n6d0RcornKkQuPfsFJaYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724663678; c=relaxed/simple;
	bh=T7ZMM1P/hnMFEVwCgFJ+HZgpisRxLInWGpOPm8xAX98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GEJBO6i7JxDDmyAiJAgLWx6CxeaDQbEk9BZDdOVzIpwomFebm0RCwO004iX73pBeLO431piREqJnynX+EqXs0HIxMCj3PIVqma81wQAMYwW+lDxHIF9OkmXkY4bwnGye8QSc4b7v0rn9OvcS59O3bgMXfTl9ooeu8+OAa01frec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F35EmqxP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52174C4E68D;
	Mon, 26 Aug 2024 09:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724663678;
	bh=T7ZMM1P/hnMFEVwCgFJ+HZgpisRxLInWGpOPm8xAX98=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F35EmqxPd1MucrVHyrxBTMufKcrk5ExKxaXUeSpd6uFKtR1I29c7axaHezMRj284h
	 p7BZKKUc5GOPk4X626kPjRNTRPLEzOtQ/X9fPzOgXdf229raxpsaKBcdULemJwFTRF
	 YTQo9mg4bNcBzyDZth5a1jmkeuhQq7GE0eVkmGS3R0TM3CTZ2A/Hp4TWmtBRMPsJiy
	 MzeBCNLth6yRyVTnilMguwFr8XAZsMm5Og9x9+QKAw6GiHKJqfJEHFBfizZGgKOgBT
	 xjGgJzdJlKsOEmWfuw9gUGvkVIQNJvjZULmc6SOjkKnQ/gMTdVfD/ih+J+5hF8NEvM
	 9+w3h9sVwxeXg==
Message-ID: <86f2adb0-3b35-431f-a9df-3c9c049628ae@kernel.org>
Date: Mon, 26 Aug 2024 11:14:28 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: gpio: add schema for NXP S32G2/S32G3
 SoCs
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>, Phu Luu An <phu.luuan@nxp.com>
References: <20240826084214.2368673-1-andrei.stefanescu@oss.nxp.com>
 <20240826084214.2368673-2-andrei.stefanescu@oss.nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <20240826084214.2368673-2-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/08/2024 10:42, Andrei Stefanescu wrote:
> Add the DT schema for the GPIO driver of the NXP S32G2/S32G3 SoCs.
> 

A nit, subject: drop second/last, redundant "schema". The "dt-bindings"
prefix is already stating that these are bindings/schema.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> ---
>  .../bindings/gpio/nxp,gpio-siul2-s32g2.yaml   | 134 ++++++++++++++++++
>  1 file changed, 134 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/nxp,gpio-siul2-s32g2.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/nxp,gpio-siul2-s32g2.yaml b/Documentation/devicetree/bindings/gpio/nxp,gpio-siul2-s32g2.yaml
> new file mode 100644
> index 000000000000..fba41a18d4c8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/nxp,gpio-siul2-s32g2.yaml

Filename matching compatible.

> @@ -0,0 +1,134 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause
> +# Copyright 2024 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/nxp,gpio-siul2-s32g2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP S32G2 SIUL2 GPIO controller
> +
> +maintainers:
> +  - Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> +  - Larisa Grigore <larisa.grigore@nxp.com>
> +  - Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.


> +  Support for the SIUL2 GPIOs found on the S32G2 and S32G3
> +  chips. It includes an IRQ controller for all pins which have
> +  an EIRQ associated.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: nxp,s32g2-siul2-gpio
> +
> +  reg:
> +    description: |
> +      A list of register regions for configuring interrupts,
> +      GPIO output values and reading GPIO input values.

Drop description, obvious. It cannot be anything else.

> +    items:
> +      - description: PGPDO (output value) registers for SIUL2_0
> +      - description: PGPDO (output value) registers for SIUL2_1
> +      - description: PGPDI (input value) registers for SIUL2_0
> +      - description: PGPDI (input value) registers for SIUL2_1
> +      - description: EIRQ (interrupt) configuration registers from SIUL2_1
> +      - description: EIRQ IMCR registers for interrupt muxing between pads
> +
> +  reg-names:
> +    items:
> +      - const: opads0
> +      - const: opads1
> +      - const: ipads0
> +      - const: ipads1
> +      - const: eirqs
> +      - const: eirq-imcrs
> +
> +  interrupts:
> +    description:
> +      The port interrupt shared by all 32 EIRQs.

Missing items. Look at existing examples. There is no code like this.

> +
> +  gpio-controller:
> +    description:
> +      Marks the device node as a gpio controller

Drop description, obvious.

> +
> +  "#gpio-cells":
> +    description: |
> +      Should be two. The first cell is the pin number and
> +      the second cell is used to specify the gpio polarity
> +      0 = active high
> +      1 = active low

This binding is nowhere near what we have in kernel. Please do not
re-invent stuff. Take recent binding and customize it.

Don't repeat constraints in free form text.

> +
> +  interrupt-controller:
> +    description:
> +      Marks the device node as an interrupt controller

Really? Drop.

> +
> +  "#interrupt-cells":
> +    const: 2
> +    description:
> +      Refer to ../interrupt-controller/interrupts.txt for more details.

Drop description, useless.

> +
> +  gpio-ranges:
> +    description:
> +      Interaction with the PINCTRL subsystem
> +      Refer to gpio.txt for more details.

Oh... drop. Missing constraints.

> +
> +  gpio-reserved-ranges:
> +    description:
> +      A list of start GPIO and number of GPIO pairs which are unusable.
> +      Refer to gpio.txt for more details.

Drop. Missing constraints.

> +
> +patternProperties:
> +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
> +    additionalProperties: false
> +    type: object
> +    properties:
> +      gpio-hog: true
> +      gpios: true
> +      input: true
> +      output-high: true
> +      output-low: true
> +      line-name: true
> +    required:
> +      - gpio-hog
> +      - gpios

Drop all this and use simplified form.
https://elixir.bootlin.com/linux/v6.9-rc3/source/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml#L45

This applies to all your patches in the future as well.

> +
> +required:
> +  - compatible
> +  - interrupts
> +  - reg
> +  - reg-names
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +  - gpio-ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    gpio: siul2-gpio@4009d700 {
> +        compatible = "nxp,s32g2-siul2-gpio";
> +        reg = <0x4009d700 0x10>,
> +              <0x44011700 0x18>,
> +              <0x4009d740 0x10>,
> +              <0x44011740 0x18>,
> +              <0x44010010 0xb4>,
> +              <0x44011078 0x80>;
> +        reg-names = "opads0", "opads1", "ipads0",
> +                    "ipads1", "eirqs", "eirq-imcrs";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +                      /* GPIO 0-101 */
> +        gpio-ranges = <&pinctrl 0   0   102>,
> +                      /* GPIO 112-190 */
> +                      <&pinctrl 112 112 79>;
> +        gpio-reserved-ranges = <102 10>, <123 21>;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +        interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
> +        status = "okay";

Drop.

> +    };

Best regards,
Krzysztof


