Return-Path: <linux-gpio+bounces-18802-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B09A891E2
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 04:32:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FBC07AA3AD
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 02:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 859B817A31F;
	Tue, 15 Apr 2025 02:32:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21B94A1A;
	Tue, 15 Apr 2025 02:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744684361; cv=none; b=mFg/HgoIU03EC3ypiDt5t87hGtk7SG1f6soige/14SkWWtStHT3c8qMTQT3z2S5Z6Gc51jcu9tT+uiWA1baaXHgYPNj7uPlbd0U+y5lLRFw9T9964qQ6JqJV+iW5OQEIR5jfEENtWsOMJrGzvpLt3wV+7G3QLWbPVvFrzXnrFDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744684361; c=relaxed/simple;
	bh=5aU/+jQzMsPhnk/kxaQnQS5SJH3IK8b/Do4X0eL5/oI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROl2WyhTxHZFz+zzEUb4LzSgadSi8mEdt+noTqUjlBGm6Sr5VnXxIcAF5o/pSvDYoWWH3wi2XEQP9dGR8fVL7OhxM3UfdbR8cWPixJLctYoDzf4aqB7DOCpxVP5hnMRNq28uAUcnO0kCKqdAbkGd0mx0nGxNdeZmFUO5xz4fAVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 8CC5E34309F;
	Tue, 15 Apr 2025 02:32:38 +0000 (UTC)
Date: Tue, 15 Apr 2025 02:32:34 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH v8 0/5] riscv: spacemit: add gpio support for K1 SoC
Message-ID: <20250415023234-GYA29961@gentoo>
References: <20250412-03-k1-gpio-v8-0-1c6862d272ec@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412-03-k1-gpio-v8-0-1c6862d272ec@gentoo.org>

Hi Bartosz,
  I think this version is good to go, if you agree,
can you take patch [1,2 / 5] through gpio tree?

Hi Palmer,
  I believe the change to riscv's defconfig file should
 go via riscv tree?

 thanks

On 07:31 Sat 12 Apr     , Yixun Lan wrote:
> The gpio controller of K1 support basic GPIO functions,
> which capable of enabling as input, output. It can also be used
> as GPIO interrupt which able to detect rising edge, falling edge,
> or both. There are four GPIO ports, each consisting of 32 pins and
> has indepedent register sets, while still sharing IRQ line and clocks.
> The GPIO controller request the two clock sources from APBC block.
> 
> Due to first three GPIO ports has interleave register settings, some
> resources (IRQ, clock) are shared by all pins.
> 
> The GPIO docs of K1 SoC can be found here, chapter 16.4 GPIO [1]
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
> Please notice in this version, the reset property is added, but optional.
> as I see no need to activate it in driver, instead I suspect it may
> break cases if bootloader did some prerequisite settings, so I'm leaving
> it for future implementation if really necessary.
> 
> The DT part (patches 4, 5) has no clock property populated which result
> some DT warnings, I will fix it and re-spin the DT part once clock driver merged,
> so it's included here for completeness only, please ignore these warnings.
> 
> Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf [1]
> Link: https://lore.kernel.org/all/20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org [2]
> Link: https://lore.kernel.org/all/20241016-02-k1-pinctrl-v5-0-03d395222e4f@gentoo.org/ [3]
> Link: https://lore.kernel.org/all/20250218-gpio-ranges-fourcell-v1-0-b1f3db6c8036@linaro.org [4]
> Link: https://lore.kernel.org/all/20250225-gpio-ranges-fourcell-v3-0-860382ba4713@linaro.org [5]
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> Changes in v8:
> - rebased to v6.15-rc1
> - adjust dt-binding/code to request clocks
> - add reset property
> - call irq_domain_update_bus_token() to support threecells interrupt mode
> - use devm_platform_ioremap_resource(), so drop "struct resource"
> - fix Kconfig
>   - select GPIO_GENERIC as calling bgpio_init()
>   - change to tristate, make it possible to build as module
> - adjust defconfig to enable gpio 
> - Link to v7: https://lore.kernel.org/r/20250226-03-k1-gpio-v7-0-be489c4a609b@gentoo.org
> 
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
> Yixun Lan (5):
>       dt-bindings: gpio: spacemit: add support for K1 SoC
>       gpio: spacemit: add support for K1 SoC
>       riscv: defconfig: spacemit: enable gpio support for K1 SoC
>       riscv: dts: spacemit: add gpio support for K1 SoC
>       riscv: dts: spacemit: add gpio LED for system heartbeat
> 
>  .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml |  96 +++++++
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  11 +
>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |   3 +
>  arch/riscv/boot/dts/spacemit/k1.dtsi               |  15 ++
>  arch/riscv/configs/defconfig                       |   1 +
>  drivers/gpio/Kconfig                               |   9 +
>  drivers/gpio/Makefile                              |   1 +
>  drivers/gpio/gpio-spacemit-k1.c                    | 293 +++++++++++++++++++++
>  8 files changed, 429 insertions(+)
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20240828-03-k1-gpio-61bf92f9032c
> 
> Best regards,
> -- 
> Yixun Lan
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

