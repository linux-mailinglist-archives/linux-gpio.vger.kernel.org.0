Return-Path: <linux-gpio+bounces-12353-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BADB39B772C
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 10:15:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23F2BB23C9B
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 09:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E3FD1953A2;
	Thu, 31 Oct 2024 09:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XzP9zy21"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071081946B8;
	Thu, 31 Oct 2024 09:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730366124; cv=none; b=iVRat4QVmteZpMFmg5VcqIMP/f9HwKOTIs4AdNUoACeKTB2Tsea9ouyNbG1qpACvZOocLk4Cn9F4l4m5c8vApG3Xl4/3/1xxOsMYuvFk1hvgMGkFo3k4wqHxsYQQJJOoeYqaV/h0MDC5Jx2oMHnvmKeRJ647UDoQr2Rc8G6lQEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730366124; c=relaxed/simple;
	bh=5TAZTObtoVI57LD372kZHMXLpPH9kIIf+X9qKx648gM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GhZuF43jtS8fT/6VeojhbU15Q43aEkN8ri+5RO+cP8kBTpRWM/mkGMCIkhCvjwl0ImvxWC4m43tITB5FoCbW+IjEmwKw/G8ClznUl9MzDxQJsFqC5Aju1BX4b5ZX2Bxv4GcuFIlqlJadaQWADExAsoDIFDbDRPb4f387wQ927rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XzP9zy21; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730366122; x=1761902122;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=5TAZTObtoVI57LD372kZHMXLpPH9kIIf+X9qKx648gM=;
  b=XzP9zy21/1aBhtsoaMUmgrgGE1XvdG5mpdy1VTJmo+vhmCZkgVWYIjYc
   J5xdXFAqjQ7semn9y2KbjbRwkQENaDaS7+43X6DkFabqEe5w1QNXY7Cs4
   IAWv0f5QCh0UelfkjNTDavT3l7rMJvjSl9mFWsYB7p6lqRN38domKxcu0
   nY97Y3jNCtqq2pXUI4xr89NaYK9hrgq0szJulanb2UVo5SyMzbeyTllFM
   OhC1eHhGQ1QkMceeQe23G4a1Aux5zx7Tuza176FuvM9WZbujeB23ZWoBM
   qkM3nwH/7phaR+/O3PMNyZxKQyJAf1PHpsTBcNo18yM4g5SmegkLg3D0R
   g==;
X-CSE-ConnectionGUID: ALmgIoLCRheGxqeTOkMtAw==
X-CSE-MsgGUID: 7mBSEVqJR1WqcnUO9hvznw==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="34023725"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="34023725"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 02:15:21 -0700
X-CSE-ConnectionGUID: bpSmqIzfTxWikrD5Rn3esw==
X-CSE-MsgGUID: oXSebj6qQ1O0XI44SirHiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="113364515"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 02:15:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t6RGv-00000009aVY-0eT8;
	Thu, 31 Oct 2024 11:15:17 +0200
Date: Thu, 31 Oct 2024 11:15:16 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] gpio: Use traditional pattern when checking error
 codes
Message-ID: <ZyNKpC_3E3GFsyXL@smile.fi.intel.com>
References: <20241028134454.1156852-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Mc_PW32jNO+C5AEQK6ej_CsCSV-HY76aJoQ6bjZ=JPOtg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mc_PW32jNO+C5AEQK6ej_CsCSV-HY76aJoQ6bjZ=JPOtg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Oct 30, 2024 at 09:20:45PM +0100, Bartosz Golaszewski wrote:
> On Mon, Oct 28, 2024 at 2:44 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > Instead of 'if (ret == 0)' switch to "check for the error first" rule.
> 
> Well there's much more to this patch than that and I have some issues with it.
> 
> > While it gives a "+" (plus) statistics it makes the code easier to read
> 
> Not only does it increase the footprint but it also adds completely
> unnecessary goto labels.

These pieces can be dropped.

...

> > and maintain (when, e.g., want to add somethning in between touched lines).
> 
> The single line calls to the notifier chain are unlikely to be
> extended anytime soon but even then I think we should cross that
> bridge when we get there.

Okay.

...

> > -       if (!ret)
> > -               gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
> > +       if (ret)
> > +               return ret;
> >
> > -       return ret;
> > +       gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
> > +       return 0;
> >  }
> 
> I really don't see how this makes it better. The logic here is: if the
> underlying set config worked fine - emit the event. Otherwise continue
> with the function (even if there's nothing there now). If anything
> you're making it more difficult to modify later because logically the
> notification is just an optional step on the way to returning from the
> function.

Optional steps are covered by flags, and not by checking the previous call for
failure. So, I barely see the "optionality" of the notifications in these calls.

...

> >         ret = gpiod_direction_input_nonotify(desc);
> > -       if (ret == 0)
> > -               gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
> > +       if (ret)
> > +               return ret;
> 
> Ok, for consistency I could take it but please put this into a
> separate commit doing just that (here and elsewhere).

Based on the other comments from you in this email I'm not sure I understood
this correctly. Do you want to reject the complete patch, or do you agree on
some pieces out of it.

> > -       return ret;
> > +       gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
> > +       return 0;

...

> >         ret = gpio_do_set_config(desc, config);
> > -       if (!ret) {
> > -               /* These are the only options we notify the userspace about. */
> > -               switch (pinconf_to_config_param(config)) {
> > -               case PIN_CONFIG_BIAS_DISABLE:
> > -               case PIN_CONFIG_BIAS_PULL_DOWN:
> > -               case PIN_CONFIG_BIAS_PULL_UP:
> > -               case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> > -               case PIN_CONFIG_DRIVE_OPEN_SOURCE:
> > -               case PIN_CONFIG_DRIVE_PUSH_PULL:
> > -               case PIN_CONFIG_INPUT_DEBOUNCE:
> > -                       gpiod_line_state_notify(desc,
> > -                                               GPIO_V2_LINE_CHANGED_CONFIG);
> > -                       break;
> > -               default:
> > -                       break;
> > -               }
> 
> If you really want to get rid of one level of indentation here,
> I suggest moving it into a separate function.

Perhaps you suggested a separate change for that?

> > +       if (ret)
> > +               return ret;
> > +
> > +       /* These are the only options we notify the userspace about */
> > +       switch (pinconf_to_config_param(config)) {
> > +       case PIN_CONFIG_BIAS_DISABLE:
> > +       case PIN_CONFIG_BIAS_PULL_DOWN:
> > +       case PIN_CONFIG_BIAS_PULL_UP:
> > +       case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> > +       case PIN_CONFIG_DRIVE_OPEN_SOURCE:
> > +       case PIN_CONFIG_DRIVE_PUSH_PULL:
> > +       case PIN_CONFIG_INPUT_DEBOUNCE:
> > +               gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
> > +               break;
> > +       default:
> > +               break;
> >         }
> >
> > -       return ret;
> > +       return 0;

...

> Most of this is IMO pointless churn. You typically do a lot of great
> cleanups but this just doesn't make sense. Sorry but NAK.

OK, I do one change out of that with deduplication of the direction input call,
the rest is up to you, let's it be less readable.

-- 
With Best Regards,
Andy Shevchenko



