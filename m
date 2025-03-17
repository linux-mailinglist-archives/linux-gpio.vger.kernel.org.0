Return-Path: <linux-gpio+bounces-17683-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E396FA650B8
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 14:23:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCDE13A3D8C
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 13:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F8BD23CEF8;
	Mon, 17 Mar 2025 13:23:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DCC1A5BB8;
	Mon, 17 Mar 2025 13:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742217792; cv=none; b=sR0x1IMv42Nv7osFOtYnxCgM160yIumQ/C+7gGz6ytjfN1WqB6ybC5EmQ/OvAngcTg8cvcM1Zmkoiq5ZJ3gKRb0nVQYxLi0+6PyXyF8PF4eWKElNHosuO47dfdIf+qizvGA2yHecCKnveMGM9i6OBCAbJL4zKppSL1wGwzVcYNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742217792; c=relaxed/simple;
	bh=837yEMNh9DUy4Bh+x2SLtCmrRrT+x9wYFtLCy5sBoQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P2JXdlG+9s3WJfW/WM99q5M79Tp/MrrkzdGT0SsxfeWnrEVxQ7qPVDn7OMUysydRIXEO1zYisshay3IZUy0gAjwzNrDb1k2YQZYTuGs+1xn6MWutyAxe4GVliFbZQjFjylvC+wiYSLqwjBqEHTf/CkJo4xDnxmxRXFr3vUk/oas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 1B624343252;
	Mon, 17 Mar 2025 13:23:08 +0000 (UTC)
Date: Mon, 17 Mar 2025 13:23:04 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: spacemit: PINCTRL_SPACEMIT_K1 should not
 default to y unconditionally
Message-ID: <20250317132304-GYB1983@gentoo>
References: <6881b8d1ad74ac780af8a974e604b5ef3f5d4aad.1742198691.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6881b8d1ad74ac780af8a974e604b5ef3f5d4aad.1742198691.git.geert+renesas@glider.be>

Hi Linus Walleij:

Can you also take this? thanks

On 09:06 Mon 17 Mar     , Geert Uytterhoeven wrote:
> Merely enabling compile-testing should not enable additional
> functionality.
> 
> Fixes: 7ff4faba63571c51 ("pinctrl: spacemit: enable config option")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Yixun Lan <dlan@gentoo.org>

> ---
>  drivers/pinctrl/spacemit/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/spacemit/Kconfig b/drivers/pinctrl/spacemit/Kconfig
> index a2f98b3f8a75580d..d6f6017fd097d326 100644
> --- a/drivers/pinctrl/spacemit/Kconfig
> +++ b/drivers/pinctrl/spacemit/Kconfig
> @@ -7,7 +7,7 @@ config PINCTRL_SPACEMIT_K1
>  	bool "SpacemiT K1 SoC Pinctrl driver"
>  	depends on ARCH_SPACEMIT || COMPILE_TEST
>  	depends on OF
> -	default y
> +	default ARCH_SPACEMIT
>  	select GENERIC_PINCTRL_GROUPS
>  	select GENERIC_PINMUX_FUNCTIONS
>  	select GENERIC_PINCONF
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

