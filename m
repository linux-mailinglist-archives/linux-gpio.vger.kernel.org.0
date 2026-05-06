Return-Path: <linux-gpio+bounces-36257-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cB+8GL7j+mmGTgMAu9opvQ
	(envelope-from <linux-gpio+bounces-36257-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 08:46:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 034AE4D6BFA
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 08:46:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A97303003995
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 06:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44238359A6B;
	Wed,  6 May 2026 06:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y/dNvrd4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A6534F241;
	Wed,  6 May 2026 06:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778049976; cv=none; b=JwU/om9kw3a/or8M4dM768/nif8bdRr3g+N6c4AuTfNl6pkHiKb2OompTc5LKvj1BnYPqEkYvMJfWUAhJCR2SSCCVpAedK5v6RW3vpTDNFssaarBem+IyleLBkMIUnzaPr9ypuKGh8ikDCapiCFTuOh4pIrywjH4hQT4z6WbH6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778049976; c=relaxed/simple;
	bh=VNoEJEv+DbS/yysHBtOTeky46gLF/wbUvnQqmZJWTB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DRVG0Dl0vrXioFc3B4qyOBtQpY/QbJjVGJu5HljI3PDBcdzKSBJyltGOAbBRKfY1fGUUFt3rf4DoeZUC153BavrOZgvnA1osUaU2300niEemiBj4e7NFMj09Vsdkqm27hBHdodcEstIRoKxeZHb4sqcPB/4jhMhU5E7Ei3PHPSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y/dNvrd4; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778049973; x=1809585973;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VNoEJEv+DbS/yysHBtOTeky46gLF/wbUvnQqmZJWTB8=;
  b=Y/dNvrd4s8Py7grxKjQD4T6iZ9hwqynpqP9bk5qYwSzPuoRVnpTAN1R3
   h0cv66WEyfsPmVfC6czujv4D4dB/8VdOtvInSdZFnlo8tYTXvb3XOmvDA
   /s5lm44xreYjIG+3yJS3J+se/fLiVoBBujle7tXRlFj1DOUUnymrHL1cZ
   sOdyQNuc53SscjGqIsy3LRhAy2m5HJaFp3ZyjOtVAxVqfEUZBZ4xhYqbF
   1XgHxIAhyj4/SC4xzD5/MrUwlHOBzPklqbjpebe4eVyoMN9EYpLT0ZQSu
   1yy6Bcvqbm0VCeMsVJPcMaS5lDyOZej1wjyEnZRnb0Uho08O+3hKw/wSM
   w==;
X-CSE-ConnectionGUID: IMRj6hzNTtG1x91VLQFmMA==
X-CSE-MsgGUID: 4eT88yskTzigXZ72IGWI1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="101627586"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="101627586"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 23:45:45 -0700
X-CSE-ConnectionGUID: u/fAcfLtSkuHeQcOfiPz6w==
X-CSE-MsgGUID: q3b0yirRR4SxVozk/jgKdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="236134867"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.183])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 23:45:41 -0700
Date: Wed, 6 May 2026 09:45:36 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] [v3] leds: gpio: make legacy gpiolib interface optional
Message-ID: <afrjkMqRUosKtkY8@ashevche-desk.local>
References: <20260505155915.3698243-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505155915.3698243-1-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 034AE4D6BFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36257-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,ashevche-desk.local:mid]

On Tue, May 05, 2026 at 05:58:48PM +0200, Arnd Bergmann wrote:

> There are still a handful of ancient mips/armv5/sh boards that use the
> gpio_led:gpio member to pass an old-style gpio number, but all modern
> users have been converted to gpio descriptors.
> 
> While the CONFIG_GPIOLIB_LEGACY option that guards devm_gpio_request_one()
> and related helpers is currently turned on in all kernel builds,
> the plan is to only enable it on the few platforms that actually
> pass gpio numbers in any platform_data.
> 
> Split out the legacy portion of the platform_data handling into a custom
> helper function that is guarded with in #ifdef block, to allow the
> the leds-gpio driver to compile cleanly when CONFIG_GPIOLIB_LEGACY
> gets turned off. Once the last user is converted, this function can
> be removed.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
There is a couple of nit-picks, but I'm not objecting if they are not
going to be addressed.

...

>  	gpiod = devm_gpiod_get_index_optional(dev, NULL, idx, GPIOD_OUT_LOW);
> -	if (IS_ERR(gpiod))
> -		return gpiod;
> -	if (gpiod) {
> +	if (!IS_ERR(gpiod))
>  		gpiod_set_consumer_name(gpiod, template->name);
> -		return gpiod;
> -	}
>  
> -	/*
> -	 * This is the legacy code path for platform code that
> -	 * still uses GPIO numbers. Ultimately we would like to get
> -	 * rid of this block completely.
> -	 */
> +	return gpiod;

Okay, let's stick with this form.

...

> -			if (template->gpiod)
> -				led_dat->gpiod = template->gpiod;
> -			else
> -				led_dat->gpiod =
> -					gpio_led_get_gpiod(dev, i, template);
> +			led_dat->gpiod = gpio_led_get_gpiod(dev, i, template);
> +			if (!led_dat->gpiod)
> +				led_dat->gpiod = gpio_led_get_legacy_gpiod(dev,
> +								  i, template);

Why not keep the style as before:

				led_dat->gpiod =
					gpio_led_get_legacy_gpiod(dev, i, template);

? (Yes, it's a bit longer than 80, but I think in this case it's justified for
readability).

> +

This blank like is not needed.

>  			if (IS_ERR(led_dat->gpiod)) {
> -				dev_info(dev, "Skipping unavailable LED gpio %d (%s)\n",
> -					 template->gpio, template->name);
> +				dev_info(dev, "Skipping unavailable LED gpio %s\n",
> +					 template->name);
>  				continue;
>  			}

-- 
With Best Regards,
Andy Shevchenko



