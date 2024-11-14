Return-Path: <linux-gpio+bounces-12999-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7839A9C880B
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 11:50:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C2E8B370F8
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 10:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305CD1F80B2;
	Thu, 14 Nov 2024 10:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aJ9Pmaqc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21691F9407;
	Thu, 14 Nov 2024 10:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731580787; cv=none; b=LImp63nFKdqchXuSRn/C7SgwQFKIKd0rBh3sg/0P6+88tAMEPf+w9B44VMup17sS9s5SnDcQTPWYoqEKlHKTcgrfSgO2NtVKngchsMzsSuas4NsIqjKTl1rBpXr2e6sq2d+2zK/4/4PflS7uXToFjnErT2s/UeFSn0MSi8uqZIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731580787; c=relaxed/simple;
	bh=jycoN5bhIGZugHX/gMZdoRKrrCKrOh6EBD7Obo0JSZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQK5ql2NiJG7LWzsWf+BIaETz5nTsQi8eOE01OkKvlktRDvwqgjMG/hqwYkTi7y1lLtp8wceaRf6RQZBxEY1pTP2KgzVADajBgVcV2R0PJRg97/HWBSlznsGTWATccodEupG/k5nLas89sA8RsDUpAkXd2+o6UDlTs+pcApmBDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aJ9Pmaqc; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731580785; x=1763116785;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jycoN5bhIGZugHX/gMZdoRKrrCKrOh6EBD7Obo0JSZg=;
  b=aJ9PmaqcAQ2rmLQpLY0tl2F+eJ0eRI62OqvaecBMUb9pBnT1wBj7rM8l
   yiBE/zZj4SRAenh+aWM8xaF5VrYQodKAR3DD8hwn3+7oQstoxv8Q/tYBE
   8O0RoXGE2uJtQ8TsAIljCMwpxb+Xzxl0NHqeiw6VkiojeH2VlhxR4b5fO
   VbgTW6lJEseUFjgeaLNw/JeCYrJgJIte+toMPrj63qXzps2+PthnSag2d
   tRtdm/CILEPFJf5b4U0tyQLG33VGiGhQzthU7416pUihP9dOrbQDNjV6B
   OTAA1m2SVYPqPYvrs/p19qGA6XlzeXwcSluJsSXJpfZUfICYuU6nfv8l7
   g==;
X-CSE-ConnectionGUID: uX/GQPbhR2ugGpeMx5EgUw==
X-CSE-MsgGUID: xcxtw+9yQKOAS2fvAOSb6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="35224386"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="35224386"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 02:39:45 -0800
X-CSE-ConnectionGUID: NdcVN8PHQaaDVMOacyrzpg==
X-CSE-MsgGUID: 8WgwCMuJQcu5BXmHZfCgjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="93215970"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 02:39:43 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tBXGG-0000000EgIa-2Wyq;
	Thu, 14 Nov 2024 12:39:40 +0200
Date: Thu, 14 Nov 2024 12:39:40 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] gpio: Move and sort Kconfig entries as suggested
Message-ID: <ZzXTbEcrLigXWpAu@smile.fi.intel.com>
References: <20241113171219.2949157-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=MeaDjhxAwmTcNZ+oHniFn4EWVEmfP8MdNWitmD+Rr=scA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeaDjhxAwmTcNZ+oHniFn4EWVEmfP8MdNWitmD+Rr=scA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 14, 2024 at 09:54:50AM +0100, Bartosz Golaszewski wrote:
> On Wed, Nov 13, 2024 at 6:12 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > The Kconfig under drivers/gpio has a specific comment
> >
> >   put drivers in the right section, in alphabetical order
> >
> > but in time some of the entries fell unordered there.
> > Put an order again.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> Could you elaborate on why you're moving drivers between categories?
> For instance: you moved Intel LJCA to USB drivers and I'm sure you
> have a reason for it (it's not clear if this actually is a USB driver,

This one is actually clear as you see that it depends on USB_LJCS which
suggests that it's USB based.

> it's not registered as such

Neither one of the existing ones in that category, right?

> ) but please expand on it in the commit message.

Okay, I will do in v2.

Thank you for the review!

-- 
With Best Regards,
Andy Shevchenko



