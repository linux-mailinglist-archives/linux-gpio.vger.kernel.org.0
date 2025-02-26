Return-Path: <linux-gpio+bounces-16600-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BB9A451CF
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 02:01:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B71131743F5
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 01:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F212F5B;
	Wed, 26 Feb 2025 01:01:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5480C63CF;
	Wed, 26 Feb 2025 01:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740531675; cv=none; b=LZRIFcLubh0ycPS34WX9clD5e4aEZcJpcmD9nsBY4DYrt7/Jgk2R8/T3IHEV7m07QbUj9avKS04QfeQ2til+ayuCKcsWd6XftyclqPUsgAdltOC/DOTG4If3g/dM6b+KEht2xVay2lvPemrw3EAiC5bjhsYKCtiXM26TdyTjFBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740531675; c=relaxed/simple;
	bh=ndgmvJpYY0f5d8nmPn7hN8YJZl0cgL5q7U04Kq5JPHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YPPQbi/mRPTI59mlCiusJG5f9M9D716UdsHiKwejQyEVcPizgr1jugJZIUBEP4dFS42CQ/7mX0H9UJgVzc1b/eKVk27c2XZTiZLP7kFxebRTbLWdMEVSYn8tNXf2/DVZWvP3tayzqocyd043WWo53WqbWvbXQuAy+tEFn5n9Ji4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 22AB134300C;
	Wed, 26 Feb 2025 01:01:12 +0000 (UTC)
Date: Wed, 26 Feb 2025 01:01:08 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alex Elder <elder@riscstar.com>, Yangyu Chen <cyy@cyyself.name>,
	Jisheng Zhang <jszhang@kernel.org>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v7 0/4] riscv: spacemit: add gpio support for K1 SoC
Message-ID: <20250226010108-GYA44567@gentoo>
References: <20250226-03-k1-gpio-v7-0-be489c4a609b@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226-03-k1-gpio-v7-0-be489c4a609b@gentoo.org>

Hi Linus Walleij:

  I'm quite satisfied with this version, but there is still one problem
of irq parsing that haven't been resolved, although it probably is 
an independent patch that we can submit it later.

  For this, I'm not sure what's the approach we should proceed,
1) if we can get current version merged first then solve it later, or 
2) find a solution now and get it eventually fixed in this cycle

for the detail problem, see comments below

On 08:41 Wed 26 Feb     , Yixun Lan wrote:
> The gpio controller of K1 support basic GPIO functions,
> which capable of enabling as input, output. It can also be used
> as GPIO interrupt which able to detect rising edge, falling edge,
> or both. There are four GPIO ports, each consisting of 32 pins and
> has indepedent register sets, while still sharing IRQ line and clocks.
> 
> The GPIO controller request the clock source from APBC block,
> In this series, I haven't added the clock support, but plan
> to fix it after clock driver is merged.
> 
> Due to first three GPIO ports has interleave register settings, some
> resources (IRQ, clock) are shared by all pins.
> 
> The GPIO docs of K1 SoC can be found here, chapter 16.4 GPIO [1]
> 
> Note, this patch is rebased to v6.14-rc1.
> 
> This patch series has been tested on Bananapi-F3 board,
> with following GPIO cases passed:
>  1) gpio input
>  2) gpio output - set to high, low
>  3) gpio interrupt - rising trigger, falling trigger, both edge trigger
> 
> This version should resolve DT related concern in V4, and register each bank as
> indepedent gpio chip in driver, no more sub children gpio DT node needed.
> 
> One problem is still not resolved, the interrupt cells parsing isn't correct.
> but it works if request gpio irq via gpiod_get() + gpiod_to_irq()
> 

Let me iterate a little bit more detail on this..

Current this v7 version work great with request irq from gpio, like:
	pin = devm_gpiod_get_optional(dev, "myirq", GPIOD_IN);
	irq = gpiod_to_irq(pin);
	devm_request_threaded_irq(dev, irq, ..)

but have problem if request irq via of_irq_get(), something like this:
DT part 
	mytst {
		..
		interrupt-parent = <&gpio>;
		interrupts = <1 28 IRQ_TYPE_EDGE_RISING>;
		interrupt-names = "wakeup";
	}

In source code
	irq = of_irq_get_byname(dev->of_node, "wakeup");

I've made an attempt to patch gpiolib to support three cells "interrupts"
syntax, but still fail, it always get last gpio irqchip of four, thus using
the wrong pin (e.g: will always get 3 from gpiochips 0, 1, 2, 3)


> Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf [1]
> Link: https://lore.kernel.org/all/20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org [2]
> Link: https://lore.kernel.org/all/20241016-02-k1-pinctrl-v5-0-03d395222e4f@gentoo.org/ [3]
> Link: https://lore.kernel.org/all/20250218-gpio-ranges-fourcell-v1-0-b1f3db6c8036@linaro.org [4]
> Link: https://lore.kernel.org/all/20250225-gpio-ranges-fourcell-v3-0-860382ba4713@linaro.org [5]
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> Changes in v7:
> - dt-binding: fix 80 column, drop unneeded dependencies
> - tested with patch v3 of "gpiolib: of: Handle threecell gpios" [5]
> - collect review tags
> - Link to v6: https://lore.kernel.org/r/20250223-03-k1-gpio-v6-0-db2e4adeef1c@gentoo.org
> 
> Changes in v6:
> - rebase to threecell gpio patch which proposed by LinusW at [4], 
>   drop unneeded *xlate(), *add_pin_range() function
> - add SPACEMIT prefix to macro
> - adjust register comments
> - drop 'index' member, instead calculate from offset
> - add IRQCHIP_SKIP_SET_WAKE as gpio doesn't support irq wake up
> - drop #ifdef CONFIG_OF_GPIO
> - move interrupt mask disabling/enabling into irq_*mask()
> - Link to v5: https://lore.kernel.org/r/20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org
> 
> Changes in v5:
> - export add_pin_range() from gpio core, support to add custom version
> - change to 3 gpio cells, model to <bank number>, <bank offset>, <gpio flag>
> - fold children DT nodes into parent
> - Link to v4: https://lore.kernel.org/r/20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org
> 
> Changes in v4:
> - gpio: re-construct gpio as four independent ports, also leverage gpio mmio API
> - gpio interrupt: convert to generic gpio irqchip
> - Link to v3: https://lore.kernel.org/r/20241225-03-k1-gpio-v3-0-27bb7b441d62@gentoo.org
> 
> Changes in v3:
> - dt: drop ranges, interrupt-names property
> - Link to v2: https://lore.kernel.org/r/20241219-03-k1-gpio-v2-0-28444fd221cd@gentoo.org
> 
> Changes in v2:
> - address dt-bindings comments, simplify example
> - rebase to 6.13-rc3 
> - Link to v1: https://lore.kernel.org/r/20240904-03-k1-gpio-v1-0-6072ebeecae0@gentoo.org
> 
> ---
> Yixun Lan (4):
>       dt-bindings: gpio: spacemit: add support for K1 SoC
>       gpio: spacemit: add support for K1 SoC
>       riscv: dts: spacemit: add gpio support for K1 SoC
>       riscv: dts: spacemit: add gpio LED for system heartbeat
> 
>  .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml |  79 ++++++
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  11 +
>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |   3 +
>  arch/riscv/boot/dts/spacemit/k1.dtsi               |  15 ++
>  drivers/gpio/Kconfig                               |   8 +
>  drivers/gpio/Makefile                              |   1 +
>  drivers/gpio/gpio-spacemit-k1.c                    | 277 +++++++++++++++++++++
>  7 files changed, 394 insertions(+)
> ---
> base-commit: 3d72d603afa72082501e9076eed61e0531339ef8
> change-id: 20240828-03-k1-gpio-61bf92f9032c
> prerequisite-change-id: 20250217-gpio-ranges-fourcell-85888ad219da:v3
> prerequisite-patch-id: 9d4c8b05cc56d25bfb93f3b06420ba6e93340d31
> prerequisite-patch-id: 7949035abd05ec02a9426bb17819d9108e66e0d7
> 
> Best regards,
> -- 
> Yixun Lan
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

