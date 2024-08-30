Return-Path: <linux-gpio+bounces-9468-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C7C96692E
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 20:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B655BB23955
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 18:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F4D1BC075;
	Fri, 30 Aug 2024 18:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k6bJBYbK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318BC1BB69B;
	Fri, 30 Aug 2024 18:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725044007; cv=none; b=AHkllDcV9mALnoUAE8C8jMZhtsX6tAg6bTQTcdd1KnmNCo8F1yz75gI9TkTdgEBAK0ln4rM7I/suphS2Z+C2pBt3gp0fLdWSZSRgGcaTw08R2N7thGo2yiHXMipiwtZH6GiJaE8uHwovCE4omYX42RghT+2xB5OC3EdotJQMOQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725044007; c=relaxed/simple;
	bh=BGlzmqgvPIIGb+VPycp9h6zWdRuotXk72Lf+amaqtmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0uwjf3aFE+lHOMIlz1OvlCoWzG5Q00gUO0B88LJrsk52jVO5FdttJbJPzMwxWQSJLSQmoiYY0gA5e5ZcDZ+R4ILkO/uaxgdZpda/yFWRUrf5G50+DKMDmlueGX/g4KiIyto9Tj4FKeUAO6fkCd6gUJeI5qanD57uDV7ZXsRYo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k6bJBYbK; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725044006; x=1756580006;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BGlzmqgvPIIGb+VPycp9h6zWdRuotXk72Lf+amaqtmg=;
  b=k6bJBYbK6RNuMIX9zIQg2lHDN2wsbnUgMZFPkM6S3Ha6wexU6A5p1cvD
   ILMuDX9WSHXg+ASXIm6btvQJvUnRZ2UCripJpyQFdViydIuYJdAYtaosP
   tnFs31A4Vniq7xSFUBxjUSWEELHYktD3COvBCHSA++BglsbcrzVO4iEwa
   O6nw4eQkgsSJrWx2YRc4/LO6pnuEimRpONTX1TJq91xMY2+SQo0/8vCFo
   IlB4HN+Hj0BjR0V1x3FSQXtD1dVCmGxvnU9Ejr8vYr9p6vZ4623g9IXGu
   1LpQAjaVJ//wJxzQ0YZCgV7QjsYGLFavyBgzcSwHpB7gXK+Kve1v1d0Pw
   g==;
X-CSE-ConnectionGUID: EMa2VK8+RNOpPkRhTbkqWQ==
X-CSE-MsgGUID: ALvpq5x/R4iLf+n/8dCVCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="34312006"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="34312006"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 11:53:25 -0700
X-CSE-ConnectionGUID: We+Tq9daTamQdLh2iK+DMg==
X-CSE-MsgGUID: qaZcjNDIR7K7Bkr8K/iYYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="63927671"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 11:53:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sk6kK-00000003S12-3Qdd;
	Fri, 30 Aug 2024 21:53:20 +0300
Date: Fri, 30 Aug 2024 21:53:06 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2 6/6] pinctrl: intel: Introduce
 for_each_intel_gpio_group() helper et al.
Message-ID: <ZtIVEuGOzuA0wnSw@smile.fi.intel.com>
References: <20240829140406.357612-1-andriy.shevchenko@linux.intel.com>
 <20240829140406.357612-7-andriy.shevchenko@linux.intel.com>
 <20240830045039.GU1532424@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830045039.GU1532424@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Aug 30, 2024 at 07:50:39AM +0300, Mika Westerberg wrote:
> On Thu, Aug 29, 2024 at 04:59:20PM +0300, Andy Shevchenko wrote:

...

> > +#define for_each_intel_pin_community(pctrl, community)					\
> > +	for (unsigned int __ci = 0;							\
> > +	     __ci < pctrl->ncommunities && (community = &pctrl->communities[__ci]);	\
> > +	     __ci++)									\
> > +
> 
> These look more readable, thanks. Just one comment. Can you move all
> them here at the top of the file so all the variants are close to each
> other? You can do that while applying.

The rest three moved here.

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



