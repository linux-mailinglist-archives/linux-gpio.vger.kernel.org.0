Return-Path: <linux-gpio+bounces-11734-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F28A9A99E3
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 08:33:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 300011C20327
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 06:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A678013E03E;
	Tue, 22 Oct 2024 06:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KXYGtbKZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579901474A2;
	Tue, 22 Oct 2024 06:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729578815; cv=none; b=h7SWZuUj/tx5pbAmCSkH4wdIXINUtobHSemJN/Y3gPzTW44siooGm1xb7y8xD9M4VsvZJMdjXmdb48UD0wQ1p1UObjKnqszBUdGVTKv3XOPHPqfOeJaoiKRoHvXDWYcR2U/yeG1DnJl1peyPH6Yk0r0i1BfVRkHzps6wm91Lm9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729578815; c=relaxed/simple;
	bh=HrnHqBL7EvmvAJrYnsFb27wYebBRHgRQrYL+r2LPjhw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nlhSxQKztxna3i1uB/Mptt2zrGuiOGZ3d8zcMR9/xHNQSbPr388I3SbABL0KGKDFRu4CWOwdwJ83u4ASELH15eiJphn+J/yAxl9ISKEDGy2JiBPfgVK0YrQe9qMjzqE89eDl1PMTi+lsTq4aW7ft6BKpDZog6/TJVIrtVHtqVTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KXYGtbKZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F0FC4CEC3;
	Tue, 22 Oct 2024 06:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729578814;
	bh=HrnHqBL7EvmvAJrYnsFb27wYebBRHgRQrYL+r2LPjhw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KXYGtbKZlgNGl57P6JT2yW0NlkWWpeVUN/m8AAVIpoQC7ituZgdqZuVXulxCX6GIY
	 Y35NhE67ctOWFCWvgJPpnBO8alNzwroT2bHv/BR2AoxxGNGV+chHKiIxsbMFcOUd8q
	 ojGR+fgaBjuPfHDkLB5B0YpC+no2ZPwpiDmcxmYrLkHhn76hmOfxwdHwb0swC6bigi
	 YfcSvT3gF5sd7xw7xBcO9LUAr86X/D1JKjn9u6fVKnFbvbd5R6hyKHruN10ajmDmDm
	 Ci4awoYL/9+dGNJFG5rlUykjWmbi0QvIAqSQ5dSqqAFBMvV/WH17nz6/lSETzZYpG7
	 wcOSqzNkxv5JA==
Message-ID: <b69251f7-7827-4f0e-b4fe-184a5cb54ee7@kernel.org>
Date: Tue, 22 Oct 2024 08:33:28 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: pinctrl: convert pinctrl-mcp23s08.txt to
 yaml format
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241022060157.36372-1-himanshu.bhavani@siliconsignals.io>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241022060157.36372-1-himanshu.bhavani@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/10/2024 08:01, Himanshu Bhavani wrote:
> Convert the text bindings of pinctrl-mcp23s08 to YAML so it could be used to
> validate the DTS.
> 

You silently dropped several compatibles. Document clearly what and why
you changed from original binding during conversion.

> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> ---
>  .../bindings/pinctrl/pinctrl-mcp23s08.txt     | 148 -----------------
>  .../bindings/pinctrl/pinctrl-mcp23s08.yaml    | 153 ++++++++++++++++++

Filename based on compatible, so microchip,mcp23s08.yaml.


>  2 files changed, 153 insertions(+), 148 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.yaml

...

> -};
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.yaml
> new file mode 100644
> index 000000000000..3904b8adba44
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.yaml
> @@ -0,0 +1,153 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +# Copyright 2024 Silicon Signals Pvt. Ltd.

I don't see how Silicon signals contributed to original binding in
a157789b78f4e95f5d66f8b564356e396716f67e and I feel above suggests it is
a new work, not derivative. And if you claim this is not derivative
work, then why not licensed as checkpatch asks? IOW, I suggest dropping
copyright statement.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/pinctrl-mcp23s08.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip I/O expander with serial interface (I2C/SPI)
> +
> +maintainers:
> +  - Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  Microchip MCP23008, MCP23017, MCP23S08, MCP23S17, MCP23S18 GPIO expander
> +  chips.These chips provide 8 or 16 GPIO pins with either I2C or SPI interface.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,mcp23s08
> +      - microchip,mcp23s17
> +      - microchip,mcp23s18
> +      - microchip,mcp23008
> +      - microchip,mcp23017
> +      - microchip,mcp23018
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: GPIO specifier for active-low reset pin.
> +    maxItems: 1
> +
> +  spi-max-frequency:
> +    description: Maximum frequency for SPI devices.

Drop, not needed. Is this a device on SPI bus? Then you miss ref to
spi-peripheral-props.


> +
> +  microchip,spi-present-mask:
> +    description: |

Do not need '|' unless you need to preserve formatting.

> +      SPI present mask. Specifies which chips are present on the shared SPI
> +      chipselect. Each bit in the mask represents one SPI address.
> +    $ref: /schemas/types.yaml#/definitions/uint8

Where is the entire description from old binding?

> +
> +  microchip,irq-mirror:
> +    type: boolean
> +    description: |
> +      Sets the mirror flag in the IOCON register. Devices with two interrupt
> +      outputs (these are the devices ending with 17 and those that have 16 IOs)
> +      have two IO banks IO 0-7 form bank 1 and IO 8-15 are bank 2. These chips
> +      have two different interrupt outputs One for bank 1 and another for
> +      bank 2. If irq-mirror is set, both interrupts are generated regardless of
> +      the bank that an input change occurred on. If it is not set,the interrupt
> +      are only generated for the bank they belong to.
> +
> +  microchip,irq-active-high:
> +    type: boolean
> +    description: |
> +      Sets the INTPOL flag in the IOCON register.This configures the IRQ output
> +      polarity as active high.
> +
> +  drive-open-drain:
> +    type: boolean
> +    description: |
> +      Sets the ODR flag in the IOCON register. This configures the IRQ output as
> +      open drain active low.
> +
> +  pinmux:
> +    type: object
> +    properties:
> +      pins:  
> +        description: |
> +          The list of GPIO pins controlled by this node. Each pin name corresponds
> +          to a physical pin on the GPIO expander.
> +        items:
> +          pattern: "^gpio([0-9]|[1][0-5])$"
> +        maxItems: 16
> +
> +      bias-pull-up:
> +        type: boolean
> +        description: Configures pull-up resistors for the GPIO pins.
> +
> +    required:
> +      - pins
> +      - bias-pull-up

This does not make much sense, why pull up is always required?

> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - '#gpio-cells'
> +
> +additionalProperties: false



Best regards,
Krzysztof


