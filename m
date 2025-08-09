Return-Path: <linux-gpio+bounces-24106-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA697B1F40D
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Aug 2025 12:10:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDB3F566D80
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Aug 2025 10:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7201E25392D;
	Sat,  9 Aug 2025 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X3PDgvmo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3548248F7E;
	Sat,  9 Aug 2025 10:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754734196; cv=none; b=AKFABJTk3hbzDYwaUTH6UrLzCQkXGgpIASlxwNvGDMxAQjAmy0tV77Ma+fI1Vv6zMOZ3dWPG1oH476wW2a9K1lQNRNbRqt7zm3NvaSnP4laC0tWXggz02DMnxNg8OYk+OmzwN8ILYYx/i6c7fcfODwWFtNZWR3kNqSYdx04IYgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754734196; c=relaxed/simple;
	bh=NxVsmGbSJASp3GA6mEX9X5vdj2y/FA5ZJu9bpIjD+ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UBZq8UBwl9Gq2zJKLE4qHZ5JskGsI6mbhdM7s1F58KEJh836bGfwgbC+KRgR9f4FwWWuGFQzJkUaTNFXFlgFtQ3qOOMC39E/6pqSlLT3JF5zS/NU/ouSSFchbzH+cvWMknT4DurRHlRzgRxJBITTeDLjLH2T00JkeTo6n6t4GU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X3PDgvmo; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754734195; x=1786270195;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NxVsmGbSJASp3GA6mEX9X5vdj2y/FA5ZJu9bpIjD+ko=;
  b=X3PDgvmoRmWvJgYHnL2GS6YaEywhYa70P/H/NQhWE1GX9Wgvuc/WiQyj
   ew8x+Im4Hdb9NyxZXPtqdYXSjED1IcTISt6S6Hd9pFrKwHAlqiXlTrjXS
   1kiWNNSAVuf5/ewyT3pa1eUJYsB5NdzBaEEV2IscziF+SSt88rnxLjLSQ
   I5ZV3tNFazGp0PB/+uwYpIvPt3h+gOKalogJlsqO/MFR86QNOV6Uk/ZvK
   Llq/T6RN1JZNqSzGcBv9T2vDaSzhPyaytkwEgntlavXa/fnO0PIMM74GF
   R4QZXaZCxBwqYM4FTcYrOibX966LuY3coVZwHK8Qb61lqSDTl+ClQ3UfD
   g==;
X-CSE-ConnectionGUID: 7ihA/natRcyfLFMottRfhw==
X-CSE-MsgGUID: GAQIFtIiSTO0fnZroqbRsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="82509963"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="82509963"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 03:09:54 -0700
X-CSE-ConnectionGUID: 1OZmubPmQx6Fc7bDBFsUqw==
X-CSE-MsgGUID: 2pq9Pu8bSeSzOFYraCtTuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="164737283"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 03:09:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ukgWK-00000004cjT-1RmL;
	Sat, 09 Aug 2025 13:09:48 +0300
Date: Sat, 9 Aug 2025 13:09:47 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 17/21] nfc: marvell: convert to gpio descriptors
Message-ID: <aJcea90siAod5Apw@smile.fi.intel.com>
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-18-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808151822.536879-18-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 08, 2025 at 05:18:01PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The only reason this driver seems to still use the legacy gpio
> numbers is for the module parameter that lets users pass a different
> reset gpio.
> 
> Since the fixed numbers are on their way out, and none of the platforms
> this driver is used on would have them any more, remove the module
> parameter and instead just use the reset information from firmware.

This patch is my love in the series, thanks for doing it!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

But note some comments below.

...

> -	if (gpio_is_valid(priv->config.reset_n_io)) {
> -		rc = gpio_request_one(priv->config.reset_n_io,
> -				      GPIOF_OUT_INIT_LOW,
> -				      "nfcmrvl_reset_n");
> -		if (rc < 0) {
> -			priv->config.reset_n_io = -EINVAL;
> -			nfc_err(dev, "failed to request reset_n io\n");
> -		}
> +	priv->reset_n_io = gpiod_get_optional(dev, "reset-n-io", GPIOD_OUT_LOW);
> +	if (IS_ERR(priv->reset_n_io)) {
> +		nfc_err(dev, "failed to get reset_n gpio\n");
> +		return ERR_CAST(priv->reset_n_io);
>  	}

This also needs a call to gpiod_set_consumer_name(), IIRC the API name.

...

> -	if (gpio_is_valid(priv->config.reset_n_io)) {
> -		nfc_info(priv->dev, "reset the chip\n");
> -		gpio_set_value(priv->config.reset_n_io, 0);
> -		usleep_range(5000, 10000);
> -		gpio_set_value(priv->config.reset_n_io, 1);
> -	} else
> -		nfc_info(priv->dev, "no reset available on this interface\n");
> +	nfc_info(priv->dev, "reset the chip\n");
> +	gpiod_set_value(priv->reset_n_io, 0);
> +	usleep_range(5000, 10000);

Side note, this would be nice to use fsleep(), but I see that's just a
copy'n'paste of the original piece.

> +	gpiod_set_value(priv->reset_n_io, 1);

...

>  void nfcmrvl_chip_halt(struct nfcmrvl_private *priv)
>  {
> -	if (gpio_is_valid(priv->config.reset_n_io))
> -		gpio_set_value(priv->config.reset_n_io, 0);
> +	if (priv->reset_n_io)

Not sure why we need this dup check.

> +		gpiod_set_value(priv->reset_n_io, 0);
>  }

-- 
With Best Regards,
Andy Shevchenko



