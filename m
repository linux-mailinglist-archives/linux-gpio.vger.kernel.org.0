Return-Path: <linux-gpio+bounces-17101-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4A9A4FC52
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 11:38:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0C1F16EB44
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 10:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B9920B1FB;
	Wed,  5 Mar 2025 10:35:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783E220AF97;
	Wed,  5 Mar 2025 10:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741170904; cv=none; b=LZwJ3he4rvUwqbKOZpx2HpPHvRD8G/X7yi58jFh4n3JVpdG4xjn+GQmiOJ79LDDTtlNw9W74/7wl5amof5MSr8ADTIkIbNy/sz82E/0+KVmK9e9RIhyAsZmUArc9DTbO5PTQauSzU/D8P/rRuFqKf7drbSX8fCMtPo/K5z8xbTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741170904; c=relaxed/simple;
	bh=PqrUbqq/B4BhQn1+Wzo5YUBHYxX/JkF9v8e4BTj6EAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IV3Y8csBL0BZC/cn53jdXS+iLPYs7GeVXsLFPBuR+HyGQGtW60FMMBH5+eBhLpVeD+THpGX4D8jBNsxQ4h6xIAsWMKVH0UqTVFGwQt1uTtOQJLpsWUu6u4KXl7e/ZIflEaZeV3aUEoapKMtcrfPqQEdvkcTExcBfb8nEOSPI1IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 6202733C1EB;
	Wed, 05 Mar 2025 10:35:02 +0000 (UTC)
Date: Wed, 5 Mar 2025 10:34:58 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] pinctrl: spacemit: destroy mutex at driver detach
Message-ID: <20250305103458-GYA63227@gentoo>
References: <20250305102710.52762-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305102710.52762-1-brgl@bgdev.pl>

On 11:27 Wed 05 Mar     , Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The mutex initialized in probe() is never cleaned up. Use
> devm_mutex_init() to destroy it automatically.
> 
Reviewed-by: Yixun Lan <dlan@gentoo.org>

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/pinctrl/spacemit/pinctrl-k1.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
> index 59fd555ff38d..67e867b04a02 100644
> --- a/drivers/pinctrl/spacemit/pinctrl-k1.c
> +++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
> @@ -9,6 +9,7 @@
>  #include <linux/seq_file.h>
>  #include <linux/spinlock.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  
>  #include <linux/pinctrl/pinconf-generic.h>
>  #include <linux/pinctrl/pinconf.h>
> @@ -749,7 +750,10 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
>  	pctrl->data = pctrl_data;
>  	pctrl->dev = dev;
>  	raw_spin_lock_init(&pctrl->lock);
> -	mutex_init(&pctrl->mutex);
> +
> +	ret = devm_mutex_init(dev, &pctrl->mutex);
> +	if (ret)
> +		return ret;
>  
>  	platform_set_drvdata(pdev, pctrl);
>  
> -- 
> 2.45.2
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

