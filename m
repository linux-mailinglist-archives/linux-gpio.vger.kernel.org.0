Return-Path: <linux-gpio+bounces-10249-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3214C97BF81
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Sep 2024 19:13:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56C7C1C223EC
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Sep 2024 17:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A5421C9DE0;
	Wed, 18 Sep 2024 17:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LD2wiXrO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96241C984E;
	Wed, 18 Sep 2024 17:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726679602; cv=none; b=fhnqleCEUvssd9wO5kghEI2ZCYjc5Z7iF4PruFL4BOnbJp8zCoPQHRbPWVU7YHJos5x8KBnLnUT1RLMUtlROmi8MZ1bnJrGqvTKmLDmTAF2qjaPAJD7Hs9Ge0Dc46CCIM0/Qq0xDcPmZF6RaYoJ98ba0vy5exTDcDxihd2ggDJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726679602; c=relaxed/simple;
	bh=yyW1aV2ISB/2jXwyRhIGQv2ctjIENPHzxX5fbLQh6Hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dzSZcCl6Ynjcjqr89eeCK1ycRmpo0PyeUOZjpBqGN8HgAvFSPoIZ+91Xv2rb6K5kItTJPqL8LTGUeiXhSnySUmxXhkn4QRN79iR2nR7o1pOFS8nf3p0kYhXO9fjhZLwf0RnydAvXxOgX1/RK7z4kpxztxyXP5D4msCMqdP7NZi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LD2wiXrO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0C8C4CEC2;
	Wed, 18 Sep 2024 17:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726679602;
	bh=yyW1aV2ISB/2jXwyRhIGQv2ctjIENPHzxX5fbLQh6Hk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LD2wiXrOT1fVjKP9Kl4zDZR5EECAKIiF2L1PY+skVHOdcuCmODCQObmn4L5jZcgSA
	 vso49Zb9NWPmLu/vCcRwqdTeswf9EOgquaMEvuTglSCFFCxfHLmrX3/pLDVz4joQQR
	 Ht9MosMe3afnHJIPaQqaPw+KL58kScX3XFvmHosKpr5NO3u322i8t+qJTjlstJ0xMN
	 kbr4qrzhK2U7y+hk33DLNx19so5j0LqXID6syc0ROE+5OFPuRef3EaAuChHchkidkm
	 +VBqjwGcZyK0+9ThngWZCpC5Le1HrUO5b+acav/7h6tb6JWpOKSkOUQZRXOBWTmJk5
	 BdWKjENaWXOdQ==
Date: Wed, 18 Sep 2024 12:13:20 -0500
From: Rob Herring <robh@kernel.org>
To: Ze Huang <18771902331@163.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Yangyu Chen <cyy@cyyself.name>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [RESEND PATCH 1/3] dt-bindings: pinctrl: Add support for
 canaan,k230 SoC
Message-ID: <20240918171320.GA1810164-robh@kernel.org>
References: <20240916063021.311721-1-18771902331@163.com>
 <20240916064225.316863-1-18771902331@163.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240916064225.316863-1-18771902331@163.com>

On Mon, Sep 16, 2024 at 02:42:23PM +0800, Ze Huang wrote:
> Add device tree binding details for Canaan K230 pinctrl device.
> 
> Signed-off-by: Ze Huang <18771902331@163.com>
> ---
>  .../bindings/pinctrl/canaan,k230-pinctrl.yaml | 128 ++++++++++++++++++
>  1 file changed, 128 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml
> new file mode 100644
> index 000000000000..979c5bd71e3d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml
> @@ -0,0 +1,128 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/canaan,k230-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Canaan Kendryte K230 Pin Controller
> +
> +maintainers:
> +  - Ze Huang <18771902331@163.com>
> +
> +description:
> +  The Canaan Kendryte K230 platform includes 64 IO pins, each capable of
> +  multiplexing up to 5 different functions. Pin function configuration is
> +  performed on a per-pin basis.
> +
> +properties:
> +  compatible:
> +    const: canaan,k230-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    additionalProperties: false
> +    description:
> +      A pinctrl node should contain at least one subnode representing the
> +      pinctrl groups available on the machine.
> +
> +    patternProperties:
> +      '-cfg$':
> +        type: object
> +        $ref: /schemas/pinctrl/pincfg-node.yaml
> +        additionalProperties: false
> +        description:
> +          Each subnode will list the pins it needs, and how they should
> +          be configured, with regard to muxer configuration, bias, input
> +          enable/disable, input schmitt trigger, slew-rate enable/disable,
> +          slew-rate, drive strength.
> +
> +        properties:
> +          pinmux:
> +            $ref: /schemas/types.yaml#/definitions/uint32-array

Drop. You need to add a $ref to pinmux-node.yaml (alongside 
pincfg-node.yaml).

> +            description:
> +              The list of GPIOs and their mux settings that properties in
> +              the node apply to. This should be set with the macro
> +              'K230_PINMUX(pin, mode)'
> +
> +          bias-disable: true
> +
> +          bias-pull-up: true
> +
> +          bias-pull-down: true
> +
> +          drive-strength:
> +            minimum: 0
> +            maximum: 15
> +
> +          input-enable: true
> +
> +          output-enable: true
> +
> +          input-schmitt-enable: true
> +
> +          slew-rate:
> +            $ref: /schemas/types.yaml#/definitions/uint32

Drop. Already has a defined type.

> +            description: |
> +              slew rate control enable
> +              0: disable
> +              1: enable
> +
> +            enum: [0, 1]
> +
> +          power-source:
> +            $ref: /schemas/types.yaml#/definitions/uint32

Drop. Already has a defined type.

> +            description: |
> +              Specifies the power source voltage for the IO bank that the
> +              pin belongs to. Each bank of IO pins operate at a specific,
> +              fixed voltage levels. Incorrect voltage configuration can
> +              damage the chip. The defined constants represent the
> +              possible voltage configurations:
> +
> +              - K230_MSC_3V3 (value 0): 3.3V power supply
> +              - K230_MSC_1V8 (value 1): 1.8V power supply
> +
> +              The following banks have the corresponding voltage
> +              configurations:
> +
> +              - bank IO0 to IO1: Fixed at 1.8V
> +              - bank IO2 to IO13: Fixed at 1.8V
> +              - bank IO14 to IO25: Fixed at 1.8V
> +              - bank IO26 to IO37: Fixed at 1.8V
> +              - bank IO38 to IO49: Fixed at 1.8V
> +              - bank IO50 to IO61: Fixed at 3.3V
> +              - bank IO62 to IO63: Fixed at 1.8V
> +
> +            enum: [0, 1]
> +
> +        required:
> +          - pinmux
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pinctrl: pinctrl@91105000 {

Drop unused labels.

> +        compatible = "canaan,k230-pinctrl";
> +        reg = <0x91105000 0x100>;
> +
> +        uart2_pins: uart2-pins {
> +            uart2-pins-cfg {
> +                pinmux = <0x503>, /* uart2 txd */
> +                         <0x603>; /* uart2 rxd */
> +                slew-rate = <0>;
> +                drive-strength = <4>;
> +                power-source = <1>;
> +                input-enable;
> +                output-enable;
> +                bias-disable;
> +            };
> +        };
> +    };
> -- 
> 2.46.1
> 

