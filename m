Return-Path: <linux-gpio+bounces-7678-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6DD9169D9
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 16:08:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E7E31F2182A
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 14:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6876515FCE9;
	Tue, 25 Jun 2024 14:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NdrqBK+X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858651B7F7;
	Tue, 25 Jun 2024 14:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719324484; cv=none; b=I90DyAVzMaGOzWMuOEGGLEYg8UQmkSFwqEKQK7Hsl3rUvbgFKFlIw4I9wmyNrAWmnnib/hmTs32IEaBRie4b6pd4fqMD3zhS6cD/4qdtnou++sCr1kzHKhM2a3zwM5I972ZHtALtWbDwpHDcTJyeW91JVgNlxJxOcib4LihEAPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719324484; c=relaxed/simple;
	bh=/zUFtZIZeDqCZmg2bLovLTDoYyRMpRKMLFnhpzZz4Ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQXa+1gWR5sitAzI3qfCNidGDs8KHvTvqnfUQaR7RNOD0d1S0Mo/siJWLKjpyM4FAqGiEPqoyJQB7XDkRQDTysuSkMYikM43NXn0UnBG5FKC+XGQJnAf9kDSuA8UTsWm/6cXXUcHproVeX84WxWAHnifR7qHJ7vFd8kWIBU6ao8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NdrqBK+X; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719324482; x=1750860482;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/zUFtZIZeDqCZmg2bLovLTDoYyRMpRKMLFnhpzZz4Ko=;
  b=NdrqBK+Xk4naks2YZ8JPe4Ggx/DcQAhZ7X2uZvBpEaf+sJbFzCjucIcp
   +SpKhQJs8Wn3X4m82hn9Qf4aIsF4g34suihOyXaV14q5m0iz9QW0puKGZ
   LLql+wdd/gNDInQnRQrpAmnCMlQA/ZOktKDMPkxr0CL3+Rz6s71HlkEHi
   8DoVZUXPccXGSqOzonHLsar5XaVgqDiyGvbgFg8XJOTMAb5Cq4dcs1Xiz
   D6njJk1m0DrJmyn7EvpVckEQaMF/fulPEUrCNOPbDuJLiuhT6euUs9WUe
   TqnRCRuRpnBz0WYB781tBOzOZBXyAmZfZvHuUOghdR1PPd0ClB5iavb/p
   g==;
X-CSE-ConnectionGUID: mNnL1xX6R32tJxWt3uNsxg==
X-CSE-MsgGUID: MHngs37/TA2YW8YvARgOVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16488633"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="16488633"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 07:07:39 -0700
X-CSE-ConnectionGUID: YAPSikMWSHOQCK5CMfhtAg==
X-CSE-MsgGUID: YRWR93OnTlWlnb/zDvkXaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="43764953"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 25 Jun 2024 07:07:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 4C29C346; Tue, 25 Jun 2024 17:07:36 +0300 (EEST)
Date: Tue, 25 Jun 2024 17:07:36 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Aapo Vienamo <aapo.vienamo@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: graniterapids: Add missing raw_spinlock_init()
Message-ID: <20240625140736.GV1532424@black.fi.intel.com>
References: <20240625135343.673745-1-aapo.vienamo@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240625135343.673745-1-aapo.vienamo@linux.intel.com>

On Tue, Jun 25, 2024 at 04:53:43PM +0300, Aapo Vienamo wrote:
> Add the missing raw_spin_lock_init() call to gnr_gpio_probe().
> 
> Fixes: ecc4b1418e23 ("gpio: Add Intel Granite Rapids-D vGPIO driver")
> Signed-off-by: Aapo Vienamo <aapo.vienamo@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Linus/Bartosz, I wonder if you can take this one directly? Andy is
currently on vacation and mine starts after this week so there is nobody
handling these until August. Thanks!

> ---
>  drivers/gpio/gpio-graniterapids.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-graniterapids.c b/drivers/gpio/gpio-graniterapids.c
> index c693fe05d50f..f2e911a3d2ca 100644
> --- a/drivers/gpio/gpio-graniterapids.c
> +++ b/drivers/gpio/gpio-graniterapids.c
> @@ -296,6 +296,8 @@ static int gnr_gpio_probe(struct platform_device *pdev)
>  	if (!priv)
>  		return -ENOMEM;
>  
> +	raw_spin_lock_init(&priv->lock);
> +
>  	regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(regs))
>  		return PTR_ERR(regs);
> -- 
> 2.45.2

