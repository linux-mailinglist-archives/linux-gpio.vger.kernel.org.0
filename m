Return-Path: <linux-gpio+bounces-24513-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F66B2AFD7
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 19:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5010F564149
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 17:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72F232C309;
	Mon, 18 Aug 2025 17:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ph7VQEYP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A182D24B0;
	Mon, 18 Aug 2025 17:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755539908; cv=none; b=WIrqGw7bVYNw2SwmxiTW1Z9fh774+tWqX0Ota5uuYyO4DDwQW4g+S8HTWydB73k8QroQCl+sIMqErmBQoKhJiVAOJDIBJElBdiLedSlO2SoK7TX6x2bkvwW8qWoCCQZBIDP28RMl51WnO2dQv1iocWVLbPvIDbVi+ksPbEZsRk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755539908; c=relaxed/simple;
	bh=ulZLbUkKKsVBIPbfqGa1aUvDJTveq02TSZlicwCIS60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=InmIxrzX0eAeO5IuJysl1DhII3sTtLRsQ1Ol1n6S3vatgl8PD2SOLO6kaZxMbMXonbUctj6zV5KuZ26idKDMCCT6E8N0bUD4ATjFPsAnPSAA9czc6qxHEUyqWDLjNG2qbIQxEkpTib6LwRIV75+gLKcXfb1lo0hAVnge4tSj0fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ph7VQEYP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D36A7C4CEEB;
	Mon, 18 Aug 2025 17:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755539908;
	bh=ulZLbUkKKsVBIPbfqGa1aUvDJTveq02TSZlicwCIS60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ph7VQEYPaaGLHX1CxSttvwluawSFjJ3RhwRQ9sc+uLROmePoNX8S92BodjURNxi2u
	 21Xkf9TnFa6S+lJ8PRefXN7/sK3AKhIaup4wJlKHmP4QLrGOcw3E101A8LCaNXf26G
	 ira2dKOY0WOzYlvHIZiemDObNHQQQbAp1V2dP5sHjIf9INn0omUMjJuaYEFxL+oOTP
	 so2CpM/Dz74nw3MwHJ1l+OKqMaQLubHKLXpVP/y72aDcAM1kIH/wnBd8WNXcaabEbz
	 WFYuX8hGs114fJDBLaDFNt4+jVQIBMGI69iSa2gt0xa1cfn+Bdfa+JjASll7obpXa8
	 SLObNXlw2ffWQ==
Date: Mon, 18 Aug 2025 12:58:27 -0500
From: Rob Herring <robh@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>
Subject: Re: [PATCH 1/3] dt-binding: pinctrl: Document Loongson 2K0300 pin
 controller
Message-ID: <20250818175827.GA1507697-robh@kernel.org>
References: <20250811163749.47028-2-ziyao@disroot.org>
 <20250811163749.47028-3-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811163749.47028-3-ziyao@disroot.org>

On Mon, Aug 11, 2025 at 04:37:48PM +0000, Yao Zi wrote:
> The pincontroller integarted in Loongson 2K0300 is able to configure
> function multiplexing for all the pins. It could also configure drive
> strength on basis of functions, which means all pins set to the same
> function share drive-strength setting. Drive-strength configuration
> isn't available for all functions, either.
> 
> This binding utilizes two levels of subnodes, where the outer represents
> function and the inner represents groups. Drive-strength is allowed in
> the outer since it's shared among all groups configured to the function.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  .../pinctrl/loongson,ls2k0300-pinctrl.yaml    | 92 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/loongson,ls2k0300-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/loongson,ls2k0300-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/loongson,ls2k0300-pinctrl.yaml
> new file mode 100644
> index 000000000000..cbd74cb45342
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/loongson,ls2k0300-pinctrl.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/loongson,ls2k0300-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson-2K0300 SoC Pinctrl Controller
> +
> +maintainers:
> +  - Yao Zi <ziyao@disroot.org>
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +properties:
> +  compatible:
> +    const: loongson,ls2k0300-pinctrl
> +
> +  reg:
> +    items:
> +      - description: Pin function-multiplexing configuration registers
> +      - description: Pin drive-strength configuration registers
> +
> +  reg-names:
> +    items:
> +      - const: mux
> +      - const: drive
> +
> +patternProperties:
> +  '^func-':
> +    type: object
> +
> +    $ref: pincfg-node.yaml#
> +
> +    properties:
> +      drive-strength:
> +        description:
> +          Maximum sink or source current as defined in pincfg-node.yaml. Note
> +          that drive strength could only be configured on function basis, i.e.,
> +          all pins multiplexed to the same function share the same
> +          configuration.
> +
> +          This could only be configured for several functions, including jtag,
> +          dvo, uart, gmac, sdio, spi, i2s, timer, usb and emmc.
> +        enum: [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

How do you know what pin this drive strength corresponds to without any 
other properties? Node names generally aren't important, so you 
shouldn't be using that. 

> +
> +    additionalProperties: false
> +
> +    patternProperties:
> +      '-pins$':
> +        type: object
> +        $ref: pinmux-node.yaml#

Generally the pin config and muxing are in 1 node if you can control 
both.

> +
> +        properties:
> +          pinmux:
> +            description:
> +              Integer array, represents GPIO pin number and multiplexing
> +              setting. Configuration for each pin takes one cell. The pin
> +              number locates at the high 24 bits, and the setting locates at
> +              the low 8 bits.
> +
> +        additionalProperties: false
> +
> +        required:
> +          - pinmux
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pinctrl@1fe00420 {
> +        compatible = "loongson,ls2k0300-pinctrl";
> +        reg = <0x16000490 0x20>, <0x16000110 0x4>;
> +        reg-names = "mux", "drive";
> +
> +        func-uart {
> +            drive-strength = <2>;
> +
> +            uart0-pins {
> +                pinmux = <((40 << 8) | 0x3)>, <((41 << 8) | 0x3)>;
> +            };
> +
> +            uart1_pins: uart1-pins {
> +                pinmux = <((42 << 8) | 0x3)>, <((43 << 8) | 0x3)>;
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7960e65d7dfc..dd50571b4072 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14414,6 +14414,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml
>  F:	drivers/thermal/loongson2_thermal.c
>  
> +LOONGSON-2K0300 SOC PINCTRL DRIVER
> +M:	Yao Zi <ziyao@disroot.org>
> +L:	linux-gpio@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/pinctrl/loongson,ls2k0300-pinctrl.yaml
> +
>  LOONGSON EDAC DRIVER
>  M:	Zhao Qunqin <zhaoqunqin@loongson.cn>
>  L:	linux-edac@vger.kernel.org
> -- 
> 2.50.1
> 

