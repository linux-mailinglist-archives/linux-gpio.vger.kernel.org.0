Return-Path: <linux-gpio+bounces-21621-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E828CADA7EF
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 08:05:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89F4B16D75E
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 06:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C8FA1C5F23;
	Mon, 16 Jun 2025 06:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KzUuj5EL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6D913632B;
	Mon, 16 Jun 2025 06:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750053912; cv=none; b=LN7ZEdyTs+Wp9PT7iU3GohvCLt6MFzRBcIWa8/KKnUNFqPzHMT6Q28BClo3Upfkxwe3He8pdJ8D61o5ue+6Oh0M/iRBI0/9NtrG5nPuxfINMeqRdLlU9XG2IYlXRgsp4a0l/HXPbOudMoJF6zE/IPf1LoaRzC8wEe1vBRH6iOJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750053912; c=relaxed/simple;
	bh=5BWz9FwN7V7x8vxN27g1twvyHPy+fK9jsrn1dGHbs8E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CsLDjjPqR28y/wpCXTG0YaB+sMQYLXVgTi7mr4uFlVJ1fCAhHtbvSpI0oQh2bnHZ8hJ7vki8EX7qApQ42auXYhORlT5vQXEBr9TcW+Hs7LG2o8IvcU8roSnv/PduApH0kF2EzQMAubknhJNqXbIcVif47kZsdsAvudFcHaOYg2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KzUuj5EL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3643FC4CEEA;
	Mon, 16 Jun 2025 06:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750053910;
	bh=5BWz9FwN7V7x8vxN27g1twvyHPy+fK9jsrn1dGHbs8E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KzUuj5ELcLWrhCKWYAXP63RPq7giIHUlOjkVIxjpKX9+l7+dP1O4hROiNXWW+Z5l/
	 dUXydJt+tW23f+r+SAljsgDRLc1qOF90aPNZ8+sM6s+2Z4apAVl0n+YV4nhGWX50vC
	 Vit5Ium2lvwX5LsRrNgJTbowkU/oPaRzGcX/6rtQ5ek6sOAQzc3c1LIhD7S4BXxVoD
	 vHohpvzI62G17mR43joZLiZmkR2Jd9vahCC56U4Iq4Oz3BxPOEdipgrgOfsbZ8g+IZ
	 qxMv+yO0+GzNfz3d2P6c1bb/tIwwtujwGDXttUQ9tn/DAM1/yJ0nRd7ZkzdWZXze5n
	 XFgUI78WZp7vQ==
Message-ID: <67b1a8d3-e695-4ea6-8405-1a8563cbf5f2@kernel.org>
Date: Mon, 16 Jun 2025 08:05:05 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] dt-bindings: gpio: gpio-cdns: convert to YAML
To: Harshit Shah <hshah@axiado.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 soc@lists.linux.dev
References: <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-0-341502d38618@axiado.com>
 <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-3-341502d38618@axiado.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-3-341502d38618@axiado.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/06/2025 06:31, Harshit Shah wrote:
> Convert Cadence family GPIO controller bindings to DT schema.
> 
> Changes during conversion:
>    - update the naming as per the other files.

You made it entirely different than every other file and review.

>    - add gpio maintainers

Not really, you need to find someone interested in that hardware, not
subsystem maintainers.

> 
> Signed-off-by: Harshit Shah <hshah@axiado.com>
> ---
>  .../devicetree/bindings/gpio/cdns,gpio.txt         | 43 ------------
>  .../devicetree/bindings/gpio/gpio-cdns.yaml        | 81 ++++++++++++++++++++++

Previous filename was correct.

>  2 files changed, 81 insertions(+), 43 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/cdns,gpio.txt b/Documentation/devicetree/bindings/gpio/cdns,gpio.txt
> deleted file mode 100644
> index 706ef00f5c64951bb29c79a5541db4397e8b2733..0000000000000000000000000000000000000000
> --- a/Documentation/devicetree/bindings/gpio/cdns,gpio.txt
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -Cadence GPIO controller bindings
> -


...

> diff --git a/Documentation/devicetree/bindings/gpio/gpio-cdns.yaml b/Documentation/devicetree/bindings/gpio/gpio-cdns.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..e71f0137912f88e69fb3fa20f096e1572211591c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-cdns.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-cdns.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cadence GPIO Controller
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +  - Bartosz Golaszewski <brgl@bgdev.pl>
> +
> +properties:
> +  compatible:
> +    const: cdns,gpio-r1p02
> +
> +  reg:
> +    minItems: 1

Why this is min and unconstrained...

> +
> +  clocks:
> +    maxItems: 1

But this is max?

maxItems: 1 in both cases (so clocks are correct, but why writing
similar things entirely different?).

> +
> +  ngpios:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Number of GPIO lines supported, maximum 32.
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +    description: |
> +      - First cell is the GPIO line number.
> +      - Second cell is flags as defined in <dt-bindings/gpio/gpio.h>,
> +        only GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW supported.
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +    description: |
> +      - First cell is the GPIO line number used as IRQ.
> +      - Second cell is the trigger type, as defined in
> +        <dt-bindings/interrupt-controller/irq.h>.
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - gpio-controller
> +  - "#gpio-cells"
> +
> +if:
> +  required: [interrupt-controller]
> +then:
> +  required:
> +    - interrupts
> +    - "#interrupt-cells"

Drop last one, core schema requires it.


Best regards,
Krzysztof

