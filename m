Return-Path: <linux-gpio+bounces-8371-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CD693B19A
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jul 2024 15:27:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC09D1F22EA9
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jul 2024 13:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 298E5158D8C;
	Wed, 24 Jul 2024 13:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oemAObco"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D686679F0;
	Wed, 24 Jul 2024 13:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721827649; cv=none; b=QohNyoBZHZCTgEJja/Lw9UHP2jSExr+yrff0oXN+vzr9q89Q+px1jn4Kpf7p5tu6gVmYObsLyDki2diX3O06rEqGL8ltf04uT/5esyWwtr8nz1C3WM996Kp5mwXVLgGpM7DZvGgCLulqD1/5iDQa6iN41aBhFydLkI4Gk5pyZrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721827649; c=relaxed/simple;
	bh=y9X5n3qdmPwr11Deal1sb3U21Htt0vla5lQICF8SJQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IhtoR10k9WEqN2ZyjLeilyq8bPnbj8uWFHljinGI5jhe+s6IYUgLYGWD8HuX9zze4Ckd1ECT0la+llQren3Zd3f8HfByuJEuvwLJu5Z/AunG1mani5pudB0S6hH6hlbcr6t98zDdryCqrtHw4JOiLII+qpJrnQzUb3CX5OG07QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oemAObco; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C187AC32782;
	Wed, 24 Jul 2024 13:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721827649;
	bh=y9X5n3qdmPwr11Deal1sb3U21Htt0vla5lQICF8SJQc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oemAObcoT4hSjBpdmS2nuYWe1sCGqIKOAvYgetQaCbiBlV7odg7/2sJJUm2GjEbYY
	 qWM3d4kmekQFJGxJNNuIh4trnbFD+EQ+3QlIS64L0nvkBiv7fNYMX/mUUPjHmC3Xas
	 SPaltVVLI4lux/NG0MR2eFmH5Kz4T7D+xluyLbHzttaDZeloj+CkPaXh2XrvQcbVPD
	 IoVimXL09wkvHJiwwv9k8+haESsWII28xQdvVu7KocgjDx4exWIGnPbdieIUtlF6A5
	 5EgYPnykMuCcnOvgyR7XaDFlD7tdZyGd5KfH3L5d8dywFuP8GVF6xdax857kE4h3Cn
	 YAmE8I1sdbhbg==
Message-ID: <3f732acc-6ed0-45f0-a2d6-ed8506b0fd6f@kernel.org>
Date: Wed, 24 Jul 2024 15:27:21 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v7 2/6] dt-bindings: interrupt-controller: document
 PolarFire SoC's gpio interrupt mux
To: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org
Cc: conor@kernel.org, Marc Zyngier <maz@kernel.org>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
 <20240723-uncouple-enforcer-7c48e4a4fefe@wendy>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240723-uncouple-enforcer-7c48e4a4fefe@wendy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/07/2024 13:27, Conor Dooley wrote:
> On PolarFire SoC there are more GPIO interrupts than there are interrupt
> lines available on the PLIC, and a runtime configurable mux is used to
> decide which interrupts are assigned direct connections to the PLIC &
> which are relegated to sharing a line.
> This mux is, in our reference configuration, written by platform
> firmware during boot based on the FPGA's configuration.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../microchip,mpfs-gpio-irq-mux.yaml          | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/microchip,mpfs-gpio-irq-mux.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/microchip,mpfs-gpio-irq-mux.yaml b/Documentation/devicetree/bindings/interrupt-controller/microchip,mpfs-gpio-irq-mux.yaml
> new file mode 100644
> index 0000000000000..89ed3a630eef3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/microchip,mpfs-gpio-irq-mux.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/microchip,mpfs-gpio-irq-mux.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip Polarfire SoC GPIO Interrupt Mux
> +
> +maintainers:
> +  - Conor Dooley <conor.dooley@microchip.com>
> +
> +description: |
> +  There are 3 GPIO controllers on this SoC, of which:
> +  - GPIO controller 0 has 14 GPIOs
> +  - GPIO controller 1 has 24 GPIOs
> +  - GPIO controller 2 has 32 GPIOs
> +
> +  All GPIOs are capable of generating interrupts, for a total of 70.
> +  There are only 41 IRQs available however, so a configurable mux is used to
> +  ensure all GPIOs can be used for interrupt generation.
> +  38 of the 41 interrupts are in what the documentation calls "direct mode",
> +  as they provide an exclusive connection from a GPIO to the PLIC.
> +  The 3 remaining interrupts are used to mux the interrupts which do not have
> +  a exclusive connection, one for each GPIO controller.
> +
> +properties:
> +  compatible:
> +    const: microchip,mpfs-gpio-irq-mux
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 1
> +
> +  interrupts:
> +    description:
> +      The first 38 entries must be the "direct" interrupts, for exclusive
> +      connections to the PLIC. The final 3 entries must be the
> +      "non-direct"/muxed connections for each of GPIO controller 0, 1 & 2
> +      respectively.
> +    maxItems: 41
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#

Please put allOf: after required:.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#interrupt-cells"
> +  - interrupt-controller

and here keep the same order as in properties, so
controller+cells+interrupts.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    irqmux: interrupt-controller@20002054 {
> +        compatible = "microchip,mpfs-gpio-irq-mux";
> +        reg = <0x20002054 0x4>;
> +        interrupt-parent = <&plic>;
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +        status = "okay";

Drop status


Best regards,
Krzysztof


