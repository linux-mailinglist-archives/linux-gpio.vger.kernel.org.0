Return-Path: <linux-gpio+bounces-27844-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E29C1B992
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 16:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C0BF1892048
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 15:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA912EC0B6;
	Wed, 29 Oct 2025 15:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kU7KrFQn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A3C278E5D;
	Wed, 29 Oct 2025 15:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761751141; cv=none; b=lTA4rCDOtjtB5GxncjesIVN9xjZnWZBj3ibLx7J2lhauYwZc3n0YxU4IvOfjf+M1Wifin9Nx7fK3z8zkUFi1xHLKyECuHGII0UXiYyUh0VHl6wR8+xa/JYp6u2iCij0vYgatulicag0GIb06nQPlXs1n47TFHIUVLmJDnryOmvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761751141; c=relaxed/simple;
	bh=EpzLFVZD5xI2UDK/Ftwn8JnCSoKvTCCWS6Wjlz1OKXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MiU5d/YY7th/w6KU9f1urwE5FxOEcMqCNW8wIYVdhDGGHRT6qywz8RGpKS/U4pVJjOX+H+AzB7B3fRCB22cOgsVHdxiJCfkhbgmEcGYL1LERAt7rM/ZV2ME8uMUuccnUeG7T+UMq+5tfdHCVnXSlW2rJ213Qayzwmp/CGdCKNIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kU7KrFQn; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761751140; x=1793287140;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=EpzLFVZD5xI2UDK/Ftwn8JnCSoKvTCCWS6Wjlz1OKXY=;
  b=kU7KrFQnOUpSPJ0oUy9eQcnnB1U55j6T4I5hIyzsrvyJu7TNaYXvGOFV
   8sJZdSjYdJhmB3eVT0GDspAfa4aGtQVNEXNRrv5QQhp5emdjUOgbAQXbd
   CYXcPHULuCZoRegcXlUdy+6LabOQBNE/DvA6M4Vsk4XQ3RMaCuXLCXL5P
   2kMV5ydA4Bbrf/HBFE5mtKyzsySCpMxASyUj8jPE5ZMp6IU6qjhMpd+Sb
   ZjhemV4mN7YtpnGI+QMIJrj7tZZ0BgyHnlAi1tjgtX6H686MhqMEuxqmR
   aALCYBHIyUtuikWAB6vEKdmMU/5dqkd3kfQyfB1exMjTyNlpLG/BYDD3J
   A==;
X-CSE-ConnectionGUID: rtHgMJJKRuS88bmw4JQ2/w==
X-CSE-MsgGUID: P195PJxHR1yvlSjEk9MInA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63759830"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="63759830"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 08:18:59 -0700
X-CSE-ConnectionGUID: KJvar1HiTFalTC2etZtyxQ==
X-CSE-MsgGUID: 0IvhDGTqSICuASuA8EuEOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="185391702"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.248])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 08:18:52 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vE7wn-00000003eOA-15u8;
	Wed, 29 Oct 2025 17:18:49 +0200
Date: Wed, 29 Oct 2025 17:18:49 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 03/10] gpiolib: implement low-level, shared GPIO
 support
Message-ID: <aQIwWXM8BfjQs7kv@smile.fi.intel.com>
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
 <20251029-gpio-shared-v3-3-71c568acf47c@linaro.org>
 <aQH-NcXry6_IlqXQ@smile.fi.intel.com>
 <CAMRc=Me5qPS2PhLK5hpK8BbTS8b9q3T-+86mq6rVDpyKZZUfoA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Me5qPS2PhLK5hpK8BbTS8b9q3T-+86mq6rVDpyKZZUfoA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 29, 2025 at 01:39:34PM +0100, Bartosz Golaszewski wrote:
> On Wed, Oct 29, 2025 at 12:45 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Wed, Oct 29, 2025 at 12:20:39PM +0100, Bartosz Golaszewski wrote:
> > >
> > > This module scans the device tree (for now only OF nodes are supported
> > > but care is taken to make other fwnode implementations easy to
> > > integrate) and determines which GPIO lines are shared by multiple users.
> > > It stores that information in memory. When the GPIO chip exposing shared
> > > lines is registered, the shared GPIO descriptors it exposes are marked
> > > as shared and virtual "proxy" devices that mediate access to the shared
> > > lines are created. When a consumer of a shared GPIO looks it up, its
> > > fwnode lookup is redirected to a just-in-time machine lookup that points
> > > to this proxy device.
> > >
> > > This code can be compiled out on platforms which don't use shared GPIOs.
> >
> > Besides strcmp_suffix() that already exists in OF core, there are also some
> > existing pieces that seems being repeated here (again). Can we reduce amount
> > of duplication?
> 
> I'm afraid you need to be more specific here.

You can simply browse the file, it's not long to find and think about it.
I'm _thinking_ that it's possible to improve the situation overall by
try our best of deduplicating (or rather not duplicating) things.

...

> > > +#if IS_ENABLED(CONFIG_OF)
> > > +static int gpio_shared_of_traverse(struct device_node *curr)
> > > +{
> >
> > I believe parts of this code may be resided somewhere in drivers/of/property.c
> > or nearby as it has the similar parsing routines.
> 
> I don't think this is a good idea, I want to keep it within the
> confines of drivers/gpio/ and the use-case is so specific, there's
> really no point in putting parts of it under drivers/of/.
> 
> If I could only iterate over all properties of an fwnode, I'd have
> skipped using OF-specific routines altogether.

The problem is that every subsystem considers "it's not a good idea" or
"historical reasons" or other excuses. Since you are adding OF-specific
stuff that has something already done inside OF specific code, why to
spread it over the kernel by duplicating in another place(s)?

-- 
With Best Regards,
Andy Shevchenko



