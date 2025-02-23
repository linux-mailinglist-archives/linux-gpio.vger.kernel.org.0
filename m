Return-Path: <linux-gpio+bounces-16436-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61504A40EC1
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 13:06:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F38517781F
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 12:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC928204F92;
	Sun, 23 Feb 2025 12:06:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ED820127E;
	Sun, 23 Feb 2025 12:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740312406; cv=none; b=cp7EL2TfkOjMjMkh9U+ni+6Au+qKd+odb/6PTO39+Ekfk1ZefTDwN8+zsaUxe62sAfrmjLslBJrL1rjyLBO7SDgqOo6IRnUrCl2p+WeGFI2cQCCFUvjBFVUIH79SzNOTiwQxU+89PFSw7YjPWIU4zdR+fbQao5R9qWI3E85W4nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740312406; c=relaxed/simple;
	bh=L853LGGQMzlJq6txYGySmcOYQdIGRGwO5NgCBY5oOwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d09BXRfXb5I0/Rk4Amxo80JgFfrn09I+i/vklZPZJsB8/dLVrKse9InsAcR27D5TmpS0mqRABFibWACjhx6rjr915ZWbrFvHfEaOdy6Nbs+GPchMLoJNsn421QXPG0b2KWYGFFIqft4px5A8VwAiYEBUeSFD9gWiYjGlkVZ43/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.172.118.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 987443431E1;
	Sun, 23 Feb 2025 12:06:43 +0000 (UTC)
Date: Sun, 23 Feb 2025 12:06:38 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alex Elder <elder@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>,
	Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v3] pinctrl: spacemit: enable config option
Message-ID: <20250223120638-GYA39613@gentoo>
References: <20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org>

Hi Linus Walleij:

On 08:31 Tue 18 Feb     , Yixun Lan wrote:
> Pinctrl is an essential driver for SpacemiT's SoC,
> The uart driver requires it, same as sd card driver,
> so let's enable it by default for this SoC.
> 
> The CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled when using
> 'make defconfig' to select kernel configuration options.
> This result in a broken uart driver where fail at probe()
> stage due to no pins found.
> 

Can you take this patch via pinctrl fixes tree? if possible in this cycle

> Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC")
> Reported-by: Alex Elder <elder@kernel.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Tested-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> This should fix problem that CONFIG_PINCTRL_SPACEMIT_K1 is not enabled
> when using make defconfig, thus fail to initilize uart driver which requst
> pins during probe stage.
> ---
> Changes in v3:
> - switch PINCTRL_SPACEMIT_K1 from tristate to bool
> - Link to v2: https://lore.kernel.org/r/20250212-k1-pinctrl-option-v2-1-bde7da0bc0d9@gentoo.org
> 
> Changes in v2:
> - set default as y
> - Link to v1: https://lore.kernel.org/r/20250207-k1-pinctrl-option-v1-1-e8a7e4d8404f@gentoo.org
> ---
>  arch/riscv/Kconfig.socs               | 1 +
>  drivers/pinctrl/spacemit/Kconfig      | 3 ++-
>  drivers/pinctrl/spacemit/pinctrl-k1.c | 2 +-
>  3 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 1916cf7ba450ec9958265de2ca41dc504d4d2f7c..17606940bb5239d0fdfc6b5aefb50eeb982d14aa 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -26,6 +26,7 @@ config ARCH_SOPHGO
>  
>  config ARCH_SPACEMIT
>  	bool "SpacemiT SoCs"
> +	select PINCTRL
>  	help
>  	  This enables support for SpacemiT SoC platform hardware.
>  
> diff --git a/drivers/pinctrl/spacemit/Kconfig b/drivers/pinctrl/spacemit/Kconfig
> index 168f8a5ffbb952cbeae3e3401c11149558e0a84b..a2f98b3f8a75580d2d157008997cc48f42a89368 100644
> --- a/drivers/pinctrl/spacemit/Kconfig
> +++ b/drivers/pinctrl/spacemit/Kconfig
> @@ -4,9 +4,10 @@
>  #
>  
>  config PINCTRL_SPACEMIT_K1
> -	tristate "SpacemiT K1 SoC Pinctrl driver"
> +	bool "SpacemiT K1 SoC Pinctrl driver"
>  	depends on ARCH_SPACEMIT || COMPILE_TEST
>  	depends on OF
> +	default y
>  	select GENERIC_PINCTRL_GROUPS
>  	select GENERIC_PINMUX_FUNCTIONS
>  	select GENERIC_PINCONF
> diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
> index a32579d736130c80bd12f0f9d8b3b2f69c428b3d..59fd555ff38d4453f446263a8fdb4a61faf63cfc 100644
> --- a/drivers/pinctrl/spacemit/pinctrl-k1.c
> +++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
> @@ -1044,7 +1044,7 @@ static struct platform_driver k1_pinctrl_driver = {
>  		.of_match_table		= k1_pinctrl_ids,
>  	},
>  };
> -module_platform_driver(k1_pinctrl_driver);
> +builtin_platform_driver(k1_pinctrl_driver);
>  
>  MODULE_AUTHOR("Yixun Lan <dlan@gentoo.org>");
>  MODULE_DESCRIPTION("Pinctrl driver for the SpacemiT K1 SoC");
> 
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250207-k1-pinctrl-option-de5bdfd6b42e
> 
> Best regards,
> -- 
> Yixun Lan
> 
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

