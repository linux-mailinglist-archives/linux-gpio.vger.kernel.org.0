Return-Path: <linux-gpio+bounces-9748-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DD096B213
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 08:46:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FCAC289369
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 06:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72ADE145A1B;
	Wed,  4 Sep 2024 06:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PAvWqOTQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C12683A19;
	Wed,  4 Sep 2024 06:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725432376; cv=none; b=WXNfuxR6ZZE2yo0nxodJi+4HLEJGrAOuIL7FPuwg+gvGiz+UTAif8BowY/IQvGFBtkmgWW22VyaHIAAVPdPh1ObyqxZReY5LoxQuU1D73rNKPPTJxvWLDMiGPI54zDCVizhsql1QvR0UEjAIEqcZ8xnHuZ0MFReWc1mwwvi+xUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725432376; c=relaxed/simple;
	bh=dYOCY0yk+cwLkcXcgwp9/YV2ZgT7cPjQlCCdBTFQ3WA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tom6KsUyfBKepz0h2iOqfJJYjSClo4OjUPacjgLU9+XeW1skar05/0fnR8wK4BxDcquWYksaB3kiFkn8U4iabo4AH6c7SWCl8Mjmm/lfgONg8TsmKm/E/bfGyS/xfEQ46Ed1E+vs2oo22wMkc7fqMTnJmEizgBfp665BemE4S/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PAvWqOTQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D2ACC4CEC2;
	Wed,  4 Sep 2024 06:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725432375;
	bh=dYOCY0yk+cwLkcXcgwp9/YV2ZgT7cPjQlCCdBTFQ3WA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PAvWqOTQcX2pjmA2V7X84ZPEWFpCLfcgE1cztCOtT2QP8c/H1LCx4AB46ZwmlHC6v
	 vAub1J+4iXPh06tq55e8rCHYUOwdvvtl/HAJkMzgUzQcZy1/USYGMhDlrE+XgsYrjw
	 +wNwRpk+MoYrpSz2UI0taSQn0dHhSdY9QLdU2NARUAcUxtivPI7MRcIbK5RfZDCQdb
	 FsdZmzBBVDzRb1up/8FSCXYUrmZZ/VNfAvBFcXQXEZWY69VEIAnKsAFihJc3ABtCHp
	 6qK1WFyMpFjobl3eUw2A8zKBmPY5MmAb6OFI3MZIFqi1OaRnQhZUJHNfVezE3xN0Rt
	 Soub50vKANT/w==
Date: Wed, 4 Sep 2024 08:46:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Yangyu Chen <cyy@cyyself.name>, Jisheng Zhang <jszhang@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
	Meng Zhang <zhangmeng.kevin@spacemit.com>, Meng Zhang <kevin.z.m@hotmail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: gpio: spacemit: add support for K1 SoC
Message-ID: <ttvqw3hncprtshhdgsnvlfopobqcxtsraxevgxqgnlt6orftkr@ktahud64cczd>
References: <20240904-03-k1-gpio-v1-0-6072ebeecae0@gentoo.org>
 <20240904-03-k1-gpio-v1-1-6072ebeecae0@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240904-03-k1-gpio-v1-1-6072ebeecae0@gentoo.org>

On Wed, Sep 04, 2024 at 12:27:23AM +0000, Yixun Lan wrote:
> The GPIO controller of K1 support basic functions as input/output,
> all pins can be used as interrupt which route to one IRQ line,
> trigger type can be select between rising edge, failing edge, or both.
> There are four GPIO banks, each consisting of 32 pins.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 95 ++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> new file mode 100644
> index 0000000000000..db2e62fb452fd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/spacemit,k1-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SpacemiT K1 GPIO controller
> +
> +description: >

Drop >

> +  The controller's registers are organized as sets of eight 32-bit
> +  registers with each set controlling a bank of up to 32 pins.  A single
> +  interrupt is shared for all of the banks handled by the controller.
> +
> +maintainers:
> +  - Yixun Lan <dlan@gentoo.org>

Maintainers go before description. Use example-schema as template.

> +
> +properties:
> +  $nodename:
> +    pattern: '^gpio@[0-9a-f]+$'


No, why? Drop.

> +
> +  compatible:
> +    items:

and you can drop items as well.

> +      - const: spacemit,k1-gpio
> +
> +  reg:
> +    maxItems: 1
> +    description: >

Drop >. Everywhere.

> +      Define the base and range of the I/O address space containing
> +      the SpacemiT K1 GPIO controller registers

Redundant description, drop.

> +
> +  ranges: true
> +
> +  "#gpio-cells":
> +    const: 2
> +    description: >
> +      The first cell is the pin number (within the controller's
> +      pin space), and the second is used for the following:
> +      bit[0]: polarity (0 for active-high, 1 for active-low)

Rather refer to standard GPIO bindings header.

> +
> +  gpio-controller: true
> +
> +  gpio-ranges: true
> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      The interrupt shared by all GPIO lines for this controller.
> +
> +  interrupt-names:
> +    items:
> +      - const: gpio_mux
> +
> +  "#interrupt-cells":
> +    const: 2
> +    description: |
> +      The first cell is the GPIO number, the second should specify
> +      flags.  The following subset of flags is supported:
> +      - bits[3:0] trigger type flags (no level trigger type support)
> +        1 = low-to-high edge triggered
> +        2 = high-to-low edge triggered
> +      Valid combinations are 1, 2, 3

Hm? No, you must use standard interrupt flags, not custom ones.

> +
> +  interrupt-controller: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - interrupts
> +  - interrupt-names
> +  - interrupt-controller
> +  - '#interrupt-cells'

Use consistent quotes. Either ' or ".

> +
> +additionalProperties: false

Best regards,
Krzysztof


