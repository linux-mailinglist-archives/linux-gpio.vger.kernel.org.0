Return-Path: <linux-gpio+bounces-27616-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1F2C0B506
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Oct 2025 23:04:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAA4C189ED06
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Oct 2025 22:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A95C81F12F8;
	Sun, 26 Oct 2025 22:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sN7N3bqe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57ACD224FA;
	Sun, 26 Oct 2025 22:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761516262; cv=none; b=UAMxx5W6mrohtF4zwx6Okl4n+si2FBkUMKpmLykSPR7nhB4GJg1G1lx8RAch5296cMfMUxvb6uIRJNYLfR3GnXKQoWv3JtL3Vb114vkvCVLJaDSGQzdu9nLPchsf/32phSl1BAXqRKWXFacxdsiKYFCIHzeqzdd9egngP7pbtKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761516262; c=relaxed/simple;
	bh=PdErI+I/U0Fxg8DPcXpq+cld1psA4QSdRuJETGHdBeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=abAxDNa6jMNO/zRo6Zo8CP9CW59F7Tkdwm+G0kKbSFGbVNOfkbrc/CCSTHCXoi+UyVyS97h+4y9Y8lonP6FUMoonzSBAulHScarcobqPZXCuGpTbpXICFP8L7Sue2/EYLDtdSCHUhRVTWLp7CSKP2d9aP8T+/5rncCz+lOpKFdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sN7N3bqe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E087AC4CEE7;
	Sun, 26 Oct 2025 22:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761516262;
	bh=PdErI+I/U0Fxg8DPcXpq+cld1psA4QSdRuJETGHdBeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sN7N3bqe8s4o0FnO+R360fkOQWJgC/k8RAkUcJcC+attu+8qX4PzkT3gnGcIiPg2l
	 2hi6hYN3PkHrGyIG5XVvF4zpQqcpL1TRPT4bGh3iR2pfiEVkyUYYrLJeaGaz5bNVlL
	 T3Txp9muq5lnODRoto/+hA/v50P+INRHOOAc1tqBpX9icRZa0dzhmTKYba45UwrV6Z
	 B8j4Sc2OemWylnWCerF8jZ7D5fbY4tcwNNANAEohMWgU21pOLLOKSxuFAd59xlvyI9
	 RH/BKzMq9/XW+/K9agOxO6sPO71v2ToMAWst2a19QKaO+BL5DGonxE1X4iQQMxHFx7
	 6GqcK804SR13w==
Date: Sun, 26 Oct 2025 17:04:20 -0500
From: Rob Herring <robh@kernel.org>
To: Sander Vanheule <sander@svanheule.net>
Cc: Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/8] dt-bindings: mfd: Binding for RTL8231
Message-ID: <20251026220420.GA3008050-robh@kernel.org>
References: <20251021142407.307753-1-sander@svanheule.net>
 <20251021142407.307753-5-sander@svanheule.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021142407.307753-5-sander@svanheule.net>

On Tue, Oct 21, 2025 at 04:23:59PM +0200, Sander Vanheule wrote:
> Add a binding description for the Realtek RTL8231, a GPIO and LED
> expander chip commonly used in ethernet switches based on a Realtek
> switch SoC. These chips can be addressed via an MDIO or SMI bus, or used
> as a plain 36-bit shift register.
> 
> This binding only describes the feature set provided by the MDIO/SMI
> configuration, and covers the GPIO, PWM, and pin control properties. The
> LED properties are defined in a separate binding.
> 
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> ---
>  .../bindings/mfd/realtek,rtl8231.yaml         | 189 ++++++++++++++++++
>  1 file changed, 189 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/realtek,rtl8231.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/realtek,rtl8231.yaml b/Documentation/devicetree/bindings/mfd/realtek,rtl8231.yaml
> new file mode 100644
> index 000000000000..25135917d3f2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/realtek,rtl8231.yaml
> @@ -0,0 +1,189 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/realtek,rtl8231.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Realtek RTL8231 GPIO and LED expander.
> +
> +maintainers:
> +  - Sander Vanheule <sander@svanheule.net>
> +
> +description: |
> +  The RTL8231 is a GPIO and LED expander chip, providing up to 37 GPIOs, up to
> +  88 LEDs, and up to one PWM output. This device is frequently used alongside
> +  Realtek switch SoCs, to provide additional I/O capabilities.
> +
> +  To manage the RTL8231's features, its strapping pins can be used to configure
> +  it in one of three modes: shift register, MDIO device, or SMI device. The
> +  shift register mode does not need special support. In MDIO or SMI mode, most
> +  pins can be configured as a GPIO output or LED matrix scan line/column. One
> +  pin can be used as PWM output.
> +
> +  The GPIO, PWM, and pin control are part of the main node. LED support is
> +  configured as a sub-node.
> +
> +properties:
> +  compatible:
> +    const: realtek,rtl8231
> +
> +  reg:
> +    description: MDIO or SMI device address.
> +    maxItems: 1
> +
> +  # GPIO support
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +    description: |

Drop '|' here and elsewhere with no formatting.

> +      The first cell is the pin number and the second cell is used to specify
> +      the GPIO active state.
> +
> +  gpio-ranges:
> +    description: |
> +      Must reference itself, and provide a zero-based mapping for 37 pins.
> +    maxItems: 1
> +
> +  # Pin muxing and configuration
> +  drive-strength:
> +    description: |
> +      Common drive strength used for all GPIO output pins, must be 4mA or 8mA.
> +      On reset, this value will default to 8mA.
> +    enum: [4, 8]
> +
> +  # LED scanning matrix
> +  led-controller:
> +    $ref: ../leds/realtek,rtl8231-leds.yaml#
> +
> +  # PWM output
> +  "#pwm-cells":
> +    description: |
> +      Twos cells with PWM index (must be 0) and PWM frequency in Hz. To use
> +      the PWM output, gpio35 must be muxed to its 'pwm' function. Valid
> +      frequency values for consumers are 1200, 1600, 2000, 2400, 2800, 3200,
> +      4000, and 4800.
> +    const: 2
> +
> +patternProperties:
> +  "-pins$":
> +    type: object
> +    $ref: ../pinctrl/pinmux-node.yaml#
> +
> +    properties:
> +      pins:
> +        items:
> +          enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7,
> +                 gpio8, gpio9, gpio10, gpio11, gpio12, gpio13, gpio14, gpio15,
> +                 gpio16, gpio17, gpio18, gpio19, gpio20, gpio21, gpio22, gpio23,
> +                 gpio24, gpio25, gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
> +                 gpio32, gpio33, gpio34, gpio35, gpio36]
> +        minItems: 1
> +        maxItems: 37

blank line

Other than those nits, looks good.

Rob

