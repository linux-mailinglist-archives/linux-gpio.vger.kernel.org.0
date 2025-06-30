Return-Path: <linux-gpio+bounces-22452-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18515AEE094
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 16:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0093817A280
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 14:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B4228C5CF;
	Mon, 30 Jun 2025 14:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GdC9zgzk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17E528C030;
	Mon, 30 Jun 2025 14:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751293386; cv=none; b=XlK2bUyir3csh+RmfVVkeTvYjKPxzukMIqAo0XwowdfgLEAtZk5FBkDpRIhQdpef0XV0uJWmRre3LX3+i5t7lvk75I/zm6N9VYBv7Gleir+mJ8F5hG0mRWX2SS/IP7pZOdo/Iu0cYKLPKMxTuxuSqbEEtb9znqKOoXWhqknORyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751293386; c=relaxed/simple;
	bh=UgYMJ2UF46+JvPf/ZD8E1xN4z5bKB+PDUIaBgR7h3yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R8kFAO3DwjoT5yuXIZbohDlHzUoG/eKp8SBn+JxI24UcefMda4o21p3Qbd3KLvSpyPBT3OzFuDpJoJC0mOst27F7URHggM3GBibdNxJaK1ikzMOc6blJv2c0vaOyOEqVVhOG1vR/k/HW4tUjOQZTim+HkNs40aJxX+YMIMZthdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GdC9zgzk; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751293385; x=1782829385;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=UgYMJ2UF46+JvPf/ZD8E1xN4z5bKB+PDUIaBgR7h3yo=;
  b=GdC9zgzkWLh6mcIY/+JENHCwwWWW8Ui1KtbZ/j6LbwhjuxEjzYBbrLv2
   J+oeAV6IAdOraiJq/8hgeOs+GxNjtA+dJ93KUHZ+MleTgp2cAPIHIl063
   wdPKc2wpqOIIpyBy5LLLuB6mbUgvxOTYl/21pdvHsx/1duG4+GvrBwkY6
   xiyu7H28KnWLMFgRginJSYtSp/f67rgKBcsfx5g8dJtVBDdDelw1ut/a7
   4rxrIUVWCQAr9K7YEq9joknQ/aVUAriYs2xBWoWfnWG6m6zP7vR48npLn
   LI3vu3FWE7nCdURA9YM4z+VqxT8aVZg7RdNQ8IKOp9YJeKy1ZSZJk1+IH
   Q==;
X-CSE-ConnectionGUID: Dtx66PKpS4W4WCLV1fOWvw==
X-CSE-MsgGUID: DnXUpvv5RoKALfQCyyDtDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53245039"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53245039"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 07:23:04 -0700
X-CSE-ConnectionGUID: ApI+dLjJQL6JgJb2MYQ+Fg==
X-CSE-MsgGUID: VMRRtmUdRg+SEtKeIqeX9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="154185267"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 07:23:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uWFPO-0000000BKY9-1rGS;
	Mon, 30 Jun 2025 17:22:58 +0300
Date: Mon, 30 Jun 2025 17:22:58 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Kent Gibson <warthog618@gmail.com>,
	Jan =?iso-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 06/10] gpio: sysfs: don't use driver data in sysfs
 callbacks for line attributes
Message-ID: <aGKdwmjlzVXsLhVX@smile.fi.intel.com>
References: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org>
 <20250630-gpio-sysfs-chip-export-v3-6-b997be9b7137@linaro.org>
 <aGKQ3m87REse0abU@smile.fi.intel.com>
 <CAMRc=Md4f_CMWKEr+k7z0NosnDmXtM1WO1ONyzE0j0OgN2W3vw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Md4f_CMWKEr+k7z0NosnDmXtM1WO1ONyzE0j0OgN2W3vw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 30, 2025 at 03:39:20PM +0200, Bartosz Golaszewski wrote:
> On Mon, Jun 30, 2025 at 3:28 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Mon, Jun 30, 2025 at 02:37:13PM +0200, Bartosz Golaszewski wrote:

...

> > > -     struct gpiod_data *data = dev_get_drvdata(dev);
> > > +     struct gpiod_data *data = container_of(attr, struct gpiod_data,
> > > +                                            dir_attr);
> >
> > > -     struct gpiod_data *data = dev_get_drvdata(dev);
> > > +     struct gpiod_data *data = container_of(attr, struct gpiod_data,
> > > +                                            dir_attr);
> >
> > I still think that bunch of definitions to wrap contaner_of():s will help.
> > Note, two of them you are using even in the code below, besides the attribute
> > show()/store() cases.
> 
> I think this is overkill, the container_of() macro is pretty explicit
> and having 4 new macros will result in more LOC in the end.

I don't know how you counted. I counted as first one takes the same +4/-4 LoCs,
second one will gain already 1 LoC if we stack them as

#define foo_attr_to_gpiod_data(a)	container_of(...)
#define bar_attr_to_gpiod_data(a)	container_of(...)

...and so on...

But yes, some people are still fans of 80, and this might distort
the calculations I made.

> I'll allow myself to keep this as is.

Fair enough.

-- 
With Best Regards,
Andy Shevchenko



