Return-Path: <linux-gpio+bounces-5790-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F328AF66F
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 20:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CAEE1C225E5
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 18:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D506213E884;
	Tue, 23 Apr 2024 18:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cQ28XInV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA4413E3FA
	for <linux-gpio@vger.kernel.org>; Tue, 23 Apr 2024 18:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713896623; cv=none; b=Mc5GHRmtE8SyI9rw6WDsj/MA9aL9P8WJeElw3mHJr1tKsfpL0R/xfYvYPwADCOVdcpWdFQGGn5Mk1LZ5qB0l85O1chTRn020pGAJacpKsCs9KARY7WAdPPh7lOtAoVFwPmsAyypWpi/TCVASgevU0iGsSFH5ABhj3+9Ma7RWEag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713896623; c=relaxed/simple;
	bh=vfQN5ppueQw/I0DbjFUSeJkqDMWVQYD8CF2gOyANUGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ik3p6uK8ayPrUn/XlavJrwyhMDsjSJhpcmrAd2JS7xg0611hM/As3MB5WK2R6xGm9l2saCJ9NlvPZfJ4mcKY2mkSun1Bk+6adxnB3TjLrui8zzxA1DU+PX2u6nEVX2bMqwxK5PdiiC/vyOVncShHKUknEDf/mjfvbNZyVt7gbn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cQ28XInV; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713896622; x=1745432622;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vfQN5ppueQw/I0DbjFUSeJkqDMWVQYD8CF2gOyANUGU=;
  b=cQ28XInV3+fgiNbpZb7v3mknKx8z06X26KUWjafHEBQXhWBPSk49Crkb
   4mSyhlyD0NvlZeFnjX1iwqmIsevZZuYRLuoIKRCHsbipX+6H1ZdXkeOWN
   QbfeBkxnwzGepWAw8Ak5zA8e4SiuY+f9g6U2zuinj9yJoz1ti1iKGuj4K
   cbkRwuJwEJhaUBIlRMmEnRTTmEXNl69PidzOR4G/7mdRx4sfEEyFQdxTk
   ekR1tBhX5A4obJDmdaInCkFCDciv4TnHUWgOCr6L5Op8AU222c64h1/IX
   5gs3L/Tf8/8rzGgrBbULBWdAS9CPdbFNBJYVSPU47Xb9Vfz9hpcO940a0
   Q==;
X-CSE-ConnectionGUID: 4it7M9YrTqCifroBWTRHuw==
X-CSE-MsgGUID: UUvQR0qBSfKlJ34yBfrZ2Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9350581"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9350581"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 11:23:41 -0700
X-CSE-ConnectionGUID: IYTztj+ITXaNU3X99Rw95A==
X-CSE-MsgGUID: rNFsrS5gSiegYlg6HsnTGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24966469"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 11:23:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rzKno-00000000QoY-2gHM;
	Tue, 23 Apr 2024 21:23:36 +0300
Date: Tue, 23 Apr 2024 21:23:36 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>,
	Phil Howard <phil@gadgetoid.com>,
	Viresh Kumar <viresh.kumar@linaro.org>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][RFC/RFT 06/18] bindings: glib: add examples
Message-ID: <Zif8qBoZq7I3Xrbb@smile.fi.intel.com>
References: <20240412122804.109323-1-brgl@bgdev.pl>
 <20240412122804.109323-7-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412122804.109323-7-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Apr 12, 2024 at 02:27:52PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add example programs showcasing the usage of GLib bindings to libgpiod.

> +		ret = g_gpiod_chip_get_line_offset_from_name(chip, line_name,
> +							     &offset, &err);
> +		if (ret) {
> +			info = g_gpiod_chip_get_info(chip, &err);
> +			if (!info) {
> +				g_printerr("Failed to get chip info: %s\n",
> +					   err->message);
> +				return EXIT_FAILURE;
> +			}
> +
> +			g_print("%s %u\n",
> +				g_gpiod_chip_info_get_name(info),
> +				offset);
> +
> +			return EXIT_SUCCESS;
> +		} else if (!ret && err) {

Besides redundant 'else' the !ret is also redundant.

> +			g_printerr("Failed to map the line name '%s' to offset: %s\n",
> +				   line_name, err->message);
> +			return EXIT_FAILURE;
> +		}
> +	}

...

> +		direction == G_GPIOD_LINE_DIRECTION_INPUT ?
> +					"input" : "output",

One line?

...

> +	settings = g_gpiod_line_settings_new(
> +			"direction", G_GPIOD_LINE_DIRECTION_INPUT,
> +			NULL);

Personally I do not like the open parenthesis style...

I don't even know why you have done this way with having a plenty of room in
the previous line at least for the first parameter.

...

> +	req_cfg = g_gpiod_request_config_new(
> +			"consumer", "get-multiple-line-values", NULL);

Ditto. And so on across the code of the entire series...

...

> +	ret = g_gpiod_line_request_set_value(data->request, data->line_offset,
> +					     data->value, &err);
> +	if (!ret) {

ret == 0 equals error?!

> +		g_printerr("failed to set line value: %s\n", err->message);
> +		exit(EXIT_FAILURE);

Don't you have something like err->code to propagate?

> +	}


-- 
With Best Regards,
Andy Shevchenko



