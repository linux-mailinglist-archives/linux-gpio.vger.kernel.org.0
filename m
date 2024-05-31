Return-Path: <linux-gpio+bounces-7004-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 988438D6304
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 15:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38AA41F26789
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 13:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C26C9158D8C;
	Fri, 31 May 2024 13:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bTOKIfKk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7A233CF1;
	Fri, 31 May 2024 13:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717162265; cv=none; b=PNQ36m9aDEyILUx68qbwH0LsXSpoQuDt8kJWQlGtPXZ9AANvjXB6pzg0PZywa9nt/PZHjUsUnK6OnP0C9Z8GieR4rZNfQY3By87VALJ0BYe0HBheEK7hDHTIdRgpvEBqWEk2Y1Jhoeo7dJxju90VFL4Wl+LG7mLV7+PzuCh8njs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717162265; c=relaxed/simple;
	bh=UIVFtugpdDW7odcIGQclSJsckzuuU62m9nGLP2gc+Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mh7RNo7bSPSOVkc5r+IqHUc8sIEO8LeK3RxRPB9KXmIfa268CC+iQwtq0E90RFE6SJFnVFROpTXzVN1xiit89rYJWEBPiuZT3quNcvz4436fcwYxzHDbhml5RnqreXicJLDpZAyrCZUwoHKihRcQEsb2q4iQ17CqNPKIX+TrlKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bTOKIfKk; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717162264; x=1748698264;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UIVFtugpdDW7odcIGQclSJsckzuuU62m9nGLP2gc+Q4=;
  b=bTOKIfKkbwE5QvB4OT/bu7zGcXYKStGK4fIJGv7m+aEkd1o9N7rQBlqs
   AWGr/bH3mHRrm7qGIvUmuMzFOjTgNSz6JMYHm3UpOsdAq/zE1ENgfJBGM
   yVYUnwNRcfOqsyr/H8x1YNpHKaybq4VrRH54CUd1D9XJn7BBESXBYY90O
   R00JoIgXDBW+TKCI0VrnYnJapafg1Sdqhwfe3tBN5DZJ4NXhIo892LMcH
   PhIl2t0wdjYlgzm7pKqtPmZbihYloiLJpuaHX3/d2ozDQU8QDb/4+Vk4c
   UOcDwWcSXNg127bF7arDzAs0C3vURex/mjmHAkF8foLUAWy6XE+V5wDl0
   g==;
X-CSE-ConnectionGUID: h/nqHZrGSH2JwqkitKrhqw==
X-CSE-MsgGUID: cSxzTceHRD2i5GtGxhtqPg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="17534273"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="17534273"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 06:31:03 -0700
X-CSE-ConnectionGUID: q3+gWuuzT/CLe6wlNwW5nA==
X-CSE-MsgGUID: efiSrgHZQ/GwxKNayJXjZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="36260869"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 06:31:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sD2LS-0000000CTTc-3L96;
	Fri, 31 May 2024 16:30:58 +0300
Date: Fri, 31 May 2024 16:30:58 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 2/2] gpiolib: Show more info for interrupt only lines
 in debugfs
Message-ID: <ZlnREkzvS0rnMUDv@smile.fi.intel.com>
References: <20240530191418.1138003-1-andriy.shevchenko@linux.intel.com>
 <20240530191418.1138003-3-andriy.shevchenko@linux.intel.com>
 <7750850.EvYhyI6sBW@steina-w>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7750850.EvYhyI6sBW@steina-w>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 31, 2024 at 01:19:56PM +0200, Alexander Stein wrote:
> Am Donnerstag, 30. Mai 2024, 21:12:30 CEST schrieb Andy Shevchenko:
> > Show more info for interrupt only lines in debugfs. It's useful
> > to monitor the lines that have been never requested as GPIOs,
> > but IRQs.
> 
> I was trying to test this on TQMa8MPQL (i.MX8MP) using gpio-mxc.c.

Thank you for trying!

> But apparently this series only has an effect when gpiochip_lock_as_irq()
> is called eventually. I'm wondering what needs to be done so IRQ only
> GPIOs are listed in debugfs. Using irq_request_resources/irq_release_resources
> similar to what pinctrl-at91.c is doing?

I haven't looked deeply into this and I don't know if it's relevant, but...

The idea is that GPIO driver has an IRQ chip that announces handle_bad_irq()
as a handler and IRQ_TYPE_NONE as default type at probe stage. It also needs
to implement ->set_irq_type() callback where actual handler is going to be
locked.

That's what I do not see implemented in the driver. Moreover, I do see it
implements its own ->to_irq() callback which shouldn't be there.

Taking all above into consideration _I think_ the drivers need a bit of
refreshments.

-- 
With Best Regards,
Andy Shevchenko



