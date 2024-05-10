Return-Path: <linux-gpio+bounces-6299-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 708EB8C2807
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 17:42:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 111931F22584
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 15:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB0D171657;
	Fri, 10 May 2024 15:42:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE74CBA41;
	Fri, 10 May 2024 15:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715355755; cv=none; b=cYn89BFaFA8yvoi08NhAPyNVcP5eExKIoGKTOmaJ0bt0p+q17J3NGjL+9vMXBNpfy0UUw7UKoNOND3EWGO6/K0tXVnFgzg09eY23ElwTWIydWSdJ4PUmpixtfv07/czg4oN+P+D5DA2D3bvQDIFnkrRo7pkui8HhC4yV5/Sz9fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715355755; c=relaxed/simple;
	bh=DOULkx4h22h/VqRsJyrl3vvBDlAXKnRKrhh6K/8+QwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y1OFbE1+vR/uPpRckBjTVC3wIfAFiEa9rIsvqm+9Lj/p3b0usSm4Yv6lToPZoB0Hb9b/vArFhmqSmFJ7/01GxRiytuK57Sq/AwgvZDqgBwKV6W9edVmRpcDmYG3jZ2Em3ifhIHJL6tLbJZBrxI0xjvjaQ1dr0ui62EUslF+H4Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: lzz7vI7xRQ+Lsi3bskvw8A==
X-CSE-MsgGUID: EwSaGLI2S7GdhCYPD+Oc0g==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="28827257"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="28827257"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 08:42:32 -0700
X-CSE-ConnectionGUID: kXf6+rPrTDmcA/d6/cuUfg==
X-CSE-MsgGUID: hH8xDzBwQl2Z+ol7FiK8DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="29760609"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 08:42:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1s5SOC-000000069Lt-2MIH;
	Fri, 10 May 2024 18:42:28 +0300
Date: Fri, 10 May 2024 18:42:28 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] gpiolib: Return label, if set, for IRQ only line
Message-ID: <Zj5AZMycTCPUoT-l@smile.fi.intel.com>
References: <20240508144741.1270912-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Me3XOy6HfqjxDQBwnSW9pOCtK_Ry7keJ2LiXGFB88t4nA@mail.gmail.com>
 <ZjzWlNdDVVBRD-Ma@surfacebook.localdomain>
 <CAMRc=MeuAQgos+=GmYr0X+5Pi+foJaRNwuNM0D3b4-FwxoD2mg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeuAQgos+=GmYr0X+5Pi+foJaRNwuNM0D3b4-FwxoD2mg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, May 09, 2024 at 04:23:07PM +0200, Bartosz Golaszewski wrote:
> On Thu, May 9, 2024 at 3:58 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > Thu, May 09, 2024 at 03:15:05PM +0200, Bartosz Golaszewski kirjoitti:
> > > On Wed, May 8, 2024 at 4:47 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > >
> > > > If line has been locked as IRQ without requesting,
> > > > still check its label and return it, if not NULL.
> > > >
> > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > ---
> > > >  drivers/gpio/gpiolib.c | 12 ++++++------
> > > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > > index db536ec9734d..1f1673552767 100644
> > > > --- a/drivers/gpio/gpiolib.c
> > > > +++ b/drivers/gpio/gpiolib.c
> > > > @@ -105,16 +105,16 @@ const char *gpiod_get_label(struct gpio_desc *desc)
> > > >         unsigned long flags;
> > > >
> > > >         flags = READ_ONCE(desc->flags);
> > > > -       if (test_bit(FLAG_USED_AS_IRQ, &flags) &&
> > > > -           !test_bit(FLAG_REQUESTED, &flags))
> > > > -               return "interrupt";
> > > > -
> > > > -       if (!test_bit(FLAG_REQUESTED, &flags))
> > > > -               return NULL;
> > > >
> > > >         label = srcu_dereference_check(desc->label, &desc->srcu,
> > > >                                        srcu_read_lock_held(&desc->srcu));
> > > >
> > > > +       if (test_bit(FLAG_USED_AS_IRQ, &flags))
> > > > +               return label->str ?: "interrupt";
> > > > +
> > > > +       if (!test_bit(FLAG_REQUESTED, &flags))
> > > > +               return NULL;
> > > > +
> > > >         return label->str;
> > > >  }
> > >
> > > What good would it be if gpiochip_dup_line_label() returns NULL for
> > > unrequested lines anyway?
> >
> > Then it should be handled differently in those cases. So, consider it as
> > a preparatory patch which doesn't change current behaviour.
> >
> > (Yes, I have some hack patches locally which do something useful, but they are
> > not ready. In any case this one looks to me as a good cleanup on its own for
> > the sake of readability of the code and reduced amount of checks.)
> >
> 
> Fair enough but I would like to know what your bigger plan is before
> picking this up.

I stand corrected, this patch has an immediate effect on the generic
gpiolib_dbg_show() which does *not* use the above mentioned call..

-- 
With Best Regards,
Andy Shevchenko



