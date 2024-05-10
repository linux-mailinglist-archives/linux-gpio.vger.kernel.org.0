Return-Path: <linux-gpio+bounces-6301-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7759C8C282D
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 17:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3379E28169F
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 15:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7B9E171672;
	Fri, 10 May 2024 15:48:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F8812D219;
	Fri, 10 May 2024 15:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715356138; cv=none; b=KsPJZ4ZOVUcRuhcYBmMwcRTnqMHq6RG34HfSvE7R+5wo5syuyHNfwgrj8dIafQunx8F0d8uxHjNcXpJcUlSMQ0N2qdDTkTthqXLATjFB8FmEWSAEqvGPHUAq+yayYRFMtI1vUD7pV0Lyd3zu+vF+MctK+iEKEMg51qPXglayH/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715356138; c=relaxed/simple;
	bh=157rns0KwSvPY8qQwBR79GlFobjNiJMs15dOemoDj1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pmEdrfZWKjH+jyYLhgX4RaGWKVs1m60N1QIIBFBxWtBOsVAeanPFDFpCh35ig4GeEkTVzJ3arbAWZspUrdnl+Ul3O4gAjdw3bPr+yxnkPUSdPokutLDEtzEhu6wwvnTIy64GG9Dx4GRlOc2SDgNdj0zflZ60cgyURCjLfr4alRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: ITsg9IDzTteg1QcYg6n80w==
X-CSE-MsgGUID: vcKOEboLRme0XBIDJU3pSQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15136663"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="15136663"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 08:48:57 -0700
X-CSE-ConnectionGUID: EiQpYrHlTu2oO5bnPtsz0g==
X-CSE-MsgGUID: Ef9QlqFkTamT1CqQPl1fEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="34095432"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 08:48:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1s5SUO-000000069SJ-2Z4w;
	Fri, 10 May 2024 18:48:52 +0300
Date: Fri, 10 May 2024 18:48:52 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] gpiolib: Return label, if set, for IRQ only line
Message-ID: <Zj5B5ONDI7DB86on@smile.fi.intel.com>
References: <20240508144741.1270912-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Me3XOy6HfqjxDQBwnSW9pOCtK_Ry7keJ2LiXGFB88t4nA@mail.gmail.com>
 <ZjzWlNdDVVBRD-Ma@surfacebook.localdomain>
 <CAMRc=MeuAQgos+=GmYr0X+5Pi+foJaRNwuNM0D3b4-FwxoD2mg@mail.gmail.com>
 <Zj5AZMycTCPUoT-l@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zj5AZMycTCPUoT-l@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 10, 2024 at 06:42:28PM +0300, Andy Shevchenko wrote:
> On Thu, May 09, 2024 at 04:23:07PM +0200, Bartosz Golaszewski wrote:
> > On Thu, May 9, 2024 at 3:58 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:

...

> > Fair enough but I would like to know what your bigger plan is before
> > picking this up.
> 
> I stand corrected, this patch has an immediate effect on the generic
> gpiolib_dbg_show() which does *not* use the above mentioned call..

Ah, but it doesn't use gpiod_get_label() in the else branch either...

I want to amend the else branch there to print similar or reuse the main one.
For the latter I have locally a patch to modify gpiolib_dbg_show() to show
the interrupt lines as well even if they are not requested.

-- 
With Best Regards,
Andy Shevchenko



