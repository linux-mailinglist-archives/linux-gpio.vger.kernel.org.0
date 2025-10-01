Return-Path: <linux-gpio+bounces-26721-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D7798BB0638
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Oct 2025 14:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CAA147A2F7F
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 12:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02F132EC08F;
	Wed,  1 Oct 2025 12:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UapV00YO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC302522BE;
	Wed,  1 Oct 2025 12:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759323249; cv=none; b=GmqiSuCsocVDOK22b4lycrTDJhqygFyVA8Z1sadb7A8VHdxEKs67qvdLj+R9s2JkyHza7iwX14dWZzsx7RcCHJ4V96g0Kw+MtgizexcWifAjivWQ4IECSd6+U509RTj+KevBWxZRFLLc7t4jsQ82giLMXp01IngvYS96vYvnO0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759323249; c=relaxed/simple;
	bh=JoGbIi/kUSYNRFIFn/6QxHYjU+Qte/1ZajrqXb63QwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K2mVAH7PtAeycyNyC4IjJrwqxS62pcYDh5Yg7SFi0qdk7wnar5gOd54AJv8885QetAblEg36IE/+pBP9TRgn7X6vEptkJxJk8RU5caM4l0DkSxFpJuycwrMvnyR7jMr4eVbAo7RhiyrrxaLetv9kW+w6Qe5nnmW1N8h3Se3YgTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UapV00YO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2ED2C4CEF4;
	Wed,  1 Oct 2025 12:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759323247;
	bh=JoGbIi/kUSYNRFIFn/6QxHYjU+Qte/1ZajrqXb63QwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UapV00YOoejfx872qiBEP0/QtqJDc+NIhFdIANLVNiY8jgHV7mTiGqNP51R8EZA4h
	 tP4VUA6nV70JsHrDng9c93Ht0OLRdVa+BbhnnyoJlNFyS4QXgvjANHQiawk8Znozr3
	 k0+QYVdgTEFvJhKB9IkLF2QhcugiqXm30Y/clouFSOgbQqgW8jSC6AHt3z/b4xfYJV
	 Ck2FVr4JbPOmjn/GDs5S3lZ+24P6S6nGL/MIt2y1DVGna1oql6K47jVTRdheE2zPLd
	 +bgZuO+Deqg8tqN+MPfloBhEhXc8rtv33K7baC34Z3lQDj2J96/gjzioXgVVNnJeYl
	 5256W/t0PjEfg==
Date: Wed, 1 Oct 2025 07:54:06 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 5/6] dt-bindings: pinctrl: Add binding for BCM6846 pinctrl
Message-ID: <20251001125406.GA1138855-robh@kernel.org>
References: <20250930-bcmbca-pinctrl-v1-0-73218459a094@linaro.org>
 <20250930-bcmbca-pinctrl-v1-5-73218459a094@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-bcmbca-pinctrl-v1-5-73218459a094@linaro.org>

On Tue, Sep 30, 2025 at 02:02:52PM +0200, Linus Walleij wrote:
> This SoC is part of the Broadcom Broadband Carrier Access (BCA)
> series. The BCM6846 has 79 muxable pins, these bindings define
> functions and groups for these.
> 
> The bindings are inspired by the other BCA pin control bindings
> for the BCM4908.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../bindings/pinctrl/brcm,bcm6846-pinctrl.yaml     | 82 ++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6846-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6846-pinctrl.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..e9c3b1e9ae0501574b5c15d4adfc5421f535c306
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6846-pinctrl.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/brcm,bcm6846-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM6846 pin controller
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +description:
> +  Binding for pin controller present on BCM6846 family SoCs.

This doesn't add any more than what 'title' says, so just drop.

> +
> +properties:
> +  compatible:
> +    const: brcm,bcm6846-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    $ref: pinmux-node.yaml#
> +    additionalProperties: false
> +
> +    properties:
> +      function:
> +        enum: [ led_0, led_1, led_2, led_3, led_4, led_5, led_6, led_7, led_8,
> +                led_9, led_10, led_11, led_12, led_13, led_14, led_15, led_16,
> +                led_17, ser_led, nand, emmc, spim, usb0_pwr, usb1_pwr, i2c,
> +                rgmii, mii, signal_detect, one_sec_pls, rogue_onu, wan, uart0,
> +                uart2 ]
> +
> +      groups:
> +        minItems: 1
> +        # SPIM uses up to 5 groups for different select signals
> +        maxItems: 5
> +        items:
> +          enum: [ led_0_grp_a, led_0_grp_b, led_1_grp_a, led_1_grp_b,
> +                  led_2_grp_a, led_2_grp_b, led_3_grp_a, led_3_grp_b,
> +                  led_4_grp_a, led_4_grp_b, led_5_grp_a, led_5_grp_b,
> +                  led_6_grp_a, led_6_grp_b, led_7_grp_a, led_7_grp_b,
> +                  led_8_grp_a, led_8_grp_b, led_9_grp_a, led_9_grp_b,
> +                  led_10_grp_a, led_10_grp_b, led_11_grp_a, led_11_grp_b,
> +                  led_12_grp_a, led_12_grp_b, led_13_grp,
> +                  led_14_grp, led_15_grp, led_16_grp, led_17_grp,
> +                  ser_led_grp_a, ser_led_grp_b, nand_ctrl_grp, nand_data_grp,
> +                  nand_wp_grp, emmc_ctrl_grp, spim_grp_a, spim_ss0_grp_a,
> +                  spim_ss1_grp_a, spim_ss2_grp_a, spim_ss3_grp_a, spim_grp_b,
> +                  spim_ss0_grp_b, spim_ss1_grp_b, spim_ss2_grp_b, spim_ss3_grp_b,
> +                  spim_grp_c, spim_ss0_grp_c, spim_ss1_grp_c, spis_grp_a,
> +                  spis_ss_grp_a, spis_grp_b, spis_ss_grp_b, usb0_pwr_grp
> +                  usb1_pwr_grp, i2c_grp, rgmii_grp, rgmii_rx_ok_grp,
> +                  rgmii_start_stop_grp, mii_grp,
> +                  signal_detect_grp_a, signal_detect_grp_b, one_sec_pls_grp_a,
> +                  one_sec_pls_grp_b, rogue_onu_grp_a, rogue_onu_grp_b,
> +                  wan_mdio_grp, wan_nco_grp, wan_early_txen_grp_a,
> +                  wan_early_txen_grp_b, wan_nco_1pps_sig_grp_a,
> +                  wan_nco_1pps_sig_grp_b, uart0_grp, uart2_grp ]

Nothing required?

> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    pinctrl@ff800550 {
> +        compatible = "brcm,bcm6846-pinctrl";
> +        reg = <0xff800550 0x10>;
> +
> +        led-0-a-pins {
> +            function = "led_0";
> +            groups = "led_0_grp_a";
> +        };
> +    };
> 
> -- 
> 2.51.0
> 

