Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5079930F4F1
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Feb 2021 15:30:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236647AbhBDO3K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Feb 2021 09:29:10 -0500
Received: from mga17.intel.com ([192.55.52.151]:64732 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236519AbhBDO2a (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 4 Feb 2021 09:28:30 -0500
IronPort-SDR: VOLLVUwSoSzmDh8Ch9cJ19RQCvYhsrUc5chi2PkJ5822Y/SlM/PjqZsNnR68drvnnZmUF9tndJ
 M8zmwCxtrVNA==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="161003790"
X-IronPort-AV: E=Sophos;i="5.79,401,1602572400"; 
   d="scan'208";a="161003790"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2021 06:27:54 -0800
IronPort-SDR: gUx4H1h+qtB8y95Q03WZldW1Wh1On8guEl5FzkQzNf2nJZEUOFpgDXU11BGoOAFqvDHXMD238g
 21L39mETNz9A==
X-IronPort-AV: E=Sophos;i="5.79,401,1602572400"; 
   d="scan'208";a="372980154"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2021 06:27:50 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1l7fbm-001v8j-Vy; Thu, 04 Feb 2021 16:27:46 +0200
Date:   Thu, 4 Feb 2021 16:27:46 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [GIT PULL] ib-drm-gpio-pdx86-rtc-wdt-v5.12-1
Message-ID: <YBwEYo0F+vNSiglD@smile.fi.intel.com>
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
 <CAMeQTsbGBrTvfkz6BStwL240Kz-dbrQVKtXbYkRtbD3OoUKCcg@mail.gmail.com>
 <CAHp75VeYroY5uG38NrsqwbHnjT0j_LMMD3JmNmRED3OY5ff7xA@mail.gmail.com>
 <CAMeQTsZRng0UWkO5fXUmZW=-gnKWiigwO0BwMY9p1T2D-hoMNA@mail.gmail.com>
 <CAKMK7uEBaWMz-AjuJO3vvUBvacqMHuevOhMhQ0a+r5TtyDpwuQ@mail.gmail.com>
 <797cf4ac-ffdc-e73e-cb58-d027beb6e3b4@redhat.com>
 <20210204105752.GA3940374@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210204105752.GA3940374@piout.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 04, 2021 at 11:57:52AM +0100, Alexandre Belloni wrote:
> On 04/02/2021 11:50:03+0100, Hans de Goede wrote:
> > On 2/4/21 11:36 AM, Daniel Vetter wrote:
> > > On Thu, Feb 4, 2021 at 11:19 AM Patrik Jakobsson
> > > <patrik.r.jakobsson@gmail.com> wrote:
> > >> On Wed, Feb 3, 2021 at 1:00 PM Andy Shevchenko
> > >> <andy.shevchenko@gmail.com> wrote:
> > >>> On Tue, Jan 26, 2021 at 5:25 PM Patrik Jakobsson
> > >>> <patrik.r.jakobsson@gmail.com> wrote:
> > >>>> On Tue, Jan 26, 2021 at 1:37 PM Andy Shevchenko
> > >>>> <andriy.shevchenko@linux.intel.com> wrote:

> > >>>>> This is first part of Intel MID outdated platforms removal. It's collected into
> > >>>>> immutable branch with a given tag, please pull to yours subsystems.
> > >>>>
> > >>>> Hi Andy,
> > >>>> Do you plan on eventually removing X86_INTEL_MID completely? If so,
> > >>>> then I should probably start looking at removing the corresponding
> > >>>> parts in GMA500.
> > >>>
> > >>> I have noticed new commits in DRM against GMA500 and it seems now in a
> > >>> conflict with my immutable branch. Are you sure you don't forget to
> > >>> pull it?
> > >>
> > >> Hi Andy, sorry I missed pulling the immutable branch before taking the
> > >> gma500 medfield removal. I was unsure how to do that through drm-misc
> > >> and it's tools so I got sidetracked. What would be the correct way to
> > >> fix this?
> > > 
> > > Imo Linus can resolve this, it's pretty trivial, as long as both pull
> > > requests point it out to him.
> > 
> > The removal of older Intel platforms touches a number of subsystem trees,
> > the idea about the IM branch was that all subsystem-trees would merge that.
> > 
> > I can certainly point out the problem in the pdx86 pull-req to Linus,
> > but the GPIO pull-req also contains a merge of the IM branch as will
> > the x86/tip and rtc pull-reqs I believe. We can add a remark to all
> > the pull-reqs about the issue I guess ?
> 
> FWIW, I'm not going to merge the PR in the rtc tree because it is a
> simple removal and doesn't have any conflicts.
> 
> > But it might be better to still merge the branch into drm-misc-next and
> > resolve the conflict there. I think that should avoid Linus seeing it ?
> 
> Linus doesn't mind seeing and solving conflicts.

Yes, but in this case the conflict is artificially created by us in the first
place and shouldn't be there from the day 1. I consider merging immutable tag
to DRM misc would be the less intrusive solution.

-- 
With Best Regards,
Andy Shevchenko


