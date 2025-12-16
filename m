Return-Path: <linux-gpio+bounces-29653-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB38CC553F
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 23:17:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51304300B2AB
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 22:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5696A313E3B;
	Tue, 16 Dec 2025 22:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mq5kqh3B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9702765C3;
	Tue, 16 Dec 2025 22:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765923395; cv=none; b=Xh7+NlARJXgqhaicPtBcbhwyJAgjtK0XVtubxS79KbgkGTsvTnIR3MdxwRDXg+Oiwpqlg0zNM8qS+EvCREB8f33TCI5RSen4eM+4YqkAvQkWoX02v7D2toNe800XQ0Jepu2URc+y/p2LIrpytJLisWBN9wTieSvb8k3k48+ni6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765923395; c=relaxed/simple;
	bh=RVv6U8vNQOFBzIPO5hHvHCI19OQVuc9YoOmPnXLDOQE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xm+h9dkdZRNhddESRF+gttXAllPjZWfmNT3vwO2l/AsXtQLGiIx+hI6WGzk5uRHNybTK0kS3XvS1dOD2F2vYr9VzibH0dLOpRjMKhoglzosnuZcOICbjBBH/dq8sZe7F+Xfh1epRQRjfX8cYsUwqJknE2liIfIn85TEwV97jT7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mq5kqh3B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E547C4CEF1;
	Tue, 16 Dec 2025 22:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765923394;
	bh=RVv6U8vNQOFBzIPO5hHvHCI19OQVuc9YoOmPnXLDOQE=;
	h=From:Date:To:Cc:Subject:References:In-Reply-To:From;
	b=Mq5kqh3BpmknEekWUGcwqTVlPjbgK45L+YGUn2woq60DUxDH785keSwAQVJ5xqVDY
	 +8c4ZA4bQv6vVDtC8v/2mBYuBVLctkJLjua5yg7yijIIumK3FJ0FYpVoYXzG/QIujd
	 mibLqEc/inkaELbvzyVC+v778pShpq71mKffoUKKVJAiA60d8hfFjBG0vpKDyNTKOg
	 ENN2Eb3qCN8opCh2N+WJbzU+KXq68PjKjrNmNh1CRDCzYoDLaJUpxDmvMtHRNMtByi
	 xOwM30wNuSQkEEuDL+R7qc0Mvo7TH+1y9m1X2EZselLV8HEuobMkywRNNZBN6jHeRC
	 VYmhgpew4FXYw==
From: Rob Herring <robh@kernel.org>
Date: Tue, 16 Dec 2025 16:16:31 -0600
To: Conor Dooley <conor@kernel.org>
Cc: linus.walleij@linaro.org, Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Valentina.FernandezAlanis@microchip.com
Subject: Re: [RFC v2 1/5] dt-bindings: pinctrl: document polarfire soc mssio
 pin controller
Message-ID: <20251216220624.GA3114300-robh@kernel.org>
References: <20251127-bogged-gauze-74aed9fdac0e@spud>
 <20251127-spousal-bless-199b36f89c80@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127-spousal-bless-199b36f89c80@spud>

On Thu, Nov 27, 2025 at 10:57:57AM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> On Polarfire SoC, the Bank 2 and Bank 4 IOs connected to the
> Multiprocessor Subsystem (MSS) are controlled by IOMUX_CRs 1 through 6,
> which determine what function in routed to them, and
> MSSIO_BANK#_IO_CFG_CRs, which determine the configuration of each pin.
> 
> Document it, including several custom configuration options that stem
> from MSS Configurator options (the MSS Configurator is part of the FPGA
> tooling for this device). "ibufmd" unfortunately is not a 1:1 mapping
> with an MSS Configurator option, unlike clamp-diode or lockdown, and I
> do not know the effect of any bits in the field. I have no been able to
> find an explanation for these bits in documentation.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../pinctrl/microchip,mpfs-pinctrl-mssio.yaml | 119 ++++++++++++++++++
>  .../microchip,mpfs-mss-top-sysreg.yaml        |   4 +
>  2 files changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-mssio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-mssio.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-mssio.yaml
> new file mode 100644
> index 000000000000..c8e509ba2f51
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-mssio.yaml
> @@ -0,0 +1,119 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/microchip,mpfs-pinctrl-mssio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip Polarfire SoC MSSIO pinctrl
> +
> +maintainers:
> +  - Conor Dooley <conor.dooley@microchip.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: microchip,mpfs-pinctrl-mssio
> +      - items:
> +          - const: microchip,pic64gx-pinctrl-mssio
> +          - const: microchip,mpfs-pinctrl-mssio
> +
> +  reg:
> +    maxItems: 1
> +
> +  pinctrl-use-default: true
> +
> +patternProperties:
> +  '-cfg$':
> +    type: object
> +    additionalProperties: false
> +
> +    patternProperties:
> +      '-pins$':
> +        type: object
> +        additionalProperties: false
> +
> +        allOf:
> +          - $ref: pincfg-node.yaml#
> +          - $ref: pinmux-node.yaml#
> +
> +        properties:
> +          pins:
> +            description:
> +              The list of IOs that properties in the pincfg node apply to.

pins can be int or string. You need to define which one here.

> +
> +          function:
> +            description:
> +              A string containing the name of the function to mux for these
> +              pins. The "reserved" function tristates a pin.
> +            enum: [ sd, emmc, qspi, spi, usb, uart, i2c, can, mdio, misc
> +                    reserved, gpio, fabric-test, tied-low, tied-high, tristate ]
> +
> +          bias-bus-hold: true
> +          bias-disable: true
> +          bias-pull-down: true
> +          bias-pull-up: true
> +          input-schmitt-enable: true
> +          low-power-enable: true
> +
> +          drive-strength:
> +            enum: [ 2, 4, 6, 8, 10, 12, 16, 20 ]
> +
> +          microchip,bank-voltage-microvolt:
> +            description:
> +              Which bank voltage to use. This cannot differ for pins in a
> +              given bank, the whole bank uses the same voltage.
> +            enum: [ 1200000, 1500000, 1800000, 2500000, 3300000 ]

"power-source" serves this purpose. It's not well defined as sometimes 
it's a register value and sometimes a voltage (in various units).

> +
> +          microchip,clamp-diode:
> +            $ref: /schemas/types.yaml#/definitions/flag
> +            description:
> +              Reflects the "Clamp Diode" setting in the MSS Configurator for
> +              this pin. This setting controls whether or not input voltage
> +              clamping should be enabled.
> +
> +          microchip,ibufmd:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            default: 0
> +            description:
> +              Reflects the "IBUFMD" bits in the MSS Configurator output files
> +              for this pin.
> +
> +        required:
> +          - pins
> +          - function
> +          - microchip,bank-voltage-microvolt
> +
> +        if:
> +          properties:
> +            microchip,bank-voltage-microvolt:
> +              contains:
> +                enum: [ 1200000, 1500000, 1800000 ]
> +        then:
> +          required:
> +            - input-schmitt-enable
> +
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pinctrl@204 {
> +      compatible = "microchip,mpfs-pinctrl-mssio";
> +      reg = <0x204 0x7c>;
> +
> +      ikrd-spi1-cfg {
> +        spi1-pins {
> +          pins = <30>, <31>, <32>, <33>;
> +          function = "spi";
> +          bias-pull-up;
> +          drive-strength = <8>;
> +          microchip,bank-voltage-microvolt = <3300000>;
> +          microchip,ibufmd = <0x1>;
> +        };
> +      };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
> index 39987f722411..44e4a50c3155 100644
> --- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
> +++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
> @@ -42,6 +42,10 @@ properties:
>      type: object
>      $ref: /schemas/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml
>  
> +  pinctrl@204:
> +    type: object
> +    $ref: /schemas/pinctrl/microchip,mpfs-pinctrl-mssio.yaml
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.51.0
> 


