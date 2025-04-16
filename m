Return-Path: <linux-gpio+bounces-18991-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9FFA90EB0
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 00:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DBA7189F01D
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 22:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DDC92343B5;
	Wed, 16 Apr 2025 22:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZClOAeIM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D085F204F90;
	Wed, 16 Apr 2025 22:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744843032; cv=none; b=buQqPGN3dfG+VjY3kTsI/luLztTqo2hdLgXhB3qcR5lSCLLhJ72+ctb1hIb4n4zwScOw/pCk1193GGoQyZ3sJdDDTfmvvkuDobctJ6P0cBFVJZd2HGjROUwSMajFrz2RfL5UqosOeENI5jMDGWjQko/b/MaTLPOE8G1u0Lw6C+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744843032; c=relaxed/simple;
	bh=GdvsN1LtIHMY8zJSroI+9TWLVN4zqOg8OLguK4T3YjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kD0AvLmV65d1bhQF7Lk5UCveslQaf10JeA1+8Fyt5N4tsfbMWIbNmW1FTnM5heixpKB7s6+5v5fjEau0u0XjOYu+4nrhVhAzv/1WlfyNKzam0vXdY/uzKEnGEXFTFpym44RUCLenDfBYUeg6rSpSFPuiaYF9C/xjpleBuiknHO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZClOAeIM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36CBCC4CEE2;
	Wed, 16 Apr 2025 22:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744843032;
	bh=GdvsN1LtIHMY8zJSroI+9TWLVN4zqOg8OLguK4T3YjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZClOAeIM863a5cHtZdWqGyG/lFZkKazWfOYJgO2WTst8ltDgkE9vnjhpEYrBZLHIe
	 C3pO+37q5MOe5PHcz02RW3JmIudnwBydcFQpofXfAhdeU/1yQ7sVWog0OpOIbCXavF
	 2NmAncXKuOlvIqQ6EHSXOFpbZVeiAEGY92cv6RK6NKNo5VrOWUXtZ8LuZqUm2pe9pp
	 hwytpPlUSzl/cgKgjiGN//rCk5vjCi6qd7puCiw47a+cR1NiuZ9MXB2F9shwJwsVZT
	 G99jaqyYHUVZPwSz2sCWrhPMOtPhOMUR6PTdwn2boubTP7LQvijpzr9UBDOerornaZ
	 VyNtIsoMCcktg==
Date: Wed, 16 Apr 2025 15:37:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 07/10] pinctrl: sx150x: enable building modules with
 COMPILE_TEST=y
Message-ID: <20250416223706.GA3230303@ax162>
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
 <20250408-gpiochip-set-rv-pinctrl-part1-v1-7-c9d521d7c8c7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-7-c9d521d7c8c7@linaro.org>

Hi Bartosz,

On Tue, Apr 08, 2025 at 09:17:44AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Increase the build coverage by enabling the sx150x modules with
> COMPILE_TEST=y.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/pinctrl/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 464cc9aca157..94eb41bb9cf2 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -541,7 +541,7 @@ config PINCTRL_STMFX
>  
>  config PINCTRL_SX150X
>  	bool "Semtech SX150x I2C GPIO expander pinctrl driver"
> -	depends on I2C=y
> +	depends on I2C=y || COMPILE_TEST
>  	select PINMUX
>  	select PINCONF
>  	select GENERIC_PINCONF
> 
> -- 
> 2.45.2
> 

This appears to break allmodconfig with

  ld.lld: error: undefined symbol: i2c_get_match_data
  >>> referenced by pinctrl-sx150x.c
  >>>               drivers/pinctrl/pinctrl-sx150x.o:(sx150x_probe) in archive vmlinux.a

  ld.lld: error: undefined symbol: i2c_smbus_write_byte_data
  >>> referenced by pinctrl-sx150x.c
  >>>               drivers/pinctrl/pinctrl-sx150x.o:(sx150x_probe) in archive vmlinux.a
  >>> referenced by pinctrl-sx150x.c
  >>>               drivers/pinctrl/pinctrl-sx150x.o:(sx150x_probe) in archive vmlinux.a
  >>> referenced by pinctrl-sx150x.c
  >>>               drivers/pinctrl/pinctrl-sx150x.o:(sx150x_regmap_reg_write) in archive vmlinux.a

  ld.lld: error: undefined symbol: i2c_smbus_read_byte_data
  >>> referenced by pinctrl-sx150x.c
  >>>               drivers/pinctrl/pinctrl-sx150x.o:(sx150x_regmap_reg_read) in archive vmlinux.a

  ld.lld: error: undefined symbol: i2c_register_driver
  >>> referenced by pinctrl-sx150x.c
  >>>               drivers/pinctrl/pinctrl-sx150x.o:(sx150x_init) in archive vmlinux.a
  make[4]: *** [scripts/Makefile.vmlinux:91: vmlinux] Error 1

I don't think this change makes much sense in light of this error,
unless the driver was converted to tristate.

Cheers,
Nathan

