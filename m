Return-Path: <linux-gpio+bounces-24372-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67603B2569E
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 00:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68D111C8298D
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 22:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B351302763;
	Wed, 13 Aug 2025 22:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YK/mLLOn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7AE302750;
	Wed, 13 Aug 2025 22:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755124011; cv=none; b=EqzNkjhwuc2xpZgaXggZ4dyO0XClu2VWGvwJcJjctYv3Za5BRCLbmU1F5BOeikWI8qIUr3lFMRoxCyeMrC7wq6C/fH4Cu0OLS5Ql6QTG1c0WJuqM5qr90KttU+6XHW2ZR99j2uam9TJSbEuZA/of7vJWnW1VV55F26IWflRi0eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755124011; c=relaxed/simple;
	bh=QJzjfAhMjPNiT7D9rCxtV6m7EGIjZSpX3sIJXmN1Zks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=muOGJa4r9H/3VoRKLRrsA8AtxeG8gOz6JEJaC5sHc7aN6pZUT9V5Q7GnpFnOzBmUQUPJoIkfo5QBRTf21/YMFXS/908WuGxCmLkb+C24Zpp5CMUnHW+emzJK8bwUBzTpSD0CSqhLkttjGJS1oViPT0i77tgmuescw0iP9P4kHwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YK/mLLOn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C019C4CEEB;
	Wed, 13 Aug 2025 22:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755124010;
	bh=QJzjfAhMjPNiT7D9rCxtV6m7EGIjZSpX3sIJXmN1Zks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YK/mLLOnoWfT+EjdQpsYmfc5UbbS9SA1NX+iBZjKN/t4m40Bgd65y7p8bQ5+zV6KG
	 zBl6/uI3gZW1yNQavyxxXecJ9vtVKHkloa928GywP3h2VuhtC5lQXfo42MF/sU2pqX
	 Fy+ogiERV4ohJc/MkK2rXIC2kmVSf1A+62+WSJfs7e1e0iA5zbiG5f4tVJOQuYVcyZ
	 +5wujWgdjkiaS0WvGODQ7/Cp3OkU7hTJMkUiwplVNRuo+kjrrRzHHWFvr87dfBlnBu
	 8reE1TysvUa/3dsS9EL4AblkoJtlFyCBVG2+lnypgVqLkyrhfcO58DxRxwSCYze9UZ
	 95MhaUdDM71VQ==
Date: Wed, 13 Aug 2025 17:26:49 -0500
From: Rob Herring <robh@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	kernel test robot <lkp@intel.com>, Peng Fan <peng.fan@nxp.com>,
	Koichiro Den <koichiro.den@canonical.com>,
	Lee Jones <lee@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Yixun Lan <dlan@gentoo.org>, Lars-Peter Clausen <lars@metafoo.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: enable CONFIG_GPIOLIB_LEGACY even for !GPIOLIB
Message-ID: <20250813222649.GA965895-robh@kernel.org>
References: <20250726211053.2226857-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250726211053.2226857-1-arnd@kernel.org>

On Sat, Jul 26, 2025 at 11:10:43PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A few drivers that use the legacy GPIOLIB interfaces can be enabled
> even when GPIOLIB is disabled entirely. With my previous patch this
> now causes build failures like:
> 
>    drivers/nfc/s3fwrn5/uart.c: In function 's3fwrn82_uart_parse_dt':
>         drivers/nfc/s3fwrn5/uart.c:100:14: error: implicit declaration of function 'gpio_is_valid'; did you mean 'uuid_is_valid'? [-Werror=implicit-function-declaration]
> 
> These did not show up in my randconfig tests because randconfig almost
> always has GPIOLIB selected by some other driver, and I did most
> of the testing with follow-up patches that address the failures
> properly.
> 
> Move the symbol outside of the 'if CONFIG_GPIOLIB' block for the moment
> to avoid the build failures. It can be moved back and turned off by
> default once all the driver specific changes are merged.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202507261934.yIHeUuEQ-lkp@intel.com/
> Fixes: 678bae2eaa81 ("gpiolib: make legacy interfaces optional")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpio/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

This change causes all of the GPIO submenu to show up directly in the 
already way too long 'Device Drivers' menu.

> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 8bda3c9d47b4..c48f9badb513 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -12,11 +12,11 @@ menuconfig GPIOLIB
>  
>  	  If unsure, say N.
>  
> -if GPIOLIB
> -
>  config GPIOLIB_LEGACY
>  	def_bool y

Perhaps this has to be before "menuconfig GPIOLIB"?

>  
> +if GPIOLIB
> +
>  config GPIOLIB_FASTPATH_LIMIT
>  	int "Maximum number of GPIOs for fast path"
>  	range 32 512
> -- 
> 2.39.5
> 

