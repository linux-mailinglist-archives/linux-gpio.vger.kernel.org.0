Return-Path: <linux-gpio+bounces-16520-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BB6A42D54
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 21:06:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FF02188F4B1
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 20:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC9F92063DB;
	Mon, 24 Feb 2025 20:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fTxJYGAH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFBAEEA9;
	Mon, 24 Feb 2025 20:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740427570; cv=none; b=coYHiwXvFv1BlPfRGQ/3iskofl/7n9G72el+QtQxGis+8jQ4lYi5X9iAB7po74VE/3o22u7toDFjnVrGya5UVDTGB4fXengOl9a3wY1md9HGl8gglegEJdOCJaVmiDy3rI8F6xfLpDBMdmjYDaV6YRjC7UGZboU4PlOxQyw8zto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740427570; c=relaxed/simple;
	bh=stM2IVR3b2kvR088SM8/A8kfusx7eVUGjEIOksI9LxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M21jG8gZOXq8JJhmHZ4ZS8oWunWejGi9F3Zx38wYVJXvfEPxfGONC/7PUEnsf/r1Zj5ngQiXcD3adcCxp6oBbnF4ZWxC2iivEd55K4I4CXLpLdsb8rK/MzC7S1ovmUpS1s4t8o5JnIP4TUfZTqWtRCipif7wpn4Hqbb5ndi0Byg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fTxJYGAH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF2CAC4CED6;
	Mon, 24 Feb 2025 20:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740427570;
	bh=stM2IVR3b2kvR088SM8/A8kfusx7eVUGjEIOksI9LxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fTxJYGAHV6FCp80DxZ0l0De/AoUhpsBvWAIfLfrdXZ80o3hrfPZJcAVurzbA8BNSE
	 ASaGSNB347y5MyVhE+qziw0Ce1PMKxGyGf/2RcUzQwZuKkKrPnC1FWrk5kCtXJ4B32
	 EEmrUZ1DwdjL4ABOXWIy1G8XsVVIHMU7oiLYdBYcfIsJe8OgeR01gjkkyrMYbQMjrQ
	 1A2EZ8pjVSfvY8vlXok+kOgJGBJTLJ8knBy9aqg7pxs8LY/azao9rfsT7RG9v+VBCw
	 hcxR6nQ8GJYBFQn8qTxlh5RZ3DeoF4fX86xb4wlOxj3g2MkPC7b40S5aSc2mYAGnLb
	 1lcWhvij8UAGQ==
Date: Mon, 24 Feb 2025 14:06:08 -0600
From: Rob Herring <robh@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>,
	Jisheng Zhang <jszhang@kernel.org>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v6 1/4] dt-bindings: gpio: spacemit: add support for K1
 SoC
Message-ID: <20250224200608.GA4014994-robh@kernel.org>
References: <20250223-03-k1-gpio-v6-0-db2e4adeef1c@gentoo.org>
 <20250223-03-k1-gpio-v6-1-db2e4adeef1c@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250223-03-k1-gpio-v6-1-db2e4adeef1c@gentoo.org>

On Sun, Feb 23, 2025 at 07:49:32PM +0800, Yixun Lan wrote:
> The GPIO controller of K1 support basic functions as input/output,
> all pins can be used as interrupt which route to one IRQ line,
> trigger type can be select between rising edge, falling edge, or both.
> There are four GPIO banks, each consisting of 32 pins.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 81 ++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..017165d325565a6868700a9ac8298b61dffcfef4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/spacemit,k1-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SpacemiT K1 GPIO controller
> +
> +maintainers:
> +  - Yixun Lan <dlan@gentoo.org>
> +
> +description:
> +  The controller's registers are organized as sets of eight 32-bit
> +  registers with each set of port controlling 32 pins.  A single
> +  interrupt line is shared for all of the pins by the controller.
> +
> +properties:
> +  $nodename:
> +    pattern: "^gpio@[0-9a-f]+$"
> +
> +  compatible:
> +    const: spacemit,k1-gpio
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 3
> +    description:
> +      The first two cells are the GPIO bank index and offset inside the bank,
> +      the third cell should specify GPIO flag.
> +
> +  gpio-ranges: true
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 3
> +    description:
> +      The first two cells are the GPIO bank index and offset inside the bank,
> +      the third cell should specify interrupt flag. The controller does not
> +      support level interrupts, so flags of IRQ_TYPE_LEVEL_HIGH, IRQ_TYPE_LEVEL_LOW
> +      should not be used. Refer <dt-bindings/interrupt-controller/irq.h> for valid flags.

Wrap lines at 80 chars.

> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - interrupts
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +  - gpio-ranges
> +
> +additionalProperties: false
> +
> +dependencies:
> +  interrupt-controller: [ interrupts ]

You made 'interrupts' always required, so this is redundant.

> +
> +examples:
> +  - |
> +    gpio: gpio@d4019000 {

Drop unused labels.

> +      compatible = "spacemit,k1-gpio";
> +      reg = <0xd4019000 0x800>;
> +      gpio-controller;
> +      #gpio-cells = <3>;
> +      interrupts = <58>;
> +      interrupt-controller;
> +      interrupt-parent = <&plic>;
> +      #interrupt-cells = <3>;
> +      gpio-ranges = <&pinctrl 0 0 0 32>,
> +                    <&pinctrl 1 0 32 32>,
> +                    <&pinctrl 2 0 64 32>,
> +                    <&pinctrl 3 0 96 32>;
> +    };
> +...
> 
> -- 
> 2.48.1
> 

