Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8A16428D8
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Dec 2022 13:58:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231222AbiLEM6i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Dec 2022 07:58:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231436AbiLEM6h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Dec 2022 07:58:37 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EFB965AA
        for <linux-gpio@vger.kernel.org>; Mon,  5 Dec 2022 04:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670245116; x=1701781116;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ufSzM0+Td2cEbjZ3/Q+miYm2FllqoOn2G2zSlM3qgww=;
  b=eKxzVag5IaDcxDe6R+P5aUm7k28YS4JvhuCENApvo3yvS2zCPo8Y6shC
   +i5WAWSEnOHGdnwwkF5PD7wdz9tBZio0sdqrLckipL1b+ohPpkE+8KQWV
   03BSU7myKTCIZoL85cTKhuZ8aemRtfPJ3EZQ9VuAJ1TM2ei3KGINsENvs
   t8eQgjOwcOy05WZo6IemCMjpj4yHoDVXHtEnzJ8Gl6NRD8R9K8FZoEKsw
   i+CWJJkSBWkZatC1GZGQTDPSfDSh0aJCBe5P2xj9Yt1WeLR+YHTdVz1/k
   QcT3hX6UHFbOtguwTyDAuqYjeQ/5u+mF+zALARk0WFf1imgnNIN1R6TV9
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="317482186"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; 
   d="scan'208";a="317482186"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2022 04:58:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="596187083"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; 
   d="scan'208";a="596187083"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 05 Dec 2022 04:58:34 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1p2B3I-004sVq-3A;
        Mon, 05 Dec 2022 14:58:32 +0200
Date:   Mon, 5 Dec 2022 14:58:32 +0200
From:   "andriy.shevchenko@intel.com" <andriy.shevchenko@intel.com>
To:     "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "Kiszka, Jan" <jan.kiszka@siemens.com>
Subject: Re: Question regarding runtime pinctrl (2nd try)
Message-ID: <Y43q+Be+uOzaDJAi@smile.fi.intel.com>
References: <7abfb823b92a4451d442b001ea7e49017ff3a3c8.camel@siemens.com>
 <Y4d6OosnHIDB2h6s@smile.fi.intel.com>
 <21ea48401aa3d652a379bf6aa412c660d3f4f0e5.camel@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21ea48401aa3d652a379bf6aa412c660d3f4f0e5.camel@siemens.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 05, 2022 at 10:47:27AM +0000, Niedermayr, BENEDIKT wrote:
> On Wed, 2022-11-30 at 17:43 +0200, Andy Shevchenko wrote:
> > On Wed, Nov 30, 2022 at 03:09:50PM +0000, Niedermayr, BENEDIKT wrote:
> > > Hello,
> > > 
> > > I got no response since last time so I try it again, but with a bit more
> > > knowledge this time.
> > > 
> > > After carefully reading the pinctrl documentation
> > > (driver-api/pin-control.rst) it was very clear for me that such an interface
> > > already exists and is accessable via debugfs. The documentation is very clear
> > > and self-explanatory. Thanks for that!
> > > At the time of writing my last email [1] I took a look into an older BSP
> > > kernel where this feature has not been implemented, yet. I must apologize for
> > > that...
> > > 
> > > Now my last concern is using debugfs on a productive system. IMHO debugfs is
> > > not the right interface to interact on a productive system.
> > 
> > And this is a point. No-one should try it on the production systems.
> > 
> > > Especially when
> > > when a unprivileged process wants to interact with an interface offered by
> > > debugfs. It's possible to change
> > > permissions on files and folders there but nevertheless I think that this is
> > > not the way to go, since debugfs was designed to offer interfaces to
> > > privileged processes only.
> > 
> > Correct.
> > 
> > > My proposal would be to implement an chardev interface for that and using
> > > udev rules to assign correct permissions to that. With this interface I can
> > > then select the active pinctrl-groups which have been defined in the device
> > > tree before.
> > > I could also imagine to put the interface into the sysfs (that would be very
> > > close to the debugfs implementation I think).
> > > 
> > > What do you think about it? Am I still missing something?
> > 
> > In my opinion -- no go.
> > 
> > The platform description (ACPI, DT, or board files) should know what they are
> > doing. If something missing to achieve what you need via existing interfaces
> > we rather think about that, but no, the debugfs stays and only for the purposes
> > of development on the "I know what I'm doing" basis.
> > 
> Ok. If I got you right, you meant that there is no way to replace the debugfs interface?
> 
> So instead replacing the debugfs interface I would rather add a second interface that coexists with
> debugfs.

I meant that this feature quite likely will stay in the debugfs realm. No new
interface is needed for sure.

> Unfortunatelly there is no interface available for runtime configuration, yet.

There is no explanation why you need that.
This is the main point of this discussion, right?

> The only alternative 
> is to access "/dev/mem", but this is the most questionable solution from a security perspective.

It's not an alternative at all, it's simple no go variant.

> There should be a way to avoid unsecure "/dev/mem" implementations but currently this is the only
> way to achieve runtime configuration with reasonable effort. 
> IMHO the current architecture leads to lot of unsecure implementations out there.
> 
> For example the raspberrypi kernel tries to workaround this issue by providing a "/dev/gpiomem"

This is even worse than more standard /dev/mem interface.

> interface that only provides mappings to the gpio register set(drivers/char/broadcom/bcm2835-gpiomem.c). 
> This reduces possible vulnerabilities but they still persist since:
> 
> - mmap() cannot map memory less than PAGE_SIZE, which means that memory outside of the GPIO registers is accessable. 
> - it's possible to select untested  pin configurations which may not be electrical fine.
> 
> I like the current architecture since I define pingroups in the platform description which have been tested and 
> then select one of them during runtime.
> It's just the interface itself which is not sufficient enough when it comes to security.  

Still no clue, what you are trying to achieve and why. Use case, please?

> > > [1] https://marc.info/?l=linux-gpio&m=166850640920120

-- 
With Best Regards,
Andy Shevchenko


