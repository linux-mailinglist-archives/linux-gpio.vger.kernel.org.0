Return-Path: <linux-gpio+bounces-16515-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7C5A42804
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 17:36:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63A173A137F
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 16:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24849254848;
	Mon, 24 Feb 2025 16:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cjDNbWf/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F01B101F2;
	Mon, 24 Feb 2025 16:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740414823; cv=none; b=E1Ww4y5d8LFnvLe6cKiSyDRLTQ3OOcVClncM73tZcjItyQnn/A3ASDsgs98FestfgbwwHQuve3/fgvVd4Y2K/7BtlOoSIFNcA6QvckDjVcd87c8URFoAOMmLZ98wtsjq3Syw+e6viI/VzLM/h/hhLbwj0eQIAbryHRhreCGSyrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740414823; c=relaxed/simple;
	bh=cVq2DdZM4FfkXQEOSmx8rDjJ+b+tHMJzy5DMjwcUZ90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APsOlzmwiT6M/z+kzyUlWBT9Az/PzNpe2q6CkYwJ9sK2bBHiI/lsKecDY4UOrn3n5hJZZQHl1Qi+Wz41v1d81lgRiyzheXCzfbqWK7eQ6GuY6NO34PNXsWss1iDg+12Th6XBU9FnkuSXa3LyWkXSFd8vA8sJrpKbrWPT4KtW9s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cjDNbWf/; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740414823; x=1771950823;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cVq2DdZM4FfkXQEOSmx8rDjJ+b+tHMJzy5DMjwcUZ90=;
  b=cjDNbWf/oAZjNmq/KWmAsmn4M4ttwP/ljTUpkP5v419XcgWipWRjSg+u
   JcA2ZR0eFTgCwbuKw4KNY1cKOaWIivoa/RDmFRImP15BCGDs2Mx8tBEsL
   4V9s+GGB/giTt17DdUJPZ+vaGBGDP5KrDZouGgiEgQUIXaAoUgCoJIsK5
   Nj56d8cBEKOXYAY/KbsoT34XAMI8XIUNtzTFl2MnALBB6tnU2lpPTnuyh
   WUqvkXLCb3ImHOpJDDU31WAGl0+OXU1mHWN2MNadvnzHPb50hKheTjm9i
   vmZX1tvh05FJdKj8my2cYRlElaH4P2tqw27o0CEwo2k6FWEPM54fG0mqK
   Q==;
X-CSE-ConnectionGUID: AoI4sJCIQxm8tbYkkVYEtQ==
X-CSE-MsgGUID: 88E6YFg0TNiSGPJ7olS/Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="52175418"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="52175418"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 08:33:22 -0800
X-CSE-ConnectionGUID: w6lPO4VOTGqH/bpN2B08Kg==
X-CSE-MsgGUID: P8+KyTXsSQmZZyYZ5wG/AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121365667"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 24 Feb 2025 08:33:19 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 1F28C19E; Mon, 24 Feb 2025 18:33:18 +0200 (EET)
Date: Mon, 24 Feb 2025 18:33:18 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 8/8] gpiolib: sanitize the return value of
 gpio_chip::get_direction()
Message-ID: <Z7yfTggRrk3K6srs@black.fi.intel.com>
References: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
 <20250210-gpio-sanitize-retvals-v1-8-12ea88506cb2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210-gpio-sanitize-retvals-v1-8-12ea88506cb2@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 10, 2025 at 11:52:02AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> As per the API contract, the get_direction() callback can only
> return 0, 1 or a negative error number. Add a wrapper around the callback
> calls that filters out anything else.

...

> +static int gpiochip_get_direction(struct gpio_chip *gc, unsigned int offset)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&gc->gpiodev->srcu);
> +
> +	if (WARN_ON(!gc->get_direction))
> +		return -EOPNOTSUPP;
> +
> +	ret = gc->get_direction(gc, offset);
> +	if (ret > 1)

Would it be better to use the respective GPIO*... macro instead of 1?

> +		ret = -EBADE;
> +
> +	return ret;
> +}

-- 
With Best Regards,
Andy Shevchenko



