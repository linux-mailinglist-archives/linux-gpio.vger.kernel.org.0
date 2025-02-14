Return-Path: <linux-gpio+bounces-16024-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBD6A35F71
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 14:50:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1327D7A4432
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 13:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BDE9230985;
	Fri, 14 Feb 2025 13:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OjRjoRLl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9684415199D;
	Fri, 14 Feb 2025 13:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739541003; cv=none; b=oHdCWbh/jHhUivqslB/hwiUR+Asc7rELMU3TVZFreznKeEoZgdQkNgSRk0MjBOUn7RdyQr0ztWIMKdN40klEF8CNZLjdb6riqk6uiSPA7bid7amn8m6onoTpH9aN17/zBvgAAzYpeAU+2zPlthb5rvOeaaUQu6mHS9VHfjpCQO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739541003; c=relaxed/simple;
	bh=Iv9UyQ7bJaHh7X48bQBL8BzgspIPY4RwA7mpyzrsnIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T7NeX5GihcneBcoM0g2+VzxHdrnJkKP//ZeCbG31ezBEG7RP8aQE7Mw94kA/ziuKBa6uYpOAJ+eH4Q1B0lCnfih6s2HTEkANkYxUtOM/lNHZAH2K0afHe5VhOLXWYCshe5XMgK0U4MwYnKVP87tcIlBNx6IUX8D6Uw4YrLHgZ0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OjRjoRLl; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739541001; x=1771077001;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Iv9UyQ7bJaHh7X48bQBL8BzgspIPY4RwA7mpyzrsnIc=;
  b=OjRjoRLlfG9iO+aOz+eVQQZvnU43cNmHKi4Fl0dQhr2fhhiC3T7mDuP7
   Avkj/jNJj1V7nTUyp+ti5KhCZmlsNYswdQbAWtIcNtLFFlPstS1vC4q6X
   QXuvfkiYSHBdNMcOsJmC6J1I9r8mDTVpWVDX/RfcRqzhRf7drkJd/AnjC
   /KzWg186hJdF1jI8oFpD6ksGQLlA5L7r/XGPQSGv+UnS91lp7QOsLy5tk
   +ga/FCsdMmQQe0qBpz8739ICk60FrCEzsK79YtKkXEo+doCj02lT++J9y
   uMfVgj4J4a9ElCBZiUXmD9uWzkxP9xI9ZPF13dY3YcgQSWtx5VFqQcbV2
   g==;
X-CSE-ConnectionGUID: w4SEzSheRD+yU3Nr+OuNug==
X-CSE-MsgGUID: +D7Rjik8QxmkdEVNrRrDUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="57696296"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="57696296"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 05:50:01 -0800
X-CSE-ConnectionGUID: LBZK5gXaS7meBzGuN9BjJQ==
X-CSE-MsgGUID: 7S3bYq+UQESE4ior4OVtVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="113436913"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 05:49:59 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tiw4q-0000000BV0E-232J;
	Fri, 14 Feb 2025 15:49:56 +0200
Date: Fri, 14 Feb 2025 15:49:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 0/5] gpio: regmap: Make use of 'ngpios' property
Message-ID: <Z69KBATz7I80r0sl@smile.fi.intel.com>
References: <20250213195621.3133406-1-andriy.shevchenko@linux.intel.com>
 <D7S21NAXRW2A.2LB56QSTDCV6Z@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D7S21NAXRW2A.2LB56QSTDCV6Z@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 14, 2025 at 10:18:29AM +0100, Mathieu Dubois-Briand wrote:
> On Thu Feb 13, 2025 at 8:48 PM CET, Andy Shevchenko wrote:
> > It appears that regmap GPIO doesn't take into account 'ngpios' property
> > and requires hard coded values or duplication of the parsing the same
> > outside of GPIO library. This miniseries addresses that.
> >
> > For the record, I have checked all bgpio_init() users and haven't seen
> > the suspicious code that this series might break, e.g., an equivalent of
> > something like this:
> >
> > static int foo_probe(struct device *dev)
> > {
> > 	struct gpio_chip *gc = devm_kzalloc(...);
> > 	struct fwnode_handle *fwnode = ...; // NOT dev_fwnode(dev)!
> >
> > 	...
> > 	gc->parent = dev;
> > 	gc->fwnode = fwnode;
> >
> > 	ret = bgpio_init(gc, dev, ...);
> > 	...
> > }
> >
> > Reported-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

...

> Thanks, I confirm I tested this series and it does fix my case: I can
> leave the ngpio field uninitialized and its value will be correctly
> retrieved from the "ngpios" property.
> 
> Also the whole series looks good to me.

Thank you! Can you give a formal tag(s)?

-- 
With Best Regards,
Andy Shevchenko



