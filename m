Return-Path: <linux-gpio+bounces-14877-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1335CA14B6E
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 09:49:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D9063A1CAC
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 08:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC86E1F8AE1;
	Fri, 17 Jan 2025 08:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NbxWSK2d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CA21F78E7;
	Fri, 17 Jan 2025 08:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737103742; cv=none; b=qPT3uUg/PUTTkcwKTH25gdP4DmBV2PJm0cvpzyXfTzEK4qXn3tEl5S1b4J/7kXh8NSSE287C3Hzboly8zPmppp/Cn8vFs+kNOy1kxRqg96tpr1fS9F+yP0bsluQVzdJO9gO8blATHIDKfq6wzCP9Y2bIRiXTFyHsuz1lGmWcBME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737103742; c=relaxed/simple;
	bh=cQc0hGk7FmLHCcBWPKPQA14Ij0b8LuFcpjJiNw1Al5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BfFy3s13L7R2u8/CYllTdeTrub0h5J/uPZWRrXee28etQ9o52QceL08iDEsXjoZ9ZkBCvJL/zJRA+f5Y/TpCK7UIdahLaYkAP3oNP13yDd5eeszSWEI7FQ5xx5EBBaWvKBoypYmpG4K7aEijjVnYtS4JYSvTBUHIV6hqhrlnw7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NbxWSK2d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B432C4CEDD;
	Fri, 17 Jan 2025 08:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737103741;
	bh=cQc0hGk7FmLHCcBWPKPQA14Ij0b8LuFcpjJiNw1Al5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NbxWSK2dXtW/eIQj7Jp2UZaUEQ5m2cq0XzCoNalsUP/cs8UOjJIFtRKn4GXgjIVc2
	 cVHPBZHe1m6gPhu9dhqWsjWzchuJxQ5Z4gzWiRtjeVHD0V7eEGyQm8rKf4NpMhYBIr
	 FePfAT3Ct/y8zT99TRC7+18AuIWun55wpfgatDdn9jeUIMWcJ3/zW9miSzifTEEiJ6
	 TCz114oXKXvNWRqEY9l/7uC1ixWI8VbBnWwBlZIB2bCFUMNw9tTt6erxuRDLdXNCD3
	 noIQucuR7dgo/xV8TFHSl6/CqhZPx41qr6vOrchadt9VRanW+bNO+9eSPKC0BtiTHU
	 y3UqzrSERrkaQ==
Date: Fri, 17 Jan 2025 09:48:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 1/5] dt-bindings: pinctrl: Add support for Amlogic SoCs
Message-ID: <20250117-intrepid-nano-horse-98e817@krzk-bin>
References: <20250115-amlogic-pinctrl-v3-0-2b8536457aba@amlogic.com>
 <20250115-amlogic-pinctrl-v3-1-2b8536457aba@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250115-amlogic-pinctrl-v3-1-2b8536457aba@amlogic.com>

On Wed, Jan 15, 2025 at 02:41:59PM +0800, Xianwei Zhao wrote:
> +properties:
> +  compatible:
> +    const: amlogic,pinctrl-a4
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2

Why this moved to '2'? 32-bit was not enough?

> +
> +  ranges: true
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"

Keep required after patternProperties

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
> +          - description: pin drive strength register (optionanl)

typo: optional

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
> +      bank-number:
> +        description: |
> +          bank-number are provided by the pin controller header file at:
> +          <include/dt-bindings/pinctrl/amlogic,pinctrl.h>
> +        $ref: /schemas/types.yaml#/definitions/uint32

gpio-ranges tell you that, don't they?

Anyway, you would need here minimum and maximum.

> +
> +    required:
> +      - reg
> +      - reg-names
> +      - gpio-controller
> +      - "#gpio-cells"
> +      - gpio-ranges
> +      - bank-number
> +
> +    additionalProperties: false
> +
> +  "^func-[0-9a-z-]+$":
> +    type: object
> +    patternProperties:
> +      "^group-[0-9a-z-]+$":
> +        type: object
> +        allOf:
> +          - $ref: /schemas/pinctrl/pincfg-node.yaml
> +          - $ref: /schemas/pinctrl/pinmux-node.yaml

Missing required pinmux and maybe other properties.

> +    additionalProperties: false
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
> +          reg = <0 0x14 0 0x10>,
> +                <0 0x14 0 0x10>;

One line.

> +          reg-names = "gpio", "mux";
> +          gpio-controller;
> +          #gpio-cells = <2>;
> +          bank-number = <AMLOGIC_GPIO_B>;
> +          gpio-ranges = <&periphs_pinctrl 0 8 10>;
> +        };

Best regards,
Krzysztof


