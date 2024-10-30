Return-Path: <linux-gpio+bounces-12310-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 331BE9B6832
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 16:45:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE57D1F22F97
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 15:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9009F1F473A;
	Wed, 30 Oct 2024 15:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gaisler.com header.i=@gaisler.com header.b="Pf3KCgqy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7C11990C5;
	Wed, 30 Oct 2024 15:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.231.106.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730303126; cv=none; b=Ql7Z6hAVYgEYTzT5PeEYzZjq7/CPGxkL+700sAVFE53bmTaDfi2uAFjz5Yc0XKVXqw0B6TMCoziY3OGv3sIWM9DfbQnG8IuXRtZrwsGT3TT+r3c7+bp9bkmY2Ns92tOpPXkMYLA65iFbmyDUt2IoNJE8ddTGyT+Vd6LjBELOSGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730303126; c=relaxed/simple;
	bh=pv7vLdQ3ku4Y9BlqvessMPs3r63z01A7s/0z8AKv83w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AIW1tR60BIrBzhgpDHDq0V55dmOed65ctg5fzOpMoIA9b7NxwdO9qpwqXKULJno/JJN9l+pAsx6kHYNG5Yoie/9KrcBQh3hBc3CbeJMwx3ZNiHqjfuyklMy35GmbBMx/VRJ93lajLt5z9Fau9AscshsfUlAP6Mh787MZqaDhGhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com; spf=pass smtp.mailfrom=gaisler.com; dkim=pass (1024-bit key) header.d=gaisler.com header.i=@gaisler.com header.b=Pf3KCgqy; arc=none smtp.client-ip=94.231.106.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gaisler.com
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4Xdrzs39NLz1FXSV;
	Wed, 30 Oct 2024 16:45:13 +0100 (CET)
Received: from [192.168.0.25] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4Xdrzs1gjWz1FXSM;
	Wed, 30 Oct 2024 16:45:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=unoeuro; t=1730303113;
	bh=RcjIBm8gFiHFoNhk0cnwIi80Gv6waCf1XdxsAhpY9EU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Pf3KCgqyQ63cZ8+SFqm0D42zS1KaVrQdIKDkwBWMtfjohY2eG7KbVArSXqfhaYMcg
	 nXE6N25jnzmkEMuLd7Kk5RCt1FSZb1KJLnSCvme4KhNkgy11ii4mtr79SmEt2Ap0vf
	 qG6zsPpyHIOEl45/xSFbXP1CckJkSBnlaUb6Z8XY=
Message-ID: <04040095-27c2-49a1-b956-ac7bbd5f919a@gaisler.com>
Date: Wed, 30 Oct 2024 16:45:11 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: GPIO_GRGPIO should depend on OF_GPIO
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, sparclinux@vger.kernel.org
References: <140b0f7522ff2f86a7fad0be88c19111fa6cb5b1.1730282507.git.geert+renesas@glider.be>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <140b0f7522ff2f86a7fad0be88c19111fa6cb5b1.1730282507.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-10-30 11:03, Geert Uytterhoeven wrote:
> While the Aeroflex Gaisler GRGPIO driver has no build-time dependency on
> gpiolib-of, it supports only DT-based configuration, and is used only on
> DT systems.  Hence re-add the dependency on OF_GPIO, to prevent asking
> the user about this driver when configuring a kernel without DT support.
> 
> Fixes: bc40668def384256 ("gpio: grgpio: drop Kconfig dependency on OF_GPIO")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/gpio/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 158ec0d7e52e2e51..a7b27a8541f572d5 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -341,6 +341,7 @@ config GPIO_GRANITERAPIDS
>  
>  config GPIO_GRGPIO
>  	tristate "Aeroflex Gaisler GRGPIO support"
> +	depends on OF_GPIO || COMPILE_TEST
>  	select GPIO_GENERIC
>  	select IRQ_DOMAIN
>  	help

Or alternatively:

	depends on OF || COMPILE_TEST

Reviewed-by: Andreas Larsson <andreas@gaisler.com>

Thanks,
Andreas


