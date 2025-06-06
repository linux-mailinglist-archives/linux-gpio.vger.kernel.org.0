Return-Path: <linux-gpio+bounces-21070-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8864ACFB05
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Jun 2025 04:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32DAF3AE78B
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Jun 2025 02:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317BD1CAA6C;
	Fri,  6 Jun 2025 02:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n9XtnQjj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D904629A2;
	Fri,  6 Jun 2025 02:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749175275; cv=none; b=FBCfMY+MK3lVCYJ/nHlXk8avLGnfBfrpw7m8cFMpGg7mmi8IjaRR2Sa/aC3Ilr5bG4bZRb2LStsV+SoPV6iCcXc4YRBLGHuICU+rSni6/pkImcN6ogP3UCcs4JMJmH7ozlWw6Lz7mn7cdsE5fI+UAxovqRgq0yvind1Sx0xWeys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749175275; c=relaxed/simple;
	bh=0Vl0iSkRpBh/E7MBlT0kYMNSiuiqq/ySln8Q8tbd0QY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ixQvtPuY9DQFd2eouH8yw6ZLgp80rvqszEK4j9KV2Y4GilXzoTsNtDomsSY1e4AeLV2Pb/CjOG+otB+aLNkR+UtTj8z4XEnj2nSfD87WDr6haCGGmu43dTYqx+3RXLXD8KNhmqRPGwZsO9GXLblLu4Ub/TylODA129Zes5b1Sjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n9XtnQjj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18488C4CEE7;
	Fri,  6 Jun 2025 02:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749175274;
	bh=0Vl0iSkRpBh/E7MBlT0kYMNSiuiqq/ySln8Q8tbd0QY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n9XtnQjj2/8a94/f/q1nDpzBTnKMUkLMlYbmApep4tZpQKr5M51rHa5ri4rE+RD+w
	 vcvmVt/8KUQYQ8+k/5jHFCv2A2heniPGaCdoKMFdorVlLrx4UWA13pTHOkhBpJdSgB
	 JULxLX76cpz/4dIKwV0lai1Le+dSSAhXempoqtlpEUd0misnDZt+lln3Fn/Ur7CaeU
	 dIR3aeMP2he1nen7IAxRMEbbIPhEo/CQV9YZH30cte+IhvtjjJLiGDZTKRdJmuAJQd
	 jN/5gkjeXjhdTUQUye72FbomnEeTpMG3fVwK1TZJm1/sVJpNt+bj9Kxjq2R6WKPXnH
	 FUL0SLHl8Z+pg==
Date: Thu, 5 Jun 2025 21:01:12 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: pinctrl: convert xp,lpc1850-scu.txt to
 yaml format
Message-ID: <20250606020112.GA3765019-robh@kernel.org>
References: <20250602143930.943830-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602143930.943830-1-Frank.Li@nxp.com>

On Mon, Jun 02, 2025 at 10:39:29AM -0400, Frank Li wrote:
> Convert nxp,lpc1850-scu.txt to yaml format.
> 
> Additional changes:
> - keep child name *_cfg to align legancy very old platform dts file.
> - remove label in examples.
> - just keep one examples.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/pinctrl/nxp,lpc1850-scu.txt      | 71 ---------------
>  .../bindings/pinctrl/nxp,lpc1850-scu.yaml     | 91 +++++++++++++++++++
>  2 files changed, 91 insertions(+), 71 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.txt b/Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.txt
> deleted file mode 100644
> index bd8b0c69fa447..0000000000000
> --- a/Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.txt
> +++ /dev/null
> @@ -1,71 +0,0 @@
> -NXP LPC18xx/43xx SCU pin controller Device Tree Bindings
> ---------------------------------------------------------
> -
> -Required properties:
> -- compatible		: Should be "nxp,lpc1850-scu"
> -- reg			: Address and length of the register set for the device
> -- clocks		: Clock specifier (see clock bindings for details)
> -
> -The lpc1850-scu driver uses the generic pin multiplexing and generic pin
> -configuration documented in pinctrl-bindings.txt.
> -
> -The following generic nodes are supported:
> - - function
> - - pins
> - - bias-disable
> - - bias-pull-up
> - - bias-pull-down
> - - drive-strength
> - - input-enable
> - - input-disable
> - - input-schmitt-enable
> - - input-schmitt-disable
> - - slew-rate
> -
> -NXP specific properties:
> - - nxp,gpio-pin-interrupt : Assign pin to gpio pin interrupt controller
> -			    irq number 0 to 7. See example below.
> -
> -Not all pins support all properties so either refer to the NXP 1850/4350
> -user manual or the pin table in the pinctrl-lpc18xx driver for supported
> -pin properties.
> -
> -Example:
> -pinctrl: pinctrl@40086000 {
> -	compatible = "nxp,lpc1850-scu";
> -	reg = <0x40086000 0x1000>;
> -	clocks = <&ccu1 CLK_CPU_SCU>;
> -
> -	i2c0_pins: i2c0-pins {
> -		i2c0_pins_cfg {
> -			pins = "i2c0_scl", "i2c0_sda";
> -			function = "i2c0";
> -			input-enable;
> -		};
> -	};
> -
> -	uart0_pins: uart0-pins {
> -		uart0_rx_cfg {
> -			pins = "pf_11";
> -			function = "uart0";
> -			bias-disable;
> -			input-enable;
> -		};
> -
> -		uart0_tx_cfg {
> -			pins = "pf_10";
> -			function = "uart0";
> -			bias-disable;
> -		};
> -	};
> -
> -	gpio_joystick_pins: gpio-joystick-pins {
> -		gpio_joystick_1_cfg {
> -			pins =  "p9_0";
> -			function = "gpio";
> -			nxp,gpio-pin-interrupt = <0>;
> -			input-enable;
> -			bias-disable;
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.yaml
> new file mode 100644
> index 0000000000000..4df47fee3a228
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/nxp,lpc1850-scu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP LPC18xx/43xx SCU pin controller
> +
> +description: |
> +  The following generic nodes are supported:
> +    - function
> +    - pins
> +    - bias-disable
> +    - bias-pull-up
> +    - bias-pull-down
> +    - drive-strength
> +    - input-enable
> +    - input-disable
> +    - input-schmitt-enable
> +    - input-schmitt-disable
> +    - slew-rat

Drop this list. Or list them in the schema if you want to keep it.

> +  Not all pins support all properties so either refer to the NXP 1850/4350
> +  user manual or the pin table in the pinctrl-lpc18xx driver for supported
> +  pin properties.
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    const: nxp,lpc1850-scu
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    additionalProperties: false
> +
> +    patternProperties:
> +      '_cfg$':
> +        type: object
> +
> +        allOf:
> +          - $ref: pincfg-node.yaml#
> +          - $ref: pinmux-node.yaml#
> +
> +        unevaluatedProperties: false
> +
> +        properties:
> +          nxp,gpio-pin-interrupt:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            minimum: 0
> +            maximum: 7
> +            description:
> +              Assign pin to gpio pin interrupt controller
> +              irq number 0 to 7. See example below.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/lpc18xx-ccu.h>
> +
> +    pinctrl@40086000 {
> +        compatible = "nxp,lpc1850-scu";
> +        reg = <0x40086000 0x1000>;
> +        clocks = <&ccu1 CLK_CPU_SCU>;
> +
> +        gpio-joystick-pins {
> +            gpio-joystick-1_cfg {
> +                pins = "p9_0";
> +                function = "gpio";
> +                nxp,gpio-pin-interrupt = <0>;
> +                input-enable;
> +                bias-disable;
> +            };
> +        };
> +    };
> -- 
> 2.34.1
> 

