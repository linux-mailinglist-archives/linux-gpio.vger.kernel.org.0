Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A73530D830
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Feb 2021 12:10:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234058AbhBCLJE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Feb 2021 06:09:04 -0500
Received: from mga05.intel.com ([192.55.52.43]:11003 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233258AbhBCLJD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 3 Feb 2021 06:09:03 -0500
IronPort-SDR: AY9yi9FagsWAuqgJrTNTvNKqUTEPKTVhGYq/eXQ0ZVQq0HmnHoqXeYrOlXvlvT/qynVrGL1Ofx
 im7v50m9I25g==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="265856388"
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; 
   d="scan'208";a="265856388"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2021 03:08:19 -0800
IronPort-SDR: o134eirMFPeTUWOydEEw8aYttN75QcofTnGYMkGLqCpwZuyydYfYGmESVeFcTSWS2xu+NjzHnO
 eEoISbHn+T7w==
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; 
   d="scan'208";a="433366277"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2021 03:08:15 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1l7G15-001c7c-VW; Wed, 03 Feb 2021 13:08:11 +0200
Date:   Wed, 3 Feb 2021 13:08:11 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>, linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [GIT PULL] ib-drm-gpio-pdx86-rtc-wdt-v5.12-1
Message-ID: <YBqEG4GGXmfD6f0f@smile.fi.intel.com>
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
 <886bbdc0-3391-2140-a2d4-1688b262966f@redhat.com>
 <CAHp75VeFvwE64zX8Wu8XvMMJ6vgxAaoYpvH2rJ_FD3CCnFZNHA@mail.gmail.com>
 <8d350b8c-5f1d-256d-cdc5-8501af0c0cad@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d350b8c-5f1d-256d-cdc5-8501af0c0cad@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 03, 2021 at 11:35:59AM +0100, Hans de Goede wrote:
> On 2/3/21 10:54 AM, Andy Shevchenko wrote:
> > On Tue, Jan 26, 2021 at 4:23 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >> On 1/26/21 1:38 PM, Andy Shevchenko wrote:
> >>> Hi guys,
> >>>
> >>> This is first part of Intel MID outdated platforms removal. It's collected into
> >>> immutable branch with a given tag, please pull to yours subsystems.
> >>>
> >>> (All changes are tagged by the respective maintainers)
> > 
> >> Erm, I already have this 2 in platform-drivers-x86/for-next since you said that
> >> these 2 could be merged independently.
> >>
> >> Anyways I just did a test-merge and there is no conflict, so everything is ok.
> >>
> >> From my pov this looks good and I plan to merge this into platform-drivers-x86/for-next
> >> before the merge-window.
> >>
> >> I'm going to hold off on doing that for a bit for now in case one of the other
> >> subsys maintainers has any objections.
> > 
> > Any news on this? Have you pulled it somewhere (I don't see it in Linux next)?
> 
> I was going through all pending pdx86 stuff yesterday to prep for the upcoming
> merge-window. I was doing so in FIFO order and I ran out of steam just as I got
> to this pull-req.
> 
> So today is a new day and after sending out a fixes pull-req for 5.11 this is
> (was) the first thing on my list.
> 
> I've merged this into my review-hans now (and I will push it to for-next soon).
> 
> I did one last check of all the commits after merging, and I found one small
> issue.
> 
> The "gpio: msic: Remove driver for deprecated platform" commit forgets to
> drop the Makefile line for the msic driver:
> 
> obj-$(CONFIG_GPIO_MSIC)                 += gpio-msic.o
> 
> This is not a reason to redo the entire branch, but it would be good if you
> can do a follow up patch to fix this.

Indeed. Thanks for catching this, I'll fixed locally and will send it soon.

-- 
With Best Regards,
Andy Shevchenko


