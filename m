Return-Path: <linux-gpio+bounces-9362-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A61FE96424F
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 12:54:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65AE02856C6
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 10:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56FB19067C;
	Thu, 29 Aug 2024 10:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VWYS8NCH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC91D18F2F9;
	Thu, 29 Aug 2024 10:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724928790; cv=none; b=H4rbi+Z1EMDedAgLx3Ypa7Me+HX3CE12pHfYUAnMomJ5iyxjyzBWJtOYFqRfkQQyhFqQOB8d3r9C/NlUwqhb5jgSP1EfFgP59lfbfBc6UhI6jQW+P9eyXnfZX+U+JYOLI1Xib21bc7UfODFT2hRiRnjWcWyQ8YfMd7VoWKm5tfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724928790; c=relaxed/simple;
	bh=Lm9uN8a4ZZk+fSkBNAShoQfaq7MgdwAi+Rap/XQl7Bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m6cxKPAoZDZak24JRQxGERehlnwI64mypCbPFz5Yq2GVpEOaM4c1AVTM336F8nxPAZ38tfVGPH/w3GAypVBEIUCJ2rOytk/Od5JZrBB47wD+maZ1Lb7DEQtORVy70hqohioSWVpJpYxo79PVNtNvhAp5sO7f3ZA666cQhrPBRLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VWYS8NCH; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724928789; x=1756464789;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Lm9uN8a4ZZk+fSkBNAShoQfaq7MgdwAi+Rap/XQl7Bo=;
  b=VWYS8NCHppw98AR28oFB82B6Mi7B7yAKk4mxYEjYS22poxyd1I6cxOR3
   CbafXA6GYPo0g45q8mUkoTqezC+wJc/VpI627hoSosise/yf+UXKUZa2i
   b4T6qbkFUkAI5ZNteJAhiVrZXOGkzVjFiSfY5nKePneNZBtohMdnk5mgA
   zvuGtQ5FAFWSbk8mhw8HIBQddXSvxbLkVepaR9Vj+9tdgeOxAa2FuO6tq
   8PlOC/Umtv+7dO6RdahyI35k9lrFbPu+QvOZGa2cEQ2tWG00vwQdgpU8v
   zQvqlw98hGGqz15sVg+UbPxKQX90Xt0gxdhcwTYk4HbGnqk6OyvEL6D7b
   g==;
X-CSE-ConnectionGUID: tvr7XC4lQnqWIDTIb2tULw==
X-CSE-MsgGUID: vOaB6vYQRXevs8bfN9I6ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23673762"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="23673762"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 03:53:08 -0700
X-CSE-ConnectionGUID: VGhqz7hORe2FOp7TfmwFDg==
X-CSE-MsgGUID: 4GHDCAwDQAWdYvNZHg+EBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="63365013"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 03:53:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sjcm0-00000002y8m-1lcR;
	Thu, 29 Aug 2024 13:53:04 +0300
Date: Thu, 29 Aug 2024 13:53:04 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 4/5] pinctrl: intel: Implement high impedance support
Message-ID: <ZtBTEODpPVDQ1NWP@smile.fi.intel.com>
References: <20240828184018.3097386-1-andriy.shevchenko@linux.intel.com>
 <20240828184018.3097386-5-andriy.shevchenko@linux.intel.com>
 <20240829044819.GS1532424@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829044819.GS1532424@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Aug 29, 2024 at 07:48:19AM +0300, Mika Westerberg wrote:
> On Wed, Aug 28, 2024 at 09:38:37PM +0300, Andy Shevchenko wrote:

...

> > +static int intel_gpio_set_high_impedance(struct intel_pinctrl *pctrl, unsigned int pin)
> > +{
> > +	void __iomem *padcfg0;
> > +	u32 value;
> > +
> > +	padcfg0 = intel_get_padcfg(pctrl, pin, PADCFG0);
> > +
> > +	guard(raw_spinlock_irqsave)(&pctrl->lock);
> > +
> > +	value = readl(padcfg0);
> > +	value = __intel_gpio_set_direction(value, false, false);
> > +	writel(value, padcfg0);
> > +
> > +	return 0;
> 
> Why not make this return void?

No special needs, can be void.

> > +}

...

Thank you for the review! I'll send a v2 soon.

-- 
With Best Regards,
Andy Shevchenko



