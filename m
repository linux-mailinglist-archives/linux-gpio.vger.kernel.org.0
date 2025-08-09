Return-Path: <linux-gpio+bounces-24107-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCB3B1F413
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Aug 2025 12:20:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5A6D5816AE
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Aug 2025 10:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1253625524C;
	Sat,  9 Aug 2025 10:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fTCvWF60"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DBC482F2;
	Sat,  9 Aug 2025 10:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754734838; cv=none; b=Tpl18gcayPSCPC7CAGsX0nNtHh4qCKgMg6pxLLXlAOxxz52XbBgCj5HbDUxEPBX9Lf9AX5f7BsaEIY9hL3cNwujh5W+FoIa+2c5tdUy8X1Yfs/cNDmlXsbW3HCyrUja1t2aSM8bfrRJ6Rg+yDliOfAK6CSmKmhCj8n0ee/wclyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754734838; c=relaxed/simple;
	bh=eHAWshYo5nna3AmUeod1PTFXIMn1ICMHmBB7kfmM/PA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HTeK2npXHscQipNe/0+Uey4Gu6MqGH1MDZpLrcmoZurai8ktKH2B2uA0iZF6fR1P7BX4V/iSAsIPhktBpb5hth1RBmaq4XiI9lcKfQcR7xs1uxw01HWw7PAwzFZ2YeOZcUKaaHTyRhHWAUzQqK0fzG4yU4fiwZfnRhBhbNVvwe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fTCvWF60; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754734837; x=1786270837;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eHAWshYo5nna3AmUeod1PTFXIMn1ICMHmBB7kfmM/PA=;
  b=fTCvWF60PQR8bmB2TNxTUxpi+XTOpb9Dz3nfsdcot+6WUsMWnUwik4Ea
   i6vUlIgsrV4EQKDsQ3FTvVaQ+xTIfE5ZaNMnZy/Ic8xl4L/7sP/BmQRVE
   1T6mSqmNLWFC0wEcdOhfgAxXvMvVHrhtKuI/RXVfryKMLfHe/+CmFlYdZ
   lAKK7sjb76rraeVrV4RdpQZ7DvpE3AbM5tncMFoVAZPcufZRV/f2UXKab
   3NzS2coXYYDyevd24mix4mbDzXOVU75ybctsATLcT9K71Bv2eRq1Cz/8k
   TXg5koHgT5IAYm0VxYME6R4yf0XSgba3xKJKPQG8ol3FykcyU/e0aSVA6
   Q==;
X-CSE-ConnectionGUID: 3fi40sUlQ+CG7RmWd4XCLA==
X-CSE-MsgGUID: sNp+9BPCSta7QOPX52mNnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="79630890"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="79630890"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 03:16:05 -0700
X-CSE-ConnectionGUID: 2h95dtyqRheD3pXdT0xt/g==
X-CSE-MsgGUID: jijf491uSumE3YvesbUHRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="196339261"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 03:16:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ukgcH-00000004cnG-2CH4;
	Sat, 09 Aug 2025 13:15:57 +0300
Date: Sat, 9 Aug 2025 13:15:57 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 19/21] usb: udc: pxa: remove unused platform_data
Message-ID: <aJcf3UzbRMx-hEab@smile.fi.intel.com>
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-20-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808151822.536879-20-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 08, 2025 at 05:18:04PM +0200, Arnd Bergmann wrote:
> 
> None of the remaining boards put useful data into the platform_data
> structures, so effectively this only works with DT based probing.
> 
> Remove all code that references this data, to stop using the legacy
> gpiolib interfaces. The pxa27x version already supports gpio
> descriptors, while the pxa25x version now does it the same way.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
See a comment below.

...

>  static int pxa_udc_probe(struct platform_device *pdev)
>  {
>  	struct pxa_udc *udc = &memory;
> -	int retval = 0, gpio;
> -	struct pxa2xx_udc_mach_info *mach = dev_get_platdata(&pdev->dev);
> -
> -	if (mach) {
> -		gpio = mach->gpio_pullup;
> -		if (gpio_is_valid(gpio)) {
> -			retval = devm_gpio_request_one(&pdev->dev, gpio,
> -						       GPIOF_OUT_INIT_LOW,
> -						       "USB D+ pullup");
> -			if (retval)
> -				return retval;
> -			udc->gpiod = gpio_to_desc(mach->gpio_pullup);
> -
> -			if (mach->gpio_pullup_inverted ^ gpiod_is_active_low(udc->gpiod))
> -				gpiod_toggle_active_low(udc->gpiod);
> -		}
> -		udc->udc_command = mach->udc_command;
> -	} else {
> -		udc->gpiod = devm_gpiod_get(&pdev->dev, NULL, GPIOD_ASIS);
> -	}
> +	int retval = 0;
> +
> +	udc->gpiod = devm_gpiod_get(&pdev->dev, NULL, GPIOD_ASIS);

Missed error check, in particular it will ignore deferred probe case.

>  	udc->regs = devm_platform_ioremap_resource(pdev, 0);

-- 
With Best Regards,
Andy Shevchenko



