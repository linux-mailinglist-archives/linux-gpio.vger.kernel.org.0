Return-Path: <linux-gpio+bounces-24400-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78615B27138
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 23:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96EEE16B7B0
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 21:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7C827E1A1;
	Thu, 14 Aug 2025 21:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QW6udU89"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FF627A92D;
	Thu, 14 Aug 2025 21:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755208646; cv=none; b=qPZe8ZWfodqjKp++HYu900jyj5uPvYpFFzZLGIA/7Vc+f2n7DyJr1kB4M47dfLENyTckKn4bQiE8R/xwjOM3MXgvGqGzEnGc/Jl02sE6rUOaJO/9TQ8phL5yVYGLBd348Er5z340BRbU0SUYM+QesKEU5qtNFUu1+5M6Si5hvu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755208646; c=relaxed/simple;
	bh=3uTHDMXMml7fueUtUfoKzzYcrvRb2prHJ1gvJShDbBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dkxzJA4OYFSK4uqN0P5KpJszCboYMadbdSVB4fwGyCw9BDbVoLRgHXGIil6rC5AzAxcwHFET18f9Tw6cpaTJP2oJfygCl4Ktxvus77I29li5IPVtMbOLFJpD1yP4zAGYR9wr1ldBKhkhkIEb2jcbsKS+O4W8XqDQ5FcloD5qrqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QW6udU89; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE12C4CEF1;
	Thu, 14 Aug 2025 21:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755208645;
	bh=3uTHDMXMml7fueUtUfoKzzYcrvRb2prHJ1gvJShDbBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QW6udU896EOcz+ZRLAD2kynlUjakc96W3XeF/Hce8BeobBglpUj3ezxqghZLGc1Na
	 M77WiPSU0zYDtuKur0SFL0GOIBpqaWiWPnRi2m8EqjaSrTfC9GspHrdYdyzdHK6MNs
	 uB+8Zuym3YQdq3VAZUDKltl2yMJRZJwqBzI0gNuzcS+rpjJmr1NEtgIbmhpu7/yvP6
	 U0kIvHBZ1+qS1e2aq3R5YGvBMe0BFcCwbQ/C24k8E7ESvQNk8Scan+7OyivFV6Whde
	 kbHBbQ1DQCfzBCd2ZyIe0UKzKLIWf+0F/SHOuDkEWq2lgWIWF+zYwKzhxfiX7ofJZa
	 KqQWiSo7si6tg==
Date: Thu, 14 Aug 2025 16:57:24 -0500
From: Rob Herring <robh@kernel.org>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 1/6] dt-binbings: mfd: Add bindings for the LTC4283 Swap
 Controller
Message-ID: <20250814215724.GA3975144-robh@kernel.org>
References: <20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com>
 <20250814-ltc4283-support-v1-1-88b2cef773f2@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250814-ltc4283-support-v1-1-88b2cef773f2@analog.com>

On Thu, Aug 14, 2025 at 11:52:23AM +0100, Nuno Sá wrote:
> The LTC4283 is a negative voltage hot swap controller that drives an
> external N-channel MOSFET to allow a board to be safely inserted and
> removed from a live backplane.

What's a binbing?

When you fix that, don't say 'bindings' twice in the subject. Subject 
space is precious.

> 
> Main usage is as an Hardware Monitoring device. However, it has up to 8
> pins that can be configured and used as GPIOs and hence, the device can
> also be a GPIO controller.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> ---
>  .../devicetree/bindings/mfd/adi,ltc4283.yaml       | 85 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 ++
>  2 files changed, 92 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/adi,ltc4283.yaml b/Documentation/devicetree/bindings/mfd/adi,ltc4283.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..c5e8aec887d9cfad9052a7c28783396efd6804a9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/adi,ltc4283.yaml
> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/adi,ltc4283.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LTC4283 I2C Negative Voltage Hot Swap Controller
> +
> +maintainers:
> +  - Nuno Sá <nuno.sa@analog.com>
> +
> +description: |
> +  The LTC4283 negative voltage hot swap controller drives an external N-channel
> +  MOSFET to allow a board to be safely inserted and removed from a live
> +  backplane.
> +
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/ltc4283.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,ltc4283
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio:
> +    $ref: /schemas/gpio/adi,ltc4283.yaml
> +  hwmon:
> +    $ref: /schemas/hwmon/adi,ltc4283.yaml

This patch has to come after these are added. However...

> +
> +  adi,gpio-pins:
> +    description:
> +      The pins to use as GPIOs. The device has 4 ADIO and 4 PGIO
> +      pins than can be used as GPIOs. The ADIO pins are numbered from 0 to 3
> +      and the PGIO pins are numbered from 4 to 7.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 8
> +    items:
> +      minimum: 0
> +      maximum: 7
> +
> +dependencies:
> +  gpio:
> +    - adi,gpio-pins
> +
> +required:
> +  - compatible
> +  - reg
> +  - hwmon
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        swap-controller@15 {
> +            compatible = "adi,ltc4283";
> +            reg = <0x15>;
> +
> +            /* pgio1 to pgio4 as gpios */
> +            adi,gpio-pins = <0 1 2 3>;
> +
> +            gpio {
> +                compatible = "adi,ltc4283-gpio";
> +                gpio-controller;
> +                #gpio-cells = <2>;
> +            };
> +
> +            hwmon {
> +                compatible = "adi,ltc4283-hwmon";
> +
> +                adi,rsense-nano-ohms = <500>;

Seems like a current sense resistor might be a common thing.

> +                adi,current-limit-sense-microvolt = <25000>;
> +                adi,current-limit-foldback-factor = <10>;
> +                adi,cooling-delay-ms = <8190>;
> +                adi,fet-bad-timer-delay-ms = <512>;

All these child node properties can be moved to the parent node.

> +            };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e90710a9b40d7b32c151472a9ac3b02efd95f346..413bb77d5eebe2b51aa9c3af86e7cfd5ab142044 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14500,6 +14500,13 @@ F:	Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
>  F:	Documentation/hwmon/ltc4282.rst
>  F:	drivers/hwmon/ltc4282.c
>  
> +lTC4283 HARDWARE MONITOR AND GPIO DRIVER
> +M:	Nuno Sá <nuno.sa@analog.com>
> +L:	linux-hwmon@vger.kernel.org
> +L:	linux-gpio@vger.kernel.org
> +S:	Supported
> +F:	Documentation/devicetree/bindings/mfd/adi,ltc4283.yaml
> +
>  LTC4286 HARDWARE MONITOR DRIVER
>  M:	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
>  L:	linux-hwmon@vger.kernel.org
> 
> -- 
> 2.50.1
> 

