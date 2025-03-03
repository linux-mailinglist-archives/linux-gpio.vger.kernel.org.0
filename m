Return-Path: <linux-gpio+bounces-16964-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9FEA4C72D
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 17:31:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86ADD169196
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 16:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 566BC2153DA;
	Mon,  3 Mar 2025 16:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NmAkxmfI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F112144B8;
	Mon,  3 Mar 2025 16:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741019332; cv=none; b=nB2XG/Yx5PmhLYZDqSSC9mUgMebDCiDWvxCuG+BWeVL+KUU8I8RQEWqyyaI0sz8XWdhSNuhHIEfT4BA1cz9JRCV/ZynfcLaqPInMFfLG+LWpaEfLEc59M3m55UZtEOHw2ViT8/AbhzRunfidLtSzNewdY0h4r+mJIkAOdCkU+aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741019332; c=relaxed/simple;
	bh=6KHbEnd+dBa09GT4KuIxocFx6yEOp05FmWTZQDE5UrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HYIYO42EpLd7YyfrZzaIjJvN19pboCuAb8aFeRqCEJXyCGfsB/H+VKKrrCs0GCmaHBVYtsv1iibylC/wfC7DvVi9qfil1Tz6Blo+Bo1grEu3nGKbS+AxP9y1Dfe4zqabttx8UI6DIwR6PkYuVl4JHn2PGXP5YykQzbNK/BpHM5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NmAkxmfI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741019331; x=1772555331;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6KHbEnd+dBa09GT4KuIxocFx6yEOp05FmWTZQDE5UrA=;
  b=NmAkxmfIKkO1y919AanuzxcpvgG6kQgXhdbwpAinnOMDzNm3dX0d3TUa
   sKcf8vApbr4DNsSvh/XC/+aiHSOWsGcFC0FbwlPrHhgP2kM9US7+6Sbsd
   NNtBqWPB2vpz87z5fi7UN91YACBtDuj9JkrtLlMuZSYQDvKgbqug6RIso
   JcSuRIgYDQFPxElyYBtR4AwENiIzB4pNqCQiG3eP3wr1YaHSjQvEnsfzt
   hVlCqIPyMk452sjSw0FKjtqHeZTETgaKM87rQc9jB4KAPDHeEHkYHRPL0
   tb9U6Bv3Wm6qvmwLH2+Qi32+X2gtlOSFaC4vi1NNL43KlffUC5ZiiUzSA
   A==;
X-CSE-ConnectionGUID: Rml07Lq3Q8CpfL1rQGh/yA==
X-CSE-MsgGUID: Rnd7MM+/RU68YaHsTucEkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="52880549"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="52880549"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 08:28:49 -0800
X-CSE-ConnectionGUID: pCLQVKJQQwyQWYRlZgGZMg==
X-CSE-MsgGUID: 0bfJ3ls4TVeDv9y4h6RXuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="118251585"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 08:28:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tp8en-0000000Grb1-2iJU;
	Mon, 03 Mar 2025 18:28:41 +0200
Date: Mon, 3 Mar 2025 18:28:41 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-wpan@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH net-next v1 2/2] ieee802154: ca8210: Switch to using
 gpiod API
Message-ID: <Z8XYuY2idCVrAfdm@smile.fi.intel.com>
References: <20250303150855.1294188-1-andriy.shevchenko@linux.intel.com>
 <20250303150855.1294188-3-andriy.shevchenko@linux.intel.com>
 <8734fu84r8.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8734fu84r8.fsf@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 03, 2025 at 05:20:59PM +0100, Miquel Raynal wrote:

...

> > - * @gpio_reset:     gpio number of ca8210 reset line
> > - * @gpio_irq:       gpio number of ca8210 interrupt line
> > + * @reset_gpio:     GPIO of ca8210 reset line
> 
> What about "CA8210 Reset GPIO line"? Or Just "Reset GPIO line"? Or even
> "Reset GPIO descriptor" (whatever).
> 
> > + * @irq_gpio:       GPIO of ca8210 interrupt line
> 
> Same

Sure.

[...]

> > -	int ret;
> > -	struct ca8210_platform_data *pdata = spi->dev.platform_data;
> > +	struct device *dev = &spi->dev;
> > +	struct ca8210_platform_data *pdata = dev_get_platdata(dev);
> 
> Can you either mention the additional cleanup that you do in the commit
> log or split it in a separate commit? (splitting is probably not
> necessary here given that most of the cleanup anyway is related to the
> actual changes.

Do you mean the platform_data accessors? I can actually split it to a separate
change as I had done some of that in the past in other drivers.

...

> > -	ret = gpio_direction_output(pdata->gpio_reset, 1);
> > -	if (ret < 0) {
> > -		dev_crit(
> > -			&spi->dev,
> > -			"Reset GPIO %d did not set to output mode\n",
> > -			pdata->gpio_reset
> > -		);
> > -	}
> > -
> > -	return ret;
> > +	return PTR_ERR_OR_ZERO(pdata->reset_gpio);
> 
> This is not a strong request, but in general I think it is preferred to return
> immediately, so this looks easier to understand:

I used the same logic as in the original flow.

> +	pdata->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(pdata->reset_gpio)) {
> +		dev_crit(dev, "Reset GPIO did not set to output mode\n");
> +                return PTR_ERR(pdata->reset_pgio);
> +       }
> +
> +       return 0;

Sure I can do this in v2.

...

> Otherwise the rest lgtm.

Thank you for the review!

-- 
With Best Regards,
Andy Shevchenko



