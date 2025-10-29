Return-Path: <linux-gpio+bounces-27849-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1106AC1CA3C
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 19:00:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C371624FB8
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 17:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D97E03491F5;
	Wed, 29 Oct 2025 17:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N/EdVFt+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0BD32C941;
	Wed, 29 Oct 2025 17:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761758441; cv=none; b=teWozRGsRfIc4zBQ4xnIbJO5DzQhr30f25RsZ47LW+2AXDRANOO7b9YqHU7UAMyeQOELJ4+lnCR2ulHcrEkIEDXLMChnjCGpkf3tcp/9DQP9SJiM6hqs5ITNfTwO0giC7P3iC69vD1FdytxEWbw4xgEH5TEhCi4C2iTZBxVTSLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761758441; c=relaxed/simple;
	bh=fRO3N8gBJsLWYOcvvMBetHyoZTIc2Qfk5OoctK9z4cY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cBsUm7h7ArZDrRy7gNtK3NHFDHVQsZLLknM5H2EqW/xlI/RsfsANimPQQcDEtidAAv5Wax8vQ0Fcc7NJAYKmZx/SPB9ul5M8/w0749nFTos8+hbQL5hH/Hw+vRnIp2m7dYbV9xEgCgOt4Zm8CcOxaEYRLalhHiOwia2L+JyoIXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N/EdVFt+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D03BFC4CEF7;
	Wed, 29 Oct 2025 17:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761758441;
	bh=fRO3N8gBJsLWYOcvvMBetHyoZTIc2Qfk5OoctK9z4cY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N/EdVFt+7i6uw00cv7W15qxY7Dr3YFHx9glHH7ILW38C+Ro4XjgKVnNAeSYuXGs+h
	 83iRqmQY02PCGvYZvtxPfhBjcVh3u/wW02siqXIUTgZJEDMS5/kokTX++ycNzaCsH5
	 yXTaoXuyWLchtj1D6pw75IljWYLOkqwfSReZ8q3x/v8gWcUVDv35XjMKhwKqdYEr9U
	 9NYPlhzk6120ifvtn1Hl9IY/bdPKM8/XWrBXzkRNwPyJzXIrQmU5YLF9yFF4oA3B73
	 GyBHOyWlnt5mEAqTZGQyzBi6opsPdBcArpCaRBIimRxBuY/OKziszCnKk5J8vE5197
	 2/XYNOwAcv3Vg==
Date: Wed, 29 Oct 2025 10:20:36 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v1] pinctrl: mpfs-iomux0: fix compile-time constant
 warning for LLVM prior to 17
Message-ID: <20251029172036.GA1130586@ax162>
References: <20251029-isolation-shield-b66aea79a9a4@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-isolation-shield-b66aea79a9a4@spud>

On Wed, Oct 29, 2025 at 03:29:35PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> With LLVM prior to 17.0.0:
> 
> drivers/pinctrl/pinctrl-mpfs-iomux0.c:89:2: error: initializer element is not a compile-time constant
>         MPFS_IOMUX0_GROUP(spi0),
>         ^~~~~~~~~~~~~~~~~~~~~~~
> drivers/pinctrl/pinctrl-mpfs-iomux0.c:79:10: note: expanded from macro 'MPFS_IOMUX0_GROUP'
>         .mask = BIT(mpfs_iomux0_##_name##_pins[0]),     \
>                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/vdso/bits.h:7:19: note: expanded from macro 'BIT'
> \#define BIT(nr)                 (UL(1) << (nr))
>                                 ^~~~~~~~~~~~~~~
> 
> This is a constant, but LLVM prior to a change from Nick to match the
> gcc behaviour did not allow this. The macro isn't really all that much
> of an idiot-proofing, just change it to the same sort that's in the
> gpio2 driver, where a second argument provides the mask/setting.
> 
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Link: https://github.com/ClangBuiltLinux/linux/issues/2140
> Fixes: 46397274da22 ("pinctrl: add polarfire soc iomux0 pinmux driver")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks a lot for the quick fix!

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
> Not entirely sold on the fixes tag since it's to shut up an old
> compiler, but no harm in it I guess.
> 
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: Linus Walleij <linus.walleij@linaro.org>
> CC: Nathan Chancellor <nathan@kernel.org>
> CC: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> CC: Bill Wendling <morbo@google.com>
> CC: Justin Stitt <justinstitt@google.com>
> CC: linux-riscv@lists.infradead.org
> CC: linux-gpio@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> CC: llvm@lists.linux.dev
> ---
>  drivers/pinctrl/pinctrl-mpfs-iomux0.c | 36 +++++++++++++--------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-mpfs-iomux0.c b/drivers/pinctrl/pinctrl-mpfs-iomux0.c
> index 49d9fcec0a16..cf5b2e4e8f5b 100644
> --- a/drivers/pinctrl/pinctrl-mpfs-iomux0.c
> +++ b/drivers/pinctrl/pinctrl-mpfs-iomux0.c
> @@ -73,33 +73,33 @@ static const unsigned int mpfs_iomux0_uart4_pins[] = { 11 };
>  static const unsigned int mpfs_iomux0_mdio0_pins[] = { 12 };
>  static const unsigned int mpfs_iomux0_mdio1_pins[] = { 13 };
>  
> -#define MPFS_IOMUX0_GROUP(_name) { \
> +#define MPFS_IOMUX0_GROUP(_name, _mask) { \
>  	.name = #_name "_mssio",	\
>  	.pins = mpfs_iomux0_##_name##_pins,	\
> -	.mask = BIT(mpfs_iomux0_##_name##_pins[0]),	\
> +	.mask = _mask,	\
>  	.setting = 0x0,	\
>  }, { \
>  	.name = #_name "_fabric",	\
>  	.pins = mpfs_iomux0_##_name##_pins,	\
> -	.mask = BIT(mpfs_iomux0_##_name##_pins[0]),	\
> -	.setting = BIT(mpfs_iomux0_##_name##_pins[0]),	\
> +	.mask = _mask,	\
> +	.setting = _mask,	\
>  }
>  
>  static const struct mpfs_iomux0_pin_group mpfs_iomux0_pin_groups[] = {
> -	MPFS_IOMUX0_GROUP(spi0),
> -	MPFS_IOMUX0_GROUP(spi1),
> -	MPFS_IOMUX0_GROUP(i2c0),
> -	MPFS_IOMUX0_GROUP(i2c1),
> -	MPFS_IOMUX0_GROUP(can0),
> -	MPFS_IOMUX0_GROUP(can1),
> -	MPFS_IOMUX0_GROUP(qspi),
> -	MPFS_IOMUX0_GROUP(uart0),
> -	MPFS_IOMUX0_GROUP(uart1),
> -	MPFS_IOMUX0_GROUP(uart2),
> -	MPFS_IOMUX0_GROUP(uart3),
> -	MPFS_IOMUX0_GROUP(uart4),
> -	MPFS_IOMUX0_GROUP(mdio0),
> -	MPFS_IOMUX0_GROUP(mdio1),
> +	MPFS_IOMUX0_GROUP(spi0, BIT(0)),
> +	MPFS_IOMUX0_GROUP(spi1, BIT(1)),
> +	MPFS_IOMUX0_GROUP(i2c0, BIT(2)),
> +	MPFS_IOMUX0_GROUP(i2c1, BIT(3)),
> +	MPFS_IOMUX0_GROUP(can0, BIT(4)),
> +	MPFS_IOMUX0_GROUP(can1, BIT(5)),
> +	MPFS_IOMUX0_GROUP(qspi, BIT(6)),
> +	MPFS_IOMUX0_GROUP(uart0, BIT(7)),
> +	MPFS_IOMUX0_GROUP(uart1, BIT(8)),
> +	MPFS_IOMUX0_GROUP(uart2, BIT(9)),
> +	MPFS_IOMUX0_GROUP(uart3, BIT(10)),
> +	MPFS_IOMUX0_GROUP(uart4, BIT(11)),
> +	MPFS_IOMUX0_GROUP(mdio0, BIT(12)),
> +	MPFS_IOMUX0_GROUP(mdio1, BIT(13)),
>  };
>  
>  static const char * const mpfs_iomux0_spi0_groups[] = { "spi0_mssio", "spi0_fabric" };
> -- 
> 2.51.0
> 

