Return-Path: <linux-gpio+bounces-22436-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 19406AEDF14
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 15:30:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4210D165EF0
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 13:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E972928B4EB;
	Mon, 30 Jun 2025 13:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mEz9lv2k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DCB28A41E;
	Mon, 30 Jun 2025 13:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751290086; cv=none; b=knz8UpNg3mviyqMNfRzEjXGtyk91rB88odMgEllJsZ/lH7Z49CTHtLiP0dTez8VvVOiPcpjw/XD7t0BsPUia+3kpL4F0nEKfte56Vcy+Dp4jfWzZkvL6DbYG6byCzocbcpwMTY158H9CdEh2hFigvP9mNzjl+YiiSIubSE9EhcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751290086; c=relaxed/simple;
	bh=7L6yz9V+Pct+A1DBO6em0oHgoO4CfMGp1vJNpCMcAAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CFuBY8UQPeOV8RctoHIx5uT5vVNa0K8a6awm+U3kMGq4s7kx8aW6v9z9gYLVlDm+sFApsBDuz0UltkUravFC4xEBbPq4CZ9dpdE0wvDUn+cE2NL6hr6AVaWqjiZHimftvS4PFVafD/RjHmg4xy0Da7mUZMBR7VHrG+1G5IIqwFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mEz9lv2k; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751290085; x=1782826085;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7L6yz9V+Pct+A1DBO6em0oHgoO4CfMGp1vJNpCMcAAI=;
  b=mEz9lv2k7fJzRp5aWWcyjh8a+xizEW0a5dyZtHd4Gly7yNBZ/zA2Gpbk
   iSxs7dwsP4B95uW46YTpfMma4S+/GuMHOcIvZzHeV+zvcFUgENdaHKr87
   SxiVU1tnV/CuUM2zH8I/cr+PGrLIJOeZXS/26BLp41o4+BBW0ha82+Gvx
   Hi0zVYHKAAsd2CXo0ql9VB96NzeKtpOKnaPE82OlcJVpUjHA9ZaB8/Cbr
   BgAK900e/M+h0yQ6EMwAMKp6IdtJQfJcfY6hgj0wIghoopOFNdOgZ4lk1
   QO6aLWHEv5krV6afRLMvvbmTWMiiG4Cpu1npFr03V3CcakwOmyxs3fpE/
   w==;
X-CSE-ConnectionGUID: CDVwqBt+TauP048UGYiS7g==
X-CSE-MsgGUID: XQBmS+PgTyC9qnWRn8eluw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64112939"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="64112939"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 06:28:04 -0700
X-CSE-ConnectionGUID: jADhKrHsRoyXCm78ZjwFKg==
X-CSE-MsgGUID: 0/EnS4O9Sv+y6zIa9nrLdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="157486469"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 06:28:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uWEYA-0000000BJmG-3eXX;
	Mon, 30 Jun 2025 16:27:58 +0300
Date: Mon, 30 Jun 2025 16:27:58 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Kent Gibson <warthog618@gmail.com>,
	Jan =?iso-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 06/10] gpio: sysfs: don't use driver data in sysfs
 callbacks for line attributes
Message-ID: <aGKQ3m87REse0abU@smile.fi.intel.com>
References: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org>
 <20250630-gpio-sysfs-chip-export-v3-6-b997be9b7137@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630-gpio-sysfs-chip-export-v3-6-b997be9b7137@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 30, 2025 at 02:37:13PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Currently each exported GPIO is represented in sysfs as a separate class
> device. This allows us to simply use dev_get_drvdata() to retrieve the
> pointer passed to device_create_with_groups() from sysfs ops callbacks.
> 
> However, we're preparing to add a parallel set of per-line sysfs
> attributes that will live inside the associated gpiochip group. They are
> not registered as class devices and so have the parent device passed as
> argument to their callbacks (the GPIO chip class device).
> 
> Put the attribute structs inside the GPIO descriptor data and
> dereference the relevant ones using container_of() in the callbacks.
> This way, we'll be able to reuse the same code for both the legacy and
> new GPIO attributes.

...

> -	struct gpiod_data *data = dev_get_drvdata(dev);
> +	struct gpiod_data *data = container_of(attr, struct gpiod_data,
> +					       dir_attr);

> -	struct gpiod_data *data = dev_get_drvdata(dev);
> +	struct gpiod_data *data = container_of(attr, struct gpiod_data,
> +					       dir_attr);

I still think that bunch of definitions to wrap contaner_of():s will help.
Note, two of them you are using even in the code below, besides the attribute
show()/store() cases.

...

> +	if (strcmp(attr->name, "direction") == 0) {
> +		data = container_of(dev_attr, struct gpiod_data, dir_attr);
> +
> +		if (!data->direction_can_change)
>  			mode = 0;

		data = dir_attr_to_gpiod_data(dev_attr);
		if (!data->direction_can_change)
			mode = 0;

> +	} else if (strcmp(attr->name, "edge") == 0) {

> +		data = container_of(dev_attr, struct gpiod_data, edge_attr);
> +
> +		if (gpiod_to_irq(data->desc) < 0)
>  			mode = 0;

In the similar way:

		data = edge_attr_to_gpiod_data(dev_attr);
		if (gpiod_to_irq(data->desc) < 0)
			mode = 0;

> +		if (!data->direction_can_change &&
> +		    test_bit(FLAG_IS_OUT, &data->desc->flags))
>  			mode = 0;
>  	}

-- 
With Best Regards,
Andy Shevchenko



