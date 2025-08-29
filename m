Return-Path: <linux-gpio+bounces-25208-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B57B3C22A
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 20:00:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC292468165
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 18:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC70834166B;
	Fri, 29 Aug 2025 17:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZlABTpoB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DDF340D8A;
	Fri, 29 Aug 2025 17:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756490399; cv=none; b=c0z3jEw+ZQ2xpdWJYv4brg3dxRZ0GBlLNqWwMgdjh2FhGEevzCe8iBm5OB5tWRbuhIo29m1eyHvy6ld8u+K98uPOfTFwWk6aQ+xRBE/HfPIUEMj2TM2y0vO3O6S7ZcHHHN9W5lpEsR+iuIrWY56bgW/bjIL1ZlgEjR+QpCk6i7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756490399; c=relaxed/simple;
	bh=+h1tJAQ+dSMq7fdj/8N37DlbXKEJmc4JNq48M9PFtwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NK3AgkXfbuomY68kGFcuBPxLWqIg3vYtrzSRMlG6IOIlmPsuUl+5IIqYgFgtddG2uf7N+b7JFXd5Z8PSbxCLO58sslMF06JFvr0qDReT3l1v1re/mxf65A+UuX6oz1eA2SOkn4L3y+gLaGBCM8KVbBZCompZby2psMLdZcTdSK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZlABTpoB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9721C4CEF0;
	Fri, 29 Aug 2025 17:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756490399;
	bh=+h1tJAQ+dSMq7fdj/8N37DlbXKEJmc4JNq48M9PFtwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZlABTpoBtGyhka7GIXWU6daQrCTsFWd3E3VBykCMvye0lE9ztaFdUKmPW3oEeurQr
	 TKlIcXZHPE1txSTj6bb4czIy2HPGz+S7I1vSWOdEhbe55pk/IeZQIU528q15IGLVSN
	 FLWFBRJ1IKvpUbBsg7tMtLaGDrlLNVvbS4QZS2ooVmdmNvC6HXgO5Es1Jis4lTs2uJ
	 iObyuQcZUuoOtm7X5uERgNzoMnxTFip4TAbwV4p5FGZhg5WUCrHP7GHnKcxZPmSz25
	 SELMCFjD/kLzI4W+m0X6c5P1+ofqJm9QLwXt9JcgwswKWuovq/M6j1NH8tHRCpsMFh
	 yK1ExmeBSkEIg==
Date: Fri, 29 Aug 2025 12:59:57 -0500
From: Rob Herring <robh@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: linus.walleij@linaro.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	florian.fainelli@broadcom.com, wahrenst@gmx.net,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, iivanov@suse.de, svarbanov@suse.de,
	mbrugger@suse.com, Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: pinctrl: Add support for Broadcom
 STB pin controller
Message-ID: <20250829175957.GA1073350-robh@kernel.org>
References: <cover.1756372805.git.andrea.porta@suse.com>
 <7ed0f2779829f4e63b69d8cf5cedda9f849996bc.1756372805.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ed0f2779829f4e63b69d8cf5cedda9f849996bc.1756372805.git.andrea.porta@suse.com>

On Thu, Aug 28, 2025 at 02:47:38PM +0200, Andrea della Porta wrote:
> From: "Ivan T. Ivanov" <iivanov@suse.de>
> 
> The STB pin controller represents a family whose silicon instances
> are found e.g. on BCM2712 SoC.
> 
> In particular, on RaspberryPi 5, there are two separate instantiations
> of the same IP block which differ in the number of pins that are
> associated and the pinmux functions for each of those pins. The
> -aon- variant stands for 'Always On'.
> 
> Depending on the revision of the BCM2712 (CO or D0), the pin
> controller instance has slight differences in the register layout.
> 
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  .../pinctrl/brcm,bcm2712c0-pinctrl.yaml       | 137 ++++++++++++++++++
>  1 file changed, 137 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
> new file mode 100644
> index 000000000000..1e5d5234ee8d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
> @@ -0,0 +1,137 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/brcm,bcm2712c0-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom STB family pin controller
> +
> +maintainers:
> +  - Ivan T. Ivanov <iivanov@suse.de>
> +  - A. della Porta <andrea.porta@suse.com>
> +
> +description: >
> +  Broadcom's STB family of memory-mapped pin controllers.
> +
> +  This includes the pin controllers inside the BCM2712 SoC which
> +  are instances of the STB family and has two silicon variants,
> +  C0 and D0, which differs slightly in terms of registers layout.
> +
> +  The -aon- (Always On) variant is the same IP block but differs
> +  in the number of pins that are associated and the pinmux functions
> +  for each of those pins.
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - brcm,bcm2712c0-pinctrl
> +      - brcm,bcm2712c0-aon-pinctrl
> +      - brcm,bcm2712d0-pinctrl
> +      - brcm,bcm2712d0-aon-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +patternProperties:
> +  '-state$':
> +    oneOf:
> +      - $ref: '#/$defs/brcmstb-pinctrl-state'
> +      - patternProperties:
> +          '-pins$':
> +            $ref: '#/$defs/brcmstb-pinctrl-state'
> +        additionalProperties: false
> +
> +$defs:
> +  brcmstb-pinctrl-state:
> +    allOf:
> +      - $ref: pincfg-node.yaml#
> +      - $ref: pinmux-node.yaml#
> +
> +    description: >
> +      Pin controller client devices use pin configuration subnodes (children
> +      and grandchildren) for desired pin configuration.
> +
> +      Client device subnodes use below standard properties.
> +
> +    properties:
> +      pins:
> +        description:
> +          List of gpio pins affected by the properties specified in this
> +          subnode (either this or "groups" must be specified).
> +        items:
> +          pattern: '^((aon_)?s?gpio[0-6]?[0-9])|(emmc_(clk|cmd|dat[0-7]|ds))$'
> +
> +      function:
> +        description:
> +          Specify the alternative function to be configured for the specified
> +          pins.
> +        enum: [ gpio, alt1, alt2, alt3, alt4, alt5, alt6, alt7, alt8,
> +                aon_cpu_standbyb, aon_fp_4sec_resetb, aon_gpclk, aon_pwm,
> +                arm_jtag, aud_fs_clk0, avs_pmu_bsc, bsc_m0, bsc_m1, bsc_m2,
> +                bsc_m3, clk_observe, ctl_hdmi_5v, enet0, enet0_mii, enet0_rgmii,
> +                ext_sc_clk, fl0, fl1, gpclk0, gpclk1, gpclk2, hdmi_tx0_auto_i2c,
> +                hdmi_tx0_bsc, hdmi_tx1_auto_i2c, hdmi_tx1_bsc, i2s_in, i2s_out,
> +                ir_in, mtsif, mtsif_alt, mtsif_alt1, pdm, pkt, pm_led_out, sc0,
> +                sd0, sd2, sd_card_a, sd_card_b, sd_card_c, sd_card_d, sd_card_e,
> +                sd_card_f, sd_card_g, spdif_out, spi_m, spi_s, sr_edm_sense, te0,
> +                te1, tsio, uart0, uart1, uart2, usb_pwr, usb_vbus, uui, vc_i2c0,
> +                vc_i2c3, vc_i2c4, vc_i2c5, vc_i2csl, vc_pcm, vc_pwm0, vc_pwm1,
> +                vc_spi0, vc_spi3, vc_spi4, vc_spi5, vc_uart0, vc_uart2, vc_uart3,
> +                vc_uart4 ]
> +
> +      bias-disable: true
> +      bias-pull-down: true
> +      bias-pull-up: true
> +
> +    required:
> +      - pins
> +
> +    if:
> +      properties:
> +        pins:
> +          not:
> +            contains:
> +              pattern: "^emmc_(clk|cmd|dat[0-7]|ds)$"
> +    then:
> +      required:
> +        - function
> +    else:
> +      properties:
> +        function: false
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    brcm_pinctrl: pinctrl@7d504100 {

Drop unused label.

> +        compatible = "brcm,bcm2712c0-pinctrl";
> +        reg = <0x7d504100 0x30>;
> +
> +        bt-shutdown-default-state {
> +           function = "gpio";
> +           pins = "gpio29";

Wrong indentation. With those fixed,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

> +        };
> +
> +        uarta-default-state {
> +            rts-tx-pins {
> +                function = "uart0";
> +                pins = "gpio24", "gpio26";
> +                bias-disable;
> +            };
> +
> +            cts-rx-pins {
> +                function = "uart0";
> +                pins = "gpio25", "gpio27";
> +                bias-pull-up;
> +            };
> +        };
> +    };
> -- 
> 2.35.3
> 

