Return-Path: <linux-gpio+bounces-30662-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60088D328EB
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jan 2026 15:24:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 850083145FDF
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jan 2026 14:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4342E331A62;
	Fri, 16 Jan 2026 14:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N5xoGJve"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8139A3328ED
	for <linux-gpio@vger.kernel.org>; Fri, 16 Jan 2026 14:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768573245; cv=none; b=MwmrJ5HOrNF5VsY4Lg4mbvHeICiBPTD8dV861Gtnn/LFayUKVCRYjBs8lAhklSeCHEq5J7gECBhcz8VRkXiQtTYDu/cKylFHtwaQTlPg3tWnlYuXjDTNaJlSGnlcyvPFaGN0j/rywT8/JHE2nl5EneUCFLWkmJesbsMtRWRnfFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768573245; c=relaxed/simple;
	bh=mXSkUMHaQ9xXqgljxET4dXaqQEfr/DOwHMs67DDUWRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UCyHWN4aDvjvY4ORWomdK+igOix5DPJ+T15wInIyK5Sogjom6I8L/d0alXIuYGgS+q4r29Q3TAg7A+x1fj5mmI90ZtGJ3zxCuC+B5WIyAtsIMGqGMoe0seYC3hwoS7kTFCJlhFnYAMCuuDdC8rs11JMFi99xfA6chPwnoHTL/+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N5xoGJve; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768573242; x=1800109242;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=mXSkUMHaQ9xXqgljxET4dXaqQEfr/DOwHMs67DDUWRU=;
  b=N5xoGJvezEyjtn9WdYAmQOr7x35WRQYF5P2Bkr0rn7xx3+i6kx98W+K7
   Cm1WRpVfvSpPBZvhwVLQmisz0cKaH6tTtQcaR97600fjE2FmchJPaCPya
   FS60rlnmIAwUzrXaXt7FcD8w/7NVTzWn/nkAzex1iJ8nY52ETCYgRWUx2
   oGPeZH8QISYaHymUxGGdidMwQPNDzsIa/SliQo0paepOejq7zIrmJ9xiL
   ZiIS1CVDGyHonwpM+ZxcBuXJC7cIKaod6bIEv9RFCMcNswtOyofPvoHLJ
   FV390mAWHBrkNL59+owdETi1Fr9sLcHvRUoCfFbDcz7RhrHRjJrrUU3pr
   g==;
X-CSE-ConnectionGUID: 49LdLMKaR4mWRUxWfpTqSw==
X-CSE-MsgGUID: CUGUcYP6Qhazk667GNHIiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="57439613"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="57439613"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 06:20:40 -0800
X-CSE-ConnectionGUID: l/3PDixFSka6gtqnMVGmgQ==
X-CSE-MsgGUID: vS+RZq4FRRiW4+2t5vvxHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="210274449"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 06:20:39 -0800
Date: Fri, 16 Jan 2026 16:20:37 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Linux pin control <linux-gpio@vger.kernel.org>
Subject: Re: GPIO direction problems in gpio-shared-proxy.c
Message-ID: <aWpJNYJ7KeYn--GB@smile.fi.intel.com>
References: <CAD++jLkJfyhmpepkanMyvLc_C0v_XZeoEKj8XJ3bw5fJAqJYyQ@mail.gmail.com>
 <aWjlJTnrI8r0iIMR@smile.fi.intel.com>
 <CAMRc=Me4dMf2hV1R=aFrmOqH5=07JBHH68wjMdgUE79FQjNwGQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Me4dMf2hV1R=aFrmOqH5=07JBHH68wjMdgUE79FQjNwGQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jan 16, 2026 at 02:03:06PM +0100, Bartosz Golaszewski wrote:
> On Thu, Jan 15, 2026 at 2:01 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Jan 15, 2026 at 10:41:11AM +0100, Linus Walleij wrote:
> > > Hi Bartosz, Andy,
> > >
> > > Andy is good with problems like this, so I explicitly address you!
> > >
> > > A review of the I2C core brought this problem to my attention:
> >
> > (and seems it's spreading:
> >  drivers/tty/serial/mxs-auart.c:1522)
> >
> > > we have the following confusion in gpio-shared-proxy.c:
> > >
> > > dir = gpiod_get_direction(desc);
> > > (...)
> > >
> > > This function from <linux/gpio/consumer.h>
> > >
> > > if (dir == GPIO_LINE_DIRECTION_OUT) {
> > >
> > > This define is from <linux/gpio/driver.h>
> > >
> > > So we need to move the GPIO_LINE_DIRECTION_[IN|OUT] to
> > > consumer.h if you want to use it like that.
> > >
> > > But we don't want to include consumer.h into driver.h or explicitly
> > > into every driver.
> > >
> > > The I2C core and any external direction user looks like this:
> > >
> > > /* FIXME: add proper flag instead of '0' once available */
> > > if (gpiod_get_direction(bri->sda_gpiod) == 0)
> > >
> > > So this needs a proper define too and it isn't a driver.
> > >
> > > Shall we create <linux/gpio/directions.h>
> > > with just these defines and include that into consumer.h and driver.h?
> >
> > If we talking about header level of splitting, I would do it as gpio/types.h
> > (gpio/defs.h) as others usually do.
> >
> > As for the particular problem, and I think Bart has better view on it,
> > I think the use cases should be revisit first to understand "whu?" do
> > we even need that in the code. Since we have two so far (or more?) we
> > can try to address each of them in a better way.
> >
> > OTOH if we have _get_direction() in consumer.h, why don't we have defined
> > possible answers in the same header?
> >
> 
> Because we also have the .get_direction() callback defined in struct
> gpio_chip in gpio/driver.h. :)
> 
> This isn't a big problem. It can probably be fixed as Andy suggested:
> add gpio/defs.h, move these defines there and include it from
> consumer.h and driver.h. Possibly adding some more symbols to defs.h
> that are used both by drivers and consumers.

Okay, let's do that way. At least it will unload us from thinking of how to do
better right now.

> The bigger issue for me is the mix-up of the defines from dt-bindings
> and gpio/machine.h. Some of them share names but not values, others
> share both while some none. I have it on my list to start untangling
> it and provide interfaces for translating between OF and machine
> definitions. We already have that buried deep in gpiolib code but
> sometimes we need it externally - for instance: to translate
> properties between different types of fwnodes.

100% agreed. I rose that topic a couple of years ago IIRC, and
I really will appreciate the solution eventually to come in.

-- 
With Best Regards,
Andy Shevchenko



