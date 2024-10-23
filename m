Return-Path: <linux-gpio+bounces-11831-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 032879AC217
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 10:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86CECB253C7
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 08:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A02D158D8B;
	Wed, 23 Oct 2024 08:47:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2D515C15B;
	Wed, 23 Oct 2024 08:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729673227; cv=none; b=Dn/U3NhiBnyRwCO2iseGu7x7HGDILPzvwcEpxyMIt0tCQqc3oKeZtrkNw4ezVmHE9YFGPKob4zE+29BzNdR1ih3x4UlIG4Y2PQBKwAEVlNGqXnb9LwVanRigQhKQrZDJa02Cxyx5sWII7w6uJDGVZzDf3i6wn2Wo7EfBR+NBb/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729673227; c=relaxed/simple;
	bh=OdPjY1A0HouuTYfnhS52CJs8YfuOZ3R3ZFVGysA5xnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjrg4qFErc1XwYRD+Icsv5wEqH+GBB2MIplWoDm2yEDleAljLEI6qG/LD22AoztlR8VXwhP0dfwJMQ1N+PmqrYya/bMIIolbZ0Mzo3I2IUduVtXevKPXdLFZ0nLPrC+4EXLFvveh3HNRii9xkBn8Nkd/Ra66WZ2Gktsw9/ZCwVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Date: Wed, 23 Oct 2024 16:47:00 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Subject: Re: [PATCH next] pinctrl: spacemit: fix double free of map
Message-ID: <20241023084700-GYB1187993@gentoo>
References: <4b5f1306-dc01-4edc-96d3-b232b930ddf2@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b5f1306-dc01-4edc-96d3-b232b930ddf2@stanley.mountain>

On 11:39 Wed 23 Oct     , Dan Carpenter wrote:
> The map pointer is freed by pinctrl_utils_free_map().  It must not be a
> devm_ pointer or it leads to a double free when the device is unloaded.
> 
> This is similar to a couple bugs Harshit Mogalapalli fixed earlier in
> commits 3fd976afe974 ("pinctrl: nuvoton: fix a double free in
> ma35_pinctrl_dt_node_to_map_func()") and 4575962aeed6 ("pinctrl: sophgo:
> fix double free in cv1800_pctrl_dt_node_to_map()").
> 
> Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Acked-by: Yixun Lan <dlan@gentoo.org>

thanks,

> ---
>  drivers/pinctrl/spacemit/pinctrl-k1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
> index c75ea27b2344..a32579d73613 100644
> --- a/drivers/pinctrl/spacemit/pinctrl-k1.c
> +++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
> @@ -314,7 +314,7 @@ static int spacemit_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	if (!grpnames)
>  		return -ENOMEM;
>  
> -	map = devm_kcalloc(dev, ngroups * 2, sizeof(*map), GFP_KERNEL);
> +	map = kcalloc(ngroups * 2, sizeof(*map), GFP_KERNEL);
>  	if (!map)
>  		return -ENOMEM;
>  
> -- 
> 2.45.2

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

