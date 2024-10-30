Return-Path: <linux-gpio+bounces-12314-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F089B6ADD
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 18:22:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57C3B1C20E08
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 17:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0540A1BD9D8;
	Wed, 30 Oct 2024 17:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="ctozl771"
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2036C1BD9C0;
	Wed, 30 Oct 2024 17:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730308810; cv=none; b=FzO6+eR4LrL+L4Co31/BBVp7dDEd/gSjXRBnJRDnbB0ALoBIBIc9LPh5hQ4HAQe+viH50iq/xIiLLWWNmmHZ5G/L1dsf/e0MR4cNyMMzav6ScZMJit9Ry+7Kc7UuPHpXqnY+sJUleXfmpdLfbOoM6uW8v+r11ys73teNnKZesao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730308810; c=relaxed/simple;
	bh=ES9aQ33x+PBTD9B7jjuzsqYGBFx/xGl7/kptdXIj6sQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OpuHBWqisC8pSY95PQI5zrg26WsW1REPU7s0KEZQcVXCtMBOEl4TNXtZdvoWQHij4PihUPDGjdVHsKKKyzrk0YX+QHho3+isT2ULZvTHWzD6/3JcHnWo7mbcwDcLFXSNBnYiitP1+v+7ZNF5SBppT4kVIsHJM7x5H0ghWbi0QE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=ctozl771; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 4BB81404CC3E;
	Wed, 30 Oct 2024 13:12:03 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	in-reply-to:content-disposition:content-type:content-type
	:mime-version:references:message-id:subject:subject:from:from
	:date:date:received:received; s=mail; t=1730308322; x=
	1732122723; bh=ES9aQ33x+PBTD9B7jjuzsqYGBFx/xGl7/kptdXIj6sQ=; b=c
	tozl771CzNFyV8Fr8IhvwgYwJpGU7fJfyX0vdsnnAQYuogbtNe2WPc4JQOeig72m
	Rq/yyGW5DrlYt7QQdytYp99ydvjtCMtOa5fHuScvjka152ip1hBkCRKi42LI8RrL
	TmL2csQK7Nemy/wr4gTLfi9KWVAnKN7VGqvDKWbR2Q=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 19tCsm-xNPsb; Wed, 30 Oct 2024 13:12:02 -0400 (EDT)
Received: from freedom.csh.rit.edu (unknown [129.21.49.24])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTPS id C4F0745735E9;
	Wed, 30 Oct 2024 13:12:02 -0400 (EDT)
Date: Wed, 30 Oct 2024 13:12:01 -0400
From: Mary Strodl <mstrodl@csh.rit.edu>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 1/2] gpio: mpsse: Check for error code from
 devm_mutex_init() call
Message-ID: <ZyJo4dvULIflwhXL@freedom.csh.rit.edu>
References: <20241030153201.2078266-1-andriy.shevchenko@linux.intel.com>
 <20241030153201.2078266-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030153201.2078266-2-andriy.shevchenko@linux.intel.com>

Hello Andy!

On Wed, Oct 30, 2024 at 05:30:26PM +0200, Andy Shevchenko wrote:
> Even if it's not critical, the avoidance of checking the error code
> from devm_mutex_init() call today diminishes the point of using devm
> variant of it. Tomorrow it may even leak something. Add the missed
> check.
Totally missed this... Thanks!

> @@ -430,8 +430,13 @@ static int gpio_mpsse_probe(struct usb_interface *interface,
>  	if (err)
>  		return err;
>  
> -	devm_mutex_init(dev, &priv->io_mutex);
> -	devm_mutex_init(dev, &priv->irq_mutex);
> +	err = devm_mutex_init(dev, &priv->io_mutex);
> +	if (err)
> +		return err;
> +
> +	ret = devm_mutex_init(dev, &priv->irq_mutex);

I think this should be `err = `

Other than that, it looks good to me (I doubt you need this, but just in case):

Reviewed-by: Mary Strodl <mstrodl@csh.rit.edu>

Thanks!

