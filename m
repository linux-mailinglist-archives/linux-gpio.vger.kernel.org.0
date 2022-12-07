Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51EA7646276
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Dec 2022 21:39:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbiLGUjC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Dec 2022 15:39:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbiLGUjB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Dec 2022 15:39:01 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5756129CAE
        for <linux-gpio@vger.kernel.org>; Wed,  7 Dec 2022 12:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670445540; x=1701981540;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aZH0VEAW2n/Hcsr4hqpvrS/EHlziWng3Tg2xL3YFrZA=;
  b=k0OO3E3gw6mpAqF8CuJSr2Ka9qSjj1bPox+jhdBJdv3wBdb2HPhZlqB/
   3QqnVhT7O0y+kphzgGAXAhhWYaVe6uLVeWLV3NOZ0Z0SpzpsJy6uSBdQ8
   rpq7ccwqH0NErRTpkrhtrNzsib3wbShZXRmATy0AsM783K4rJsA0xqKaA
   o7RkComPQBpHH2NQPg4dJBhajTqijl9jXhrmy4AasFpDuwYC/v4zGpO/D
   +lWFbP9r958n8d79zQn4YhP0+rBBkw3CIzJeeu80wjfTLwWmh/J1to7TV
   4nXCAjBhE/KRJJH9ys7Ps+T9PX2+7G6O4p6pgo5kvp2PSYgtqTjGS4W9P
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="379165290"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; 
   d="scan'208";a="379165290"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2022 12:38:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="624436777"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; 
   d="scan'208";a="624436777"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 07 Dec 2022 12:38:58 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1p31Bx-005z5m-1p;
        Wed, 07 Dec 2022 22:38:57 +0200
Date:   Wed, 7 Dec 2022 22:38:57 +0200
From:   "andriy.shevchenko@intel.com" <andriy.shevchenko@intel.com>
To:     "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "Kiszka, Jan" <jan.kiszka@siemens.com>
Subject: Re: Question regarding runtime pinctrl (2nd try)
Message-ID: <Y5D54VpeMg/rRHCd@smile.fi.intel.com>
References: <7abfb823b92a4451d442b001ea7e49017ff3a3c8.camel@siemens.com>
 <Y4d6OosnHIDB2h6s@smile.fi.intel.com>
 <21ea48401aa3d652a379bf6aa412c660d3f4f0e5.camel@siemens.com>
 <Y43q+Be+uOzaDJAi@smile.fi.intel.com>
 <87e807ea2542b86c043e065cd9c80ce0a556479b.camel@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87e807ea2542b86c043e065cd9c80ce0a556479b.camel@siemens.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 07, 2022 at 12:02:08PM +0000, Niedermayr, BENEDIKT wrote:
> On Mon, 2022-12-05 at 14:58 +0200, andriy.shevchenko@intel.com wrote:
> > On Mon, Dec 05, 2022 at 10:47:27AM +0000, Niedermayr, BENEDIKT wrote:
> > > On Wed, 2022-11-30 at 17:43 +0200, Andy Shevchenko wrote:
> > > > On Wed, Nov 30, 2022 at 03:09:50PM +0000, Niedermayr, BENEDIKT wrote:

Something is wrong with your mail user agent or editor. The lines are quite
long. Please, make sure you wrap them somewhere at ~76 characters per line.

> > > > > Hello,
> > > > > 
> > > > > I got no response since last time so I try it again, but with a bit more
> > > > > knowledge this time.
> > > > > 
> > > > > After carefully reading the pinctrl documentation
> > > > > (driver-api/pin-control.rst) it was very clear for me that such an interface
> > > > > already exists and is accessable via debugfs. The documentation is very clear
> > > > > and self-explanatory. Thanks for that!
> > > > > At the time of writing my last email [1] I took a look into an older BSP
> > > > > kernel where this feature has not been implemented, yet. I must apologize for
> > > > > that...
> > > > > 
> > > > > Now my last concern is using debugfs on a productive system. IMHO debugfs is
> > > > > not the right interface to interact on a productive system.
> > > > 
> > > > And this is a point. No-one should try it on the production systems.
> > > > 
> > > > > Especially when
> > > > > when a unprivileged process wants to interact with an interface offered by
> > > > > debugfs. It's possible to change
> > > > > permissions on files and folders there but nevertheless I think that this is
> > > > > not the way to go, since debugfs was designed to offer interfaces to
> > > > > privileged processes only.
> > > > 
> > > > Correct.
> > > > 
> > > > > My proposal would be to implement an chardev interface for that and using
> > > > > udev rules to assign correct permissions to that. With this interface I can
> > > > > then select the active pinctrl-groups which have been defined in the device
> > > > > tree before.
> > > > > I could also imagine to put the interface into the sysfs (that would be very
> > > > > close to the debugfs implementation I think).
> > > > > 
> > > > > What do you think about it? Am I still missing something?
> > > > 
> > > > In my opinion -- no go.
> > > > 
> > > > The platform description (ACPI, DT, or board files) should know what they are
> > > > doing. If something missing to achieve what you need via existing interfaces
> > > > we rather think about that, but no, the debugfs stays and only for the purposes
> > > > of development on the "I know what I'm doing" basis.
> > > > 
> > > Ok. If I got you right, you meant that there is no way to replace the
> > > debugfs interface?
> > > 
> > > So instead replacing the debugfs interface I would rather add a second
> > > interface that coexists with debugfs.
> > 
> > I meant that this feature quite likely will stay in the debugfs realm. No new
> > interface is needed for sure.
> > 
> > > Unfortunatelly there is no interface available for runtime configuration, yet.
> > 
> > There is no explanation why you need that.
> > This is the main point of this discussion, right?
> > 
> > > The only alternative 
> > > is to access "/dev/mem", but this is the most questionable solution from
> > > a security perspective.
> > 
> > It's not an alternative at all, it's simple no go variant.
> > 
> > > There should be a way to avoid unsecure "/dev/mem" implementations but
> > > currently this is the only way to achieve runtime configuration with
> > > reasonable effort.  IMHO the current architecture leads to lot of
> > > unsecure implementations out there.
> > > 
> > > For example the raspberrypi kernel tries to workaround this issue by
> > > providing a "/dev/gpiomem"
> > 
> > This is even worse than more standard /dev/mem interface.
> > 
> > > interface that only provides mappings to the gpio register
> > > set(drivers/char/broadcom/bcm2835-gpiomem.c). 
> > > This reduces possible vulnerabilities but they still persist since:
> > > 
> > > - mmap() cannot map memory less than PAGE_SIZE, which means that memory
> > > outside of the GPIO registers is accessable. 
> > > - it's possible to select untested  pin configurations which may not be
> > > electrical fine.
> > > 
> > > I like the current architecture since I define pingroups in the platform
> > > description which have been tested and then select one of them during
> > > runtime.  It's just the interface itself which is not sufficient enough
> > > when it comes to security.  
> > 
> > Still no clue, what you are trying to achieve and why. Use case, please?
> It already mentioned the use case here [1].

(Too many [1]:s)

> But let me explain it again and
> in slightly other words.

Thank you, it helps. See my comments below.

> We are currently working on platforms that can be extended with different
> types of IO-Shields. The pinmux configuration is currently done by a
> userspace application that offers a ncurses-like GUI interface. There you can
> select the pinmux configuration for each pin regarding on the IO-Shield you
> are using.

This is very dangerous feature. While it might work in your case it may damage
the users' hardware if they don't know what they are doing.

What prevents you to create a DT / ACPI overlay and load it?
Okay, seems the answer is below...

> I already mentioned how pinmuxing works with this framework and we have the
> same opinion about using /dev/mem like you.  Well, now we're are looking for
> other solutions.
> 
> For example using device tree overlays (written statically or generated) for
> each different kind of shield would be technically fine, but doesn't scale
> very well with increasing number of shields and host platforms.

I agree with this.

> And if the host platform is non ARM based this approach may not work.

Why?

> Furthermore we need to deal also with ACPI stuff on x86.

And?..
ACPI supports overlays.

> Recompiling the device-tree/kernel for each shield and host platform is
> possible, but from a userspace developer point of view this means efford and
> may require more knowledge about the hardware (or you need to request for
> features from your BSP provider).

Yes, and it's a good thing, right?

> I also think about the question, why are there frameworks out there that try
> to solve that part of the problem (wiring-pi, eclipse-mraa, etc.).  I think
> these frameworks try to address, among other things, those issues.  So it's
> not only about our special use case. IMHO there are many use cases where this
> would make sense, otherwise these frameworks would have never come into
> being.
> 
> I hope this clarifies my point of view a bit better.

Definitely.

But again, what you are proposing is not for production, but for prototyping.
That's why it's under debugfs. Moreover, it's dangerous from electrical point
of view reconfigure pins at run-time. This feature very well may damage the
hardware or even kill somebody (if you think of a heavy robots).

The solutions for the developers who KNOW what they ARE DOING are:
1) overlays;
2) debugfs;
3) reboot.

Choose one, suitable for you and go with it.

> [1] https://marc.info/?l=linux-gpio&m=166850640920120
> 
> > > > > [1] https://marc.info/?l=linux-gpio&m=166850640920120

-- 
With Best Regards,
Andy Shevchenko


