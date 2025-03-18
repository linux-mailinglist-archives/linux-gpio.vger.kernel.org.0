Return-Path: <linux-gpio+bounces-17724-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8B8A670D6
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 11:11:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4B1D3B0719
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 10:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCFFA207E00;
	Tue, 18 Mar 2025 10:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+7u70KU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDAF207E0E
	for <linux-gpio@vger.kernel.org>; Tue, 18 Mar 2025 10:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742292654; cv=none; b=Hmcn1nK07YfICsvLYlCwvRDN9XAhHCGFnS0BZ4lxAlKv5aSK1MiHGnVqggRPFhX9LKrOGfp67FoK68+YTETli7vXysGZESXazjWDFmIq23acnyXEemADQMyNWxZzHpvUuwhyu5Wo5DSQsNK3fmBR0kJpY9xETIJANdL1vCRub3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742292654; c=relaxed/simple;
	bh=+HNr0OUUg/pet6wF5/pds7FuLgRzJRiTTxJAIbvCZY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EccyShBVlSYoqbLdZDuP+W8X3KEpsan2RDs3+weiRJv0UGlw1Zgy52i9m3+0hlxQr7+4gvUoczYYX9uA2NExKOxZC7sd6TMHUqrFuUuYqL9bGm7ckaGtS4DAkQSxQiqRHkUHfnuk+u2l4O0Owk9fWPp7jpILkLdHOJLujR7S4Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J+7u70KU; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742292653; x=1773828653;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+HNr0OUUg/pet6wF5/pds7FuLgRzJRiTTxJAIbvCZY4=;
  b=J+7u70KUz+mmU1yUB+z984UmpgIl+JSrVLxhXJ8aQfyXkJrBMnszed+j
   B22mJcMClVnK6W27X+0CKl4ITzKgH32paRfAcnnwu1YyBKczLYhqEsBKv
   nmVXJLv1ji6S/3PhRq3Dwcq8ZBkskYWBFqB4p12S986XXx1F8iT7SAwqK
   hr0ZK8dprq+jJW+fdS35NAGgT+xTHTeOF4mxp5CCiQcASZ+GMAtSHIW4f
   TiHk8XujUKfNbC+TaHSOnjAxQKaJ2SO1iwd9gPYOkLeLmcNSl39UyE4TZ
   ywnClQlmYf9R/SXXmhGNuVyGLEUNq1lyFY4BD/a9TrhDk/Ezf/MVTxxGY
   A==;
X-CSE-ConnectionGUID: h81BiJYhQFqilgrZ+P8oRA==
X-CSE-MsgGUID: 1zsHzIV8SHq7lFOl9XHcfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="42674139"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="42674139"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 03:10:51 -0700
X-CSE-ConnectionGUID: /m0VV5uBQmusXdolfYOAjw==
X-CSE-MsgGUID: q1KeQLK5SbaiOse7zOci3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="127252793"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 03:10:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tuTuJ-00000003aQk-3Ow8;
	Tue, 18 Mar 2025 12:10:47 +0200
Date: Tue, 18 Mar 2025 12:10:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Linus W <linus.walleij@linaro.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: GPIO TODO
Message-ID: <Z9lGp8soCgPUYLQ2@smile.fi.intel.com>
References: <PAXPR04MB8459BEB700FB66FE693EF1CF88DE2@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z9k7cL8W-TCBLK1f@smile.fi.intel.com>
 <PAXPR04MB8459E4734C7390AB4F83178E88DE2@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459E4734C7390AB4F83178E88DE2@PAXPR04MB8459.eurprd04.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Mar 18, 2025 at 09:58:43AM +0000, Peng Fan wrote:
> > On Tue, Mar 18, 2025 at 07:37:59AM +0000, Peng Fan wrote:
> > >
> > > I did two patches to drop of_gpio.h for drivers/spi/spi-stm32-ospi.c
> > > and drivers/regulator/s5m8767.c.
> > 
> > Dropping of_gpio.h from the latter is not just that, one needs to
> > convert it to use GPIO descriptor APIs first.
> 
> Yes, I did that. Not have device to test, just my best practice to
> do the convertion.
> https://lore.kernel.org/all/20250318052709.1731747-1-peng.fan@oss.nxp.com/

As far as I can tell this needs a bit more work and also have you checked
the existing DTS files? What about polarity?

> > > But when I search lore.kernel.org, I see Andy did some work on the
> > > cleanup, hope there is no duplication with your work, and I wonder
> > do
> > > you plan to cleanup the remaining ones under drivers/net/
> > drivers/nfc
> > > sound/ ?
> > 
> > There is no duplication for sure, any help will be appreciated.
> 
> My pleasure, just have spare time on various stuff.
> 
> > > Besides the of_gpio.h, anyone working on immutable irq_chip?
> > 
> > As far as I know that work has been staled. Again, it would be nice to
> > continue.
> 
> I will give a look.

-- 
With Best Regards,
Andy Shevchenko



