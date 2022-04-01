Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 560CA4EEBBB
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Apr 2022 12:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345083AbiDAKp0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Apr 2022 06:45:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345052AbiDAKpZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Apr 2022 06:45:25 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED51E1171
        for <linux-gpio@vger.kernel.org>; Fri,  1 Apr 2022 03:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648809809; x=1680345809;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s9Tr2T7PrfS5VIiM+2TiPIIuJdG7DAUv3FMD31MBXgg=;
  b=CVpMzznwmmblGNTfuPcY2GBHCrer8vYaBpPQ7t0QKN3RfJktu4sMYKo1
   lzYT9WJNAi6NVVvDT069+9OZyR8GaPJwUwpCeLeUBoIwfrZlpAxIU3iqM
   s3ne/CEH5SIOoL1qTwC+RPxy4yFv0P4KAlr917De8QMbytm5sGKPPyUbh
   R9rvKLwsRRHfqU5+iCveV+ncwUEzk0H4sHCL7+M2y3ZaOTNbuXaUUctHG
   GPy0DNUJeBMZq9ZjeNUxPOy7Zdt0h0BQBrWNuF4WVqyv8zH1DWD29yJdj
   TEXkBaYVGSm2BGVkfz0vSoVhO+b/flTev9I7aNHXIX0ueKwNrnDEfd5Dh
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="240693332"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; 
   d="scan'208";a="240693332"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2022 03:43:28 -0700
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; 
   d="scan'208";a="586807287"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2022 03:43:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1naEk2-00Ad2w-RU;
        Fri, 01 Apr 2022 13:42:54 +0300
Date:   Fri, 1 Apr 2022 13:42:54 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-gpio@vger.kernel.org,
        brgl@bgdev.pl, thomas.petazzoni@bootlin.com,
        linus.walleij@linaro.org
Subject: Re: gpiolib: why does gpio_set_bias() suppress ENOTSUPP?
Message-ID: <YkbXLgeodeQtmGS9@smile.fi.intel.com>
References: <20220331025203.GA53907@sol>
 <YkWyU8seDqyDL532@smile.fi.intel.com>
 <20220331141524.GA93836@sol>
 <YkXiq995Xb+1Quq8@smile.fi.intel.com>
 <20220401000837.GA4938@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220401000837.GA4938@sol>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 01, 2022 at 08:08:37AM +0800, Kent Gibson wrote:
> On Thu, Mar 31, 2022 at 08:19:39PM +0300, Andy Shevchenko wrote:
> > On Thu, Mar 31, 2022 at 10:15:24PM +0800, Kent Gibson wrote:
> > > On Thu, Mar 31, 2022 at 04:53:23PM +0300, Andy Shevchenko wrote:
> > > > On Thu, Mar 31, 2022 at 10:52:03AM +0800, Kent Gibson wrote:
> > > > > It has recently come to my attention that the setting of bias by the
> > > > > cdev uAPI is a best effort operation that quietly succeeds if bias is
> > > > > not supported by the hardware. That strikes me as being a bug.
> > > > > It seems I was aware of this when adding bias to the uAPI and intended
> > > > > to fix it, as shown in the comments of v4 of the corrsponding patch
> > > > > series[1]:
> > > > 
> > > > > > > The setting of bias is performed by gpio_set_bias, which is hooked into
> > > > > > > gpiod_direction_input and gpiod_direction_output.  It extends the setting
> > > > > > > of bias that was already present in gpiod_direction_input.
> > > > > > > In keeping with the existing behaviour, the bias is set on a best-effort
> > > > > > > basis - no error is returned to the user if an error is returned by the
> > > > > > > pinctrl driver.  Returning an error makes sense to me, particularly for
> > > > > > > the uAPI, but that conflicts with the existing gpiod_direction_input
> > > > > > > behaviour. So leave as best-effort, change gpiod_direction_input
> > > > > > > behaviour, or restructure to support both behaviours?
> > > > > 
> > > > > > Thomas: is there any reason not to check the return value of these
> > > > > > calls for errors other than -EOPNOTSUPP?
> > > > > 
> > > > > that being my comment, and Bart's followup question to Thomas.
> > > > > 
> > > > > That went unanswered AFAICT and the issue subsequently fell through the
> > > > > cracks.
> > > > 
> > > > My understanding that all constraints we have in kernel is due to
> > > > in-kernel use and possible (non-critical) issues.
> > > > 
> > > > For example, driver can set only selected values of bias. What to do when
> > > > the given value is not supported by hardware?
> > > > 
> > > > Followup question: Why do you think your choice is any better than another
> > > > one?
> > > > 
> > > 
> > > I'm probably missing your point here.
> > > 
> > > What makes gpiolib best placed to decide that bias not being supported
> > > by hardware is non-critical?  Why not just propagate the ENOTSUPP to the
> > > caller and let them decide?
> > 
> > First of all, ENOTSUPP may not be sent to user, it's wrong error code.
> > The returning any other error code make behaviour for the _very same_
> > GPIO line _different_ when it being configured in kernel (via firmware)
> > and user space. That's unacceptable. So, it means we have to have
> > synchronized behaviour, means either error in both case or ignoring it.
> > The latter one is current state of affairs, the former might break the
> > cases where driver and firmware are not synchronized well.
> > 
> 
> First of all, I was referring to in-kernel users of gpiolib, so gpiolib
> would propagate ENOTSUPP.  You will note I said "caller", not "user"
> to try to emphasise that point.
> cdev, being the caller here, would translate the ENOTSUPP to EOPNOTSUPP
> for user space consumption.

Ah, okay!

> But back to the point...
> Are you saying that user space should not be given an error if bias is
> not supported as it was already decided by gpiolib that the kernel
> driver wouldn't be given one?
> That makes no sense to me, so I'm probably missing something.
> Can you clarify?

I think that deviating of the behaviour would confuse some.
Why the configuration of the very same line described in DT
and used in user space will behave differently?

> What I read from your answer is "that's the way it is".
> I get that, but was after why.
> I don't see dropping errors as a way to get anything in sync.
> Quite the opposite - it ensures we can never tell if they are.
> 
> If the original problem was that there are two possible causes for
> ENOTSUPP, and one of them is critical and one is not, then the solution
> should be to split the functionality into separate calls, not just drop
> the error from the "non-critical" one.  Again, gpiolib has no business
> in that criticality decision, IMHO. And again when I say gpiolib here
> I mean the core - gpiolib.c.

I got your point. But to me it is a way of breaking the prototyping and
actual product. If you strict at prototyping and reuse same DT(b) over
several generations of the platform, some of them (due to subtle hardware
differences) may ignore errors (due to in-kernel behaviour) while during
prototyping that was strict.

The best approach here is to add a new IOCTL "enable extended error reporting"
or alike and expect all of GPIO ABI calls to fail. In such case it won't
alter status quo, not break ABI.

> > > Is it because setting bias is piggy-backed onto
> > > gpiod_direction_input() rather than being separate, so then you can't
> > > tell whether it is input or bias that is not supported?
> > > 
> > > Anyway, if that interface is required for internal use then there is no
> > > option but to refactor gpiod_direction_input() and provide an alternate
> > > interface so that cdev can determine if bias is supported or not.
> > 
> > > > > I would like to fix the uAPI such that if the hardware does not support
> > > > > the requested configuration, or if it can't be emulated in the kernel,
> > > > > that fact is returned to userspace - bias being the sole counter example
> > > > > as far as I am aware.
> > > > > 
> > > > > The simplest fix involves changing gpio_set_bias() to call gpio_set_config()
> > > > > rather than gpio_set_config_with_argument_optional(), but as mentioned in
> > > > > my comment above, that would impact any existing users of
> > > > > gpiod_direction_input() that assume the best-effort behaviour.
> > > > 
> > > > Exactly, best effort is to supply it to the driver and <s>pray</s> hope for
> > > > the best form the hardware driver.
> > > > 
> > > > > I haven't been able to find any such usage, but that could just be proof
> > > > > that I'm not looking in the right place.
> > > > > Any input on that front would be greatly appreciated.
> > > > > 
> > > > > Also, fixing this as mentioned could be considered an uAPI ABI change.
> > > > > Is this a bug, so that is ok, or do I need to consider adding a strict
> > > > > mode flag or somesuch to the API?
> > > > > 
> > > > > Bart, I'm also hoping to extend the gpiosim to optionally not support
> > > > > bias in gc->set_config() to test this case.
> > > > > Any suggstions on a configfs interface extension to do that?
> > > > > 
> > > > > My apologies for the verbage rather than proffering a patch, but the
> > > > > different paths have vastly different costs, and the simplest solution
> > > > > has the potential to introduce breakage.
> > > > 
> > > > > [1] https://www.spinics.net/lists/linux-gpio/msg43579.html
> > 
> > -- 
> > With Best Regards,
> > Andy Shevchenko
> > 
> > 

-- 
With Best Regards,
Andy Shevchenko


