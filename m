Return-Path: <linux-gpio+bounces-28802-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 08311C70325
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 17:47:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4E938356A33
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 16:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D46B536C0A4;
	Wed, 19 Nov 2025 16:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QSOWetkq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72BB359FA8;
	Wed, 19 Nov 2025 16:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569569; cv=none; b=YV+dK5j9J7bdAUzQInBDaJLr2hf5gQNtgpx1bHOjJV/QdDrCmtXmTEQ1vMwpdneEb06VUY6xszh40S2ynN+AJC/B+pZ/lV2GkP4g2u1tkzmaDwoyk/aIVGR0F2As+J1V7JqX3fEjNIlB7V6Em2YH9t6KYkNKoGjvXMT8cWUXWow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569569; c=relaxed/simple;
	bh=rcYiTW4WgTYzSq1h46XlhyDQby8fcyyNoQwZ4LlKIJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OdaGO2ePmRuPb2UC3claxQn0yR1AdvFkMOnPnhSotiTsecHZLzmSyWtkqeLSFq6trFuv2cucPeyWZdPYK2hM2iH0/eHkt9OyasSAIZ7JZNExJ6wPLjY9yWWBeMxcqGk1S0VDwH7gVCJ/I3PZYev8+gt2YyFaTv4fj1DNZGOe3Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QSOWetkq; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763569568; x=1795105568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rcYiTW4WgTYzSq1h46XlhyDQby8fcyyNoQwZ4LlKIJk=;
  b=QSOWetkq5Ue6hex+HuS3gDeuukyyjsfytU9OApcsUz7ZH2xnGWwSkaln
   GuXBFIJ0yzZ+415612OsmfhQDb7cgU0pWas2W/vczKz4j75Ou5r/s7oXY
   1DTU8Thqu87b9qpOd4aZYYjWXcvhkcHgCEvMRRBwhsdwSa8P9o3odH6DO
   uJz7rLyYC3LhLEP6H7ijiwLY2Ll7i3mQ+DaBp/cMA77iwGmwRY1C/MBDn
   eLDU+a+tf8BcMckKJrceZfw7ZDAfuGbDaTR6hBx7CmWwCqZrRtrSRojGM
   tNVqAB0Y7/LnFkMarr1Bgnalzi1jACfNcidiPIjneYrEdIbVuHUAOJYnX
   w==;
X-CSE-ConnectionGUID: TqYuKXvGSSef3DrmnQ8Dwg==
X-CSE-MsgGUID: DceRcYxtSo2b03aRHI0jnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="77083285"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="77083285"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 08:26:06 -0800
X-CSE-ConnectionGUID: C6AjU3XJRhCz5LxNOI/G7g==
X-CSE-MsgGUID: IupJoa/+SbSMxo/3outhag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="228432613"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 08:26:01 -0800
Date: Wed, 19 Nov 2025 18:25:58 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>, Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v3 05/15] gpio: pxa: Use modern PM macros
Message-ID: <aR3vllR_9-aVxCAG@smile.fi.intel.com>
References: <20251119144327.13345-1-jszhang@kernel.org>
 <20251119144327.13345-6-jszhang@kernel.org>
 <aR3mnWQedt7SMRP0@smile.fi.intel.com>
 <aR3pG7Em5RcRqAKT@xhacker>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aR3pG7Em5RcRqAKT@xhacker>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 19, 2025 at 11:58:19PM +0800, Jisheng Zhang wrote:
> On Wed, Nov 19, 2025 at 05:47:41PM +0200, Andy Shevchenko wrote:
> > On Wed, Nov 19, 2025 at 10:43:17PM +0800, Jisheng Zhang wrote:

...

> > > -#ifdef CONFIG_PM
> > >  	unsigned long	saved_gplr;
> > >  	unsigned long	saved_gpdr;
> > >  	unsigned long	saved_grer;
> > >  	unsigned long	saved_gfer;
> > > -#endif
> > 
> > Same Q as per dwapb driver. The CONFIG_PM=n doesn't need these.
> 
> Now, I know why you commented like these... 
> the pm_ptr() and pm_sleep_ptr() can optimize out the PM
> functions, but those functions still need to be compiled. So if
> we keep these #ifdef, there will be build errors in case of !PM

My bad. I haven't realised that it's not just being discarded...

Thanks for your patience. Then please, fix the typos and we will go
with the v4.

-- 
With Best Regards,
Andy Shevchenko



