Return-Path: <linux-gpio+bounces-24612-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E449BB2DB28
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 13:36:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A456160279
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 11:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29AD72E7BA3;
	Wed, 20 Aug 2025 11:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WoFAPO5E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EED22E7179;
	Wed, 20 Aug 2025 11:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755689689; cv=none; b=uQnzfyhkZ18iPwM4qRDU0ERsBl1CBzs8R56m4HzGtspIAlMdzSmzdY8Te1nmfTrr05HKoFf7KletKuIINHlr9/uN65mYuViq0TScm9j+o69I8UHURVzSIc8nqWfq/htkMVPls22Zl5o5YYh9f6x0M0Yfx4dfZeg74HmEyRqCBUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755689689; c=relaxed/simple;
	bh=MNBcc/OA0QprSnUR9adFiAWbzK6BWeNTvC9da61Vglk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qUb796fUwNQ2LgowdMPzGtZPK2M4+eZWkfB6ypr3lTNjKkJZw0f1KD1BlK54gndrgMrGUkwMDoEcpUxSL1F5Q3GxRFy/55lI9CZie77hkzObgONUuLO4ORmLdpapoftKOlnL1VwgVff0TMNSRlCbI+FrquuR0f3oLH4mwgz8eSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WoFAPO5E; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755689689; x=1787225689;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=MNBcc/OA0QprSnUR9adFiAWbzK6BWeNTvC9da61Vglk=;
  b=WoFAPO5EW31MWIJB/wdeDmbeKf1Gckotjyx31/KT48E8F32R6/J7kKeU
   nFrq58c1d0nBDU+iMD8MyalwbwE9vNYBDoNHXmKxpzF4xl7lNvc+FlQHm
   55RTvE40mPN5g+Pw02Ru625Uv+Vc5wPsuBJsnihH7ZnZoS3g5BiwEwYbW
   32C/rxJjeRkur3Zd/Y8BPG4ESbk6WbSMvYnUhDI+epaIGNuiSo0hPlT1B
   VwFFYd4oM5nwtZJlippeELTd9hXU20wPGszSf+jbKTxwthOHOGyJBWjG6
   +PdRvwKHK1v8UKefAYQMaq5ipd6CLIeO+vGerCyoNvXkCnECKMrWcE4G1
   Q==;
X-CSE-ConnectionGUID: oaDtI25+QUiYYnabW9c1zA==
X-CSE-MsgGUID: csjKt0aMTGm3TiYZRRmyoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="61590964"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="61590964"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 04:34:48 -0700
X-CSE-ConnectionGUID: OZwi1ARoR22vDhP0Kzzw0g==
X-CSE-MsgGUID: /f3T65c+Q66CElPl5MASkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="168016625"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 04:34:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uoh5X-00000006pjt-0FPL;
	Wed, 20 Aug 2025 14:34:43 +0300
Date: Wed, 20 Aug 2025 14:34:42 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marcos Del Sol Vives <marcos@orca.pet>,
	Michael Walle <mwalle@kernel.org>
Cc: William Breathitt Gray <wbg@kernel.org>, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] gpio: vortex: add new GPIO device driver
Message-ID: <aKWy0lWrsiz7yaCw@smile.fi.intel.com>
References: <20250709091542.968968-1-marcos@orca.pet>
 <aHD40TD8MLug0C6b@black.fi.intel.com>
 <99b67e0f-783a-4ac0-971f-07cf1544a651@orca.pet>
 <aHElavFTptu0q4Kj@smile.fi.intel.com>
 <a36a853d-5f32-409e-8add-c60b7f5d2fa9@orca.pet>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a36a853d-5f32-409e-8add-c60b7f5d2fa9@orca.pet>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Aug 19, 2025 at 10:17:14PM +0200, Marcos Del Sol Vives wrote:
> El 11/07/2025 a las 16:53, Andy Shevchenko escribió:

...

> >> Again, I am not an expert on the Linux kernel, but I did not see any code
> >> or examples using neither gpio-mmio nor gpio-regmap for I/O-mapped registers.
> > 
> > $ git grep -lw '\.io_port[[:space:]]\+= true,'
> > drivers/counter/104-quad-8.c
> > drivers/gpio/gpio-104-dio-48e.c
> > drivers/gpio/gpio-104-idi-48.c
> > drivers/gpio/gpio-104-idio-16.c
> > drivers/gpio/gpio-exar.c
> > drivers/gpio/gpio-gpio-mm.c
> > drivers/gpio/gpio-pci-idio-16.c
> > drivers/gpio/gpio-pcie-idio-24.c
> > drivers/gpio/gpio-ws16c48.c
> > drivers/iio/addac/stx104.c
> > drivers/iio/dac/cio-dac.c
> > 
> > Take a look.
> 
> I've already made a third version of the patch, using gpio-regmap this time.
> This time I'm also using a Southbridge driver that pulls it as a platform
> device, much like the rdc321x-southbridge.c does. It's not yet ready for
> merging, but it's available for now at
> https://github.com/socram8888/linux/tree/vortex-gpio
> 
> I have found a small issue though regarding gpio-regmap, and before making
> a third version of the patch, I'd prefer to know the way to approach it.
> 
> The Vortex86 SoCs require the direction of the GPIO pin to be set before
> writing the pin's value. Otherwise, writes to the data ports are ignored.
> 
> Currently gpio-regmap does it in the opposite order:

Which is correct for the proper HW, the Vortex86 HW is broken, but...

> > static int gpio_regmap_direction_output(struct gpio_chip *chip,
> > 					unsigned int offset, int value)
> > {
> >	gpio_regmap_set(chip, offset, value);
> >
> > 	return gpio_regmap_set_direction(chip, offset, true);
> > }
> 
> (I have also noticed that it does not properly check the return value of
> gpio_regmap_set, but that's another thing)
> 
> So there are IMO three different approaches:
> 
> 1. Add a boolean flag that allows changing the behaviour. If set, invert
> the order of operations. Else do as before.
> 2. Same, but with a "flags" bitfield, in case more flags need to be added
> in the future.
> 3. Do an additional "gpio_regmap_set" after setting the direction. This
> means no new fields need to be added to the structures but causes an extra
> write that may not be needed on other drivers.

...if you want to still support this configuration which is prone to glitches
on the lines with who knows what the possible issues will come with that, you
may modify gpio-regmap on your needs. TBH, I have no preferences on the
approach, but it would be nice if others can share their opinions (I would ask
the author of gpio-regmap first (Cc'ed).

> >> IRQ is only available for the first two ports out of the five available.
> > Would  it be a problem to support them?
> 
> I cannot test that on my platform: as mentioned before, only ports 0 and 1
> have IRQs, and in my mini PC I only have two pins available, and they're
> both on port 4. 
> 
> Any code I'd write would be completely untested and IMHO sounds like a
> terrible idea to have such code merged.

I see... But what I meant is to support in terms of gpio-regmap. I think you
can still test the code that you have hardware for.


-- 
With Best Regards,
Andy Shevchenko



