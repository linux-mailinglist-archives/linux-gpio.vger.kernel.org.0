Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4011848D6B2
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jan 2022 12:32:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234192AbiAMLcp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Jan 2022 06:32:45 -0500
Received: from mga02.intel.com ([134.134.136.20]:9064 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230283AbiAMLco (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 13 Jan 2022 06:32:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642073564; x=1673609564;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WY2OiJ2aEi6R6nSH/vWW0CfNIGNDDQE2dfBdRGTd2WA=;
  b=ORV8DrGFHiTkhYlmsbg7waqP5uoEsrxbLXVDip1J/gDldXsK4jCjucbY
   xQM2R2Djy8YrrOMtnwfkcmH65QWGzLfNaXk7L87Gy5hLQMi62ZZY9NuIj
   htJ9HRPcXZT/BHbjVrN9i8eErOVeXJB+sx68U8w42CIAp0Wy0ZRvkJ9BC
   c1Cu1g9489D3SpOnMs3ZJ3Cn4lHlon+T2nJ/lcVegvyFYKRGXu4eLsyMX
   P5QwjJ4cs3ko/QCbu7V841OlaiQM8ebRXwORLdILf9TTBgclgWCmk/awN
   bB4nO+Cob6JlMxazFvaE/kbpdXhFeoqmcTvS4oWOYkYdZrt+GGasmUv45
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="231334151"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="231334151"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2022 03:32:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="491103993"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2022 03:32:42 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1n7yKH-00AAka-S4;
        Thu, 13 Jan 2022 13:31:29 +0200
Date:   Thu, 13 Jan 2022 13:31:29 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: baytrail: Pick first supported debounce value
 larger then the requested value
Message-ID: <YeANkfsFivOpulog@smile.fi.intel.com>
References: <20210819203952.785132-1-hdegoede@redhat.com>
 <YR+qHHVgALcpQ6k+@smile.fi.intel.com>
 <ee7274c0-15f1-3ca0-cca3-bcdc37350334@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ee7274c0-15f1-3ca0-cca3-bcdc37350334@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 23, 2021 at 12:32:18PM +0200, Hans de Goede wrote:
> On 8/20/21 3:11 PM, Andy Shevchenko wrote:
> > On Thu, Aug 19, 2021 at 10:39:52PM +0200, Hans de Goede wrote:
> >> Bay Trail pin control only supports a couple of discrete debounce timeout
> >> values. Instead of returning -EINVAL for other values, pick the first
> >> supported debounce timeout value larger then the requested timeout.
> >>
> >> E.g. on a HP ElitePad 1000 G2, where the ACPI tables specify a timeout of
> >> 20 ms for various _AIE ACPI event sources, this will result in a timeout
> >> of 24 ms instead of returning -EINVAL to the caller.

Old thread which I forgot to answer to...

> > I would prefer to see case 1...375: case 376...750: It makes it more explicit
> > what we choose. Also it will be in align with debounce getter switch-case.
> 
> Ok, that works for me.
> 
> > Nevertheless, there is the bigger problem here, which is that the debounce
> > setting is global per community and neither current nor new code addresses.
> > 
> > What we need is to have a bitmap of size 3-bit * N_pins (per community) to save
> > settings and each time we try to adjust them, we have to go through that bitmap
> > and check actual users and see if we have conflicting requests.
> > 
> > You may ask why we have to keep the actual debounce value and not the biggest
> > one. The reason why is simple, if the following flow of requests comes we will
> > have better setting at the end:
> > 
> > 1) A asks for debounce of 1ms (we set to 1.5ms)
> > 2) B asks for 10ms (we set likely to 12ms *)
> > 3) B gone (we should return to 1.5ms)
> > 4) C asks for 400us (*)
> > 
> > *) TBH I have no idea what to do with these cases, i.e. when better to satisfy
> >    the bigger, when issue warning, when just print a debug message. I admit
> >    that debounce on BYT has been not thought through on HW level.
> 
> I believe that most DSDTs only use 1 value, so the whole bitmap thing seems
> over-complicated.

Since you are in possession of plenty of them, can you confirm?

> I did noticed the dev_dbg which I added triggering by a requested value of 50 ms.
> I've tracked that down to  drivers/input/misc/soc_button_array.c setting
> debounce_interval to 50, which then gets passed to gpiod_set_debounce() by
> drivers/input/keyboard/gpio_keys.c. gpio_keys.c will fallback to sw debouncing using
> mod_delayed_work() if gpiod_set_debounce() fails, so I think we should deny
> big debounce values to keep that fallback working.

I'm not sure I got this. If DSDT asks for big debounce timeout how can we be
sure it's incorrect request?

At least I see the way out (yes, over complicated) in keeping bitmap and / or
(not sure about bitmap) the mean / average debounce timeout. In such case if
5x users wants 10ms and one wants 50ms, we will set something like 12ms.

> I suggest we do the following:
> 
> 1. Reject value < 0 || value > 24 ms values (avoiding the gpio_keys case)

Why not to set 24ms? Perhaps we need some heuristics here. If there ask for
30ms, 24ms sounds good enough, no?

> 2. Determine rounded-up value using modified switch-case as you suggest 

Ack.

> 3. Check vs last set rounded-debounce value (if set) and warn + fail
>    the set_debounce if it is different

Ack.

> 4. Remember the last set debounce value

Ack with the above comment that perhaps better to keep mean / average.

> If the warnings turn out to trigger, we can then look at the DSDT of
> that specific device and figure out a way forward from there, with the
> knowledge of how a troublesome device actually uses this (I know a sample
> of 1 troublesome device is not necessarily representative, but it is
> better then no samples and I expect / hope there to simply be no samples).

Ack.

> (we can then also skip the debounce-time programming when it is unchanged)

Or close enough, sounds like we need margin in percentage of the asked value,
like ±20% is okay.

-- 
With Best Regards,
Andy Shevchenko


