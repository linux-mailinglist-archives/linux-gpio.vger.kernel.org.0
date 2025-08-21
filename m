Return-Path: <linux-gpio+bounces-24725-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4292B2F3DA
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 11:27:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F4C7A03535
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 09:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98FFE2E7F2C;
	Thu, 21 Aug 2025 09:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C66bWB7S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57F12222CB
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 09:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755768279; cv=none; b=RpNuz5BLiKSjikrNHvUiwF333/2s5SdFyhYr5CDLIii2rl5kSg3qMhzW0Jd5ixXFyJiY3ugXojxelSA0AeJAiXUSo0modLUx/IZdRV0+tsdtNgQ6rQkBZrgPVEOJvWISpFdeFbuwhrcDtk9FVN7BVVbENRgGiIzdWRJC+4j3O00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755768279; c=relaxed/simple;
	bh=BgLSVdYM08fG8odFB1qbIQgi8NQaqBPkkDFsG40Rra8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N9dB4tLGxrILxilrPfjVQ0oTRl2w1tvdZ1X8gvsCzEPeqJZ/2OTfgnzFu0J6/pdVwvvVpR7IG1aAgrbBNVS96lt9uNm376vLokBCDMlF1w0vRWgESRBoXgprduRvUXPNTsr1DkiXTCXUk1kyF3B9X7FjdA1f2qhlgvotakQYF80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C66bWB7S; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755768277; x=1787304277;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BgLSVdYM08fG8odFB1qbIQgi8NQaqBPkkDFsG40Rra8=;
  b=C66bWB7SpX1OpLTV5U/qp2zNEjf9NfoDuFX9i5TPG3FRxES9wDjjvpqo
   CIxOnFyEHNvvIeK7Y5Sm7GQQkcBTn0IwmKsG+aihCFquwPXhasHZaoAYn
   aCPdtqFtSVw8HgYhLBWyXJ40KE8b6HZ8aiyhFvp4d19PIVADzfX/zoi9T
   C8Xx261DkOmugzScUqqtM1tSrfYKOyzri0ro+yYTsyUWx36PAi9wgXJB5
   C+kM188PnOJe0ZYzmiFk96K6mcybgSRr31rRmHUfBKewmSYRRkDuRRVfD
   SNqMz7hNoXft8zzOJzHkn5XskmExSaJu7lyx7lfza7fhs/doxGkvx7uxJ
   w==;
X-CSE-ConnectionGUID: dvUIMKKDQnW4x/2rOXyJ3g==
X-CSE-MsgGUID: FjPrenQJSqScp9KUU4046w==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="68756231"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="68756231"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 02:24:36 -0700
X-CSE-ConnectionGUID: aiiY5vvGSsahqfCN3cBeJw==
X-CSE-MsgGUID: bZG15ahuQ0e4o6783Wf3/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="169171244"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 02:24:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1up1X5-00000007BSf-3kYf;
	Thu, 21 Aug 2025 12:24:31 +0300
Date: Thu, 21 Aug 2025 12:24:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: mario.limonciello@amd.com, Basavaraj.Natikar@amd.com,
	Shyam-sundar.S-k@amd.com, linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: amd: Don't access irq_data's hwirq member
 directly
Message-ID: <aKblz5LnafUkBzId@smile.fi.intel.com>
References: <20250820233203.1429901-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820233203.1429901-1-superm1@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Aug 20, 2025 at 06:31:52PM -0500, Mario Limonciello (AMD) wrote:
> There is an irqd_to_hwirq() intended to get the hwirq number. Switch
> all use to it.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
One nit-pick below, though.

Thanks, Mario, for a prompt act!

...

>  	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>  	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);

Perhaps better

	irq_hw_number_t hwirq = ...;

?

> -	gpiochip_enable_irq(gc, d->hwirq);
> +	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
>  
>  	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
> -	pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
> +	pin_reg = readl(gpio_dev->base + irqd_to_hwirq(d)*4);
>  	pin_reg |= BIT(INTERRUPT_ENABLE_OFF);
>  	pin_reg |= BIT(INTERRUPT_MASK_OFF);
> -	writel(pin_reg, gpio_dev->base + (d->hwirq)*4);
> +	writel(pin_reg, gpio_dev->base + irqd_to_hwirq(d)*4);
>  	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);

Ditto for the rest.

-- 
With Best Regards,
Andy Shevchenko



