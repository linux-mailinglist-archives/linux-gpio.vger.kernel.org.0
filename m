Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9AF53A2E48
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jun 2021 16:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbhFJOfL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 10:35:11 -0400
Received: from mga18.intel.com ([134.134.136.126]:36675 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230153AbhFJOfL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 10 Jun 2021 10:35:11 -0400
IronPort-SDR: VRQXk7bPXe6jnMheEG6UBQEtYDWODn4WMOV03qpOBOvHEsm7U8JUG61vz6kYMlriGrwQ9AdCFX
 +ghpHxZZbD0Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="192624645"
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; 
   d="scan'208";a="192624645"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 07:32:51 -0700
IronPort-SDR: 8uDDKdrfy1Mxx0drDVGhpbL++tNhkiIuRRyYQA0/KVeB9ft4qtJOj+rxFDu81KmgSKMve3m9Yb
 1zweDXmSa1Ig==
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; 
   d="scan'208";a="402879486"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 07:32:49 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1lrLji-001AjR-Ql; Thu, 10 Jun 2021 17:32:46 +0300
Date:   Thu, 10 Jun 2021 17:32:46 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: intel: fix NULL pointer deref
Message-ID: <YMIijnvoudaodX+A@smile.fi.intel.com>
References: <20210609062722.9132-1-henning.schild@siemens.com>
 <YMCT+izizEg0gPLD@lahna.fi.intel.com>
 <CAHp75Vcj9wmM7H908sqGmXs10BQN8ty1C4qfmk_nXpG_s=BjTQ@mail.gmail.com>
 <20210609130816.3631f0aa@md1za8fc.ad001.siemens.net>
 <YMIgwORlAzz/gJcK@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMIgwORlAzz/gJcK@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 10, 2021 at 05:25:04PM +0300, Andy Shevchenko wrote:
> On Wed, Jun 09, 2021 at 01:08:16PM +0200, Henning Schild wrote:
> > Am Wed, 9 Jun 2021 13:33:34 +0300
> > schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:
> 
> ...
> 
> > In order to use GPIO from the drivers i need to make sure
> > "broxton-pinctrl" comes up even if p2sb is hidden.
> > 
> > Long story short, i thought the patch was simple enough to merge even
> > taken out of my special context.
> > 
> > Currently intel_pinctl only works if "ps2b is not hidden by BIOS" or
> > "ACPI tables are correct", lifting the ban on the hidden p2sb seems
> > like a useful thing in general (i.e. sysfs gpio interface). And i was
> > hoping Andy would take the lead on that. It is something my Siemens
> > drivers would depend on, but really a generic thing as far as i
> > understand it.
> 
> From p2sb series discussion it appears that this patch is not needed.
> The case is when BIOS already provides an ACPI device.
> 
> So, the initial bug is in that series that needs to check if the ACPI device is
> exposed and forbid platform device instantiation in that case.

Actually, I'm still thinking how this ever possible. We have all drivers to
provide SoC data pointers. match data may be NULL if and only if the ACPI
device provided is a new one that doesn't provide a SoC data.

So, w/o seeing ACPI table, I'm really puzzled here.

-- 
With Best Regards,
Andy Shevchenko


