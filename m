Return-Path: <linux-gpio+bounces-24359-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E72B24998
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 14:37:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0984D171FFC
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 12:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B0426A1B6;
	Wed, 13 Aug 2025 12:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nn5TXXJM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95F2184540;
	Wed, 13 Aug 2025 12:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755088576; cv=none; b=Zu98ZIa5sydRPOAxX5WV/vQQlxrwgCHKKs0emvg6iDUhFS0nkJXHEziLia73CqysLxOlOqgpq10kznEo/AGeNJScmHyqW1F0sq0NdUyLryUXaUvFDXA6360+xSgPtL785aAiofjrQQV7B7c8RNhvflpbfOGFqS+3NjGYtT9pumY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755088576; c=relaxed/simple;
	bh=mxRfZXhr447uYosUDWIrSQHTE83kDcrhJRFkwa9w6xY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bo7LLui8tbsDSOQ2/gB9iHYrNp2og8TjKGckRtDRhzwI4SKJnBz2f3ABmeEibvellFbToUzgU8CHb08tWRvKWYgHq1wxQ2MQGt8BuSi/w5NREsAoG0A0WOiUQNvisRNON49wQ5lr0Z2n/eEqSI6tTEO8YdIPNDCiosyg0nahEN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nn5TXXJM; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755088574; x=1786624574;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mxRfZXhr447uYosUDWIrSQHTE83kDcrhJRFkwa9w6xY=;
  b=nn5TXXJMBblrNpjiyaZZjc10j7kfH7oQmILcLcpLxDc/QP4N7Sn4W7ci
   h2oqEPqYP/RqQ/snirmdtNCokaZd0sFgYT/ZLeIDvayitxT5++wGxECp5
   O21N574nUl3A2P9GbeIByEfo6r9zkalacjV4Eof1jekXWxxq+Q63skZia
   gBRD0qG/aO7pZieLv7iQKMtEiOvAtOr9h1RheINSZxMnyyokL13LznkMv
   wkKxNAFKcTI+oN2Z8oSJwrvqKljoSrtgPDBnVcRzdLCTc2aEK0bJTZBfL
   SaOn1Ig1EHaZytyTuxc+YofiehXBzOcWuZLIF6zPuSdYOTgoPS0Ekpu3V
   w==;
X-CSE-ConnectionGUID: Uzk3AeV6TsOfY7Jh1PbRMw==
X-CSE-MsgGUID: R78ZBNSXTlqmhqjFm0AW9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68082075"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="68082075"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 05:36:04 -0700
X-CSE-ConnectionGUID: avms1LHFQQi6Qyl4Sby/fw==
X-CSE-MsgGUID: NDlCXyHZQtG2h9caP94TFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="167247521"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 05:36:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1umAhy-00000005R62-4Bwc;
	Wed, 13 Aug 2025 15:35:59 +0300
Date: Wed, 13 Aug 2025 15:35:58 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 17/21] nfc: marvell: convert to gpio descriptors
Message-ID: <aJyGrhvViwoK2MeN@smile.fi.intel.com>
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-18-arnd@kernel.org>
 <aJcea90siAod5Apw@smile.fi.intel.com>
 <yf5coptfembueds4ozpsphdv7vggyzfezdxv66uuqzjv3gpw62@x4s6iylxahrv>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yf5coptfembueds4ozpsphdv7vggyzfezdxv66uuqzjv3gpw62@x4s6iylxahrv>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 11, 2025 at 02:43:51PM -0700, Dmitry Torokhov wrote:
> On Sat, Aug 09, 2025 at 01:09:47PM +0300, Andy Shevchenko wrote:
> > On Fri, Aug 08, 2025 at 05:18:01PM +0200, Arnd Bergmann wrote:

...

> > > -	if (gpio_is_valid(priv->config.reset_n_io)) {
> > > -		rc = gpio_request_one(priv->config.reset_n_io,
> > > -				      GPIOF_OUT_INIT_LOW,
> > > -				      "nfcmrvl_reset_n");
> > > -		if (rc < 0) {
> > > -			priv->config.reset_n_io = -EINVAL;
> > > -			nfc_err(dev, "failed to request reset_n io\n");
> > > -		}
> > > +	priv->reset_n_io = gpiod_get_optional(dev, "reset-n-io", GPIOD_OUT_LOW);
> 
> No, this should be "reset". gpiolib-of.c has a quirk to resolve to naked
> "reset-n-io", otherwise this will resolve to "reset-n-io-gpios" in the
> bowels of gpiolib.

Good point.

> > > +	if (IS_ERR(priv->reset_n_io)) {
> > > +		nfc_err(dev, "failed to get reset_n gpio\n");
> > > +		return ERR_CAST(priv->reset_n_io);
> > >  	}
> > 
> > This also needs a call to gpiod_set_consumer_name(), IIRC the API name.
> 
> It does not have to... I am not sure who pays attention to names.

It goes to user space, isn't it?
In any case it will give 1:1 transition from the look&fell perspective.

...

> > >  void nfcmrvl_chip_halt(struct nfcmrvl_private *priv)
> > >  {
> > > -	if (gpio_is_valid(priv->config.reset_n_io))
> > > -		gpio_set_value(priv->config.reset_n_io, 0);
> > > +	if (priv->reset_n_io)
> > 
> > Not sure why we need this dup check.
> 
> I personally feel very uneasy when dealing with optional GPIO and not
> checking if it exists or not, even though gpiod_set_value() handles
> this. I think check makes logic clearer.

I disagree with the duplicate. It doesn't make any additional clearness as I
read it. When one reads the code the "here we set GPIO to the X state" without
any conditional is fine as one may check later in DT schema if the GPIO is
optional or not.

> > > +		gpiod_set_value(priv->reset_n_io, 0);
> > >  }



-- 
With Best Regards,
Andy Shevchenko



