Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A455F3A2F4C
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jun 2021 17:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231482AbhFJPac (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 11:30:32 -0400
Received: from mga01.intel.com ([192.55.52.88]:38211 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230445AbhFJPac (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 10 Jun 2021 11:30:32 -0400
IronPort-SDR: dRZ10piBdAzMMZBVpvEZPI/4oiR+BnOf5xz32lNudnCXs8lqoK7pIqVKEYe26VvO8p8cHJ/xhx
 9H6Ly3fPH4Sg==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="226719229"
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; 
   d="scan'208";a="226719229"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 08:28:36 -0700
IronPort-SDR: EZPruktFHltxMBmWLGwqBtYUJJDYra9AstjaQrNd0NPFum4J5/A42wQ23UdzCrig9arxld13ID
 fEzqX7XSNeuA==
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; 
   d="scan'208";a="450413169"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 08:28:34 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1lrMbf-001BkV-Qm; Thu, 10 Jun 2021 18:28:31 +0300
Date:   Thu, 10 Jun 2021 18:28:31 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: intel: fix NULL pointer deref
Message-ID: <YMIvn+iGt2ijfh7z@smile.fi.intel.com>
References: <20210609062722.9132-1-henning.schild@siemens.com>
 <YMCT+izizEg0gPLD@lahna.fi.intel.com>
 <CAHp75Vcj9wmM7H908sqGmXs10BQN8ty1C4qfmk_nXpG_s=BjTQ@mail.gmail.com>
 <20210609130816.3631f0aa@md1za8fc.ad001.siemens.net>
 <YMIgwORlAzz/gJcK@smile.fi.intel.com>
 <YMIijnvoudaodX+A@smile.fi.intel.com>
 <20210610165632.0d9bb321@md1za8fc.ad001.siemens.net>
 <CAHp75Vd+r3_OnRAYJcHVTU3Q2ekLYV_oHQQ6-wWmq=9hm_cP1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vd+r3_OnRAYJcHVTU3Q2ekLYV_oHQQ6-wWmq=9hm_cP1g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 10, 2021 at 06:00:29PM +0300, Andy Shevchenko wrote:
> On Thu, Jun 10, 2021 at 5:56 PM Henning Schild
> <henning.schild@siemens.com> wrote:
> >
> > Am Thu, 10 Jun 2021 17:32:46 +0300
> > schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:
> >
> > > On Thu, Jun 10, 2021 at 05:25:04PM +0300, Andy Shevchenko wrote:
> > > > On Wed, Jun 09, 2021 at 01:08:16PM +0200, Henning Schild wrote:
> > > > > Am Wed, 9 Jun 2021 13:33:34 +0300
> > > > > schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:
> > > >
> > > > ...
> > > >
> > > > > In order to use GPIO from the drivers i need to make sure
> > > > > "broxton-pinctrl" comes up even if p2sb is hidden.
> > > > >
> > > > > Long story short, i thought the patch was simple enough to merge
> > > > > even taken out of my special context.
> > > > >
> > > > > Currently intel_pinctl only works if "ps2b is not hidden by BIOS"
> > > > > or "ACPI tables are correct", lifting the ban on the hidden p2sb
> > > > > seems like a useful thing in general (i.e. sysfs gpio interface).
> > > > > And i was hoping Andy would take the lead on that. It is
> > > > > something my Siemens drivers would depend on, but really a
> > > > > generic thing as far as i understand it.
> > > >
> > > > From p2sb series discussion it appears that this patch is not
> > > > needed. The case is when BIOS already provides an ACPI device.
> > > >
> > > > So, the initial bug is in that series that needs to check if the
> > > > ACPI device is exposed and forbid platform device instantiation in
> > > > that case.
> > >
> > > Actually, I'm still thinking how this ever possible. We have all
> > > drivers to provide SoC data pointers. match data may be NULL if and
> > > only if the ACPI device provided is a new one that doesn't provide a
> > > SoC data.
> > >
> > > So, w/o seeing ACPI table, I'm really puzzled here.
> >
> > Not sure what exactly you mean. Let us kill this thread and ignore the
> > patch. It was posted out of context and the NULL deref code-path does
> > not exist in the kernel, so the check is not needed.
> >
> > I will revisit the machine where your patch-series did lead to a
> > double-init and EBUSY on claiming those memory ressources. And i will
> > add ACPI info there as well.
> 
> I guess I got what's going on here. When we create a platform device
> we get an associated companion device (which is parent in this case of
> LPC) and that's why when we try enumerating it you have got the first
> branch chosen.

I have just sent another patch based on this report. Can you please test it?


-- 
With Best Regards,
Andy Shevchenko


