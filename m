Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E77E4EDF8A
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Mar 2022 19:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbiCaRWD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 31 Mar 2022 13:22:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbiCaRWC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2022 13:22:02 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8672A125590
        for <linux-gpio@vger.kernel.org>; Thu, 31 Mar 2022 10:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648747214; x=1680283214;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b1oApMrkZxF19K13rJAQwzEuLz7YYN2DHRpcLhQP4uQ=;
  b=NkogiuQ4STm6hk0CQEDDYOeil/IRf1Z3zZdBhk6o1U5buKQtuBAiFr2a
   ElrLIWtpiYQofN95VfHXutNzT51CW6tdAIUJDTq8GfztUF22eaG7E3xdm
   86F/zpTfeygxeY5VfFgsdsVwk7Yz4FsJeAEpT3VJVj9fA/807xl62a0tM
   U8gSUgoMi3Pjr8N1Qd0Ka3IjOFVPsudzPIrsPCSBcxGAGAAUoTKCrmI1V
   gM/9qLOv9IQSr+dI1iBy8JKr6pYYmbcZS3IUvDP19/sTxZyJPlJoZSJLl
   y4FP/znXI96BuRuIbMDUvX21SgW4pTX+TMRDIrXVqdTUKBkTOOHkAWiZt
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="260085041"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; 
   d="scan'208";a="260085041"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2022 10:20:14 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; 
   d="scan'208";a="720545314"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2022 10:20:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nZySR-00A94d-IQ;
        Thu, 31 Mar 2022 20:19:39 +0300
Date:   Thu, 31 Mar 2022 20:19:39 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-gpio@vger.kernel.org,
        brgl@bgdev.pl, thomas.petazzoni@bootlin.com,
        linus.walleij@linaro.org
Subject: Re: gpiolib: why does gpio_set_bias() suppress ENOTSUPP?
Message-ID: <YkXiq995Xb+1Quq8@smile.fi.intel.com>
References: <20220331025203.GA53907@sol>
 <YkWyU8seDqyDL532@smile.fi.intel.com>
 <20220331141524.GA93836@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331141524.GA93836@sol>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 31, 2022 at 10:15:24PM +0800, Kent Gibson wrote:
> On Thu, Mar 31, 2022 at 04:53:23PM +0300, Andy Shevchenko wrote:
> > On Thu, Mar 31, 2022 at 10:52:03AM +0800, Kent Gibson wrote:
> > > It has recently come to my attention that the setting of bias by the
> > > cdev uAPI is a best effort operation that quietly succeeds if bias is
> > > not supported by the hardware. That strikes me as being a bug.
> > > It seems I was aware of this when adding bias to the uAPI and intended
> > > to fix it, as shown in the comments of v4 of the corrsponding patch
> > > series[1]:
> > 
> > > > > The setting of bias is performed by gpio_set_bias, which is hooked into
> > > > > gpiod_direction_input and gpiod_direction_output.  It extends the setting
> > > > > of bias that was already present in gpiod_direction_input.
> > > > > In keeping with the existing behaviour, the bias is set on a best-effort
> > > > > basis - no error is returned to the user if an error is returned by the
> > > > > pinctrl driver.  Returning an error makes sense to me, particularly for
> > > > > the uAPI, but that conflicts with the existing gpiod_direction_input
> > > > > behaviour. So leave as best-effort, change gpiod_direction_input
> > > > > behaviour, or restructure to support both behaviours?
> > > 
> > > > Thomas: is there any reason not to check the return value of these
> > > > calls for errors other than -EOPNOTSUPP?
> > > 
> > > that being my comment, and Bart's followup question to Thomas.
> > > 
> > > That went unanswered AFAICT and the issue subsequently fell through the
> > > cracks.
> > 
> > My understanding that all constraints we have in kernel is due to
> > in-kernel use and possible (non-critical) issues.
> > 
> > For example, driver can set only selected values of bias. What to do when
> > the given value is not supported by hardware?
> > 
> > Followup question: Why do you think your choice is any better than another
> > one?
> > 
> 
> I'm probably missing your point here.
> 
> What makes gpiolib best placed to decide that bias not being supported
> by hardware is non-critical?  Why not just propagate the ENOTSUPP to the
> caller and let them decide?

First of all, ENOTSUPP may not be sent to user, it's wrong error code.
The returning any other error code make behaviour for the _very same_
GPIO line _different_ when it being configured in kernel (via firmware)
and user space. That's unacceptable. So, it means we have to have
synchronized behaviour, means either error in both case or ignoring it.
The latter one is current state of affairs, the former might break the
cases where driver and firmware are not synchronized well.

> Is it because setting bias is piggy-backed onto
> gpiod_direction_input() rather than being separate, so then you can't
> tell whether it is input or bias that is not supported?
> 
> Anyway, if that interface is required for internal use then there is no
> option but to refactor gpiod_direction_input() and provide an alternate
> interface so that cdev can determine if bias is supported or not.

> > > I would like to fix the uAPI such that if the hardware does not support
> > > the requested configuration, or if it can't be emulated in the kernel,
> > > that fact is returned to userspace - bias being the sole counter example
> > > as far as I am aware.
> > > 
> > > The simplest fix involves changing gpio_set_bias() to call gpio_set_config()
> > > rather than gpio_set_config_with_argument_optional(), but as mentioned in
> > > my comment above, that would impact any existing users of
> > > gpiod_direction_input() that assume the best-effort behaviour.
> > 
> > Exactly, best effort is to supply it to the driver and <s>pray</s> hope for
> > the best form the hardware driver.
> > 
> > > I haven't been able to find any such usage, but that could just be proof
> > > that I'm not looking in the right place.
> > > Any input on that front would be greatly appreciated.
> > > 
> > > Also, fixing this as mentioned could be considered an uAPI ABI change.
> > > Is this a bug, so that is ok, or do I need to consider adding a strict
> > > mode flag or somesuch to the API?
> > > 
> > > Bart, I'm also hoping to extend the gpiosim to optionally not support
> > > bias in gc->set_config() to test this case.
> > > Any suggstions on a configfs interface extension to do that?
> > > 
> > > My apologies for the verbage rather than proffering a patch, but the
> > > different paths have vastly different costs, and the simplest solution
> > > has the potential to introduce breakage.
> > 
> > > [1] https://www.spinics.net/lists/linux-gpio/msg43579.html

-- 
With Best Regards,
Andy Shevchenko


