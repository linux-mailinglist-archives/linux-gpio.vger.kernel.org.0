Return-Path: <linux-gpio+bounces-16558-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8616A4409A
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 14:24:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAD631896ADD
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 13:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C9626981A;
	Tue, 25 Feb 2025 13:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cypeVvTG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF328433CE;
	Tue, 25 Feb 2025 13:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740489569; cv=none; b=JVEdAYabzYjc3NvqAZsoDzyhKvhW5mF97vWyalTmIJg5XdOzAyosMrxT93yXz6i0/nEIYxp7zbiav5JRQ5gEBmppkqbjAjyZJWJd8GoUmdB+XP358WvVDyCF/nW7UVg7rnYRkzQyBNQdk8oRoLshnlvrHgdT0Q7LsMmRfowZjtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740489569; c=relaxed/simple;
	bh=uEs0MAHmOiOcijcgY2FO3pVkG7ras2voCoIqnM+mBQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gbgANx+VnYcrLQGMtEZNeJxMAnAxLJaTYL45QUvdy/8PNWOWNoAoI6UE5Qd/yf3ken/VlslfMdrXTeRXHNnlv98LYWqNUPQIkImAF+81XsNXvs6caCVTTlG5DXExrNiPVLl5fZiZ6N2SvFdO+KeA/I5Dw1SayuCiZhell5qecSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cypeVvTG; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740489568; x=1772025568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uEs0MAHmOiOcijcgY2FO3pVkG7ras2voCoIqnM+mBQ0=;
  b=cypeVvTGx1YZpdtzhmT6ao08z+tOcM4sXua25ei4g6RGqlKIYgJNccMD
   jzxVCxG+cVAK9xA81fS7qK1RydEoH8SU3y7q3wZfk3bidSLTfj+h8iuYn
   hMOv6ByoP3/wj7ZDbGMRvulJz0OnjehQFc18grrvyzmHic32EkyHspT8v
   29JtKOB2yyk87X8UIcFdTk2h3y7hIelXXu9yDQ0OKJ+WadDZQH9JQK0Og
   PU33LZl6WxVw3UDEFzdt+/bYsRSEqIlYsFmq1MOPXrVlz2o0ZvDYqYu8d
   SWoj1fysTjEDB85dTCMAEToBn7aWUTWLIrlgnp8wRTvENSJwz0n/YGjys
   w==;
X-CSE-ConnectionGUID: lFFNL9umR3aeu/5I9uiKjA==
X-CSE-MsgGUID: EdxvuUjUQCuHTx55Pq8blQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41139342"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="41139342"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 05:19:28 -0800
X-CSE-ConnectionGUID: Lax3sQzJQ8Sp5KJea8gVgQ==
X-CSE-MsgGUID: tfLDb+9XRIqscJoZnScmkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="116163984"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 05:19:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tmuqJ-0000000F09U-021Q;
	Tue, 25 Feb 2025 15:19:23 +0200
Date: Tue, 25 Feb 2025 15:19:22 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/3] gpiolib: use a more explicit retval logic in
 gpiochip_get_direction()
Message-ID: <Z73DWoscARsC06gS@smile.fi.intel.com>
References: <20250225-retval-fixes-v1-0-078c4c98517a@linaro.org>
 <20250225-retval-fixes-v1-2-078c4c98517a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-retval-fixes-v1-2-078c4c98517a@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Feb 25, 2025 at 12:56:24PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> We have existing macros for direction settings so we don't need to rely
> on the magic value of 1 in the retval check. Use readable logic that
> explicitly says we expect INPUT, OUTPUT or a negative errno and nothing
> else in gpiochip_get_direction().

...

>  	ret = gc->get_direction(gc, offset);
> -	if (ret > 1)
> +	if (!(ret == GPIO_LINE_DIRECTION_OUT ||
> +	      ret == GPIO_LINE_DIRECTION_IN || ret < 0))
>  		ret = -EBADE;

Wouldn't be better to write it as

	if (ret < 0)
		return ret;

	if (ret != GPIO_LINE_DIRECTION_OUT && ret != GPIO_LINE_DIRECTION_IN)
		ret = -EBADE;

	return ret;


Otherwise LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
after addressing the above.

-- 
With Best Regards,
Andy Shevchenko



